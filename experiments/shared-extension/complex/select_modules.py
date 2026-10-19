#!/usr/bin/env python3
"""Split native exploration functions into shared C modules, without duplicates."""
from pathlib import Path
import re,json
R=Path(__file__).resolve().parent;S=R/'shared';s=(S/'native_fp.h').read_text();functions=[];removed=[]
for match in re.finditer(r'^static inline [^{}\n]+\([^{}\n]*\)\s*\{',s,re.M):
 start=match.start();pos=match.end();depth=1
 while depth:
  if s[pos]=='{':depth+=1
  elif s[pos]=='}':depth-=1
  pos+=1
 text=s[start:pos];signature=text[:text.index('{')].strip().removeprefix('static inline ');name=re.search(r'(\w+)\(',signature).group(1)
 functions.append((name,signature,text.removeprefix('static inline ')));removed.append((start,pos))
types=s
for start,end in reversed(removed):types=types[:start]+types[end:]
types=types.replace('COMPLEX_NATIVE_FP_H','COMPLEX_NATIVE_TYPES_H')
(S/'native_types.h').write_text(types)
(S/'fp_primitives.h').write_text('#ifndef COMPLEX_FP_PRIMITIVES_H\n#define COMPLEX_FP_PRIMITIVES_H\n#include "native_types.h"\n'+''.join(sig+';\n' for _,sig,_ in functions)+'#endif\n')
def category(n):
 if n.startswith(('vld','vst','vget','vdup','vmovq','vcombine','vext','vzip')) or re.match('__riscv_(vsetvl|vle32_v_f32|vse32_v_f32|vfmv_|vfslide|vfred)',n):return 'fp_memory'
 if n in ['fp_nan','canonical_nan','min_number','max_number','neon_min','neon_max'] or n.startswith(('vmin','vmax','__riscv_vfmin','__riscv_vfmax')):return 'fp_minmax'
 if n.startswith(('vcgt','vclt','vbsl','__riscv_vmf','__riscv_vfmerge','__riscv_vmerge')):return 'fp_masks'
 if n.startswith(('vreinterpret','vshlq','vandq','vbicq','__riscv_vreinterpret_v_f32m4','__riscv_vreinterpret_v_i32m4','__riscv_vsll_vx_i32m4')):return 'fp_repr'
 if n.startswith(('__riscv_vid','__riscv_vadd_vx','__riscv_vmul_vx_u32m1','__riscv_vreinterpret_v_u32m1','__riscv_vsub_vx','__riscv_vmsge','__riscv_vmslt','__riscv_vmand','__riscv_vlse')):return 'fp_index'
 if n.startswith(('vfma','vaddq_f32','vsubq_f32','vmulq_f32','vmlaq_f32','vaddv','__riscv_vfmacc','__riscv_vfmadd','__riscv_vfmul','__riscv_vfadd','__riscv_vfsub')):return 'fp_arithmetic'
 return 'quantized'
def group(n):
 cat=category(n)
 if cat=='quantized' and n in ['xnn_prefetch_to_l1','round_down_po2','round_up_po2','doz']:return 'utils'
 if cat=='fp_memory' and (re.search(r'_(?:s8|s32|u32)$',n) or 'v_u32' in n):return 'integer_memory'
 width=re.search(r'f32(m[1248])',n)
 if width and cat in ['fp_memory','fp_arithmetic','fp_minmax','fp_masks']:return cat+'_'+width.group(1)
 return cat
groups={}
for row in functions:groups.setdefault(group(row[0]),[]).append(row)
for old in S.glob('fp_*.c'):old.unlink()
for old in [S/'quantized.c',S/'integer_memory.c',S/'utils.c']:
 if old.exists():old.unlink()
for g,rows in groups.items():(S/(g+'.c')).write_text('#include "fp_primitives.h"\n\n'+'\n\n'.join(t for _,_,t in rows)+'\n')
modules={};namesall={n for n,_,_ in functions}
for d in (R/'cases').iterdir():
 if not (d/'original_rvv.c').exists():continue
 target=d/'rvv.c'
 if not target.exists():target=d/'original_rvv.c'
 names=set(re.findall(r'\b(\w+)\s*\(',(d/'neon.c').read_text()+target.read_text()));chosen=set();old=None
 while old!=chosen:
  old=chosen.copy();chosen.update(group(n) for n in names&namesall)
  for g in chosen:
   for _,_,text in groups[g]:names.update(re.findall(r'\b(\w+)\s*\(',text))
 modules[d.name]=[g+'.c' for g in groups if g in chosen]
 for p in S.glob(d.name.replace('-','_')+'_ops.*'):p.unlink()
(S/'module-map.json').write_text(json.dumps(modules,indent=2)+'\n')
print({k:len(v) for k,v in groups.items()});print(json.dumps(modules,indent=2))
