#!/usr/bin/env python3
"""Generate only audited f32-vadd shared intrinsic bodies and field contracts."""
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2]
OUT=ROOT/'shared/vadd'
OUT.mkdir(parents=True,exist_ok=True)
T={4:'float32x4_t',2:'float32x2_t'}
header='''#ifndef QCP_VADD_INTRINSICS_H
#define QCP_VADD_INTRINSICS_H
/*@ Import Coq Require Import QcpVadd.VaddBits */
/*@ Extern Coq (fp32_bits_equal : fp32 -> fp32 -> Prop)
               (vadd_vl : Z -> Z)
               (vadd_active_add : Z -> Z -> fp32 -> fp32 -> fp32) */
'''+''.join('struct '+t+' { '+ ' '.join(f'float s{i};' for i in range(n))+' };\n' for n,t in T.items())
funcs=[]
def field(p,i): return f'&({p}->s{i})'
def cell(p,x): return f'store({p},float,{x})'
def undef(p): return f'undef_data_at({p},float)'
def at(p,i): return f'pointer_offset({p},{i},float)'
def fn(ret,name,args,binders,requires,ensures,body):
 contract='/*@ '+('With '+binders+'\n' if binders else '')+'    Require '+requires+'\n    Ensure '+ensures+' */'
 funcs.append(f'{ret} {name}({args})\n{contract}\n{{\n{body}\n}}\n')
 return f'{ret} {name}({args})\n{contract}\n;\n'
header+=fn('float','f32_add','float a, float b','', 'emp','fp32_bits_equal(__return,fp32_add(a,b))','  return a+b;')
for n in (4,2):
 xs=' '.join(f'(x{i}: fp32)' for i in range(n))
 a=[cell(at('p',i),f'x{i}') for i in range(n)]
 r=[cell(field('r',i),f'x{i}') for i in range(n)]
 if n==4:
  header+=fn('void','vld1q_f32',f'struct {T[n]} *r, const float *p',xs,' * '.join(a+[undef(field('r',i)) for i in range(n)]),' * '.join(a+r),'\n'.join(f'  r->s{i}=p[{i}];' for i in range(n)))
 header+=fn('void','vst1q_f32' if n==4 else 'vst1_f32',f'float *p, const struct {T[n]} *a',xs,' * '.join([cell(field('a',i),f'x{i}') for i in range(n)]+[undef(at('p',i)) for i in range(n)]),' * '.join([cell(field('a',i),f'x{i}') for i in range(n)]+a),'\n'.join(f'  p[{i}]=a->s{i};' for i in range(n)))
xs=' '.join(f'(x{i}: fp32) (y{i}: fp32)' for i in range(4))
ab=[cell(field(p,i),f'{v}{i}') for p,v in [('a','x'),('b','y')] for i in range(4)]
header+=fn('void','vaddq_f32','struct float32x4_t *r, const struct float32x4_t *a, const struct float32x4_t *b',xs,' * '.join(ab+[undef(field('r',i)) for i in range(4)]),' * '.join(ab+[cell(field('r',i),f'fp32_add(x{i},y{i})') for i in range(4)]),'\n'.join(f'  r->s{i}=f32_add(a->s{i},b->s{i});' for i in range(4)))
for name,start in [('vget_low_f32',0),('vget_high_f32',2)]:
 xs=' '.join(f'(x{i}: fp32)' for i in range(4))
 a=[cell(field('a',i),f'x{i}') for i in range(4)]
 header+=fn('void',name,'struct float32x2_t *r, const struct float32x4_t *a',xs,' * '.join(a+[undef(field('r',i)) for i in range(2)]),' * '.join(a+[cell(field('r',i),f'x{i+start}') for i in range(2)]),'\n'.join(f'  r->s{i}=a->s{i+start};' for i in range(2)))
a=[cell(field('a',i),f'x{i}') for i in range(2)]
header+=fn('void','vst1_lane_f32','float *p, const struct float32x2_t *a, int lane','(x0: fp32) (x1: fp32) (z: fp32)','((lane == 0 && fp32_bits_equal(z,x0)) || (lane == 1 && fp32_bits_equal(z,x1))) && '+' * '.join(a+[undef('p')]),' * '.join(a+[cell('p','z')]),'  if (lane == 0) *p=a->s0;\n  if (lane == 1) *p=a->s1;')
# A checked four-lane vadd block composes the load/add/store contracts.
# Scratch vectors are explicit caller-owned resources; no unproved local
# struct allocator predicate is hidden in the contract.
xs=' '.join(f'(x{i}: fp32) (y{i}: fp32)' for i in range(4))
inputs=[cell(at(p,i),f'{v}{i}') for p,v in [('a','x'),('b','y')] for i in range(4)]
scratch=[undef(field(p,i)) for p in ['va','vb','vc'] for i in range(4)]
outputs=[cell(at('out',i),f'fp32_add(x{i},y{i})') for i in range(4)]
values=[cell(field(p,i),f'{v}{i}') for p,v in [('va','x'),('vb','y')] for i in range(4)]
values += [cell(field('vc',i),f'fp32_add(x{i},y{i})') for i in range(4)]
header+=fn('void','qcp_vadd_block4','struct float32x4_t *va, struct float32x4_t *vb, struct float32x4_t *vc, const float *a, const float *b, float *out',xs,' * '.join(inputs+[undef(at('out',i)) for i in range(4)]+scratch),' * '.join(inputs+outputs+values),'  vld1q_f32(va,a);\n  vld1q_f32(vb,b);\n  vaddq_f32(vc,va,vb);\n  vst1q_f32(out,vc);')
header+=fn('unsigned long long','__riscv_vsetvl_e32m8','unsigned long long n','','emp','__return == vadd_vl(n) && emp','  if (n < 32) return n;\n  return 32;')
header+=fn('float','qcp_rvv_add_lane32','float a, float b, unsigned long long i, unsigned long long vl','','0 <= i && i < 32 && 0 <= vl && vl <= 32 && emp','fp32_bits_equal(__return,vadd_active_add(i,vl,a,b)) && emp','  if (i < vl) return f32_add(a,b);\n  return 0.0f;')
header+=fn('void','qcp_assert','int condition','','condition != 0 && emp','emp','  return;')
prefix, declarations = header.split('float f32_add',1)
(OUT/'intrinsics.h').write_text('#ifndef QCP_VADD_INTRINSICS_H\n#define QCP_VADD_INTRINSICS_H\n#include \"types.h\"\nfloat f32_add'+declarations+'#endif\n')
# Prototypes are separate for consumers; definition annotations are required
# for QCP to inspect each body rather than merely assume its contract.
structs=header.split('float f32_add',1)[0]+'#endif\n'
(OUT/'types.h').write_text(structs.replace('QCP_VADD_INTRINSICS_H','QCP_VADD_TYPES_H'))
(OUT/'intrinsics.c').write_text('#include "types.h"\n\n'+'\n'.join(funcs))
