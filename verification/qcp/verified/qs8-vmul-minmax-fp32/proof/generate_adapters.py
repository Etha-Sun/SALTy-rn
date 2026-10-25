#!/usr/bin/env python3
from pathlib import Path
import importlib.util,json,hashlib
C=Path(__file__).resolve().parent.parent;P=C/'proof';S=C/'shim';spec=importlib.util.spec_from_file_location('specs',P/'generate_intrinsic_specs.py');g=importlib.util.module_from_spec(spec);spec.loader.exec_module(g)
parts=[];units=[]
def normal(name,ret,args,expr,body):
 decl=g.emit(name,ret,args,expr);parts.append(decl);fn=S/(name+'.c');fn.write_text('#include "adapters.h"\n'+decl.rstrip().removesuffix(';')+'\n{\n'+body+'\n}\n');units.append({'stem':name,'source':str(fn.relative_to(C)),'kind':'ordinary actual C composition adapter','contract':decl})
def bind(typ,var,ghost='a',offset=0,whereaddr=None):
 _,kind,k=g.meta[typ];return (ghost+'='+ (whereaddr or'&'+var)+',' if var else'')+','.join(ghost+str(i)+'='+ghost+str(i+offset)for i in range(k))
for which,off in [('low',0),('high',4)]:
 body='int16x4_t al=vget_'+which+'_s16(a) /*@ where a=&a,'+','.join('a'+str(i)+'=a'+str(i)for i in range(8))+' */;\nint16x4_t bl=vget_'+which+'_s16(b) /*@ where a=&b,'+','.join('a'+str(i)+'=b'+str(i)for i in range(8))+' */;\nint32x4_t r=vmull_s16(al,bl) /*@ where a=&al,b=&bl,'+','.join('a'+str(i)+'=a'+str(i+off)for i in range(4))+','+','.join('b'+str(i)+'=b'+str(i+off)for i in range(4))+' */;\nreturn r;'
 normal('qm_mull_'+which,'int32x4_t',[('int16x8_t','a'),('int16x8_t','b')],lambda j,o=off:f'a{j+o}*b{j+o}',body)
body='float32x4_t s=vaddq_f32(a,b) /*@ where a=&a,b=&b,'+','.join(n+str(i)+'='+n+str(i)for n in ['a','b']for i in range(4))+' */;\nint32x4_t r=vreinterpretq_s32_f32(s) /*@ where a=&s,'+','.join('a'+str(i)+'=qm_arm_add(a'+str(i)+',b'+str(i)+')'for i in range(4))+' */;\nreturn r;'
normal('qm_add_reinterpret','int32x4_t',[('float32x4_t','a'),('float32x4_t','b')],lambda j:f'qm_signed_bits(bits_of_fp32(qm_arm_add(a{j},b{j})))',body)
body='int16x4_t lo=vqmovn_s32(a) /*@ where a=&a,'+','.join('a'+str(i)+'=a'+str(i)for i in range(4))+' */;\nint16x8_t r=vqmovn_high_s32(lo,b) /*@ where a=&lo,b=&b,'+','.join('a'+str(i)+'=qm_sat16(a'+str(i)+')'for i in range(4))+','+','.join('b'+str(i)+'=b'+str(i)for i in range(4))+' */;\nreturn r;'
normal('qm_narrow_pair','int16x8_t',[('int32x4_t','a'),('int32x4_t','b')],lambda j:f'qm_sat16(a{j})'if j<4 else f'qm_sat16(b{j-4})',body)
# Source-used nested sign-extension/subtraction, with unconstrained inactive data.
decl=g.rvv('qm_sext_sub','vint16m4_t',[('vint8m2_t','a'),('int16_t','x'),('size_t','vl')],lambda j:f'qm_sub16(A({j}),x)');parts.append(decl);body='vint16m4_t s=__riscv_vsext_vf2_i16m4(a,vl) /*@ where a=&a,A=A */;\nvint16m4_t r=__riscv_vsub_vx_i16m4(s,x,vl) /*@ where a=&s,A=A */;\nreturn r;';fn=S/'qm_sext_sub.c';fn.write_text('#include "adapters.h"\n'+decl.rstrip().removesuffix(';')+'\n{\n'+body+'\n}\n');units.append({'stem':'qm_sext_sub','source':str(fn.relative_to(C)),'kind':'ordinary actual C composition adapter','contract':decl})
# No body aliases an input vector resource to two operand locations.
withs=' '.join('(x'+str(i)+':Z)'for i in range(8));inheap=' * '.join('store(&(a->s'+str(i)+'),char,x'+str(i)+')'for i in range(8))
for k in [4,2,1]:
 name='qm_store'+str(k);undef=' * '.join('undef_data_at(out+'+str(i)+',char)'for i in range(k));post=' * '.join('store(out+'+str(i)+',char,x'+str(i)+')'for i in range(k));decl='void '+name+'(const int8x8_t *a,int8_t *out,int lane)\n/*@ With '+withs+'\n Require lane==0 && '+undef+' * '+inheap+'\n Ensure '+post+' * '+inheap+' */;\n';parts.append(decl);fn=S/(name+'.c');fn.write_text('#include "adapters.h"\n'+decl.rstrip().removesuffix(';')+'\n{\n'+''.join('out['+str(i)+']=a->s'+str(i)+';\n'for i in range(k))+'}\n');units.append({'stem':name,'source':str(fn.relative_to(C)),'kind':'ordinary actual C readonly-pointer byte store adapter','contract':decl})
