"""Bind final independent audits and per-group results without promoting local VCs."""
from pathlib import Path
import hashlib,json
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2]
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
audit=HERE/'root-audit02.json'
a=json.loads(audit.read_text())
assert all(c['all_frozen_files_match'] and c['c_spec_shim_match_v4_baseline'] and c['source_guard'] for c in a['cases'])
kernels=sorted({c['kernel'] for c in a['cases']});assert len(kernels)==9
sources={}
for rel in ['stage3-gemm/STATUS.json','stage3-gemm/RESULTS.json','stage3-conv/STATUS.json','stage3-pool-spmm/STATUS.json','stage3-unary-front/ACCEPTANCE.json','stage3-conv/unary-front-review.json','stage3-conv/cross-review.json','stage3-audit/address-diagnostic/raw01/result.json','stage3-audit/address-diagnostic/typed01/result.json','stage3-conv/address-review.json','stage3-audit/old-source-preservation.json']:
 p=HERE.parent/rel;sources[str(p.relative_to(ROOT))]=sha(p)
native=[]
for p in [HERE/'native-results.json',HERE/'stress01/native-results.json']:
 r=json.loads(p.read_text());assert len(r)==9 and all(x['compile_exit']==0 and x['run_exit']==0 for x in r)
 native.append({'path':str(p.relative_to(ROOT)),'sha256':sha(p),'kernels_executed':9,'finite_search_only':True})
record={'baseline_head':'3b96d1a','new_complete_kernels':0,'kernel_count':9,'kernels':kernels,'strictly_accepted_stage3_kernels':[], 'inventory':{'admitted':11,'unproved':26,'missing_target':3},'original_target_modified':False,'new_target_counterexample_found':False,'candidate_versions_audited':len(a['cases']),'audit_sha256':sha(audit),'group_evidence':sources,'native_searches':native,'tool_fix':'Independent value-context logical-negation frontend; controls and old f32-vadd full 571/571 replay accepted. Not a new kernel proof.','scope':'All nine received proof changes and full attempts. Selected diagnostics and global-only reports are not complete proofs; missing body raw remains unknown. See group reports for exact versions, pending VCs and run history.','push_authorized':False}
(HERE/'RESULTS.json').write_text(json.dumps(record,indent=2)+'\n')
print('stage3: 9 attempted, 0 newly accepted')
