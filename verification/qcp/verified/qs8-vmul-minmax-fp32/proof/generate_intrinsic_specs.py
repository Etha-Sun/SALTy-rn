#!/usr/bin/env python3
"""Generate explicit reviewed numeric intrinsic contracts; no C bodies claimed.
RVV output contracts overapproximate only unobserved inactive lanes, never set
all inactive values to zero. Ordinary pointer/composition adapters are separate.
"""
from pathlib import Path
import json,hashlib
C=Path(__file__).resolve().parent.parent;P=C/'proof';S=C/'shim';NS='Qs8Mul'
meta={'int8x8_t':('char','Z',8),'int16x4_t':('short','Z',4),'int16x8_t':('short','Z',8),'int32x4_t':('int','Z',4),'float32x4_t':('float','fp32',4),'uint32x2_t':('unsigned int','Z',2),'uint16x4_t':('unsigned short','Z',4),'vint8m2_t':('char','Z',32),'vint16m4_t':('short','Z',32),'vint32m8_t':('int','Z',32),'vfloat32m8_t':('float','fp32',32)}
extern={'qm_min':'Z -> Z -> Z','qm_max':'Z -> Z -> Z','qm_sub16':'Z -> Z -> Z','qm_of_int':'Z -> fp32','qm_arm_mul':'fp32 -> fp32 -> fp32','qm_arm_add':'fp32 -> fp32 -> fp32','qm_rvv_mul':'fp32 -> fp32 -> fp32','qm_rvv_add':'fp32 -> fp32 -> fp32','qm_sign':'fp32 -> fp32 -> fp32','qm_sat32':'Z -> Z','qm_sat16':'Z -> Z','qm_sat8':'Z -> Z','qm_signed_bits':'Z -> Z','bits_of_fp32':'fp32 -> Z','qm_pack16':'Z -> Z -> Z','qm_pack32':'Z -> Z -> Z -> Z -> Z','qm_ext_pair':' -> '.join(['Z']*19),'qm_lane_match':'Z -> Z -> Z -> Z -> Prop','qm_fp_lane_match':'Z -> Z -> fp32 -> fp32 -> Prop','qm_vl_allowed':'Z -> Z -> Prop','rd_get':'RDMap -> Z -> Z','rd_window':'RDMap -> Z -> Z -> Prop','rd_mem':'RDMap -> Assertion','qm_magic':'fp32'}
# qm_ext_pair has18 scalar arguments (16 input lanes, shift, result index).
extern['qm_ext_pair']=' -> '.join(['Z']*19)
(S/'intrinsic_model.h').write_text('#ifndef QS8MUL_INTRINSIC_MODEL_H\n#define QS8MUL_INTRINSIC_MODEL_H\n#include "types_def.h"\n/*@ Import Coq Require Import Qs8Mul.IntrinsicModel */\n/*@ Extern Coq (RDMap :: *) */\n/*@ Extern Coq '+ ' '.join('('+n+':'+t+')'for n,t in extern.items())+' */\n#endif\n')
rows=[]
def emit(name,ret,args,expr,extra=''):
 withs=[];heap=[]
 for typ,n in args:
  if typ in meta:
   cell,kind,k=meta[typ];withs+=['('+n+str(j)+':'+kind+')'for j in range(k)];heap+=['store(&('+n+'.s'+str(j)+'),'+cell+','+n+str(j)+')'for j in range(k)]
 cell,kind,k=meta[ret];post=' * '.join('store(&(__return.s'+str(j)+'),'+cell+','+expr(j)+')'for j in range(k));req=(' && '.join(filter(None,[extra,' * '.join(heap)]))or'emp')
 decl=ret+' '+name+'('+','.join(t+' '+n for t,n in args)+')\n/*@ '+('With '+' '.join(withs)+'\n 'if withs else'')+'Require '+req+'\n Ensure '+post+' */;\n';rows.append({'name':name,'side':'NEON','return_type':ret,'arguments':args,'contract':decl,'evidence':'draft-review-pending','ISA_correspondence_formally_proved':False});return decl
