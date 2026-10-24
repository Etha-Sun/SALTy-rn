#!/usr/bin/env python3
from pathlib import Path
import argparse,hashlib,json,subprocess,tempfile,sys,re,shutil
from prepare import ROOT,prepare
p=argparse.ArgumentParser();p.add_argument('--run',required=True);p.add_argument('--jobs',type=int,default=32);a=p.parse_args();assert a.jobs==32
O=ROOT/'.build'/a.run/'negative';O.mkdir(parents=True,exist_ok=False)
false=O/'RejectFalse.v';false.write_text('Lemma rejected_false : False.\nProof. exact I. Qed.\n')
with (O/'false.log').open('w') as log:r=subprocess.run(['/usr/bin/prlimit','--as=17179869184','--cpu=120','--','/tmp/qcp-coq820-install/bin/coqc','-q',str(false)],stdout=log,stderr=subprocess.STDOUT,timeout=150)
assert r.returncode!=0 and 'Error:' in (O/'false.log').read_text() and not false.with_suffix('.vo').exists()
# A fresh isolated copy ensures the live/frozen implementation is never touched.
M=O/'mutant';(M/'impl').mkdir(parents=True);(M/'proof/c').mkdir(parents=True)
for src in ['proof/prepare.py','proof/c/neon.json','impl/testNEON.c','spec.c']:shutil.copy2(ROOT/src,M/src)
p=M/'impl/testNEON.c';s=p.read_text();assert 'UINTPTR_MAX - 448' in s;p.write_text(s.replace('UINTPTR_MAX - 448','UINTPTR_MAX - 447',1))
cmd=['python3','-c',"import sys;sys.path.insert(0,sys.argv[1]);import prepare;prepare.prepare('neon')",str(M/'proof')]
r2=subprocess.run(cmd,capture_output=True,text=True,timeout=30);(O/'source-tamper.log').write_text(r2.stdout+r2.stderr);assert r2.returncode!=0 and 'source changed' in r2.stderr
# A concrete address arithmetic witness: no claim of a native hardware fault.
maximum=2**64-1;cursor=maximum-447;assert cursor<=maximum-447 and cursor+448>maximum and not cursor<=maximum-448
r={'passed':True,'configured_jobs':a.jobs,'false_goal_rejected':True,'source_tamper_rejected':True,'live_source_unchanged':hashlib.sha256((ROOT/'impl/testNEON.c').read_bytes()).hexdigest(),'guard_counterexample':{'cursor':cursor,'maximum':maximum,'wrong_guard_allows':True,'pointer_sum':cursor+448,'correct_guard_allows':False,'scope':'64-bit QCP integer-address prefetch bound; no hardware fault claimed'},'both_wrong_model_control':'native/result.json: simultaneous zero-FMA mutant rejected by independent oracle','source_tamper_scope':'annotation/source identity guard; new reviewed source requires regeneration and proof'};(O/'result.json').write_text(json.dumps(r,indent=2)+'\n');print(r)
