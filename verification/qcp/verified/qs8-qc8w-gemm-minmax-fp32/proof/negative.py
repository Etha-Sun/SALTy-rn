#!/usr/bin/env python3
"""Independent rejection controls, with input-bound adoption of the native oracle mutant."""
from pathlib import Path
import argparse,concurrent.futures,hashlib,json,os,re,shutil,subprocess,sys
T=Path(__file__).resolve().parents[1]
p=argparse.ArgumentParser();p.add_argument('--run',required=True);p.add_argument('--jobs',type=int,default=32);p.add_argument('--native-run',required=True);p.add_argument('--budget-runner',type=Path,required=True);a=p.parse_args();assert a.jobs==32 and re.fullmatch(r'[A-Za-z0-9_-]+',a.run)
O=T/'.build'/a.run/'negative';O.mkdir(parents=True,exist_ok=False);sha=lambda f:hashlib.sha256(f.read_bytes()).hexdigest()
files=[Path(__file__),T/'spec.c',T/'proof/prepare.py',T/'proof/c/neon.json',*list((T/'impl').glob('*.c'))]
before={str(f.relative_to(T)):sha(f)for f in files}
def execute(name,cmd,seconds):
 W=O/name;W.mkdir();r=subprocess.run([sys.executable,str(a.budget_runner),'--out',str(W/'budget'),'--timeout',str(seconds),'--reserve-gib','16','--memory-gib','16','--',*cmd],capture_output=True,text=True)
 (W/'launcher.log').write_text(r.stdout+r.stderr);bp=W/'budget/result.json';b=json.loads(bp.read_text())if bp.exists()else{};normal='seconds'in b and b.get('kind')!='service_or_resource_failure';lp=W/'budget/command.log';log=lp.read_text()if lp.exists()else''
 return {'exit':r.returncode,'normal_completion':normal,'inner_exit':b.get('exit_code'),'log':log}
def false_goal():
 f=O/'FalseGoal.v';f.write_text('Lemma rejected_false : False.\nProof. exact I. Qed.\n')
 r=execute('false_goal',[os.getenv('QCP_COQC','/tmp/qcp-coq820-install/bin/coqc'),'-q',str(f)],180)
 return r['normal_completion']and r['exit']!=0 and 'Error:'in r['log']and 'True'in r['log']and 'False'in r['log']and not f.with_suffix('.vo').exists()
def source_tamper():
 M=O/'mutant'
 for name in ['proof/prepare.py','proof/c/neon.json','impl/testNEON.c','spec.c']:
  dest=M/name;dest.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(T/name,dest)
 f=M/'impl/testNEON.c';s=f.read_text();assert s.count('assert(mr != 0)')==1;f.write_text(s.replace('assert(mr != 0)','assert(mr == 0)',1))
 code="import sys;sys.path.insert(0,sys.argv[1]);import prepare;prepare.source('neon')"
 r=execute('source_tamper',[sys.executable,'-c',code,str(M/'proof')],60)
 return r['normal_completion']and r['exit']!=0 and 'AssertionError'in r['log']and 'source_token_sha256'in r['log']
def oracle_mutant():
 B=T/'.build'/a.native_run/'native';r=json.loads((B/'result.json').read_text());assert r['passed']and r['snapshot_unchanged']and r['live_inputs_unchanged']
 assert all(sha(T/f)==h and sha(B/'snapshot'/f)==h for f,h in r['source_hashes'].items())
 for name in ['original','repaired','both_wrong']:
  v=json.loads((B/name/'result.json').read_text());b=json.loads((B/name/'budget/result.json').read_text());assert v['passed']and len(v['results'])==2 and 'seconds'in b and b['exit_code']==0
  assert all(x['exit']==x['expected_exit']for x in v['results'])
 mutant=json.loads((B/'both_wrong/result.json').read_text());assert mutant['results'][1]['exit']==21
 (O/'adopted_native.json').write_text(json.dumps({'run':a.native_run,'result_sha256':sha(B/'result.json'),'scope':'Existing unchanged finite native regression, not rerun by negative.py','source_hashes':r['source_hashes']},indent=2)+'\n')
 return True
with concurrent.futures.ThreadPoolExecutor(max_workers=32)as pool:
 futures={n:pool.submit(fn)for n,fn in [('false_goal_rejected',false_goal),('source_tamper_rejected',source_tamper),('both_wrong_rejected_by_independent_oracle',oracle_mutant)]};results={n:f.result()for n,f in futures.items()}
unchanged=all(sha(T/f)==h for f,h in before.items());result={'passed':all(results.values())and unchanged,'configured_jobs':32,'independent_controls':results,'live_inputs_unchanged':unchanged,'input_sha256':before,'native_run':a.native_run}
(O/'result.json').write_text(json.dumps(result,indent=2)+'\n');print({k:v for k,v in result.items()if k!='input_sha256'});raise SystemExit(not result['passed'])
