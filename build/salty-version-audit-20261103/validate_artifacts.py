"""Read-only validation of completed measurements and their frozen bindings."""
import hashlib,json
from pathlib import Path
import collect
OUT=collect.OUT
def read(p):return json.loads(p.read_text())
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
checked=[]
for row in read(OUT/'all-runs.json'):
 if not row['valid'] or not (row['primary'] or row['shape']=='0-warm5-avl0-aligned64-clang-diagnostic'):continue
 p=Path(row['evidence']).parent;b=read(p/'build.json');r=read(p/'result.json')
 assert read(p/'native.json')['valid'],str(p)
 assert r['returncode']==0 and len(r['samples'])==b['repetitions'],str(p)
 assert b['harness_sha256']==sha(p/'main.c'),str(p)
 assert b['compiled_source_sha256']==sha(p/'kernel.c'),str(p)
 assert b['compiler_sha256']==sha(Path(b['kernel_command'][0])),str(p)
 assert all(s['correct'] and s['cycles']>0 for s in r['samples']),str(p)
 checked.append(dict(directory=str(p),compiler_sha256=b['compiler_sha256'],binary_sha256=r['binary_sha256'],samples=len(r['samples'])))
for row in read(OUT/'comparison.json'):
 compilers=set()
 for r in row['roles'].values():
  if r['valid']:compilers.add(read(Path(r['evidence']).parent/'build.json')['compiler_sha256'])
 assert len(compilers)<=1,('mixed compiler in comparison',row['kernel'],row['shape'])
for r in read(OUT/'environment/build-inputs.json'):
 assert sha(Path(r['snapshot']))==r['sha256'],r['snapshot']
 assert sha(Path(r['path']))==r['sha256'],('build input changed',r['path'])
drift=[]
root=OUT.parents[1]
for r in read(OUT/'identity.json'):
 p=root/'kernels/target'/(r['kernel']+'.c')
 if sha(p)!=r['working_sha256']:drift.append(dict(path=str(p),intake_sha256=r['working_sha256'],current_sha256=sha(p)))
collect.write(OUT/'artifact-validation.json',dict(status='passed',checked_completed_runs=checked,current_target_drift_since_intake=drift,scope='passing primary and warm128 cohorts; measurements remain tied to intake snapshots'))
print('Artifact bindings checked:',len(checked),'completed runs;',len(drift),'target files changed since intake')
