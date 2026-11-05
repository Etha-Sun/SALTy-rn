"""Existing candidates, matched Clang kernel/helper compiler; fixed GCC harness."""
import json,traceback
import bench
from campaign import quota
OUT=bench.OUT
jobs=[]
# Preserve a full author-like five-warm-call case before the larger cold supplement.
for role in ['A-target','C-public','D-manual-16x8','E-frozen']:
 jobs.append(('x32-transposec',role,'0-warm5-avl0-aligned64-clang-diagnostic',360))
for i in range(3):
 for role in ['A-target','C-public','D-manual-16x8','E-frozen']:
  jobs.append(('x32-transposec',role,f'{i}-cold1-avl0-aligned64-clang-diagnostic',[180,300,600][i]))
for i in range(5):
 for role in ['A-target','C-public','D-manual-1x2v','E-frozen']:
  jobs.append(('f32-dwconv2d-chw',role,f'{i}-primary1-avl0-aligned64-clang',240 if i==4 else 120))
for k,role,s,limit in jobs:
 d=OUT/'runs'/k/role/s
 if (d/'result.json').exists():continue
 first=OUT/'runs'/k/role/('0-'+s.split('-',1)[1])/'result.json'
 if not s.startswith('0-') and first.exists() and not json.loads(first.read_text()).get('valid'):
  d.mkdir(parents=True,exist_ok=True);bench.write(d/'result.json',dict(valid=False,stage='not_started',reason='smallest_shape_unmeasurable_in_matched_clang_protocol',evidence=str(first)));continue
 state=dict(status='matched_clang_cohort_running',kernel=k,role=role,shape=s,timeout_seconds=limit,resume=f'python3 {OUT}/compat_campaign.py')
 bench.write(OUT/'CONTINUE.json',state)
 try:q=quota()
 except Exception as e:
  state.update(status='stopped_by_quota_guard',reason=str(e));bench.write(OUT/'CONTINUE.json',state);print(state,flush=True);break
 print('LAUNCH',k,role,s,'remaining',q,flush=True)
 try:
  if not (d/'test.elf').exists():bench.build(k,role,s)
  if bench.native_check(d):bench.run(d,limit)
  else:bench.write(d/'result.json',dict(valid=False,stage='native_precheck'))
 except Exception as e:
  d.mkdir(parents=True,exist_ok=True);bench.write(d/'result.json',dict(valid=False,stage='driver_error',error=str(e)));(d/'exception.log').write_text(traceback.format_exc());print('ERROR',k,role,s,str(e),flush=True)
else:bench.write(OUT/'CONTINUE.json',dict(status='matched_clang_cohort_finished',resume=f'python3 {OUT}/compat_campaign.py'))
