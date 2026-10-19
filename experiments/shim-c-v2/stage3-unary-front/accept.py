from pathlib import Path
import json,hashlib
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2]
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
control=json.loads((HERE/'control-acceptance.json').read_text());assert control['controls_accepted']
case=HERE/'replay/f32-vadd';summary=case/'logs/unary-smoke01-summary.json';rawfile=case/'logs/unary-smoke01.json';s=json.loads(summary.read_text());raw=json.loads(rawfile.read_text())
assert s['complete'] and s['source_guard']['passed'] and s['model_control']['accepted'] and s['unchanged'] and s['model_inputs_unchanged']
assert not s['pending'] and not s['missing_body_ensures'] and not s['missing_global_lemmas']
assert len(raw)==571 and all(r['passed'] for r in raw)
model_checks={}
for name in ['handoff-model-front','handoff-model-plus','stage3-unary-front']:
 lock=HERE.parent/name/'float_model_lock.json';data=json.loads(lock.read_text())
 for p,h in data['files'].items():assert sha(Path(p) if Path(p).is_absolute() else ROOT/p)==h,(name,p)
 model_checks[name]={'lock_sha256':sha(lock),'files_checked':len(data['files']),'unchanged':True}
p=HERE/'replay/f32-argmaxpool/logs/unary-selected01.json';r=json.loads(p.read_text());assert len(r)==6 and all(x['verdict'] in ['valid','timeout'] for x in r)
assert 'Type mismatch' not in p.with_suffix('.log').read_text()
record={'status':'isolated_frontend_controls_and_known_full_replay_accepted','scope':'Value-context logical negation repair, native IEEE; compiler/ISA correspondence remain TCB. No complex kernel accepted.','model_checks':model_checks,'controls':control,'known_full_replay':{'kernel':'f32-vadd','complete':True,'raw_passed':571,'raw_total':571,'pending':[],'summary_sha256':sha(summary),'raw_sha256':sha(rawfile),'frozen_sha256':sha(case/'frozen.json'),'seconds':s['seconds']},'argmax_original_raw_configuration_diagnostic':{'raw_passed':sum(x['passed'] for x in r),'raw_total':len(r),'type_error_reproduced_after_fix':False,'raw_sha256':sha(p),'whole_kernel_accepted':False}}
full_path=HERE/'replay/f32-argmaxpool/logs/unary-full01-summary.json'
full=json.loads(full_path.read_text())
assert not full['complete'] and full['exit']==124
full_raw=json.loads((full_path.parent/'unary-full01.json').read_text())
assert full_raw and all(r.get('function') is None and r['property'].startswith('lemma_') for r in full_raw)
assert full['actual_command'][full['actual_command'].index('-wp-model')+1]=='Typed+raw+float'
assert full['source_guard']['passed'] and full['unchanged'] and full['model_inputs_unchanged'] and full['model_control']['accepted']
record['argmax_full_attempt']={'complete':False,'exit':full['exit'],'seconds':full['seconds'],'body_raw_present':False,'global_only_raw':full['raw_obligations'],'summary_sha256':sha(full_path),'actual_wp_model':'Typed+raw+float','note':'command is the base command; actual_command is the pinned execution. Global-only merged raw is not a body report.'}
(HERE/'ACCEPTANCE.json').write_text(json.dumps(record,indent=2)+'\n');print(record['status'])
