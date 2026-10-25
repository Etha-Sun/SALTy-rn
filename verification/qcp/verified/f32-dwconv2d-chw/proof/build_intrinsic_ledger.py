#!/usr/bin/env python3
from pathlib import Path
import json,re,hashlib,shutil
C=Path(__file__).resolve().parent.parent;P=C/'proof';sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest();cache=C/'.build/isa-source-ledger';cache.mkdir(exist_ok=True);donor=C.parent/'qs8-vmul-minmax-fp32';prior=json.loads((donor/'proof/intrinsic-ledger.json').read_text());sources=prior['official_sources']
for f in ['arm-acle.html','rvv-v1.0.adoc']:shutil.copy2(donor/'.build/isa-source-ledger'/f,cache/f)
assert sha(cache/'arm-acle.html')==sources['ARM_ACLE']['sha256'];assert sha(cache/'rvv-v1.0.adoc')==sources['RVV_V1.0']['sha256']
original={side:sorted(set(re.findall(r'\b((?:__riscv_|v(?:ld|st|dup|mov|ext|fma|reinterpret|and|get|min|max))\w*)\s*\(', (P/'original'/('test'+side+'.c')).read_text())))for side in ['NEON','RVV']}
models={'vld1q_u32':['TerminalModel.dw_load_u32'],'vdupq_n_f32':['TerminalModel.dw_arm_dup'],'vmovq_n_f32':['TerminalModel.dw_arm_dup'],'vget_low_f32':['TerminalModel.dw_arm_low'],'vget_high_f32':['TerminalModel.dw_arm_high'],'vdupq_lane_f32':['TerminalModel.dw_arm_dup_lane'],'vextq_f32':['TerminalModel.dw_arm_ext'],'vfmaq_lane_f32':['TerminalModel.dw_arm_fma_lane','Model.dw_arm_fma'],'vmaxq_f32':['TerminalModel.dw_arm_max_lane'],'vminq_f32':['TerminalModel.dw_arm_min_lane'],'vandq_u32':['TerminalModel.dw_arm_and'],'vreinterpretq_u32_f32':['TerminalModel.dw_arm_to_bits'],'vreinterpretq_f32_u32':['TerminalModel.dw_arm_from_bits'],'__riscv_vfmacc_vf_f32m2':['TerminalModel.dw_rvv_fma_lane'],'__riscv_vfslide1up_vf_f32m2':['TerminalModel.dw_rvv_slide_up'],'__riscv_vfslide1down_vf_f32m2':['TerminalModel.dw_rvv_slide_down'],'__riscv_vsetvl_e32m2':['VectorModel.dw_vl_allowed'],'__riscv_vfmv_v_f_f32m2':['TerminalModel.dw_arm_dup'],'__riscv_vfmax_vf_f32m2':['Model.fp32_max_number'],'__riscv_vfmin_vf_f32m2':['Model.fp32_min_number'],'__riscv_vmfne_vv_f32m2_b16':['VectorModel.dw_mask_matches','VectorModel.dw_ne_value'],'__riscv_vmerge_vvm_f32m2':['Model.dw_rvv_merge','VectorModel.dw_mask_bit']}
rows=[]
for side,names in original.items():
 for name in names+(['__riscv_vmfne_vv_f32m2_b16','__riscv_vmerge_vvm_f32m2']if side=='RVV'else[]):
  defs=models.get(name)
  if defs is None:defs=['TerminalModel.dw_store']if('vst1'in name or'vse32'in name)else['TerminalModel.dw_load']
  candidates=[C/'shim/neon_intrinsics.h']if side=='NEON'else[C/'shim/intrinsics_rvv.h',C/'shim/rvv_extended_intrinsics.h',C/'shim/rvv_store_spec.h'];m=None
  for current_header in candidates:
   h=current_header.read_text();m=re.search(r'\b'+re.escape(name)+r'\([^;]+?/\*@.*?\*/;',h,re.S)
   if m:break
  ds=[]
  for d in defs:
   module,term=d.split('.');q=P/'coq'/(module+'.v');assert re.search(r'\bDefinition\s+'+term+r'\b',q.read_text()),d;ds.append({'FQ':'DwChw.'+d,'source':str(q.relative_to(C)),'source_sha256':sha(q)})
  row={'name':name,'side':side,'origin':'original'if name in names else'NaN repair addition','boundary':'source-reviewed-spec','formal_ISA_correspondence_proved':False,'human_review':'pending final manual review','configuration':'binary32 NEON4/2 lanes'if side=='NEON'else'RVV1.0 fixedVLEN128,SEW32,LMUL2,VLMAX8,XLEN64; all legal VL retained','Coq_definitions':ds,'official_source':sources['ARM_ACLE'if side=='NEON'else'RVV_V1.0'],'rounding_nan':'RNE, DN/FZ/FIZ/AH disabled, traps disabled, flags not observed; ARM payload selection/quieting vs RVV canonical FMA NaN and minNumber. Public observer numeric equality or bothNaN.','inactive':'NEON all result lanes specified by instruction; RVV inactive fields arbitrary typed values, no zero/tail-undisturbed guarantee.'}
  if m:row.update(contract=m[0],contract_sha256=hashlib.sha256(m[0].encode()).hexdigest(),header=str(current_header.relative_to(C)),header_sha256=sha(current_header),contract_status='source-reviewed declaration; complete kernel call-site binding pending')
  else:row.update(contract_status='pending kernel frontend binding; value model does not by itself give a C call contract or memory permission')
  
  row['active_lane_domain']=('0<=i<2'if name in ['vld1_f32','vst1_f32','vst1_lane_f32','vget_low_f32','vget_high_f32']else'0<=i<4')if side=='NEON'else'0<=i<vl<=8'
  if name=='vdupq_lane_f32' or name=='vfmaq_lane_f32':row['immediate_domain']='0<=lane<2'
  if name=='vextq_f32':row['immediate_domain']='0<=k<4; actual kernel uses k=1 or3'
  if name=='vld1q_u32':row['memory_note']='Unsigned32 word reads of the private signed-int32 constant mask table; integer bit representation bridge is pending, never treated as Float cells.'
  rows.append(row)
ledger={'scope':'All29 original/repair ISA terminals have explicit value models and source-reviewed C contract declarations; actual whole-kernel caller bindings remain pending. Contracts themselves are not a formal ISA refinement theorem.','whole_kernel_verified':False,'official_sources':sources,'original_intrinsics':original,'entry_count':len(rows),'entries':rows,'ordinary_adapter_proof':'proof/propagating-proof-status.json','ordinary_adapter_proof_sha256':sha(P/'propagating-proof-status.json'),'representation':'Float2/4 and RVV8 scalar fields plus logical8mask bits; not physical ABI. Only active lanes are constrained at RVV boundary.','alias_scope':'One shared read map for input/zero/weights/params; one mutable output map preserves intentional bottom-row output aliases and reverse o2/o1/o0 stores.'}
assert len(rows)==29;(P/'intrinsic-ledger.json').write_text(json.dumps(ledger,indent=2)+'\n');print('29 entries; initial bound contracts',sum('contract'in r for r in rows))