x=[];add=lambda *a,**kw:x.append(emit(*a,**kw))
add('vdup_n_s8','int8x8_t',[('int8_t','x')],lambda j:'x')
add('vdupq_n_s32','int32x4_t',[('int32_t','x')],lambda j:'x')
add('vdupq_n_f32','float32x4_t',[('float','x')],lambda j:'x')
add('vsubl_s8','int16x8_t',[('int8x8_t','a'),('int8x8_t','b')],lambda j:f'a{j}-b{j}')
for suffix,offset in [('low',0),('high',4)]:add('vget_'+suffix+'_s16','int16x4_t',[('int16x8_t','a')],lambda j,o=offset:f'a{j+o}')
add('vmull_s16','int32x4_t',[('int16x4_t','a'),('int16x4_t','b')],lambda j:f'a{j}*b{j}')
add('vcvtq_f32_s32','float32x4_t',[('int32x4_t','a')],lambda j:f'qm_of_int(a{j})')
for op in ['mul','add']:add('v'+op+'q_f32','float32x4_t',[('float32x4_t','a'),('float32x4_t','b')],lambda j,o=op:f'qm_arm_{o}(a{j},b{j})')
add('vreinterpretq_s32_f32','int32x4_t',[('float32x4_t','a')],lambda j:f'qm_signed_bits(bits_of_fp32(a{j}))')
add('vqsubq_s32','int32x4_t',[('int32x4_t','a'),('int32x4_t','b')],lambda j:f'qm_sat32(a{j}-b{j})')
add('vqmovn_s32','int16x4_t',[('int32x4_t','a')],lambda j:f'qm_sat16(a{j})')
add('vqmovn_high_s32','int16x8_t',[('int16x4_t','a'),('int32x4_t','b')],lambda j:f'a{j}'if j<4 else f'qm_sat16(b{j-4})')
add('vcombine_s16','int16x8_t',[('int16x4_t','a'),('int16x4_t','b')],lambda j:f'a{j}'if j<4 else f'b{j-4}')
add('vqmovn_s16','int8x8_t',[('int16x8_t','a')],lambda j:f'qm_sat8(a{j})')
for op in ['min','max']:add('v'+op+'_s8','int8x8_t',[('int8x8_t','a'),('int8x8_t','b')],lambda j,o=op:f'qm_{o}(a{j},b{j})')
for bits,count in [(32,4),(16,2)]:add('vreinterpret_u'+str(bits)+'_s8','uint'+str(bits)+'x'+str(8//count)+'_t',[('int8x8_t','a')],lambda j,b=bits,c=count:'qm_pack'+str(b)+'('+','.join('a'+str(j*c+k)for k in range(c))+')')
add('vext_s8','int8x8_t',[('int8x8_t','a'),('int8x8_t','b'),('int','k')],lambda j:'qm_ext_pair('+','.join(['a'+str(i)for i in range(8)]+['b'+str(i)for i in range(8)]+['k',str(j)])+')',extra='0<=k && k<=7')
# Readonly overlapping inputs are described once by RDMap.
load='int8x8_t vld1_s8(const int8_t *p)\n/*@ With (M:RDMap)\n Require rd_window(M,p,8) && rd_mem(M)\n Ensure rd_mem(M) * '+' * '.join('store(&(__return.s'+str(j)+'),char,rd_get(M,p+'+str(j)+'))'for j in range(8))+' */;\n';x.append(load);rows.append({'name':'vld1_s8','side':'NEON','contract':load,'evidence':'draft-review-pending','memory':'rd_window at exactly8 input bytes, one rd_mem preserved; aliases allowed'})
(S/'intrinsics_neon.h').write_text('#ifndef QS8MUL_NEON_INTRINSICS_H\n#define QS8MUL_NEON_INTRINSICS_H\n#include "intrinsic_model.h"\n'+''.join(x)+'#endif\n')
def rvv(name,ret,args,out,extra=''):
 withs=[];pre=[]
 for typ,n in args:
  if typ in meta:
   cell,kind,k=meta[typ];withs.append('('+n.upper()+':Z -> '+kind+')');vs=[n+str(j)for j in range(k)];rel='qm_fp_lane_match'if kind=='fp32'else'qm_lane_match';pure=[rel+'('+str(j)+',vl,'+v+','+n.upper()+'('+str(j)+'))'for j,v in enumerate(vs)];heap=['store(&('+n+'.s'+str(j)+'),'+cell+','+v+')'for j,v in enumerate(vs)];pre.append('exists '+' '.join('('+v+':'+kind+')'for v in vs)+', '+' && '.join(pure)+' && '+' * '.join(heap))
 cell,kind,k=meta[ret];rv=['r'+str(j)for j in range(k)];rel='qm_fp_lane_match'if kind=='fp32'else'qm_lane_match';post='exists '+' '.join('('+v+':'+kind+')'for v in rv)+', '+' && '.join(rel+'('+str(j)+',vl,'+v+','+out(j)+')'for j,v in enumerate(rv))+' && '+' * '.join('store(&(__return.s'+str(j)+'),'+cell+','+v+')'for j,v in enumerate(rv))
 req='0<=vl && vl<=32'+(' && '+extra if extra else'')+(' && '+' * '.join('('+a+')'for a in pre)if pre else' && emp')
 decl=ret+' '+name+'('+','.join(t+' '+n for t,n in args)+')\n/*@ '+('With '+' '.join(withs)+'\n 'if withs else'')+'Require '+req+'\n Ensure '+post+' */;\n';rows.append({'name':name,'side':'RVV','return_type':ret,'arguments':args,'contract':decl,'evidence':'draft-review-pending','inactive':'Arbitrary typed C representation values, only active prefix constrained. Abstraction of unobserved tail, not tail=zero claim.','VLEN':128,'VLMAX':32});return decl
r=[]
r.append('size_t __riscv_vsetvl_e8m2(size_t avl)\n/*@ Require emp Ensure qm_vl_allowed(avl,__return) && emp */;\n');rows.append({'name':'__riscv_vsetvl_e8m2','side':'RVV','evidence':'draft-review-pending','contract':r[-1],'definition':'Qs8Mul.Model.qm_vl_allowed','VLEN':128,'VLMAX':32,'vl':'All RVV1.0 choices retained, not just min(avl,32)'})
r.append(rvv('__riscv_vsext_vf2_i16m4','vint16m4_t',[('vint8m2_t','a'),('size_t','vl')],lambda j:f'A({j})'))
r.append(rvv('__riscv_vsub_vx_i16m4','vint16m4_t',[('vint16m4_t','a'),('int16_t','x'),('size_t','vl')],lambda j:f'qm_sub16(A({j}),x)'))
r.append(rvv('__riscv_vwmul_vv_i32m8','vint32m8_t',[('vint16m4_t','a'),('vint16m4_t','b'),('size_t','vl')],lambda j:f'A({j})*B({j})'))
r.append(rvv('__riscv_vfcvt_f_x_v_f32m8','vfloat32m8_t',[('vint32m8_t','a'),('size_t','vl')],lambda j:f'qm_of_int(A({j}))'))
for op in ['mul','add']:r.append(rvv('__riscv_vf'+op+'_vf_f32m8','vfloat32m8_t',[('vfloat32m8_t','a'),('float','x'),('size_t','vl')],lambda j,o=op:f'qm_rvv_{o}(A({j}),x)'))
r.append(rvv('__riscv_vfsgnj_vf_f32m8','vfloat32m8_t',[('vfloat32m8_t','a'),('float','x'),('size_t','vl')],lambda j:f'qm_sign(A({j}),x)'))
r.append(rvv('__riscv_vreinterpret_v_f32m8_i32m8','vint32m8_t',[('vfloat32m8_t','a')],lambda j:f'qm_signed_bits(bits_of_fp32(A({j})))',extra='vl==32')) # revised below: reinterpret has no vl; conserve all lanes bit-exact instead.
# Reinterpret must not introduce a hidden vl parameter. Its active abstraction
# uses a ghost VL supplied by the caller; all lane0..VL-1 relations are exact.
r[-1]=r[-1].replace('With (A:Z -> fp32)','With (vl:Z) (A:Z -> fp32)').replace(' && vl==32','');rows[-1]['contract']=r[-1]
r.append(rvv('__riscv_vssub_vx_i32m8','vint32m8_t',[('vint32m8_t','a'),('int32_t','x'),('size_t','vl')],lambda j:f'qm_sat32(A({j})-x)'))
for bits,ret,src in [(16,'vint16m4_t','vint32m8_t'),(8,'vint8m2_t','vint16m4_t')]:r.append(rvv('__riscv_vnclip_wx_i'+str(bits)+('m4'if bits==16 else'm2'),ret,[(src,'a'),('size_t','shift'),('unsigned int','vxrm'),('size_t','vl')],lambda j,b=bits:f'qm_sat{b}(A({j}))',extra='shift==0 && vxrm==2'))
for op in ['min','max']:r.append(rvv('__riscv_v'+op+'_vx_i8m2','vint8m2_t',[('vint8m2_t','a'),('int8_t','x'),('size_t','vl')],lambda j,o=op:f'qm_{o}(A({j}),x)'))
# A load's inactive fields are arbitrary too; its ownership is one shared map.
load=rvv('__riscv_vle8_v_i8m2','vint8m2_t',[('const int8_t*','p'),('size_t','vl')],lambda j:f'rd_get(M,p+{j})');load=load.replace('/*@ Require','/*@ With (M:RDMap)\n Require').replace(' && emp\n Ensure',' && rd_window(M,p,vl) && rd_mem(M)\n Ensure rd_mem(M) * (').replace(' */;',') */;');rows[-1]['contract']=load;rows[-1]['memory']='Exactly VL active byte reads, shared map preserved';r.append(load)
(S/'intrinsics_rvv.h').write_text('#ifndef QS8MUL_RVV_INTRINSICS_H\n#define QS8MUL_RVV_INTRINSICS_H\n#include "intrinsic_model.h"\n'+''.join(r)+'#endif\n')
(P/'intrinsic-contract-inventory.json').write_text(json.dumps({'scope':'Draft source-reviewed contracts; exact official per-intrinsic ledger and actual callers still required. Ordinary adapters separately body checked.','whole_kernel_verified':False,'numeric_contracts':rows},indent=2)+'\n')
print('Generated',len(x),'NEON and',len(r),'RVV declarations; no intrinsic body credit')
