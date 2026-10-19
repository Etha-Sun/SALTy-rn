#!/usr/bin/env python3
"""Prepare manifests only. Does not invoke Why3 or a solver."""
from pathlib import Path
import hashlib,json,re,shlex,shutil,sys
HERE=Path(__file__).resolve().parent
REPO=HERE.parents[4]
PROTO=HERE.parent.parent/'byte-fp-prototype'
AUDIT=HERE.parent/'byte19-complete/DEPENDENCY-AUDIT.json'
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def load(p):return json.loads(Path(p).read_text())
def command(path,source):
 data=load(PROTO/path);data=data if isinstance(data,list) else [data]
 found=[d['command'] for d in data if str((PROTO/source).resolve()) in d.get('command',[])]
 assert len(found)==1,(path,source,found)
 return found[0]
rows=[('codec-round-range','checked-subset-v4/root-z301/result.json','checked-subset-v4/subset.mlw',4,['checked_decodeencode32','checked_encoderange32','checked_decodeencode64','checked_encoderange64']),
('prereq-bv32','checked-lemmas-v3/root-z301/results.json','checked-lemmas-v3/prerequisites.mlw',1,['bv_inverse32']),
('prereq-int32','checked-lemmas-v3/root-z301/results.json','checked-lemmas-v3/prerequisites.mlw',1,['int_roundtrip32']),
('prereq-bv64','checked-lemmas-v3/root-z301/results.json','checked-lemmas-v3/prerequisites.mlw',1,['bv_inverse64']),
('prereq-int64','native-int64-cvc5-v6/root01/result.json','checked-lemmas-v3/prerequisites.mlw',1,['int_roundtrip64']),
('interfaces','checked-lemmas-v3/root-z301/results.json','checked-lemmas-v3/interfaces.mlw',2,['interface32','interface64']),
('compose32','compose32-cuts-v6/root01/result.json','compose32-cuts-v6/compose.mlw',6,['checked_integer_inverse32']),
('compose64','compose64-cuts-v7/root01/result.json','compose64-cuts-v7/compose.mlw',6,['checked_integer_inverse64']),
('zero32','zero-unique-v11/result.json','zero-unique-v11/zero32.mlw',1,['checked_negative_zero32']),
('zero64','zero-unique-v11/result.json','zero-unique-v11/zero64.mlw',1,['checked_negative_zero64']),
('memoryread','store-read-v16/memory-root01.json','store-read-v16/memoryread.mlw',2,['checked_read_write32','checked_read_frame32']),
('storeread','store-read-v16/store-root01.json','store-read-v16/store-read.mlw',2,['checked_store_read32']),
('loadframe','store-read-v16/frame-root01.json','store-read-v16/loadframe.mlw',1,['checked_decode_frame32']),
('read64','read64-bytes-v14/root01.json','read64-bytes-v14/read64.mlw',1,['checked_read64_equal_bytes'])]
assert not (HERE/'PLAN.json').exists(),'Prepared plan exists; refuse overwrite'
(HERE/'configs').mkdir();(HERE/'inputs').mkdir()
python=Path(shutil.which('python3')).resolve()
common={python,Path(sys.executable).resolve(),AUDIT,HERE/'run.py',HERE/'record-solver.py',HERE/'prepare.py'}
roots=set();drivers=set();jobs=[]
for name,result,source,leaves,goals in rows:
 old=command(result,source);actual=list(old)
 if name in ('prereq-bv32','prereq-int32','prereq-bv64'):
  module={'prereq-bv32':'BVInverse32','prereq-int32':'IntRoundtrip32','prereq-bv64':'BVInverse64'}[name]
  actual += ['-T',module]
 cfg=Path(old[old.index('-C')+1]);text=cfg.read_text()
 def wrap(m):
  raw=json.loads(m.group(1));exe=Path(shlex.split(raw)[0]);assert exe.is_absolute() and exe.is_file(),exe
  common.add(exe);roots.add(exe.parent) if exe.suffix=='.py' else None
  return 'command = '+json.dumps(shlex.quote(str(python))+' '+shlex.quote(str(HERE/'record-solver.py'))+' '+raw)
 text=re.sub(r'^command\s*=\s*("[^\n]+")\s*$',wrap,text,flags=re.M)
 newcfg=HERE/'configs'/f'{name}.conf';newcfg.write_text(text)
 actual[actual.index('-C')+1]=str(newcfg)
 common.update([cfg,PROTO/result,PROTO/source,Path(old[0])])
 drivers.update(Path(x) for x in re.findall(r'^driver\s*=\s*"([^"]+)"',cfg.read_text(),re.M))
 roots.add((PROTO/source).parent)
 roots.update(Path(old[i+1]) for i,x in enumerate(old) if x=='-L')
 jobs.append({'id':name,'historical_result':str(PROTO/result),'original_command':old,'actual_command':actual,'source':str(PROTO/source),'expected_valid_leaves':leaves,'expected_goals':sorted(goals),'wall_seconds':240,'inputs_manifest':str(HERE/'inputs'/f'{name}.json'),'configuration_change':'Observational solver wrapper only; same original executable/driver/options. Prerequisite Z3 batch is split by -T to its three previously valid modules; separate CVC5 int64 retained.'})
