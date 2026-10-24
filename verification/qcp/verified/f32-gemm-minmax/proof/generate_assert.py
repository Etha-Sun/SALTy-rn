#!/usr/bin/env python3
from pathlib import Path
import argparse,hashlib,json,subprocess,time,re
ROOT=Path(__file__).resolve().parents[1]
p=argparse.ArgumentParser();p.add_argument('--run',required=True);p.add_argument('--jobs',type=int,default=32);a=p.parse_args();assert a.jobs==32 and re.fullmatch(r'[A-Za-z0-9_-]+',a.run)
O=ROOT/'.build'/a.run/'generation/ordinary';O.mkdir(parents=True,exist_ok=False);src=ROOT/'shim/ordinary.c';sha=lambda f:hashlib.sha256(f.read_bytes()).hexdigest();h=sha(src)
cmd=['/usr/bin/prlimit','--as=17179869184','--cpu=7200','--','/tmp/qcp214-src/linux-binary/symexec','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--no-record-strategies','--input-file='+str(src),'--coq-output-dir='+str(O),'--coq-logic-path=F32Admission'];start=time.monotonic();r=subprocess.run(cmd,text=True,capture_output=True,timeout=7230);(O/'qcp.log').write_text(r.stdout+r.stderr)
goal=O/'ordinary_goal.v';fields=re.findall(r'^Axiom proof_of_\w+',goal.read_text(),re.M) if goal.exists() else []
result={'passed':r.returncode==0 and sha(src)==h and len(fields)==1,'configured_jobs':32,'source':'shim/ordinary.c','source_sha256':h,'inputs_unchanged':sha(src)==h,'generation_exit':r.returncode,'vc_fields':len(fields),'goal_sha256':sha(goal) if goal.exists() else None,'seconds':time.monotonic()-start,'command':cmd}
(O/'result.json').write_text(json.dumps(result,indent=2)+'\n');print(result);raise SystemExit(not result['passed'])
