#!/usr/bin/env python3
"""Explicit scalar-field intrinsic bodies for this case; no kernel rewriting.

Only shifts0/13/16 and self-vext2 used by the live kernels are supported.
Unsupported macro argument shapes fail compilation/generation.
"""
from pathlib import Path
import json
H=Path(__file__).resolve().parent;C=H.parent
T={
 'f4':('float32x4_t','float','fp32',4),
 'u4':('uint32x4_t','unsigned int','Z',4),
 'h4':('uint16x4_t','unsigned short','Z',4),
 'h8':('uint16x8_t','unsigned short','Z',8),
 'vf':('vfloat32m8_t','float','fp32',32),
 'vu':('vuint32m8_t','unsigned int','Z',32),
 'vh':('vuint16m4_t','unsigned short','Z',32),
 'mb':('vbool4_t','int','Z',32),
}
rows=[];active=[]
def unit(name,out,args,scalars,models,values,ret_alias=None):
 assert out in T and len(models)==len(values)==T[out][3]
 assert all(t in T for _,t,_ in args)
 rows.append(dict(name=name,out=out,args=args,scalars=scalars,models=models,values=values,ret_alias=ret_alias))
def ordinary(name,out,args,prim,logical):
 n=T[out][3];xs=[prefix+'{i}' for _,_,prefix in args];vs=[a+'.s{i}'for a,_,_ in args]
 unit(name,out,args,[],[logical.format(*[x.format(i=i)for x in xs])for i in range(n)],[prim.format(*[x.format(i=i)for x in vs])for i in range(n)])
for name,out,ct in [('vdupq_n_u32','u4','unsigned int'),('vdupq_n_f32','f4','float'),('vdupq_n_u16','h8','unsigned short')]:
 unit(name,out,[],[(ct,'b')],['b']*T[out][3],['b']*T[out][3])
for name,out,kind,prim,model in [
 ('vabsq_f32','f4','f4','qcp_f16_abs({0})','f16_abs({0})'),
 ('vreinterpretq_u32_f32','u4','f4','qcp_float_bits({0})','bits_of_fp32({0})'),
 ('vreinterpretq_f32_u32','f4','u4','qcp_float_from_bits({0})','fp32_of_bits({0})'),
 ('vmovn_u32','h4','u4','qcp_f16_narrow16({0})','f16_narrow16({0})'),
 ('qcp_f16_vshrn_13','h4','u4','qcp_f16_shrn13({0})','f16_shrn13({0})'),
 ('qcp_f16_vshrn_16','h4','u4','qcp_f16_shrn16({0})','f16_shrn16({0})')]:
 ordinary(name,out,[('a',kind,'x')],prim,model)
for name,out,op in [('vaddq_u32','u4','add32'),('vandq_u32','u4','and32'),('vmaxq_u32','u4','max32'),('vcgtq_u32','u4','gt32'),('vmulq_f32','f4','arm_mul'),('vaddq_f32','f4','arm_add'),('vandq_u16','h8','and16'),('vand_u16','h4','and16'),('vaddq_u16','h8','add16'),('vadd_u16','h4','add16'),('vorrq_u16','h8','or16'),('vorr_u16','h4','or16')]:
 ordinary(name,out,[('a',out,'x'),('b',out,'y')],'qcp_f16_'+op+'({0},{1})','f16_'+op+'({0},{1})')
for name,out in [('vbslq_u16','h8'),('vbsl_u16','h4')]:
 ordinary(name,out,[('m',out,'m'),('a',out,'x'),('b',out,'y')],'qcp_f16_select16({0},{1},{2})','f16_select16({0},{1},{2})')
unit('vcombine_u16','h8',[('a','h4','x'),('b','h4','y')],[],[('x'+str(i)if i<4 else'y'+str(i-4))for i in range(8)],[('a.s'+str(i)if i<4 else'b.s'+str(i-4))for i in range(8)])
unit('vget_low_u16','h4',[('a','h8','x')],[],['x'+str(i)for i in range(4)],['a.s'+str(i)for i in range(4)])
unit('qcp_f16_reinterpret_u32_u16','h4',[('a','h4','x')],[],['x'+str(i)for i in range(4)],['a.s'+str(i)for i in range(4)],ret_alias='uint32x2_t')
# Every RVV operation below uses all32 actual scalar fields, selecting0 only for
# unobserved inactive lanes. No VLMAX reduction or abstract loop body is used.
def rvv(name,out,args,scalar,prim,model):
 n=32;pars=[]
 for a,t,p in args:pars.append((T[t][1],a,p))
 pars.extend((ct,a,a)for ct,a in scalar)
 active.append(dict(name=name,out=out,pars=pars,primitive=prim,model=model))
 ms=[];vs=[]
 for i in range(n):
  margs=[str(i),'vl']+[p+str(i)for _,_,p in args]+[a for _,a in scalar]
  cargs=[a+'.s'+str(i)for a,_,_ in args]+[a for _,a in scalar]+[str(i),'vl']
  ms.append('f16_active_'+name+'('+','.join(margs)+')');vs.append('qcp_f16_active_'+name+'('+','.join(cargs)+')')
 unit(name,out,args,scalar+[('size_t','vl')],ms,vs)
