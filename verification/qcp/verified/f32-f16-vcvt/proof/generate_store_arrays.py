#!/usr/bin/env python3
"""Real C adapters between ushort arrays and checked exact-cell stores."""
from pathlib import Path
H=Path(__file__).resolve().parent;C=H.parent

def main():
 model='From Coq Require Import ZArith List.\nFrom F32F16 Require Export UShortStoreModel.\nImport ListNotations. Local Open Scope Z_scope.\n'
 head='#ifndef QCP_F32F16_STORE_ARRAYS_H\n#define QCP_F32F16_STORE_ARRAYS_H\n#include "program_model.h"\n#include "memory_neon.h"\n/*@ Import Coq Require Import F32F16.PackModel */\n/*@ Extern Coq '
 for n in [1,2,4,8]:
  model+='Definition f16_pack'+str(n)+' '+' '.join('(x'+str(i)+':Z)'for i in range(n))+' : list Z := ['+';'.join('x'+str(i)for i in range(n))+'].\n';head+='\n (f16_pack'+str(n)+' : '+'Z -> '*n+'list Z)'
 head+=' */\n';source='#include "store_arrays.h"\n';proof='From Coq Require Import ZArith Lia.\nFrom F32F16 Require Export PackModel VectorSupport.\nImport Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.\n'
 for n in [1,2,4,8]:
  cellu=' ** '.join('(p+'+str(2*i)+') # UShort |->_'for i in range(n));cellv=' ** '.join('(p+'+str(2*i)+') # UShort |-> x'+str(i)for i in range(n));params=' '.join('(x'+str(i)+':Z)'for i in range(n));pack='f16_pack'+str(n)+' '+' '.join('x'+str(i)for i in range(n))
  proof+=f'Lemma f16_store_undef{n}_cells : forall p,UShortArray.undef_full p {n} --||-- {cellu}.\nProof. intros;unfold UShortArray.undef_full,store_undef_array;change(Z.to_nat {n})with({n}%nat);cbn[store_undef_array_rec];unfold StoreUShortAsElement.undefstoreA;rewrite ?sizeof_ushort;split;entailer!. Qed.\n'
  proof+=f'Lemma f16_store_full{n}_cells : forall p {params}, UShortArray.full p {n} ({pack}) --||-- {cellv}.\nProof. intros;unfold UShortArray.full,store_array,f16_pack{n};cbn[store_array_rec];unfold StoreUShortAsElement.storeA;rewrite ?sizeof_ushort;split;entailer!. Qed.\n'
 for n in [8,4,2,1]:
  count=8 if n==8 else 4;typ='uint16x8_t' if n==8 else 'uint16x4_t';pt='void*' if n==2 else 'uint16_t*';prim='qcp_f16_store'+str(n)+('_0' if n<4 else '');name=prim+'_array';xs=' '.join('(x'+str(i)+':Z)'for i in range(count));aheap=' * '.join('store(&(a->s'+str(i)+'),unsigned short,x'+str(i)+')'for i in range(count));args=','.join('x'+str(i)for i in range(n));pack='f16_pack'+str(n)+'('+args+')';decl='void '+name+'('+pt+' p,const '+typ+'* a)\n/*@ With '+xs+'\n Require '+aheap+' * UShortArray::undef_full(p,'+str(n)+')\n Ensure '+aheap+' * UShortArray::full(p,'+str(n)+','+pack+') */';head+=decl+';\n';undef=' * '.join('undef_data_at(pointer_offset(p,'+str(i)+',unsigned short),unsigned short)'for i in range(n));cells=' * '.join('store(pointer_offset(p,'+str(i)+',unsigned short),unsigned short,x'+str(i)+')'for i in range(n));source+=decl+'\n{\n /*@ UShortArray::undef_full(p,'+str(n)+') which implies '+undef+' */\n '+prim+'(p,a);\n /*@ '+cells+' which implies UShortArray::full(p,'+str(n)+','+pack+') */\n}\n'
 head+='''#undef vst1q_u16
#define vst1q_u16(p,a) qcp_f16_store8_array((p),&(a))
#undef vst1_u16
#define vst1_u16(p,a) qcp_f16_store4_array((p),&(a))
#undef vst1_lane_u16
#define vst1_lane_u16(p,a,n) qcp_f16_store1_##n##_array((p),&(a))
#undef vst1_lane_u32
#define vst1_lane_u32(p,a,n) qcp_f16_store2_##n##_array((p),(a))
#endif
'''
 proof+='''Ltac f16_store_arrays_finish :=
 try left;intros;cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;
 rewrite ?f16_store_undef1_cells,?f16_store_undef2_cells,?f16_store_undef4_cells,?f16_store_undef8_cells;
 rewrite ?f16_store_full1_cells,?f16_store_full2_cells,?f16_store_full4_cells,?f16_store_full8_cells;
 f16_vector_finish.
Print Assumptions f16_store_undef8_cells.
Print Assumptions f16_store_full8_cells.
'''
 (H/'coq/PackModel.v').write_text(model);(H/'coq/UShortArrayBridge.v').write_text(proof);(C/'shim/store_arrays.h').write_text(head);(C/'shim/store_arrays.c').write_text(source);print('4 actual store-array adapter bodies and8 resource equivalences')
if __name__=='__main__':main()
