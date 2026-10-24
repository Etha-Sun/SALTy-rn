#!/usr/bin/env python3
"""Build actual RVV32 scalar-field arithmetic and active-lane providers."""
from pathlib import Path
import json,re
C=Path(__file__).resolve().parent.parent
T={'i8':('uint8_t','unsigned char','vuint8m2_t',0,255),'u16':('uint16_t','unsigned short','vuint16m4_t',0,65535),'i16':('int16_t','short','vint16m4_t',-32768,32767),'i32':('int32_t','int','vint32m8_t',-2147483648,2147483647)}
# label, output, vector inputs, scalar inputs, scalar expression, scalar/math operation
ops=[
 ('subu','u16',[('a','i8')],[('b','i8')],'qcp_qu_subu8(a,b)','qu_udiff(a,b)'),
 ('sext','i32',[('a','i16')],[],'a','a'),
 ('mul','i32',[('a','i32')],[('b','i32')],'qcp_qu_rvv_mul(a,b)','qu_rvv_mul(a,b)'),
 ('macc','i32',[('a','i32'),('c','i32')],[('b','i32')],'qcp_qu_rvv_macc(a,b,c)','qu_rvv_macc(a,b,c)'),
 ('mov','i32',[],[('b','i32')],'b','b'),
 ('rnu','i32',[('a','i32')],[('d','shift')],'qcp_qu_rvv_rnu(a,(int32_t)d)','qu_rvv_rnu(a,d)'),
 ('sll','i32',[('a','i32')],[('d','shift')],'qcp_qu_rvv_sll(a,(int32_t)d)','qu_rvv_sll(a,d)'),
 ('clip16','i16',[('a','i32')],[],'qcp_qu_sat16(a)','qu_sat16(a)'),
 ('add','i16',[('a','i16')],[('b','i16')],'qcp_qu_rvv_add16(a,b)','qu_rvv_add16(a,b)'),
 ('max16','i16',[('a','i16')],[],'qcp_qu_max16_zero(a)','qu_max16zero(a)'),
 ('clipu8','i8',[('a','u16')],[],'qcp_qu_rvv_usat16(a)','qu_uclip8(a)'),
 ('max','i8',[('a','i8')],[('b','i8')],'qcp_qu_umax8(a,b)','qu_umax(a,b)'),
 ('min','i8',[('a','i8')],[('b','i8')],'qcp_qu_umin8(a,b)','qu_umin(a,b)')]
math='From Coq Require Import ZArith Lia.\nFrom Qu8Add Require Export VectorModel RvvModel.\nLocal Open Scope Z_scope.\n';math+='Definition qu_uclip8(a:Z):Z:=Z.min a 255.\n';ah='#ifndef QCP_QU_RVV_ACTIVE_H\n#define QCP_QU_RVV_ACTIVE_H\n#include "neon_arithmetic.h"\n#include "unsigned_scalar.h"\n/*@ Import Coq Require Import Qu8Add.RvvActiveModel */\n';ac='#include "rvv_active.h"\n';rows=[]
clipdecl='uint8_t qcp_qu_rvv_usat16(uint16_t a)\n/*@ Require 0<=a && a<=65535 && emp Ensure __return==qu_uclip8(a) && 0<=__return && __return<=255 && emp */'
ah+='/*@ Extern Coq (qu_uclip8:Z -> Z) */\n'+clipdecl+';\n';ac+=clipdecl+'\n{if(a>255)return 255;return(uint8_t)a;}\n';rows.append('qcp_qu_rvv_usat16')
def scalar(k):return ('size_t',0,31)if k=='shift'else(T[k][0],T[k][3],T[k][4])
for label,out,vecs,scalars,expr,value in ops:
 params=vecs+scalars;args=[x for x,k in params];ct,coqt,typ,lo,hi=T[out]
 mathvalue=re.sub(r'(qu_\w+)\(([^()]+)\)',lambda m:'('+m[1]+' '+ ' '.join('('+a+')'for a in m[2].split(','))+')',value)
 math+='Definition qu_active_'+label+' ('+' '.join(['i','vl']+args)+':Z):Z := if Z.ltb i vl then '+mathvalue+' else 0.\n'
 ah+='/*@ Extern Coq (qu_active_'+label+':'+('Z -> '*(len(args)+2))+'Z) */\n'
 name='qcp_qu_active_'+label;decl=ct+' '+name+'('+','.join([scalar(k)[0]+' '+x for x,k in params]+['size_t i','size_t vl'])+')\n';req=['0<=i','i<32','0<=vl','vl<=32']
 for x,k in params:
  _,l,h=scalar(k);req.extend([f'{l}<={x}',f'{x}<={h}'])
 contract='/*@ Require '+' && '.join(req)+' && emp\n Ensure __return==qu_active_'+label+'('+','.join(['i','vl']+args)+f') && {lo}<=__return && __return<={hi} && emp */'
 ah+=decl+contract+';\n';ac+=decl+contract+'\n{if(i<vl)return '+expr+';return 0;}\n';rows.append(name)
