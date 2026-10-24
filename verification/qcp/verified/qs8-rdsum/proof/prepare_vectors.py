#!/usr/bin/env python3
"""Case-local actual scalar-field integer helpers; does not issue proof status."""
from pathlib import Path
import json,hashlib
c=Path(__file__).resolve().parent.parent;root=next(p for p in c.parents if(p/'.git').exists());ns='Qs8Rdsum';d=c/'shim';p=c/'proof/coq'
types={'int8x8_t':(8,8),'int16x8_t':(16,8),'int32x2_t':(32,2),'int32x4_t':(32,4),'vint8m2_t':(8,32),'vint16m4_t':(16,32),'vint32m8_t':(32,32)}
cell={8:'char',16:'short',32:'int'};sl={8:'Char',16:'Short',32:'Int'};bound=lambda b:(-2**(b-1),2**(b-1)-1)
h=['#ifndef RDSUM_FORMAL_TYPES_H','#define RDSUM_FORMAL_TYPES_H','#include "formal_model.h"','/*@ Import Coq Require Import '+ns+'.Types */']
v=['From Coq Require Import ZArith String.','From SimpleC.SL Require Export Mem SeparationLogic.','From '+ns+' Require Export Model.','Import Snaive_C_Rules64.','Local Open Scope string_scope.','Local Open Scope sac.']
for t,(bits,n)in types.items():
 h+=['typedef struct '+t+' { '+''.join(f'int{bits}_t s{i};'for i in range(n))+' } '+t+';','/*@ Extern Coq (UndefStructPred'+t+' : Z -> Assertion) */']
 v+=['Definition UndefStructPred'+t+'(p:Z):Assertion :=\n'+' **\n'.join(f'(&(p # "{t}" ->ₛ "s{i}")) # {sl[bits]} |->_'for i in range(n))+'.']
donor=root/'verification/qcp/verified/qs8-f32-vcvt/proof/coq/Types.v';v+=['Lemma local_field_address'+donor.read_text().split('Lemma local_field_address',1)[1]]
h+=['struct xnn_qs8_rsum_params { char _; };','#endif'];(d/'formal_types.h').write_text('\n'.join(h)+'\n');(p/'Types.v').write_text('\n'.join(v)+'\n');(p/'FastFrame.v').write_text((donor.parent/'FastFrame.v').read_text())
models='''From Coq Require Import ZArith.
From Qs8Rdsum Require Export Model.
Local Open Scope Z_scope.
Definition rd_wadd16(a b:Z):Z := rs_s16(a+b).
Definition rd_active_wadd16(a b i vl:Z):Z := if Z.ltb i vl then rd_wadd16 a b else 0.
Definition rd_active_wadd32(a b i vl:Z):Z := if Z.ltb i vl then rs_add_s32 a b else 0.
Definition rd_splat(x i vl:Z):Z := if Z.ltb i vl then x else 0.
''';(p/'VectorModel.v').write_text(models)
sh=['#ifndef RDSUM_VECTOR_SCALAR_H','#define RDSUM_VECTOR_SCALAR_H','#include "scalar_primitives.h"','/*@ Import Coq Require Import Qs8Rdsum.VectorModel */','/*@ Extern Coq (rd_wadd16:Z -> Z -> Z) (rd_active_wadd16:Z -> Z -> Z -> Z -> Z) (rd_active_wadd32:Z -> Z -> Z -> Z -> Z) (rd_splat:Z -> Z -> Z -> Z) */'];sc=['#include "vector_scalar.h"']
def scalar(name,ret,args,req,expr,body):
 lo,hi=bound(int(ret[3:-2]));proto=f'{ret} {name}({args})\n/*@ Require {req} && emp Ensure __return=={expr} && {lo}<=__return && __return<={hi} && emp */'
 sh.append(proto+';');sc.append(proto+'\n{'+body+'}')
scalar('rdsum_wadd16','int16_t','int16_t a,int8_t b','-32768<=a && a<=32767 && -128<=b && b<=127','rd_wadd16(a,b)','int32_t sum=(int32_t)a+(int32_t)b;return rsum_narrow16(sum);')
for suffix,abits,bbits,model,callee in [('wadd16',16,8,'rd_active_wadd16','rdsum_wadd16'),('wadd32',32,16,'rd_active_wadd32','rsum_add_s32'),('add32',32,32,'rd_active_wadd32','rsum_add_s32')]:
 al,ah=bound(abits);bl,bh=bound(bbits)
 scalar('rdsum_active_'+suffix,f'int{abits}_t',f'int{abits}_t a,int{bbits}_t b,size_t i,size_t vl',f'{al}<=a && a<={ah} && {bl}<=b && b<={bh} && 0<=i && i<=18446744073709551615 && 0<=vl && vl<=18446744073709551615',f'{model}(a,b,i,vl)',f'if(i<vl)return {callee}(a,b);return 0;')
for bits in[16,32]:
 lo,hi=bound(bits);scalar('rdsum_splat'+str(bits),f'int{bits}_t',f'int{bits}_t x,size_t i,size_t vl',f'{lo}<=x && x<={hi} && 0<=i && i<=18446744073709551615 && 0<=vl && vl<=18446744073709551615','rd_splat(x,i,vl)','if(i<vl)return x;return 0;')
