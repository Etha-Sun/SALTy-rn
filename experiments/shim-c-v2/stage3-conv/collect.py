"""Summarize saved actual attempts; never substitutes for executing proofs."""
from pathlib import Path
import json,hashlib,datetime
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2];sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
candidates=[]
for p in sorted(HERE.rglob('frozen.json')):
 if '.build' in p.parts:continue
 case=p.parent;data=json.loads(p.read_text());guard=json.loads((case/'source-guard.json').read_text());ann=Path(guard['annotated'])
 files_unchanged=all(sha(ROOT/v['path'])==v['sha256'] for v in data['files'].values())
 annotated_unchanged=all(sha(ann/n)==v for n,v in guard['generated'].items())
 patch_unchanged=all(sha(ROOT/n)==v for n,v in guard['proof'].items())
 attempts=[]
 for rp in sorted((case/'logs').glob('*-result.json')):
  r=json.loads(rp.read_text())
  log=rp.with_name(rp.name.replace('-result.json','.log'));text=log.read_text() if log.exists() else ''
  classification=('environment_configuration_error' if 'Unknown prover' in text else 'candidate_annotation_parse_error' if 'Only one code annotation is allowed' in text else 'budget_exhausted_without_final_raw' if r.get('exit_code')==124 and r.get('raw_total') is None else 'completed_attempt_not_formal_acceptance')
  attempts.append({'result':str(rp.relative_to(HERE)),'classification':classification,**r})
 candidates.append({'case':str(case.relative_to(HERE)),'kernel':data['name'],'frozen_sha256':sha(p),'proof_sha256':sha(case/'proof.patch'),'source_guard_passed':guard['passed'],'frozen_inputs_unchanged':files_unchanged,'annotated_inputs_unchanged':annotated_unchanged,'proof_unchanged':patch_unchanged,'attempts':attempts})
old=[]
for n in ['f32-conv-hwc2chw','f32-dwconv-minmax','f32-dwconv2d-chw']:
 baseline=HERE.parent/'v4-campaign'/n;initial=json.loads((HERE/'freeze.json').read_text())[n]
 old.append({'kernel':n,'old_frozen_unchanged':sha(baseline/'frozen.json')==initial['old_frozen_sha256'],'old_proof_unchanged':sha(baseline/'proof.patch')==initial['old_proof_sha256']})
model=HERE.parent/'handoff-model-plus/float_model_lock.json';ld=json.loads(model.read_text());stable=all(sha(Path(n) if Path(n).is_absolute() else ROOT/n)==v for n,v in ld['files'].items())
status={'generated_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'complete':False,'new_complete_kernels':0,'model_inputs_unchanged':stable,'model_lock_sha256':sha(model),'old_versions':old,'candidates':candidates,'scope':'Independent attempts only; no strict checker complete=true is claimed. Missing raw body reports are null, not 0/0. No true kernel counterexample established.'}
(HERE/'STATUS.json').write_text(json.dumps(status,indent=2)+'\n')
files={str(p.relative_to(HERE)):sha(p) for p in HERE.rglob('*') if p.is_file() and '.build' not in p.parts and p.name!='evidence-sha256.json'}
(HERE/'evidence-sha256.json').write_text(json.dumps(files,indent=2)+'\n')
print('candidates',len(candidates),'model_unchanged',stable,'old_unchanged',all(x['old_frozen_unchanged'] and x['old_proof_unchanged'] for x in old))
