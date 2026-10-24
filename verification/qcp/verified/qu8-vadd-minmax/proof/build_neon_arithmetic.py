#!/usr/bin/env python3
"""Actual scalar-field providers for the original QU8 NEON instruction set."""
from pathlib import Path
import json
C=Path(__file__).resolve().parent.parent
T={'u8':('uint8x8_t','unsigned char',8,0,255),'u16':('uint16x8_t','unsigned short',8,0,65535),'s16':('int16x4_t','short',4,-32768,32767),'s16q':('int16x8_t','short',8,-32768,32767),'s32':('int32x4_t','int',4,-2147483648,2147483647)}
h='#ifndef QCP_QU8_NEON_ARITHMETIC_H\n#define QCP_QU8_NEON_ARITHMETIC_H\n#include "types_def.h"\n#include "unsigned_scalar.h"\n';b='#include "neon_arithmetic.h"\n';units=[]
def emit(name,out,args,expr,values):
 global h,b
 ot,oct,n,_,_=T[out];ghost=[];req=[];params=[]
 for key,kind in args:
  if kind in T:
   typ,ct,count,lo,hi=T[kind];params.append(typ+' '+key)
   for i in range(count):ghost.append(f'({key}{i}:Z)');req.extend([f'({lo})<={key}{i}',f'{key}{i}<={hi}',f'store(&({key}.s{i}),{ct},{key}{i})'])
  else:
   ct,lo,hi=kind;params.append(ct+' '+key);req.extend([f'({lo})<={key}',f'{key}<={hi}'])
 sig=ot+' '+name+'('+','.join(params)+')\n/*@ '+('With '+' '.join(ghost)+'\n 'if ghost else'')+'Require '+' && '.join(req)+'\n Ensure '+' * '.join(f'store(&(__return.s{i}),{oct},{values[i]})'for i in range(n))+' */';h+=sig+';\n';b+=sig+'\n{\n '+ot+' r;\n'+''.join(f' r.s{i}={expr[i]};\n'for i in range(n))+' return r;\n}\n';units.append(name)
for name,out,ct,lo,hi in [('vdup_n_u8','u8','uint8_t',0,255),('vdupq_n_s16','s16q','int16_t',-32768,32767),('vdupq_n_s32','s32','int32_t',-2147483648,2147483647)]:emit(name,out,[('x',(ct,lo,hi))],['x']*T[out][2],['x']*T[out][2])
emit('vsubl_u8','u16',[('a','u8'),('b','u8')],[f'qcp_qu_subu8(a.s{i},b.s{i})'for i in range(8)],[f'qu_udiff(a{i},b{i})'for i in range(8)])
emit('vreinterpretq_s16_u16','s16q',[('a','u16')],[f'qcp_qu_from_u16(a.s{i})'for i in range(8)],[f'qu_s16(a{i})'for i in range(8)])
for name,out,ink,start in [('vget_low_s16','s16','s16q',0),('vget_high_s16','s16','s16q',4),('vmovl_s16','s32','s16',0)]:emit(name,out,[('a',ink)],[f'a.s{i+start}'for i in range(T[out][2])],[f'a{i+start}'for i in range(T[out][2])])
for name,scalar,model in [('vmulq_s32','qcp_qu_neon_mul','qu_neon_mul'),('vrshlq_s32','qcp_qu_neon_shift','qu_neon_shift')]:emit(name,'s32',[('a','s32'),('b','s32')],[f'{scalar}(a.s{i},b.s{i})'for i in range(4)],[f'{model}(a{i},b{i})'for i in range(4)])
emit('vmlaq_s32','s32',[('a','s32'),('b','s32'),('c','s32')],[f'qcp_qu_neon_mla(a.s{i},b.s{i},c.s{i})'for i in range(4)],[f'qu_neon_mla(a{i},b{i},c{i})'for i in range(4)])
emit('vqmovn_s32','s16',[('a','s32')],[f'qcp_qu_sat16(a.s{i})'for i in range(4)],[f'qu_sat16(a{i})'for i in range(4)])
emit('vcombine_s16','s16q',[('a','s16'),('b','s16')],[f'{"a"if i<4 else"b"}.s{i%4}'for i in range(8)],[f'{"a"if i<4 else"b"}{i%4}'for i in range(8)])
emit('vqaddq_s16','s16q',[('a','s16q'),('b','s16q')],[f'qcp_qu_neon_add16(a.s{i},b.s{i})'for i in range(8)],[f'qu_neon_add16(a{i},b{i})'for i in range(8)])
emit('vqmovun_s16','u8',[('a','s16q')],[f'qcp_qu_usat8(a.s{i})'for i in range(8)],[f'qu_usat8(a{i})'for i in range(8)])
for op in ['min','max']:emit('v'+op+'_u8','u8',[('a','u8'),('b','u8')],[f'qcp_qu_u{op}8(a.s{i},b.s{i})'for i in range(8)],[f'qu_u{op}(a{i},b{i})'for i in range(8)])
h+='#endif\n';(C/'shim/neon_arithmetic.h').write_text(h);(C/'shim/neon_arithmetic.c').write_text(b);(C/'proof/neon-arithmetic-units.json').write_text(json.dumps(units,indent=2)+'\n')
