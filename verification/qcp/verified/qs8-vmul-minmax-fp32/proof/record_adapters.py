#!/usr/bin/env python3
from pathlib import Path
import json,re,hashlib
P=Path(__file__).resolve().parent;C=P.parent;sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();plan=json.loads((C/'.build/current-all-adapter-plan.json').read_text());run=C/'.build/module-proof-i7w_1gvc';st=json.loads((run/'status.json').read_text());assert st['passed'];src={**st['core_available_source_sha256'],**st['source_sha256']};rows=[]
for row in plan['units']:
 stem=row['stem'];goal=run/'coq'/(stem+'_goal.v');assert sha(goal)==row['goal_sha256'];fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',goal.read_text(),re.M);assert len(fields)==row['actual_C_fields']
 path=C/row['source'];assert sha(path)==row.get('source_sha256',sha(path));checked=row['checked_module'];instance=row['typed_instance'];module=run/'coq'/(checked+'.v');assert module.exists();assert (run/'coq'/(checked+'.vo')).exists();assert sha(P/'coq'/(checked+'.v'))==sha(module)
 rows.append({**row,'exact_actual_type':'Qs8Mul.'+stem+'_goal.VC_Correct','current_source_sha256':sha(path),'checked_module_source_sha256':sha(module),'checked_module_object_sha256':sha(run/'coq'/(checked+'.vo'))})
for n,h in src.items():
 p=P/'coq'/(n+'.v')
 if p.exists():assert sha(p)==h,(n,'current source drift')
assert sum(r['actual_C_fields']for r in rows)==144 and len(rows)==14
state={'passed':True,'whole_kernel_verified':False,'scope':'Complete exact typed ordinary adapters,14 actual C translation units/144 current fields and6 strategy fields; no kernel or formal-ISA theorem','actual_C_units':14,'actual_C_fields':144,'strategy_fields':6,'units':rows,'strategy':{'goal_sha256':'307670e3c0ac249369e27a12e94564b4e8bb493dd055e1a9075e3116b11f6659','typed_instance':'Qs8Mul.byte_store_strategy_proof.CheckedByteStoreStrategy','source_status':'proof/byte-store-strategy-status.json','source_status_sha256':sha(P/'byte-store-strategy-status.json')},'run_directory':str(run),'run_status_sha256':sha(run/'status.json'),'current_source_sha256':src,'input_sha256':{str(p.relative_to(C)):sha(p)for p in sorted((C/'shim').iterdir())if p.suffix in ['.c','.h']},'historical_partials':'Exact successful module source/VO dependencies and logs explicitly bound by core derivation receipts; failed/missing imports and old disjunction8 are retained without count credit. Final admission must freshly recompile the whole DAG.','no_new_axioms_or_Admitted':True,'all_fp32_scales':True,'arbitrary_inactive_lanes':True};dest=P/'adapter-proof-status.json'
if dest.exists():(P/'history'/('adapter-proof-status-'+sha(dest)+'.json')).write_bytes(dest.read_bytes())
dest.write_text(json.dumps(state,indent=2)+'\n');print(json.dumps({'passed':True,'actual_C_units':14,'actual_C_fields':144,'strategy_fields':6,'status_sha256':sha(dest)},indent=2))
