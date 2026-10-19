from pathlib import Path
import json,hashlib
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2]
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
checks=[]
for name,expected in [('unary-raw03',{'wrong_pointer_not_ensures','wrong_negative_zero_not_ensures'}),('unary-typed03',{'wrong_pointer_not_ensures','wrong_negative_zero_not_ensures'}),('ieee-regression01',None),('fma-regression01',None)]:
 out=HERE/'controls'/name;raw=json.loads((out/'raw.json').read_text());record=json.loads((out/'result.json').read_text())
 if expected is None:
  old=HERE.parent/('handoff-local/semantic-local-02.json' if name.startswith('ieee') else 'model-plus/controls02.json')
  baseline=json.loads(old.read_text());expected={r['property'] for r in baseline if not r['passed']}
  assert {(r['property'],r['function']) for r in raw}=={(r['property'],r['function']) for r in baseline}
 pending={r['property'] for r in raw if not r['passed']}
 assert record['exit']==0 and pending==expected,(name,pending,expected)
 assert all(r['verdict']=='timeout' for r in raw if not r['passed'])
 checks.append({'name':name,'raw_sha256':sha(out/'raw.json'),'positive_passed':sum(r['passed'] for r in raw),'raw_total':len(raw),'intended_negative_unproved':sorted(pending),'accepted':True})
(HERE/'control-acceptance.json').write_text(json.dumps({'controls_accepted':True,'model_lock_sha256':sha(HERE/'float_model_lock.json'),'checks':checks,'whole_kernel_replay':'pending'},indent=2)+'\n')
old=HERE.parent/'handoff-replay/f32-vadd/frozen.json';data=json.loads(old.read_text());case=HERE/'replay/f32-vadd';case.mkdir(parents=True)
for v in data['files'].values():assert sha(ROOT/v['path'])==v['sha256']
lock=HERE/'float_model_lock.json';ld=json.loads(lock.read_text())
data['files']['float_model_lock.json']={'path':str(lock.relative_to(ROOT)),'sha256':sha(lock)}
data.update(previous_version=str(old.parent.relative_to(ROOT)),wp_share=ld['share'],wp_why3_config=ld['why3_config'],tool_revision={'base_frozen_sha256':sha(old),'source_change':'CodeSemantics.exp_unop LNot operand typing and IEEE zero comparison','controls':'experiments/shim-c-v2/stage3-unary-front/control-acceptance.json'})
data.pop('environment_relocation',None)
(case/'frozen.json').write_text(json.dumps(data,indent=2)+'\n')
(case/'freeze-sha256.txt').write_text(sha(case/'frozen.json')+'\n')
print('accepted controls; frozen replay',sha(case/'frozen.json'))