post=' * '.join('store(&(__return.s'+str(i)+'),char,qm_ext8('+','.join('x'+str(j)for j in range(8))+',k,'+str(i)+'))'for i in range(8));decl='int8x8_t qm_ext_self(const int8x8_t *a,int k)\n/*@ With '+withs+'\n Require (k==2 || k==4) && '+inheap+'\n Ensure '+inheap+' * '+post+' */;\n';parts.append(decl);fn=S/'qm_ext_self.c';body='int8x8_t r;\nif(k==4){\n'+''.join('r.s'+str(i)+'=a->s'+str((i+4)%8)+';\n'for i in range(8))+'}else{\n'+''.join('r.s'+str(i)+'=a->s'+str((i+2)%8)+';\n'for i in range(8))+'}\nreturn r;';fn.write_text('#include "adapters.h"\n'+decl.rstrip().removesuffix(';')+'\n{\n'+body+'\n}\n');units.append({'stem':'qm_ext_self','source':str(fn.relative_to(C)),'kind':'ordinary actual C same-operand extract adapter','contract':decl})
(S/'adapters.h').write_text('#ifndef QS8MUL_ADAPTERS_H\n#define QS8MUL_ADAPTERS_H\n#include "intrinsics_neon.h"\n#include "intrinsics_rvv.h"\n#include "active_model.h"\n/*@ Extern Coq (qm_ext8:'+' -> '.join(['Z']*11)+') */\n'+''.join(parts)+'#endif\n')
(P/'adapter-unit-inventory.json').write_text(json.dumps({'whole_kernel_verified':False,'units':units,'note':'Every listed ordinary adapter still requires current actual C goal generation, complete typed proof and call closure; source-review alone is insufficient.'},indent=2)+'\n');print('Prepared',len(units),'actual C units')
# Kernels retain raw C tokens. Only these audited bare-lvalue composition shapes
# are supported; a separate source checker rejects all other macro invocations.
(S/'neon_frontend.h').write_text('''#include "adapters.h"
#include "store.h"
#include "program_model.h"
#include "control.h"
#define vst1_s8(p,a) qm_store8((p),&(a))
#define vst1_lane_s8(p,a,l) qm_store1(&(a),(p),(l))
#define vst1_lane_u32(p,v,l) QM_STORE32_##v p),l)
#define QM_STORE32_vreinterpret_u32_s8(a) qm_store4(&(a),(int8_t*)(
#define vst1_lane_u16(p,v,l) QM_STORE16_##v p),l)
#define QM_STORE16_vreinterpret_u16_s8(a) qm_store2(&(a),(int8_t*)(
#define vext_s8(a,b,k) qm_ext_self(&(a),(k))
#define vmull_s16(a,b) QM_MULL_##a QM_MULL_END_##b
#define QM_MULL_vget_low_s16(a) qm_mull_low(a,
#define QM_MULL_vget_high_s16(a) qm_mull_high(a,
#define QM_MULL_END_vget_low_s16(b) b)
#define QM_MULL_END_vget_high_s16(b) b)
#define vreinterpretq_s32_f32(x) QM_ADD_REINTERPRET_##x
#define QM_ADD_REINTERPRET_vaddq_f32(a,b) qm_add_reinterpret(a,b)
#define vqmovn_high_s32(x,y) QM_NARROW_##x y)
#define QM_NARROW_vqmovn_s32(a) qm_narrow_pair(a,
''')
(S/'rvv_frontend.h').write_text('''#include "adapters.h"
#include "program_model.h"
#include "control.h"
#define __riscv_vsub_vx_i16m4(a,x,vl) QM_SEXT_SUB_##a x,vl)
#define QM_SEXT_SUB___riscv_vsext_vf2_i16m4(a,vl) qm_sext_sub(a,
''')
