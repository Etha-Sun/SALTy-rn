#!/usr/bin/env python3
"""Reject a false proof and a changed actual C source; preserve the live case."""
from pathlib import Path
import argparse,hashlib,json,subprocess,shutil,time
from prepare import ROOT
p=argparse.ArgumentParser();p.add_argument('--run',required=True);p.add_argument('--jobs',type=int,default=32);a=p.parse_args();assert a.jobs==32
O=ROOT/'.build'/a.run/'negative';O.mkdir(parents=True,exist_ok=False);sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();before=sha(ROOT/'impl/testNEON.c')
f=O/'RejectFalse.v';f.write_text('Lemma rejected_false : False.\nProof. exact I. Qed.\n')
with (O/'false.log').open('w')as log:r=subprocess.run(['/usr/bin/prlimit','--as=17179869184','--cpu=120','--','/tmp/qcp-coq820-install/bin/coqc','-q',str(f)],stdout=log,stderr=subprocess.STDOUT,timeout=150)
false=r.returncode!=0 and 'Error:'in(O/'false.log').read_text()and not f.with_suffix('.vo').exists();assert false
M=O/'mutant';(M/'impl').mkdir(parents=True);(M/'proof/c').mkdir(parents=True)
for src in ['proof/prepare.py','proof/c/neon.json','impl/testNEON.c','spec.c']:shutil.copy2(ROOT/src,M/src)
f=M/'impl/testNEON.c';s=f.read_text();assert s.count('assert(mr != 0)')==1;f.write_text(s.replace('assert(mr != 0)','assert(mr == 0)',1))
cmd=['python3','-c',"import sys;sys.path.insert(0,sys.argv[1]);import prepare;prepare.prepare('neon')",str(M/'proof')];r=subprocess.run(cmd,capture_output=True,text=True,timeout=30);(O/'source-tamper.log').write_text(r.stdout+r.stderr);tamper=r.returncode!=0 and 'annotation source changed'in r.stderr
result={'passed':false and tamper and before==sha(ROOT/'impl/testNEON.c'),'configured_jobs':32,'false_goal_rejected':false,'source_tamper_rejected':tamper,'source_sha256':before,'live_source_unchanged':before==sha(ROOT/'impl/testNEON.c'),'native_negative_controls':'native/result.json: wrong zero/offset/table/ks/packed stride and both-side zero-FMA are rejected; none count as formal kernel proofs'};(O/'result.json').write_text(json.dumps(result,indent=2)+'\n');print(result);raise SystemExit(not result['passed'])
