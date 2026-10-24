from pathlib import Path
import json
c=Path(__file__).resolve().parent.parent;d=c/'shim';h=['#ifndef RDSUM_OUTPUT_VECTOR_H','#define RDSUM_OUTPUT_VECTOR_H','#include "output_model.h"','/*@ Import Coq Require Import Qu8Rdsum.OutputModel */','/*@ Extern Coq (rd_out_lane:list Z -> Z -> Z -> Z -> Z) (rd_store_lane:list Z -> Z -> Z -> Z -> Z -> list Z) */'];proto='''uint32_t rdsum_output_lane(const uint32_t *p,size_t i,size_t vl)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=idx && 0<=i && i<32 && 0<=vl && vl<=32 && idx+vl<=count && p==base+idx*4 && UIntArray::full(base,count,L)
 Ensure __return==rd_out_lane(L,idx,i,vl) && 0<=__return && __return<=4294967295 && UIntArray::full(base,count,L) */''';h.append(proto+';');bodies=[proto+'\n{if(i<vl)return rdsum_get_i32(p,i) /*@ where base=base,count=count,idx=idx,L=L */;return 0;}'];proto='''void rdsum_store_lane(uint32_t *p,size_t i,uint32_t value,size_t vl)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=idx && 0<=i && i<32 && 0<=vl && vl<=32 && idx+vl<=count && p==base+idx*4 && 0<=value && value<=4294967295 && UIntArray::full(base,count,L)
 Ensure UIntArray::full(base,count,rd_store_lane(L,idx,i,value,vl)) */''';h.append(proto+';');bodies.append(proto+'\n{if(i<vl)rdsum_put_i32(p,i,value) /*@ where base=base,count=count,idx=idx,L=L */;}');(d/'output_active.c').write_text('#include "output_vector.h"\n'+'\n'.join(bodies)+'\n')
units=[]
for n,t,suffix in[(2,'uint32x2_t',''),(4,'uint32x4_t','q'),(32,'vuint32m8_t','rvv')]:
 dyn=n==32;vl='vl'if dyn else str(n);name='__riscv_vle32_v_u32m8'if dyn else'vld1'+suffix+'_s32';args='const uint32_t *p'+(',size_t vl'if dyn else'');extra='0<=vl && vl<=32 && 'if dyn else'';req=f'0<=idx && {extra}idx+{vl}<=count && p==base+idx*4 && UIntArray::full(base,count,L)';post='UIntArray::full(base,count,L) * '+' * '.join(f'store(&(__return.s{i}),unsigned int,'+(f'rd_out_lane(L,idx,{i},vl)'if dyn else f'L[idx+{i}]')+')'for i in range(n));proto=f'{t} {name}({args})\n/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z) Require {req} Ensure {post} */';h.append(proto+';');get='rdsum_output_lane'if dyn else'rdsum_get_i32';body=f'{t} r;\n'+'\n'.join(f'r.s{i}={get}(p,{i}'+(',vl)'if dyn else')')+' /*@ where base=base,count=count,idx=idx,L=L */;'for i in range(n))+'\nreturn r;';(d/(name+'.c')).write_text('#include "output_vector.h"\n'+proto+'\n{\n'+body+'\n}\n');units.append(name)
 name='__riscv_vse32_v_u32m8'if dyn else'vst1'+suffix+'_s32';args='uint32_t *p,'+t+' a'+(',size_t vl'if dyn else'');values=[f'a{i}'for i in range(n)];withs=' '.join(f'({v}:Z)'for v in values);pure=' && '.join(f'0<={v} && {v}<=4294967295'for v in values);heap=' * '.join(f'store(&(a.s{i}),unsigned int,a{i})'for i in range(n));before='L';calls=[]
 for i in range(n):
  callee='rdsum_store_lane'if dyn else'rdsum_put_i32';calls.append(f'{callee}(p,{i},a.s{i}'+(',vl)'if dyn else')')+f' /*@ where base=base,count=count,idx=idx,L={before} */;')
  before=f'rd_store_lane({before},idx,{i},a{i},vl)'if dyn else f'replace_Znth(idx+{i},a{i},{before})'
 req=f'0<=idx && {extra}idx+{vl}<=count && p==base+idx*4 && {pure} && UIntArray::full(base,count,L) * {heap}';proto=f'void {name}({args})\n/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z) {withs} Require {req} Ensure UIntArray::full(base,count,{before}) */';h.append(proto+';');(d/(name+'.c')).write_text('#include "output_vector.h"\n'+proto+'\n{\n'+'\n'.join(calls)+'\n}\n');units.append(name)
h+=['#endif'];(d/'output_vector.h').write_text('\n'.join(h)+'\n');(c/'proof/output-vector-units.json').write_text(json.dumps(units,indent=2)+'\n')
