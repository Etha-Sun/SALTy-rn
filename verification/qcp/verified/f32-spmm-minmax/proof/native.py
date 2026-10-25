#!/usr/bin/env python3
"""Finite native regression on actual C; not a complete-kernel proof."""
from pathlib import Path
import argparse,concurrent.futures,hashlib,json,os,shutil,subprocess,time
T=Path(__file__).resolve().parents[1]
p=argparse.ArgumentParser();p.add_argument('--run',required=True);p.add_argument('--jobs',type=int,default=32);p.add_argument('--budget-runner',type=Path,required=True);a=p.parse_args();assert a.jobs==32
O=T/'.build'/a.run/'native';O.mkdir(parents=True,exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
inputs=[*sorted((T/'proof/native').glob('*.c')),*sorted((T/'proof/native').glob('*.h')),T/'impl/testNEON.c',T/'impl/testRVV.c']
hashes={str(f.relative_to(T)):sha(f)for f in inputs};snapshot=O/'snapshot';snapshot.mkdir()
for f in inputs:shutil.copy2(f,snapshot/f.name)
def variant(name):
 d=O/name;d.mkdir();macros={'max':[],'balanced':['-DBALANCED_VL'],'both_wrong':['-DBOTH_WRONG']}[name]
 build=['gcc','-std=c11','-O1','-g','-ffp-contract=off','-frounding-math','-fno-builtin-fmaf','-fsanitize=address,undefined','-fno-omit-frame-pointer',*macros,'-I',str(snapshot),*map(str,sorted(f for f in snapshot.glob('*.c')if not f.name.startswith('test'))),'-lm','-o',str(d/'regression')]
 records=[]
 for phase,command in [('build',build),('run',[str(d/'regression')])]:
  t=time.monotonic();budget=d/phase;cmd=['python3',str(a.budget_runner),'--out',str(budget),'--timeout','300','--reserve-gib','4','--memory-gib','4','--',*command]
  r=subprocess.run(cmd,capture_output=True,text=True,env=dict(os.environ,ASAN_OPTIONS='detect_leaks=0'));(d/(phase+'-launcher.log')).write_text(r.stdout+r.stderr)
  result=json.loads((budget/'result.json').read_text())if(budget/'result.json').exists()else{}
  records.append({'phase':phase,'exit':r.returncode,'seconds':time.monotonic()-t,'budget_result':result})
  expected=21 if name=='both_wrong'and phase=='run'else 0
  if r.returncode!=expected or result.get('exit_code')!=expected or result.get('kind')=='service_or_resource_failure':return {'variant':name,'passed':False,'records':records}
 log=(d/'run/command.log').read_text()
 counts=json.loads(log.strip().splitlines()[-1])if name!='both_wrong'else {'negative_rejected':True,'expected_exit':21}
 return {'variant':name,'passed':True,'records':records,**counts}
with concurrent.futures.ThreadPoolExecutor(max_workers=a.jobs)as pool:results=list(pool.map(variant,['max','balanced','both_wrong']))
unchanged=all(sha(T/f)==sha(snapshot/Path(f).name)==h for f,h in hashes.items())
result={'passed':all(x['passed']for x in results)and unchanged,'configured_jobs':32,'scope':'native actual C under host models, two legal VL selections, independent indexed oracle; no whole-kernel or hardware proof','source_hashes':hashes,'inputs_unchanged':unchanged,'results':results}
(O/'result.json').write_text(json.dumps(result,indent=2)+'\n');print({k:v for k,v in result.items()if k not in ['source_hashes','results']});print([{k:v for k,v in row.items()if k!='records'}for row in results]);raise SystemExit(not result['passed'])
