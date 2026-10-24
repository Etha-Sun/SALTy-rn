"""Refresh precise spec/model/adapter bindings without claiming ISA refinement."""
from pathlib import Path
import hashlib,json,re
C=Path(__file__).resolve().parent.parent;H=C/'proof';R=next(p for p in C.parents if(p/'.git').exists());sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
p=H/'intrinsic-ledger.json';s=json.loads(p.read_text());header=C/'shim/intrinsics.h';text=header.read_text();providers={'vst1q_f32':('qcp_sqrt_store4','shim/store_adapters.c','Sqrt.StoreAdaptersChecked.CheckedStoreAdapters','Sqrt.store_adapters_goal.VC_Correct'),'vst1_f32':('qcp_sqrt_store2','shim/store_adapters.c','Sqrt.StoreAdaptersChecked.CheckedStoreAdapters','Sqrt.store_adapters_goal.VC_Correct'),'vst1_lane_f32':('qcp_sqrt_store1_0','shim/store_adapters.c','Sqrt.StoreAdaptersChecked.CheckedStoreAdapters','Sqrt.store_adapters_goal.VC_Correct'),'__riscv_vse32_v_f32m8':('__riscv_vse32_v_f32m8','shim/rvv_store.c','Sqrt.RvvStoreChecked.CheckedRvvStore','Sqrt.rvv_store_goal.VC_Correct')}
extras={
'vld1q_f32':[('Sqrt.Pack.sqrt_lane','proof/coq/Pack.v')],
'vsqrtq_f32':[('Sqrt.Model.sqrt_arm','proof/coq/Model.v'),('Sqrt.Model.sqrt_core','proof/coq/Model.v'),('Sqrt.Model.sqrt_quiet','proof/coq/Model.v'),('Sqrt.Model.sqrt_nan_bits','proof/coq/Model.v')],
'vget_low_f32':[], 'vget_high_f32':[],
'vst1q_f32':[('Sqrt.Pack.sqrt_pack4','proof/coq/Pack.v')],
'vst1_f32':[('Sqrt.Pack.sqrt_pack2','proof/coq/Pack.v')],
'vst1_lane_f32':[('Sqrt.Pack.sqrt_pack1','proof/coq/Pack.v')],
'__riscv_vsetvl_e32m8':[('Sqrt.Pack.sqrt_vl_allowed','proof/coq/Pack.v')],
'__riscv_vle32_v_f32m8':[('Sqrt.Borrowed.sqrt_read_at','proof/coq/Borrowed.v'),('Sqrt.Pack.sqrt_lane','proof/coq/Pack.v')],
'__riscv_vfsqrt_v_f32m8':[('Sqrt.Pack.sqrt_active','proof/coq/Pack.v'),('Sqrt.Model.sqrt_rvv','proof/coq/Model.v'),('Sqrt.Model.sqrt_core','proof/coq/Model.v')],
'__riscv_vse32_v_f32m8':[('QcpRvv32.RvvStoreModel.rvv_pack32','../../verified/f32-vadd/proof/coq/QcpRvv32/RvvStoreModel.v'),('QcpRvv32.RvvStoreModel.rvv_take','../../verified/f32-vadd/proof/coq/QcpRvv32/RvvStoreModel.v')]}
assert set(extras)=={e['original_intrinsic']for e in s['entries']}
for e in s['entries']:
 n=e['original_intrinsic'];provider=providers.get(n);actual=provider[0]if provider else n
 m=re.search(r'^([^\n]*\b'+re.escape(actual)+r'\([^\n]*\))\s*(/\*@.*?\*/);',text,re.M|re.S);assert m,n
 e.update(contract_file='shim/intrinsics.h',contract_source_sha256=sha(header),contract_line=text[:m.start()].count('\n')+1,contract_exact_text_sha256=hashlib.sha256(m[2].encode()).hexdigest(),signature=m[1],specification_boundary='reviewed intrinsic contract'if not provider else'actual ordinary C adapter/body also checked',human_final_review='pending',formal_isa_correspondence='not established',coq_definitions=[dict(name=n,file=f,sha256=sha(C/f))for n,f in extras[n]])
 if provider:e.update(actual_provider=actual,actual_source=provider[1],actual_source_sha256=sha(C/provider[1]),typed_instance=provider[2],actual_target_interface=provider[3],status='body-component-checked; full-case replay pending',macro_single_evaluation=True,physical_isa_store_refinement='source-reviewed only')
 else:e.update(actual_provider=actual,status='source-reviewed-spec; intrinsic implementation body intentionally outside proof boundary')
 if n=='vget_low_f32':e['direct_coq_expression']='post store(ret.s0,float,x0) * store(ret.s1,float,x1); structural identity projection of the input four field values'
 if n=='vget_high_f32':e['direct_coq_expression']='post store(ret.s0,float,x2) * store(ret.s1,float,x3); structural identity projection of the input four field values'
 if n=='vst1_lane_f32':e['configuration']='lane literal 0 only; unsupported dynamic/nonzero lanes have no provided macro/callee'
 if n=='__riscv_vsetvl_e32m8':e['configuration']='VLEN128 / SEW32 / LMUL8 / VLMAX32; full architectural pointwise legal range, no forced min'
 if n in ['vld1q_f32','__riscv_vle32_v_f32m8']:e['ownership']='borrow entire existing FloatArray.full(base,total,A), exact p=base+4*k, read only four/activeVL lanes and preserve same region; no duplicate or aligned extra region'
 if n in ['__riscv_vle32_v_f32m8','__riscv_vfsqrt_v_f32m8']:e['inactive_fields']='arbitrary logical tail values; only active prefix constrained/observed'
s.update(status='source-reviewed intrinsic specs and actual adapter components; full kernel/case gate pending',spec_only_declarations=[e['actual_provider']for e in s['entries']if e['original_intrinsic']not in providers],body_checked_adapters=[providers[n][0]for n in providers],formal_isa_refinement_established=False,model_source_sha256={f:sha(C/f)for f in ['proof/coq/Model.v','proof/coq/Bits.v','proof/coq/NanFacts.v','proof/coq/Types.v','proof/coq/Pack.v','proof/coq/Borrowed.v','proof/coq/Observation.v','proof/coq/KernelFacts.v']})
assert len(s['spec_only_declarations'])==7 and len(set(s['spec_only_declarations']))==7
s['environment']['alignment']='FloatArray full initialized/undef float cells entail natural four-byte alignment through inherited isvalidptr_float; no extra alignment precondition added'
s['unfinished']=['Complete new preserved-Cargs kernel typed interfaces and full fresh replay','Current final input-bound native replay after wrapper/ledger freeze','Final human intrinsic specification review; no ISA refinement theorem claimed']
p.write_text(json.dumps(s,indent=2,ensure_ascii=False)+'\n')
