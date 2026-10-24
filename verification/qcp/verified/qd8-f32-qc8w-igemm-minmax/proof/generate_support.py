#!/usr/bin/env python3
"""Fresh support C/strategy targets; these obligations do not constitute the full IGEMM."""
from pathlib import Path
import argparse,json,hashlib,subprocess,shutil,time,re
ROOT=Path(__file__).resolve().parents[1]
p=argparse.ArgumentParser();p.add_argument('--run',required=True);p.add_argument('--jobs',type=int,default=32);a=p.parse_args();assert a.jobs==32 and re.fullmatch(r'[A-Za-z0-9_-]+',a.run)
O=ROOT/'.build'/a.run/'generation';O.mkdir(parents=True,exist_ok=False);sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
inputs={str(f.relative_to(ROOT)):sha(f) for f in (ROOT/'shim').iterdir() if f.is_file()}
for f in (ROOT/'shim').iterdir():
 if f.is_file():shutil.copy2(f,O/f.name)
common=['--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info'];B=Path('/tmp/qcp214-src/linux-binary')
commands=[('strategy',[str(B/'StrategyCheck'), '--input-file',str(O/'indirection.strategies'),'--coq-output-dir',str(O),'--coq-logic-path','Qd8Indirect',*common]),('c',[str(B/'symexec'),'--input-file',str(O/'indirection.c'),'--coq-output-dir',str(O),'--coq-logic-path','Qd8Indirect','--no-record-strategies','-slp',str(O),'Qd8Indirect',*common])]
records=[]
for label,cmd in commands:
 start=time.monotonic();r=subprocess.run(['/usr/bin/prlimit','--as=17179869184','--cpu=7200','--',*cmd],capture_output=True,text=True,timeout=7230,cwd=O)
 (O/(label+'.log')).write_text(r.stdout+r.stderr);records.append({'phase':label,'exit':r.returncode,'seconds':time.monotonic()-start,'command':cmd});assert r.returncode==0,r.stderr
matches={f:sha(O/f)==sha(ROOT/'proof/coq/Qd8Indirect'/f) for f in ['indirection_strategy_goal.v','indirection_goal.v']};unchanged=all(sha(ROOT/f)==h for f,h in inputs.items())
result={'passed':all(matches.values()) and unchanged,'configured_jobs':32,'C_fields':11,'strategy_fields':3,'goal_identities':matches,'source_hashes':inputs,'inputs_unchanged':unchanged,'records':records,'whole_kernel_proved':False,'scope':'three actual support C bodies; whole original kernel/caller still open'}
(O/'result.json').write_text(json.dumps(result,indent=2)+'\n');print({k:v for k,v in result.items() if k not in ['source_hashes','records']});raise SystemExit(not result['passed'])
