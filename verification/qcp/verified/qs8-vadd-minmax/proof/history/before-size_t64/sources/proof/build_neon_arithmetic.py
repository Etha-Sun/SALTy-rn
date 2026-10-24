#!/usr/bin/env python3
"""Generate scalar-field C definitions for the exact NEON integer operations."""
from pathlib import Path
import json
C=Path(__file__).resolve().parent.parent
T={'s8':('int8x8_t','char',8,-128,127),'s8q':('int8x16_t','char',16,-128,127),'s16':('int16x4_t','short',4,-32768,32767),'s16q':('int16x8_t','short',8,-32768,32767),'s32q':('int32x4_t','int',4,-2147483648,2147483647)}
header='#ifndef QCP_QA_NEON_ARITHMETIC_H\n#define QCP_QA_NEON_ARITHMETIC_H\n#include "types_def.h"\n/*@ Import Coq Require Import Qs8Add.VectorModel */\n/*@ Extern Coq (qa_min:Z -> Z -> Z) (qa_max:Z -> Z -> Z) */\n'
bodies='#include "neon_arithmetic.h"\n';units=[]
def emit(name,out,args,expressions,mathexpr):
 global header,bodies
 ot,oct,on,_,_=T[out];ghost=[];req=[];params=[]
 for key,kind in args:
  if kind in T:
   typ,coqt,n,lo,hi=T[kind];params.append(typ+' '+key)
   for i in range(n):ghost.append(f'({key}{i}:Z)');req.extend([f'{lo}<={key}{i}',f'{key}{i}<={hi}',f'store(&({key}.s{i}),{coqt},{key}{i})'])
  else:
   ct,lo,hi=kind;params.append(ct+' '+key);req.extend([f'{lo}<={key}',f'{key}<={hi}'])
 ensure=' * '.join(f'store(&(__return.s{i}),{oct},{mathexpr[i]})'for i in range(on));contract='/*@ '+('With '+' '.join(ghost)+'\n 'if ghost else '')+'Require '+' && '.join(req)+'\n Ensure '+ensure+' */'
 sig=ot+' '+name+'('+','.join(params)+')\n'+contract
 header+=sig+';\n';bodies+=sig+'\n{\n '+ot+' r;\n'+''.join(f' r.s{i}={expressions[i]};\n'for i in range(on))+' return r;\n}\n';units.append(name)
for name,out,ct,lo,hi in [('vdup_n_s8','s8','int8_t',-128,127),('vdupq_n_s8','s8q','int8_t',-128,127),('vdupq_n_s16','s16q','int16_t',-32768,32767),('vdupq_n_s32','s32q','int32_t',-2147483648,2147483647)]:emit(name,out,[('x',(ct,lo,hi))],['x']*T[out][2],['x']*T[out][2])
emit('vsubl_s8','s16q',[('a','s8'),('b','s8')],[f'qcp_qa_sub8(a.s{i},b.s{i})'for i in range(8)],[f'qa_s16(a{i}-b{i})'for i in range(8)])
for name,out,inkind,start in [('vget_low_s16','s16','s16q',0),('vget_high_s16','s16','s16q',4),('vget_low_s8','s8','s8q',0),('vmovl_s16','s32q','s16',0)]:emit(name,out,[('a',inkind)],[f'a.s{i+start}'for i in range(T[out][2])],[f'a{i+start}'for i in range(T[out][2])])
for name,scalar,math in [('vmulq_s32','qcp_qa_neon_mul','qa_neon_mul'),('vrshlq_s32','qcp_qa_neon_shift','qa_neon_shift')]:emit(name,'s32q',[('a','s32q'),('b','s32q')],[f'{scalar}(a.s{i},b.s{i})'for i in range(4)],[f'{math}(a{i},b{i})'for i in range(4)])
emit('vmlaq_s32','s32q',[('a','s32q'),('b','s32q'),('c','s32q')],[f'qcp_qa_neon_mla(a.s{i},b.s{i},c.s{i})'for i in range(4)],[f'qa_neon_mla(a{i},b{i},c{i})'for i in range(4)])
for name,out,inkind,scalar,math in [('vqmovn_s32','s16','s32q','qcp_qa_sat16','qa_sat16'),('vqmovn_s16','s8','s16q','qcp_qa_sat8','qa_sat8')]:emit(name,out,[('a',inkind)],[f'{scalar}(a.s{i})'for i in range(T[out][2])],[f'{math}(a{i})'for i in range(T[out][2])])
emit('vqaddq_s16','s16q',[('a','s16q'),('b','s16q')],[f'qcp_qa_neon_add16(a.s{i},b.s{i})'for i in range(8)],[f'qa_neon_add16(a{i},b{i})'for i in range(8)])
for name,out,inkind in [('vcombine_s16','s16q','s16'),('vcombine_s8','s8q','s8')]:
 n=T[inkind][2];emit(name,out,[('a',inkind),('b',inkind)],[f'{"a"if i<n else "b"}.s{i%n}'for i in range(2*n)],[f'{"a"if i<n else "b"}{i%n}'for i in range(2*n)])
# Separate actual scalar bodies avoid exponential vector-branch generation.
for op in ['min','max']:
 name='qcp_qa_'+op+'8';comp='<'if op=='min'else'>'
 sig='int8_t '+name+'(int8_t a,int8_t b)\n/*@ Require -128<=a && a<=127 && -128<=b && b<=127 && emp\n Ensure __return==qa_'+op+'(a,b) && -128<=__return && __return<=127 && emp */'
 header+=sig+';\n';bodies+=sig+'\n{if(a'+comp+'b)return a;return b;}\n';units.append(name)
 for suffix,kind in [('', 's8'),('q','s8q')]:
  n=T[kind][2];emit('v'+op+suffix+'_s8',kind,[('a',kind),('b',kind)],[f'{name}(a.s{i},b.s{i})'for i in range(n)],[f'qa_{op}(a{i},b{i})'for i in range(n)])
header+='#endif\n';(C/'shim/neon_arithmetic.h').write_text(header);(C/'shim/neon_arithmetic.c').write_text(bodies);(C/'proof/neon-arithmetic-units.json').write_text(json.dumps(units,indent=2)+'\n')