sh+=['#endif'];(d/'vector_scalar.h').write_text('\n'.join(sh)+'\n');(d/'vector_scalar.c').write_text('\n'.join(sc)+'\n')
heads=['#ifndef RDSUM_VECTOR_PRIMITIVES_H','#define RDSUM_VECTOR_PRIMITIVES_H','#include "formal_types.h"','#include "vector_scalar.h"'];units=[]
def make(name,ret,args,expr,body,extra=''):
 vs=[];pure=[];heap=[]
 for var,t in args:
  if t in types:
   bits,n=types[t];lo,hi=bound(bits)
   for i in range(n):vs.append(f'({var}{i}:Z)');pure.append(f'{lo}<={var}{i} && {var}{i}<={hi}');heap.append(f'store(&({var}.s{i}),{cell[bits]},{var}{i})')
 if ret in types:
  bits,n=types[ret];post=' * '.join(f'store(&(__return.s{i}),{cell[bits]},{expr(i)})'for i in range(n))
 else:post='__return=='+expr(0)+' && emp'
 req=' && '.join(pure+([extra]if extra else[])+[' * '.join(heap)if heap else'emp']);proto=ret+' '+name+'('+','.join(t+' '+a for a,t in args)+')\n/*@ '+('With '+' '.join(vs)+' 'if vs else'')+'Require '+req+' Ensure '+post+' */'
 heads.append(proto+';');(d/(name+'.c')).write_text('#include "vector_primitives.h"\n'+proto+'\n{\n'+body+'\n}\n');units.append(name)
def fields(ret,n,expr):return ret+' r;\n'+'\n'.join(f'r.s{i}={expr(i)};'for i in range(n))+'\nreturn r;'
for bits,n,t,name in[(16,8,'int16x8_t','vmovq_n_s16'),(32,4,'int32x4_t','vdupq_n_s32')]:
 lo,hi=bound(bits);make(name,t,[('x',f'int{bits}_t')],lambda i:'x',fields(t,n,lambda i:'x'),f'{lo}<=x && x<={hi}')
make('vaddw_s8','int16x8_t',[('a','int16x8_t'),('b','int8x8_t')],lambda i:f'rd_wadd16(a{i},b{i})',fields('int16x8_t',8,lambda i:f'rdsum_wadd16(a.s{i},b.s{i})'))
for half,start in [('low',0),('high',4)]:
 make('rdsum_wadd16_'+half,'int32x4_t',[('a','int32x4_t'),('b','int16x8_t')],lambda i:f'rs_add_s32(a{i},b{i+start})',fields('int32x4_t',4,lambda i:f'rsum_add_s32(a.s{i},b.s{i+start})'))
make('vaddq_s32','int32x4_t',[('a','int32x4_t'),('b','int32x4_t')],lambda i:f'rs_add_s32(a{i},b{i})',fields('int32x4_t',4,lambda i:f'rsum_add_s32(a.s{i},b.s{i})'))
make('rdsum_addlow2','int32x2_t',[('a','int32x2_t'),('b','int32x4_t')],lambda i:f'rs_add_s32(a{i},b{i})',fields('int32x2_t',2,lambda i:f'rsum_add_s32(a.s{i},b.s{i})'))
make('rdsum_selfext2','int32x4_t',[('a','int32x4_t')],lambda i:'a'+str((i+2)%4),fields('int32x4_t',4,lambda i:'a.s'+str((i+2)%4)))
make('rdsum_lane0','int32_t',[('a','int32x4_t')],lambda i:'a0','return a.s0;')
for bits in[16,32]:
 t=f'vint{bits}m'+('4'if bits==16 else'8')+'_t';lo,hi=bound(bits);name='__riscv_vmv_v_x_i'+str(bits)+('m4'if bits==16 else'm8')
 make(name,t,[('x',f'int{bits}_t'),('vl','size_t')],lambda i:f'rd_splat(x,{i},vl)',fields(t,32,lambda i:f'rdsum_splat{bits}(x,{i},vl)'),f'{lo}<=x && x<={hi} && 0<=vl && vl<=32')
for name,t,bt,callee,model in [('__riscv_vwadd_wv_i16m4','vint16m4_t','vint8m2_t','rdsum_active_wadd16','rd_active_wadd16'),('__riscv_vwadd_wv_i32m8','vint32m8_t','vint16m4_t','rdsum_active_wadd32','rd_active_wadd32'),('__riscv_vadd_vv_i32m8','vint32m8_t','vint32m8_t','rdsum_active_add32','rd_active_wadd32')]:
 make(name,t,[('a',t),('b',bt),('vl','size_t')],lambda i:f'{model}(a{i},b{i},{i},vl)',fields(t,32,lambda i:f'{callee}(a.s{i},b.s{i},{i},vl)'),'0<=vl && vl<=32')
heads+=['#endif'];(d/'vector_primitives.h').write_text('\n'.join(heads)+'\n');(c/'proof/vector-units.json').write_text(json.dumps(units,indent=2)+'\n')
print(len(types),'types;',len(units),'actual vector units; 6 actual scalar bodies; proof pending')