rvv('__riscv_vfabs_v_f32m8','vf',[('a','vf','x')],[],'qcp_f16_abs(a)','f16_abs x')
rvv('__riscv_vadd_vx_u32m8','vu',[('a','vu','x')],[('unsigned int','b')],'qcp_f16_add32(a,b)','f16_add32 x b')
rvv('__riscv_vand_vx_u32m8','vu',[('a','vu','x')],[('unsigned int','b')],'qcp_f16_and32(a,b)','f16_and32 x b')
rvv('__riscv_vmaxu_vx_u32m8','vu',[('a','vu','x')],[('unsigned int','b')],'qcp_f16_max32(a,b)','f16_max32 x b')
rvv('__riscv_vmsgtu_vx_u32m8_b4','mb',[('a','vu','x')],[('unsigned int','b')],'(qcp_f16_gt32(a,b)!=0)','if Z.ltb b x then 1 else 0')
rvv('__riscv_vfmul_vf_f32m8','vf',[('a','vf','x')],[('float','b')],'qcp_f16_rvv_mul(a,b)','f16_rvv_mul x b')
rvv('__riscv_vfadd_vv_f32m8','vf',[('a','vf','x'),('b','vf','y')],[],'qcp_f16_rvv_add(a,b)','f16_rvv_add x y')
for sh,op in [(0,'narrow16'),(13,'shrn13'),(16,'shrn16')]:rvv('qcp_f16_rvv_shrn_'+str(sh),'vh',[('a','vu','x')],[],'qcp_f16_'+op+'(a)','f16_'+op+' x')
rvv('__riscv_vand_vx_u16m4','vh',[('a','vh','x')],[('unsigned short','b')],'qcp_f16_and16(a,b)','f16_and16 x b')
rvv('__riscv_vadd_vv_u16m4','vh',[('a','vh','x'),('b','vh','y')],[],'qcp_f16_add16(a,b)','f16_add16 x y')
rvv('__riscv_vmerge_vxm_u16m4','vh',[('a','vh','x'),('mask','mb','m')],[('unsigned short','b')],'(mask ? b : a)','if Z.eqb m 0 then x else b')
rows[-1]['parameter_order']=['a','b','mask','vl']
rvv('__riscv_vor_vv_u16m4','vh',[('a','vh','x'),('b','vh','y')],[],'qcp_f16_or16(a,b)','f16_or16 x y')
for name,out,kind,prim,model in [('__riscv_vreinterpret_v_f32m8_u32m8','vu','vf','qcp_float_bits({0})','bits_of_fp32({0})'),('__riscv_vreinterpret_v_u32m8_f32m8','vf','vu','qcp_float_from_bits({0})','fp32_of_bits({0})')]:ordinary(name,out,[('a',kind,'x')],prim,model)

