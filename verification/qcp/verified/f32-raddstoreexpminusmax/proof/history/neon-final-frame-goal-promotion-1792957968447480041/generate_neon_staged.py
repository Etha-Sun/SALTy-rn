#!/usr/bin/env python3
"""Exact named-record SSA cuts after original ISA calls.
Every cut retains the same single StructPred owner plus structural record
identity. RHS expressions contain logical operands only, never C field loads.
The original current C statements and public contract are unchanged.
"""
from pathlib import Path
import re,json,sys
import generate_neon as B
C=B.C
OPS={
 'vld1q_f32':('float32x4_t',None),
 'vsubq_f32':('float32x4_t','em_neon_sub'),
 'vaddq_f32':('float32x4_t','em_neon_add'),
 'vmulq_f32':('float32x4_t','em_neon_mul'),
 'vfmaq_f32':('float32x4_t','em_neon_fma'),
 'vreinterpretq_s32_f32':('int32x4_t','em_neon_reint_f_i'),
 'vreinterpretq_f32_s32':('float32x4_t','em_neon_reint_i_f'),
 'vreinterpretq_u32_f32':('uint32x4_t','em_neon_reint_f_u'),
 'vreinterpretq_f32_u32':('float32x4_t','em_neon_reint_u_f'),
 'vshlq_n_s32':('int32x4_t','em_neon_slli'),
 'vcltq_f32':('uint32x4_t','em_neon_clt'),
 'vbicq_u32':('uint32x4_t','em_neon_bic')}
PAT=re.compile(r'(?m)^(?P<indent>[ \t]*)(?:(?:const\s+)?(?:float32x4_t|int32x4_t|uint32x4_t)\s+)?(?P<var>[A-Za-z_]\w*)\s*=\s*(?P<fn>'+ '|'.join(OPS)+r')\((?P<args>[^();]*)\)(?P<where>\s*/\*@\s*where\s+.*?\*/)?\s*;')
old_render=B.render
metadata=[]
def render():
 raw,s=old_render();tail=s.index('if (batch != 0)');env={v:'em_neon_dup('+k+')'for v,k in B.consts};env.update(vi_max='em_neon_dup(em_get(F,M))',vacc='A');count=0;phase='bulk';out=[];start=0
 for m in PAT.finditer(s):
  if m.start()>tail and phase=='bulk':phase='tail';env['vacc']='A'
  var,fn=m['var'],m['fn'];ty,model=OPS[fn];args=[x.strip()for x in m['args'].split(',')];where=[]
  if fn=='vld1q_f32':
   expected='em_load_record4(F,P+16*'+('G'if phase=='bulk'else'(N/4)')+')';where=['F=F']
  else:
   logical=[]
   for j,arg in enumerate(args):
    if fn=='vshlq_n_s32'and j==1:logical.append(arg);continue
    assert arg in env,(fn,arg,env);logical.append(env[arg]);where.append(chr(65+j)+'='+env[arg])
   expected=model+'('+','.join(logical)+')'
  count+=1;ghost='EMStage'+str(count);same={'float32x4_t':'em_same_record4','int32x4_t':'em_same_record_i4','uint32x4_t':'em_same_record_u4'}[ty]
  original=s[m.start():m.end()];original=re.sub(r'/\*@\s*where\s+.*?\*/','',original,flags=re.S);original=original.rstrip().removesuffix(';').rstrip()+' /*@ where '+','.join(where)+' */;'
  cut='\n/*@ StructPred'+ty+'(&'+var+','+expected+') which implies exists('+ghost+':Record'+ty+'),'+same+'('+ghost+','+expected+')&&StructPred'+ty+'(&'+var+','+ghost+') */\n/*@ Given '+ghost+' */'
  out += [s[start:m.start()],original,cut];start=m.end();env[var]=ghost;metadata.append(dict(variable=var,record_type='Record'+ty,ghost=ghost,expected_original_instruction_result=expected,phase=phase,owner_count_before=1,owner_count_after=1,no_C_field_load_in_RHS=True))
 out.append(s[start:]);s=''.join(out)
 # Avoid mixed C-pointer/logical-Z subtraction in ghost arguments.
 final_bulk=next(x['ghost'] for x in reversed(metadata)if x['phase']=='bulk'and x['variable']=='vf')
 s=re.sub(r'(vst1q_f32\(output,\s*vf\))\s*/\*@\s*where.*?\*/',r'\1 /*@ where W=W,O=em_arm_output_prefix(F,P,M,Q,4*G,O),A='+final_bulk+' */',s,flags=re.S)
 s=re.sub(r'(vst1_f32\(output,\s*vf_lo\))\s*/\*@\s*where.*?\*/',r'\1 /*@ where W=W,O=em_arm_output_prefix(F,P,M,Q,4*(N/4),O) */',s,flags=re.S)
 s=re.sub(r'(vst1_lane_f32\(output,\s*vf_lo,\s*0\))\s*/\*@\s*where.*?\*/',r'\1 /*@ where W=W */',s,flags=re.S)

 anchor='for (; batch >= 4 * sizeof(float); batch -= 4 * sizeof(float)) {';assert s.count(anchor)==1;s=s.replace(anchor,anchor+'\n/*@ Given G A */')
 # The post-loop Assert introduces its own current accumulator record.
 marker='#if XNN_ARCH_ARM64\n  float vacc_lo';assert s.count(marker)==1;s=s.replace(marker,'/*@ Given A */\n'+marker)
 assert B.tokens(s)==B.tokens(raw),'SSA renderer changed original C tokens'
 return raw,s
B.render=render
B.prefix=lambda:'#include "'+str(C/'shim/staged_model.h')+'"\n'
if __name__=='__main__':
 B.EXTRA_INPUTS=[Path(__file__).resolve()]
 B.main()
