from pathlib import Path
import json
c=Path(__file__).resolve().parent.parent;d=c/'shim';h=['#ifndef RDSUM_LOAD_PRIMITIVES_H','#define RDSUM_LOAD_PRIMITIVES_H','#include "formal_types.h"','#include "read_model.h"','/*@ Import Coq Require Import Qu8Rdsum.LoadModel */','/*@ Extern Coq (rd_read_lane:RDMap -> Z -> Z -> Z -> Z) */']
proto='''uint8_t rdsum_read_lane(const uint8_t *p,size_t i,size_t vl)
/*@ With (M:RDMap)
 Require 0<p && 0<=i && i<32 && 0<=vl && vl<=32 && p+vl<=(18446744073709551615+1) && rd_window(M,p,vl) && rd_mem(M)
 Ensure __return==rd_read_lane(M,p,i,vl) && 0<=__return && __return<=255 && rd_mem(M) */'''
h.append(proto+';');(d/'load_scalar.c').write_text('#include "load_primitives.h"\n'+proto+'\n{\n if(i<vl)return rdsum_read_byte(p+i) /*@ where M=M */;\n return 0;\n}\n')
for name,t,n,dynamic in [('vld1_u8','uint8x8_t',8,False),('vld1q_u8','uint8x16_t',16,False),('__riscv_vle8_v_u8m2','vuint8m2_t',32,True)]:
 vl='vl'if dynamic else str(n);args='const uint8_t *p'+(',size_t vl'if dynamic else'');req='0<p && '+('0<=vl && vl<=32 && 'if dynamic else'')+f'p+{vl}<=(18446744073709551615+1) && rd_window(M,p,{vl}) && rd_mem(M)';post='rd_mem(M) * '+' * '.join(f'store(&(__return.s{i}),unsigned char,rd_read_lane(M,p,{i},{vl}))'for i in range(n));proto=f'{t} {name}({args})\n/*@ With (M:RDMap) Require {req} Ensure {post} */';h.append(proto+';');(d/(name+'.c')).write_text('#include "load_primitives.h"\n'+proto+'\n{\n'+t+' r;\n'+'\n'.join(f'r.s{i}=rdsum_read_lane(p,{i},{vl}) /*@ where M=M */;'for i in range(n))+'\nreturn r;\n}\n')
h+=['#endif'];(d/'load_primitives.h').write_text('\n'.join(h)+'\n');print('4 actual C units written (readlane/load8/load16/load32)')
