"""Canonical architecture-defined, aligned cohort; existing kernel sources only."""
import argparse,json,traceback
from pathlib import Path
import bench
from campaign import quota
OUT=bench.OUT

def jobs(group):
 if group in ['all','vmulc']:
  for role in ['A-target','C-public','D-manual-u8v']:yield 'f32-vmulc',role,'author-ref3-avl0-aligned64',180
 if group in ['all','exp']:
  for i in range(2):
   for role in ['A-target','C-branch-u4v','D-manual-u4v','E-frozen']:
    yield 'f32-raddstoreexpminusmax',role,f'{i}-fastcheck1-avl0-aligned64',480 if role=='E-frozen' else 240
 if group in ['all','gemm']:
  for role in ['B-initial','C-public','D-manual-nr64','E-frozen','A-target']:yield 'f32-gemm-minmax',role,'0-cold1-avl0-aligned64',600
 if group in ['all','dwconv']:
  for i in range(5):
   for role in ['A-target','C-public','D-manual-1x2v','E-frozen']:
    yield 'f32-dwconv2d-chw',role,f'{i}-primary1-avl0-aligned64',180 if i==4 else 90
 if group=='transpose-gcc-compatibility-reproduction':
  for i in range(3):
   for role in ['A-target','C-public','D-manual-16x8','E-frozen']:
    yield 'x32-transposec',role,f'{i}-cold1-avl0-aligned64-diagnostic',[120,240,600][i]

def main():
 p=argparse.ArgumentParser();p.add_argument('group',default='all',nargs='?');a=p.parse_args()
 for k,role,s,limit in jobs(a.group):
  d=OUT/'runs'/k/role/s
  if (d/'result.json').exists():continue
  first=OUT/'runs'/k/role/('0-'+s.split('-',1)[1])/'result.json'
  if k in ['f32-dwconv2d-chw','x32-transposec'] and not s.startswith('0-') and first.exists() and not json.loads(first.read_text()).get('valid'):
   d.mkdir(parents=True,exist_ok=True);bench.write(d/'result.json',dict(valid=False,stage='not_started',reason='smallest_shape_unmeasurable_in_same_protocol',evidence=str(first)));continue
  state=dict(status='canonical_defined_reset_running',kernel=k,role=role,shape=s,timeout_seconds=limit,resume=f'python3 {OUT}/defined_campaign.py all')
  bench.write(OUT/'CONTINUE.json',state)
  try:q=quota()
  except Exception as e:
   state.update(status='stopped_by_quota_guard',reason=str(e));bench.write(OUT/'CONTINUE.json',state);print(state,flush=True);return
  print('LAUNCH',k,role,s,'remaining',q,flush=True)
  try:
   if not (d/'test.elf').exists():bench.build(k,role,s)
   if bench.native_check(d):bench.run(d,limit)
   else:bench.write(d/'result.json',dict(valid=False,stage='native_precheck'))
  except Exception as e:
   d.mkdir(parents=True,exist_ok=True);bench.write(d/'result.json',dict(valid=False,stage='driver_error',error=str(e)));(d/'exception.log').write_text(traceback.format_exc());print('ERROR',k,role,s,str(e),flush=True)
 bench.write(OUT/'CONTINUE.json',dict(status='canonical_batch_finished',group=a.group,resume=f'python3 {OUT}/defined_campaign.py all'))
if __name__=='__main__':main()