ah+='#endif\n';(C/'proof/coq/RvvActiveModel.v').write_text(math);(C/'shim/rvv_active.h').write_text(ah);(C/'shim/rvv_active.c').write_text(ac);(C/'proof/rvv-active-units.json').write_text(json.dumps(rows,indent=2)+'\n')
# Keep source instruction spellings; all provider bodies are explicit C.
fn={'subu':'__riscv_vwsubu_vx_u16m4','sext':'__riscv_vsext_vf2_i32m8','mul':'__riscv_vmul_vx_i32m8','macc':'__riscv_vmacc_vx_i32m8','mov':'__riscv_vmv_v_x_i32m8','rnu':'__riscv_vssra_vx_i32m8','sll':'__riscv_vsll_vx_i32m8','clip16':'__riscv_vnclip_wx_i16m4','add':'__riscv_vsadd_vx_i16m4','max16':'__riscv_vmax_vx_i16m4','clipu8':'__riscv_vnclipu_wx_u8m2','max':'__riscv_vmaxu_vx_u8m2','min':'__riscv_vminu_vx_u8m2'}
h='#ifndef QCP_QU_RVV_ARITHMETIC_H\n#define QCP_QU_RVV_ARITHMETIC_H\n#include "rvv_active.h"\n#define __RISCV_VXRM_RNU 0\n#define __RISCV_VXRM_RDN 2\n';b='#include "rvv_arithmetic.h"\n';names=[]
for label,out,vecs,scalars,expr,value in ops:
 ct,coqt,typ,lo,hi=T[out];params=vecs+scalars
 if label=='macc':params=[vecs[0],scalars[0],vecs[1]]
 par=[];req=['0<=vl','vl<=32'];cells=[];ghost=[]
 for x,k in params:
  if(x,k)in vecs:
   ict,icoqt,ityp,il,ih=T[k];par.append(ityp+' '+x)
   for i in range(32):ghost.append(f'({x}{i}:Z)');req.extend([f'{il}<={x}{i}',f'{x}{i}<={ih}']);cells.append(f'store(&({x}.s{i}),{icoqt},{x}{i})')
  else:
   ict,il,ih=scalar(k);par.append(ict+' '+x);req.extend([f'{il}<={x}',f'{x}<={ih}'])
 if label=='max16':
  par.append('int16_t b');req.append('b==0')
 if label in ['clip16','clipu8']:
  par.extend(['size_t d','int rm']);req.extend(['d==0','rm==2'])
 elif label=='rnu':par.append('int rm');req.append('rm==0')
 par.append('size_t vl');args=[x for x,k in vecs+scalars]
 outs=[]
 for i in range(32):outs.append(f'store(&(__return.s{i}),{coqt},qu_active_{label}('+','.join([str(i),'vl']+[x+str(i)if any(x==v for v,k in vecs)else x for x in args])+'))')
 contract='/*@ '+('With '+' '.join(ghost)+'\n 'if ghost else'')+'Require '+' && '.join(req)+(' && '+' * '.join(cells)if cells else' && emp')+'\n Ensure '+' * '.join(outs)+' */'
 start=len(b)
 sig=typ+' '+fn[label]+'('+','.join(par)+')\n'+contract;h+=sig+';\n';b+=sig+'\n{\n '+typ+' r;\n'
 for i in range(32):b+=f' r.s{i}=qcp_qu_active_{label}('+','.join([x+'.s'+str(i)if any(x==v for v,k in vecs)else x for x in args]+[str(i),'vl'])+');\n'
 b+=' return r;\n}\n';unitstem='rvv_'+fn[label];(C/'shim'/(unitstem+'.c')).write_text('#include \"rvv_arithmetic.h\"\n'+b[start:]);names.append(dict(name=fn[label],stem=unitstem,source='shim/'+unitstem+'.c'))
for label,ik,ok,name,helper,mathop in [('rei16','u16','i16','__riscv_vreinterpret_v_u16m4_i16m4','qcp_qu_from_u16','qu_s16'),('reiu16','i16','u16','__riscv_vreinterpret_v_i16m4_u16m4','qcp_qu_u16','qu_u16')]:
 ict,icq,it,il,ih=T[ik];oct,ocq,ot,ol,oh=T[ok];ghost=' '.join(f'(a{i}:Z)'for i in range(32));req=' && '.join(f'{il}<=a{i} && a{i}<={ih}'for i in range(32));cells=' * '.join(f'store(&(a.s{i}),{icq},a{i})'for i in range(32));outs=' * '.join(f'store(&(__return.s{i}),{ocq},{mathop}(a{i}))'for i in range(32));sig=ot+' '+name+'('+it+' a)\n/*@ With '+ghost+'\n Require '+req+' && '+cells+'\n Ensure '+outs+' */';h+=sig+';\n';code=sig+'\n{\n '+ot+' r;\n'+''.join(f' r.s{i}={helper}(a.s{i});\n'for i in range(32))+' return r;\n}\n';b+=code;stem='rvv_'+name;(C/'shim'/(stem+'.c')).write_text('#include "rvv_arithmetic.h"\n'+code);names.append(dict(name=name,stem=stem,source='shim/'+stem+'.c'))
h+='#endif\n';(C/'shim/rvv_arithmetic.h').write_text(h);(C/'shim/rvv_arithmetic.c').write_text(b);(C/'proof/rvv-arithmetic-units.json').write_text(json.dumps(names,indent=2)+'\n')
