#!/usr/bin/env python3
"""Generate original RVV intrinsic contract views, not ordinary C providers.

Each 32-field result constrains only active lanes. Borrowed store views preserve
the actual source vector owner and update exactly one writable map owner.
The original names, normative sources and pending ISA refinement are in ledger.
"""
from pathlib import Path
import argparse,hashlib,json,re
C=Path(__file__).resolve().parents[1]
N=32
def bind(p,t):return ' '.join(f'({p}{j}:{t})'for j in range(N))
def fields(v,p,t,borrow=False):
 return ' * '.join(f'store(&({v}{"->"if borrow else"."}s{j}),{t},{p}{j})'for j in range(N))
def result(p,t):return fields('__return',p,t)
def decl(sig,w,pre,post,name=''):
 return sig+'\n/*@ '+(name+' 'if name else'')+('With '+w+' 'if w else'')+'Require '+pre+'\n Ensure '+post+' */;\n'
def packet(p,fp):return ('ap_fpack32'if fp else'ap_ipack32')+'('+','.join(p+str(j)for j in range(N))+')'
def active(p,fp,values):
 model='apr_float_lane'if fp else'apr_int_lane'
 return ' && '.join(f'{model}({j},vl,{p}{j},{values(j)})'for j in range(N))
def main():
 parser=argparse.ArgumentParser();parser.add_argument('--ledger-only',action='store_true');args=parser.parse_args()
 s='''#ifndef ARGMAXPOOL_RVV_SPECS_H
#define ARGMAXPOOL_RVV_SPECS_H
#include "formal_types.h"
#include "read_table.h"
/*@ Import Coq Require Import ArgmaxPool.RvvKernelModel */
/*@ Extern Coq (APOutput :: *) (APIndex :: *) */
/*@ Extern Coq
 (ap_vl_allowed:Z->Z->Prop)
 (apr_float_lane:Z->Z->fp32->fp32->Prop) (apr_int_lane:Z->Z->Z->Z->Prop)
 (ap_rvv_gt:fp32->fp32->Z) (ap_rvv_select_f32:Z->fp32->fp32->fp32)
 (ap_rvv_select_u32:Z->Z->Z->Z) (ap_rvv_mask_active:Z->Z->Z->Prop)
 (ap_output:list Z->APOutput->Assertion) (ap_index:list Z->APIndex->Assertion)
 (ap_write_window:list Z->Z->Z->Prop)
 (ap_output_readable:APOutput->Z->Z->Prop) (ap_index_readable:APIndex->Z->Z->Prop)
 (ap_output_active_loaded:Z->Z->APOutput->Z->fp32->Prop)
 (ap_index_active_loaded:Z->Z->APIndex->Z->Z->Prop)
 (ap_output_write:APOutput->Z->Z->(Z->fp32)->APOutput)
 (ap_index_write:APIndex->Z->Z->(Z->Z)->APIndex)
'''
 for fp in [True,False]:
  t='fp32'if fp else'Z';s+=' ('+('ap_fpack32'if fp else'ap_ipack32')+':'+('->'.join([t]*N+['Z',t]))+')\n'
 s+=' */\n'
 s+=decl('size_t __riscv_vsetvl_e32m8(size_t avl)','','emp','ap_vl_allowed(avl,__return) && emp')
 s+=decl('vfloat32m8_t __riscv_vle32_v_f32m8(const float*p,size_t vl)','(F:APMap)',
  '0<=vl && vl<=32 && ap_window(F,p,vl) && ap_data(F)',
  'exists '+bind('r','fp32')+', '+active('r',True,lambda j:f'ap_load_lane(F,p,{j})')+' && ap_data(F) * '+result('r','float'),'readonly_map')
 for fp in [True,False]:
  t='fp32'if fp else'Z';suffix='f32'if fp else'u32';ctype='float'if fp else'uint32_t';vec='vfloat32m8_t'if fp else'vuint32m8_t';ann='float'if fp else'unsigned int';mt='APOutput'if fp else'APIndex';pred='ap_output'if fp else'ap_index'
  conditions=' && '.join(f'{pred}_active_loaded({j},vl,O,p,r{j})'for j in range(N))
  s+=decl(f'{vec} __riscv_vle32_v_{suffix}m8(const {ctype}*p,size_t vl)',f'(W:list Z) (O:{mt})',
   f'0<=vl && vl<=32 && ap_write_window(W,p,vl) && {pred}_readable(O,p,vl) && {pred}(W,O)',
   'exists '+bind('r',t)+', '+conditions+f' && {pred}(W,O) * '+result('r',ann),'output_map')
 s+=decl('vbool4_t __riscv_vmfgt_vv_f32m8_b4(vfloat32m8_t a,vfloat32m8_t b,size_t vl)',bind('a','fp32')+' '+bind('b','fp32'),
  '0<=vl && vl<=32 && '+fields('a','a','float')+' * '+fields('b','b','float'),
  'exists '+bind('r','Z')+', '+active('r',False,lambda j:f'ap_rvv_gt(a{j},b{j})')+' && '+' && '.join(f'ap_rvv_mask_active({j},vl,r{j})'for j in range(N))+' && '+result('r','unsigned int'))
 mask=' && '.join(f'ap_rvv_mask_active({j},vl,m{j})'for j in range(N))
 s+=decl('vfloat32m8_t __riscv_vmerge_vvm_f32m8(vfloat32m8_t a,vfloat32m8_t b,vbool4_t m,size_t vl)',bind('a','fp32')+' '+bind('b','fp32')+' '+bind('m','Z'),
  '0<=vl && vl<=32 && '+mask+' && '+fields('a','a','float')+' * '+fields('b','b','float')+' * '+fields('m','m','unsigned int'),
  'exists '+bind('r','fp32')+', '+active('r',True,lambda j:f'ap_rvv_select_f32(m{j},a{j},b{j})')+' && '+result('r','float'))
 s+=decl('vuint32m8_t __riscv_vmerge_vxm_u32m8(vuint32m8_t a,uint32_t x,vbool4_t m,size_t vl)',bind('a','Z')+' '+bind('m','Z'),
  '0<=vl && vl<=32 && '+mask+' && '+fields('a','a','unsigned int')+' * '+fields('m','m','unsigned int'),
  'exists '+bind('r','Z')+', '+active('r',False,lambda j:f'ap_rvv_select_u32(m{j},a{j},ap_u32(x))')+' && '+result('r','unsigned int'))
 s+=decl('vuint32m8_t __riscv_vmv_v_x_u32m8(uint32_t x,size_t vl)','','0<=vl && vl<=32 && emp',
  'exists '+bind('r','Z')+', '+active('r',False,lambda j:'ap_u32(x)')+' && '+result('r','unsigned int'))
 for fp in [True,False]:
  t='fp32'if fp else'Z';suffix='f32'if fp else'u32';ctype='float'if fp else'uint32_t';vec='vfloat32m8_t'if fp else'vuint32m8_t';ann='float'if fp else'unsigned int';mt='APOutput'if fp else'APIndex';pred='ap_output'if fp else'ap_index';view='ap_rvv_store_'+suffix+'_view'
  s+=decl(f'void {view}({ctype}*p,const {vec}*a,size_t vl)',f'(W:list Z) (O:{mt}) '+bind('a',t),
   f'0<=vl && vl<=32 && ap_write_window(W,p,vl) && {pred}(W,O) * '+fields('a','a',ann,True),
   f'{pred}(W,{pred}_write(O,p,vl,{packet("a",fp)})) * '+fields('a','a',ann,True))
  s+=f'#define __riscv_vse32_v_{suffix}m8(p,a,vl) {view}((p),&(a),(vl))\n'
 s+='#endif\n'
 if args.ledger_only:assert (C/'shim/rvv_specs.h').read_text()==s,'live header differs from this constructor'
 else:(C/'shim/rvv_specs.h').write_text(s)
 # Bind every exact declaration/contract and every definition source that the
 # human ISA review needs. These records deliberately assert no ISA theorem.
 primary=json.loads((C/'proof/evidence/rvv-primary/source.json').read_text())
 rows=[]
 for match in re.finditer(r'((?:size_t|vfloat32m8_t|vuint32m8_t|vbool4_t|void)\s+(\w+)\([^;]*?\n/\*@.*?\*/;)',s,re.S):
  text,name=match.groups();fp='f32'in name
  if 'setvl'in name:original=name;encoding='vsetvli / vsetvl, e32,m8';defs=['IntrinsicSemantics.ap_vl_allowed'];section='30.1.6.3 Constraints on Setting vl';detail='All three legal AVL/VLMAX cases; deterministic hardware choice is abstracted by a relation. Positive AVL progress is proved separately.'
  elif 'vle32'in name:
   original=name;encoding='vle32.v';section='30.1.7 Vector Loads and Stores';detail='Only active addresses p+4*j are accessed; readonly region borrowed once, or initialized previous-output state borrowed once. Inactive fields unconstrained.'
   if 'readonly_map'in text:defs=['MemoryModel.ap_load_lane','MemoryModel.ap_window','RvvKernelModel.apr_float_lane']
   elif fp:defs=['OutputMemory.ap_output','PackModel.ap_output_active_loaded','ReadWindows.ap_output_readable']
   else:defs=['OutputMemory.ap_index','PackModel.ap_index_active_loaded','ReadWindows.ap_index_readable']
  elif 'vmfgt'in name:original=name;encoding='vmflt.vv with source operands reversed (vmfgt pseudoinstruction)';defs=['IntrinsicSemantics.ap_rvv_gt','PackModel.ap_rvv_mask_active'];section='30.1.13 Vector Floating-Point Instructions, compare';detail='Ordered strict greater-than; either NaN yields false. Logical mask fields are 0/1 for active bits. Exception flags are outside the observation.'
  elif 'vmerge_vvm'in name:original=name;encoding='vmerge.vvm (raw bits, floating-register API type)';defs=['IntrinsicSemantics.ap_rvv_select_f32','PackModel.ap_rvv_mask_active'];section='30.1.11.15 Vector Integer Merge Instructions';detail='Mask bit 0 selects first vector, 1 second vector; exact selected FP32 bits including NaN payload/sign and signed zero. No floating arithmetic.'
  elif 'vmerge_vxm'in name:original=name;encoding='vmerge.vxm';defs=['IntrinsicSemantics.ap_rvv_select_u32','Model.ap_u32','PackModel.ap_rvv_mask_active'];section='30.1.11.15 Vector Integer Merge Instructions';detail='Mask0 copies vector lane, mask1 copies scalar low32 bits.'
  elif 'vmv_v_x'in name:original=name;encoding='vmv.v.x';defs=['Model.ap_u32','RvvKernelModel.apr_int_lane'];section='30.1.11.16 Vector Integer Move Instructions';detail='Active lanes copy scalar low32 bits; inactive unconstrained.'
  else:original='__riscv_vse32_v_'+('f32'if fp else'u32')+'m8';encoding='vse32.v';defs=['PackModel.ap_output_write'if fp else'PackModel.ap_index_write','OutputMemory.ap_output'if fp else'OutputMemory.ap_index'];section='30.1.7 Vector Loads and Stores';detail='Explicit borrowed-pointer representation of the original intrinsic. Macro takes the named vector address once. Active p+4*j cells overwritten; exactly one writable-map owner consumed and updated, source-vector fields preserved. No ordinary helper body is exempted.'
  sources={}
  for d in defs:
   p='proof/coq/'+d.split('.')[0]+'.v';sources[p]=hashlib.sha256((C/p).read_bytes()).hexdigest()
  rows.append(dict(original_intrinsic=original,formal_declaration_name=name,formal_header='shim/rvv_specs.h',declaration_and_contract=text,declaration_and_contract_sha256=hashlib.sha256(text.encode()).hexdigest(),encoding=encoding,normative_section=section,model_definitions=['ArgmaxPool.'+d for d in defs],model_source_sha256=sources,scope=detail,body_checked=False,source_reviewed=True,isa_refinement_proved=False,human_final_review='pending'))
 assert len(rows)==10 and len({r['original_intrinsic']for r in rows})==9
 ledger=dict(scope='original_RVV_intrinsic_specs_only_not_ordinary_C_helpers',configuration=dict(XLEN=64,VLEN=128,SEW=32,LMUL=8,VLMAX=32,vstart=0,endian='little',vl_choices='all ISA-legal choices',inactive_lanes='unconstrained',exceptions='flags/traps not observed; normal-completion partial correctness'),primary_sources=primary,views=rows,source_refinement='source-reviewed specifications; no formal correspondence to ISA operational semantics claimed',header_sha256=hashlib.sha256(s.encode()).hexdigest())
 (C/'proof/rvv-intrinsic-ledger.json').write_text(json.dumps(ledger,indent=2)+'\n')
 print('Generated 10 RVV contract views for 9 original intrinsic names; ISA refinement remains unproved.')
if __name__=='__main__':main()