def main():
 assert len(rows)==len({u['name']for u in rows})
 vm='From Coq Require Import ZArith.\nFrom F32F16 Require Export Types IntegerModel.\nLocal Open Scope Z_scope.\n'
 ah='#ifndef QCP_F32F16_ACTIVE_H\n#define QCP_F32F16_ACTIVE_H\n#include "types_def.h"\n#include "scalar.h"\n#include "integer.h"\n/*@ Import Coq Require Import F32F16.VectorModel */\n/*@ Extern Coq '
 ac='#include "active.h"\n'
 for u in active:
  name=u['name'];out=u['out'];ct=T[out][1];floatret=ct=='float';args=[];cs=[];types=[];bind=[]
  for pct,p,logic in u['pars']:
   lt='fp32'if pct=='float'else'Z';bind.append('('+logic+':'+lt+')');args.append(logic);cs.append(pct+' '+p);types.append(lt)
  vm+='Definition f16_active_'+name+' (i vl:Z) '+' '.join(bind)+' : '+('fp32'if floatret else'Z')+' := if Z.ltb i vl then ('+u['model']+') else '+('fp32_zero'if floatret else'0')+'.\n'
  ah+='\n (f16_active_'+name+' : Z -> Z -> '+' -> '.join(types+['fp32'if floatret else'Z'])+')'
  call='f16_active_'+name+'('+','.join(['i','vl']+[p for _,p,_ in u['pars']])+')'
  decl=ct+' qcp_f16_active_'+name+'('+','.join(cs+['size_t i','size_t vl'])+')\n/*@ Require 0 <= i && i < 32 && 0 <= vl && vl <= 32 && emp Ensure '+('f16_same_bits(__return,'+call+')'if floatret else'__return == '+call)+' && emp */'
  u['declaration']=decl
  if name=='__riscv_vmerge_vxm_u16m4':
   # Avoid integer promotion of a ushort ternary; direct ushort returns keep
   # exactly the same typed C behavior and the original lane contract.
   ac+=decl+'\n{ if(i<vl) { if(mask) return b; return a; } return 0; }\n'
  else:ac+=decl+'\n{ if(i<vl) return '+u['primitive']+'; return '+('qcp_float_from_bits(0u)'if floatret else'0')+'; }\n'
 ah+=' */\n'+'\n'.join(u['declaration']+';'for u in active)+'\n#endif\n';(C/'shim/active.c').write_text(ac);(C/'shim/active.h').write_text(ah);(H/'coq/VectorModel.v').write_text(vm)
 vh='#ifndef QCP_F32F16_VECTOR_OPS_H\n#define QCP_F32F16_VECTOR_OPS_H\n#include "active.h"\n';units=[]
 for u in rows:
  name=u['name'];out=u['out'];n=T[out][3];withs=[];cells=[]
  for a,t,p in u['args']:
   for i in range(T[t][3]):withs.append('('+p+str(i)+':'+T[t][2]+')');cells.append('store(&('+a+'.s'+str(i)+'),'+T[t][1]+','+p+str(i)+')')
  pre=' * '.join(cells)if cells else'emp'
  if any(a=='vl'for _,a in u['scalars']):pre='0 <= vl && vl <= 32 && '+pre
  post=' * '.join('store(&(__return.s'+str(i)+'),'+T[out][1]+','+u['models'][i]+')'for i in range(n))
  args=[T[t][0]+' '+a for a,t,_ in u['args']]+[ct+' '+a for ct,a in u['scalars']]
  if 'parameter_order'in u:
   amap={a:T[t][0]+' '+a for a,t,_ in u['args']};amap.update({a:ct+' '+a for ct,a in u['scalars']});assert set(u['parameter_order'])==set(amap);args=[amap[a]for a in u['parameter_order']]
  decl=(u['ret_alias']or T[out][0])+' '+name+'('+','.join(args)+')\n/*@ '+('With '+' '.join(withs)+'\n 'if withs else'')+'Require '+pre+'\n Ensure '+post+' */'
  vh+=decl+';\n';body='#include "vector_ops.h"\n'+decl+'\n{\n '+T[out][0]+' r;\n'+'\n'.join(' r.s'+str(i)+'='+u['values'][i]+';'for i in range(n))+'\n return r;\n}\n';(C/'shim'/(name+'.c')).write_text(body);units.append({'name':name,'source':'shim/'+name+'.c','kind':'scalar_field_vector','lanes':n})
 # The actual raw-byte view is4 ushort fields. Lane0 writes two ushort cells;
 # this is the same4 little-endian bytes and adds no4-byte-alignment demand.
 name='qcp_f16_vext_u16_2';withs=' '.join('(x'+str(i)+':Z)'for i in range(4));cells=' * '.join('store(&(a->s'+str(i)+'),unsigned short,x'+str(i)+')'for i in range(4));post=cells+' * '+' * '.join('store(&(__return.s'+str(i)+'),unsigned short,x'+str((i+2)%4)+')'for i in range(4));decl='uint16x4_t '+name+'(const uint16x4_t* a,const uint16x4_t* b)\n/*@ With '+withs+'\n Require a == b && '+cells+'\n Ensure '+post+' */';body='#include "vector_ops.h"\n'+decl+'\n{ uint16x4_t r;\n'+'\n'.join(' r.s'+str(i)+'=a->s'+str((i+2)%4)+';'for i in range(4))+'\n return r; }\n';(C/'shim'/(name+'.c')).write_text(body);vh+=decl+';\n';units.append({'name':name,'source':'shim/'+name+'.c','kind':'borrowed_self_vext','lanes':4})
 vh+='''#define vshrn_n_u32(a,n) qcp_f16_vshrn_##n((a))
#define __riscv_vnsrl_wx_u16m4(a,n,vl) qcp_f16_rvv_shrn_##n((a),(vl))
#define vreinterpret_u32_u16(a) qcp_f16_reinterpret_u32_u16((a))
#define vext_u16(a,b,n) qcp_f16_vext_u16_##n(&(a),&(b))
#endif
''';(C/'shim/vector_ops.h').write_text(vh);(H/'vector-units.json').write_text(json.dumps(units,indent=2)+'\n');(H/'active-units.json').write_text(json.dumps(active,indent=2)+'\n');print('actual_vector_units',len(units),'actual_active_helpers',len(active))
if __name__=='__main__':main()