prefix=Path(jobs[0]['original_command'][0]).parent.parent
roots.add(prefix/'share/why3')
common.update(x for x in (prefix/'bin').glob('why3*') if x.is_file())
# Both bottom-level solvers are also locked when an old CVC5 adapter is the configured executable.
solverdir=REPO/'experiments/shim-c-v2/handoff-solvers/.build/bin'
common.update([solverdir/'z3',solverdir/'cvc5'])
seen=set()
def add_driver(p):
 p=p.resolve()
 if p in seen:return
 assert p.is_file(),p
 seen.add(p);common.add(p)
 for x in re.findall(r'^\s*import\s+"([^"]+)"',p.read_text(),re.M):
  candidates=[Path(x)] if Path(x).is_absolute() else [p.parent/x,prefix/'share/why3/drivers'/x]
  found=next((q for q in candidates if q.is_file()),None)
  assert found is not None,(p,x)
  add_driver(found)
for p in drivers:add_driver(p)
allowed={'.mlw','.why','.drv','.gen','.conf','.py','.cma','.cmxs','.cmxs'}
for root in roots:
 for p in root.rglob('*'):
  if p.is_file() and p.suffix in allowed and not any(x in p.relative_to(root).parts for x in ('.build','runs','replay','__pycache__')):
   common.add(p)
common_snapshot={str(p.resolve()):sha(p) for p in sorted(common) if p.is_file()}
assert len(common_snapshot)==len({p.resolve() for p in common}), 'Missing input'
for job in jobs:
 files=dict(common_snapshot);cfg=Path(job['actual_command'][job['actual_command'].index('-C')+1]);files[str(cfg)]=sha(cfg)
 Path(job['inputs_manifest']).write_text(json.dumps(files,indent=2)+'\n')
plan={'status':'prepared_not_executed','repository':str(REPO),'historical_records':12,'replay_jobs':len(jobs),'expected_valid_solver_leaves':sum(j['expected_valid_leaves'] for j in jobs),'jobs':jobs,'snapshot_policy':'All files of theory/driver/code suffix in each -L and source directory, Why3 stdlib/drivers, recursive driver imports, configured executables, actual Z3/CVC5, Python, Why3 and sibling why3 executables. Overinclusive immutable set checked before and after every job. Exact generated SMT and solver outputs retained per invocation. No new semantic assumptions or source/model changes.'}
(HERE/'PLAN.json').write_text(json.dumps(plan,indent=2)+'\n')
seal={str(p):sha(p) for p in [HERE/'PLAN.json',HERE/'run.py',HERE/'record-solver.py',HERE/'prepare.py',*sorted((HERE/'inputs').glob('*.json')),*sorted((HERE/'configs').glob('*.conf'))]}
(HERE/'SEAL.json').write_text(json.dumps(seal,indent=2)+'\n')
print(json.dumps({'jobs':len(jobs),'expected_leaves':plan['expected_valid_solver_leaves'],'common_inputs':len(common_snapshot),'repository':str(REPO),'plan_sha256':sha(HERE/'PLAN.json')},indent=2))
