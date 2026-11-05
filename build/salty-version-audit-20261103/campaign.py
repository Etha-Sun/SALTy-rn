"""Evaluate existing sources serially; no inference/search; live account quota gate."""
import argparse,json,subprocess,sys,time,traceback
from pathlib import Path
import bench
OUT=bench.OUT

def quota():
 p=subprocess.run([sys.executable,str(OUT/'read_quota.py')],stdout=subprocess.PIPE,stderr=subprocess.PIPE,text=True,timeout=40)
 if p.returncode:raise RuntimeError('quota_query_failed')
 j=json.loads(p.stdout);q=min(w['remaining_percent'] for w in j['windows'])
 with (OUT/'quota-history.jsonl').open('a') as f:f.write(json.dumps(j)+'\n')
 if q<=27:raise RuntimeError('quota_stop_remaining_'+str(q))
 return q

def jobs(group):
 if group=='gemm-frozen-fix':
  yield 'f32-gemm-minmax','E-frozen','0-cold1-retry1',600
  return
 ks=[('f32-raddstoreexpminusmax',['A-target','B-autocomp-reference','C-branch-u4v','C-branch-u2v','D-manual-u4v','E-frozen'],2,360),('f32-gemm-minmax',['B-initial','C-public','D-manual-nr64','E-frozen','A-target'],1,600),('x32-transposec',['A-target','C-public','D-manual-16x8','E-frozen'],3,360),('f32-dwconv2d-chw',['A-target','C-public','D-manual-1x2v','D-manual-3x2v','E-frozen'],5,90)]
 for k,roles,ns,limit in ks:
  if group not in ['all',k]:continue
  for i in range(ns):
   for role in roles:yield k,role,str(i)+('-fastcheck1' if 'radd' in k else '-cold1' if k=='f32-gemm-minmax' else '-primary1'),limit

def main():
 a=argparse.ArgumentParser();a.add_argument('group');a.add_argument('--limit',type=int,default=99);args=a.parse_args();launched=0
 for k,role,s,limit in jobs(args.group):
  d=OUT/'runs'/k/role/s
  if (d/'result.json').exists():continue
  if k=='f32-dwconv2d-chw' and not s.startswith('0-'):
   first=OUT/'runs'/k/role/'0-primary1/result.json'
   if first.exists() and not json.loads(first.read_text()).get('valid'):
    d.mkdir(parents=True,exist_ok=True)
    bench.write(d/'result.json',dict(valid=False,stage='not_started',reason='smallest_shape_unmeasurable',evidence=str(first),note='Larger dimensions not attempted; no claim that they fail'))
    continue
  current=dict(kernel=k,role=role,shape=s,timeout_seconds=limit,status='pending',resume=f'python3 {OUT}/campaign.py {args.group}')
  bench.write(OUT/'CONTINUE.json',current)
  try:q=quota()
  except Exception as e:
   current.update(status='stopped_by_quota_guard',reason=str(e));bench.write(OUT/'CONTINUE.json',current);print(json.dumps(current),flush=True);return
  print('LAUNCH',k,role,s,'quota_remaining',q,flush=True)
  try:
   if not (d/'test.elf').exists():bench.build(k,role,s)
   if not bench.native_check(d):
    bench.write(d/'result.json',dict(valid=False,stage='native_precheck',error='Exact GCC object failed the same output comparator under QEMU; no RTL speed credited'))
    continue
   bench.run(d,limit)
  except Exception as e:
   d.mkdir(parents=True,exist_ok=True);bench.write(d/'result.json',dict(valid=False,error=str(e),stage='build_or_runner_exception'));(d/'exception.log').write_text(traceback.format_exc());print('ERROR',k,role,s,str(e),flush=True)
  launched+=1
  if launched>=args.limit:break
 bench.write(OUT/'CONTINUE.json',dict(status='batch_finished',group=args.group,launched=launched,resume=f'python3 {OUT}/campaign.py all'))
if __name__=='__main__':main()
