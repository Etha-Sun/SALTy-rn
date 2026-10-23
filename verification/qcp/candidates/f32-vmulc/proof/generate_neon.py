#!/usr/bin/env python3
"""Original NEON source + VMUL annotation shape specialized to a broadcast constant."""
from pathlib import Path
import json,re,subprocess,tempfile,time
HERE=Path(__file__).resolve().parent;CASE=HERE.parent
REPO=next(p for p in CASE.parents if (p/'.git').exists());BASE=REPO/'verification/qcp/verified/f32-vmul'
RUN=Path(tempfile.mkdtemp(prefix='neon-vcs-',dir=CASE/'.build'))
def prototype(text,name):
 start=text.index(' '+name+'(');start=text.rfind('\n',0,start)+1
 return text[start:text.index('*/',start)+2]+';\n'
head='#include "'+str(BASE/'shim/proof/ByValue/frontend.h')+'"\n#include "model_def.h"\n'
head+='/*@ Extern Coq (vmulc_values : Z -> list fp32 -> fp32 -> list fp32) */\n'
head+='/*@ include strategies "neon_vmulc.strategies" */\n'
head+=prototype((CASE/'shim/primitives.c').read_text(),'vld1q_dup_f32')
(CASE/'shim/neon_frontend.h').write_text(head)
raw=(CASE/'impl/testNEON.c').read_text();spec=(CASE/'spec.c').read_text()
contract=re.search(r'/\*@.*?\*/',prototype(spec,'test_neon'),re.S).group()
inv=json.loads((BASE/'proof/annotations/test_neon.json').read_text())[1]['text']
inv=inv.replace(' && fp32_length(B) == batch@pre/4+3','')
inv=inv.replace('input_b == input_b@pre + k','input_b == input_b@pre')
inv=inv.replace('FloatArray::full(input_b@pre,k,fp32_slice(0,k,B)) *\nFloatArray::full(input_b,batch/4+3,fp32_slice(k,batch@pre/4+3,B)) *','store(input_b@pre,float,c) *\n'+' *\n'.join('store(&(vb.s'+str(i)+'),float,c)' for i in range(4))+' *')
inv=inv.replace('vadd_values(k,A,B)','vmulc_values(k,A,c)')
source=raw.replace('\n{','\n'+contract+'\n{',1)
source=source.replace('  for (;',inv+'\n  for (;',1)
source=source.replace('vmulq_f32(va, vb)','vmulq_f32(va, vb) /*@ where a = &va, b = &vb */')
for call in ['vst1q_f32(output, vacc)','vget_low_f32(vacc)','vget_high_f32(vacc)']:
 source=source.replace(call,call+' /*@ where a = &vacc */')
for call in ['vst1_f32(output, vacc_lo)','vst1_lane_f32(output, vacc_lo, 0)']:
 source=source.replace(call,call+' /*@ where a = &vacc_lo */')
tokens=lambda x:re.findall(r'\w+|[^\s\w]',re.sub(r'/\*.*?\*/|//[^\n]*','',x,flags=re.S))
assert tokens(source)==tokens(raw),'Original kernel changed'
(HERE/'c/neon.annotations.json').write_text(json.dumps({'invariant':inv,'where':'a=&va,b=&vb; vector store/read borrows corresponding local'},indent=2)+'\n')
unit=RUN/'neon_unit.c';unit.write_text('#include "'+str(CASE/'shim/neon_frontend.h')+'"\n'+source)
r=subprocess.run(['gcc','-E','-P','-CC','-nostdinc',str(unit),'-o',str(RUN/'expanded.c')],capture_output=True,text=True,timeout=30);assert r.returncode==0,r.stderr
unit.write_bytes((RUN/'expanded.c').read_bytes())
cmd=['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--input-file='+str(unit),'--coq-output-dir='+str(RUN),'--coq-logic-path=VMulc']
for d in sorted((BASE/'proof/c').iterdir()):cmd+=['-slp',str(d),d.name]
cmd+=['-slp',str(CASE/'shim'),'VMulc','-slp',str(HERE/'c'),'VMulc']
start=time.monotonic()
with (RUN/'qcp.log').open('w') as out:r=subprocess.run(cmd,stdout=out,stderr=out,timeout=240)
g=RUN/'neon_unit_goal.v'
status={'generation_passed':r.returncode==0,'generated_c_vcs':len(re.findall(r'^Axiom proof_of_',g.read_text(),re.M)) if g.exists() else 0,'kernel_vcs_proved':False,'whole_kernel_verified':False,'original_c_tokens_preserved':True,'run_directory':str(RUN),'seconds':time.monotonic()-start,'command':cmd}
(HERE/'neon-generation-status.json').write_text(json.dumps(status,indent=2)+'\n');print(json.dumps(status,indent=2))
if r.returncode:print((RUN/'qcp.log').read_text()[-3000:])
raise SystemExit(r.returncode!=0)
