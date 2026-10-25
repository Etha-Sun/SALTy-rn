#!/usr/bin/env python3
"""Input-bound finite regression of original/repaired full C; never formal credit."""
from pathlib import Path
import argparse,concurrent.futures,datetime,hashlib,json,os,re,shutil,subprocess,time
ROOT=Path(__file__).resolve().parents[1]
p=argparse.ArgumentParser();p.add_argument('--run',required=True);p.add_argument('--jobs',type=int,default=32);p.add_argument('--budget-runner',type=Path,required=True);a=p.parse_args();assert a.jobs==32 and re.fullmatch('[A-Za-z0-9_-]+',a.run)
O=ROOT/'.build'/a.run/'native';O.mkdir(parents=True,exist_ok=False);S=O/'snapshot';S.mkdir();sha=lambda f:hashlib.sha256(f.read_bytes()).hexdigest()
files=[Path(__file__)]+[f for d in ['impl','proof/native','proof/original'] for f in(ROOT/d).rglob('*') if f.is_file()];inputs={str(f.relative_to(ROOT)):sha(f)for f in files}
for f in files:
 dest=S/f.relative_to(ROOT);dest.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(f,dest)
(O/'input.json').write_text(json.dumps(inputs,indent=2)+'\n')
variants=[('original','original_counterexample.c',[],0),('repaired','check.c',[],0),('both_wrong','check.c',['-DBOTH_WRONG'],21)]
def run(v):
 name,src,defs,expected=v;W=O/name;W.mkdir();binary=W/'run';compile=['gcc','-std=c11','-O1','-fno-fast-math','-ffp-contract=off','-fsanitize=address,undefined','-fno-omit-frame-pointer',*defs,str(S/'proof/native'/src),'-lm','-o',str(binary)]
 harness=W/'run.py';harness.write_text('import subprocess,os,json\nfrom pathlib import Path\nW=Path(__file__).parent\ncommands='+repr([compile,[str(binary)]])+'\nexpected='+repr([0,expected])+'''\nresults=[]
for i,cmd in enumerate(commands):
 with(W/('step'+str(i)+'.log')).open('w')as log:
  r=subprocess.run(['/usr/bin/prlimit','--cpu=180','--',*cmd],stdout=log,stderr=subprocess.STDOUT,timeout=210,env={**os.environ,'ASAN_OPTIONS':'detect_leaks=0','UBSAN_OPTIONS':'halt_on_error=1'})
 results.append({'command':cmd,'exit':r.returncode,'expected_exit':expected[i]})
 if r.returncode!=expected[i]:break
passed=len(results)==2 and all(r['exit']==r['expected_exit']for r in results)
(W/'result.json').write_text(json.dumps({'passed':passed,'results':results},indent=2)+'\\n')
raise SystemExit(not passed)
''')
 cmd=['python3',str(a.budget_runner),'--out',str(W/'budget'),'--timeout','450','--reserve-gib','16','--memory-gib','16','--','python3',str(harness)];t=time.monotonic();r=subprocess.run(cmd,capture_output=True,text=True);(W/'launch.log').write_text(r.stdout+r.stderr)
 return {'variant':name,'exit':r.returncode,'seconds':time.monotonic()-t,'passed':r.returncode==0,'result':str((W/'result.json').relative_to(O))}
with concurrent.futures.ThreadPoolExecutor(max_workers=32)as pool:records=list(pool.map(run,variants))
text=(O/'repaired/step1.log').read_text()if(O/'repaired/step1.log').exists()else'';counts=re.search(r'PASS cases=(\d+) output_cells=(\d+)',text)
res={'passed':all(r['passed']for r in records),'utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'configured_jobs':32,'independent_tasks':3,'cases':int(counts[1])if counts else None,'output_cells':int(counts[2])if counts else None,'source_hashes':inputs,'snapshot_unchanged':all(sha(S/n)==h for n,h in inputs.items()),'live_inputs_unchanged':all(sha(ROOT/n)==h for n,h in inputs.items()),'records':records,'scope':'finite host C-shim regression, separately implemented ISA NaN behavior; not hardware or formal proof','negative_control':'both outputs first byte flipped; equality holds but independent oracle rejects','physical_memory_limit_per_variant_gib':16,'limits':'actual shared cgroup lease records under each variant/budget'}
res['passed'] &= res['snapshot_unchanged'] and res['live_inputs_unchanged'] and counts is not None;(O/'result.json').write_text(json.dumps(res,indent=2)+'\n');print({k:v for k,v in res.items()if k not in['source_hashes','records']});raise SystemExit(not res['passed'])
