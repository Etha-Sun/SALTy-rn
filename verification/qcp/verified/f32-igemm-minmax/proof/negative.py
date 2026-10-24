"""False Coq goal, C identity tamper, and both-ISA incorrect arithmetic controls."""
from pathlib import Path
import argparse,json,hashlib,subprocess,shutil,time,os
from prepare import ROOT
p=argparse.ArgumentParser();p.add_argument('--run',required=True);p.add_argument('--jobs',type=int,default=32);a=p.parse_args();assert a.jobs==32
O=ROOT/'.build'/a.run/'negative';O.mkdir(parents=True,exist_ok=False);sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();before={str(p.relative_to(ROOT)):sha(p)for p in [*list((ROOT/'impl').glob('*.c')),*list((ROOT/'proof/native').glob('*'))]if p.is_file()}
f=O/'RejectFalse.v';f.write_text('Lemma rejected_false : False.\nProof. exact I. Qed.\n')
with(O/'false.log').open('w')as log:r=subprocess.run(['/usr/bin/prlimit','--as=17179869184','--cpu=120','--','/tmp/qcp-coq820-install/bin/coqc','-q',str(f)],stdout=log,stderr=subprocess.STDOUT,timeout=150)
false=r.returncode!=0 and 'Error:'in(O/'false.log').read_text()and not f.with_suffix('.vo').exists()
M=O/'mutant';(M/'impl').mkdir(parents=True);(M/'proof/c').mkdir(parents=True)
for src in ['proof/prepare.py','proof/c/neon.json','impl/testNEON.c','spec.c']:shutil.copy2(ROOT/src,M/src)
f=M/'impl/testNEON.c';s=f.read_text();assert s.count('assert(mr != 0)')==1;f.write_text(s.replace('assert(mr != 0)','assert(mr == 0)',1))
cmd=['python3','-c',"import sys;sys.path.insert(0,sys.argv[1]);import prepare;prepare.source('neon')",str(M/'proof')];r=subprocess.run(cmd,capture_output=True,text=True,timeout=30);(O/'source-tamper.log').write_text(r.stdout+r.stderr);tamper=r.returncode!=0 and 'AssertionError'in r.stderr
# The BOTH_WRONG macro is confined to the two intrinsic arithmetic units;
# the independently indexed driver/oracle retains real fmaf.
exe=O/'both-wrong';cmd=['clang','-std=c11','-O1','-DBOTH_WRONG','-frounding-math','-fno-fast-math','-ffp-contract=off','-fsanitize=address,undefined','-fno-omit-frame-pointer',*map(str,sorted((ROOT/'proof/native').glob('*.c'))),'-lm','-o',str(exe)]
with(O/'both-wrong-compile.log').open('w')as log:r=subprocess.run(cmd,stdout=log,stderr=subprocess.STDOUT,timeout=600)
assert r.returncode==0
with(O/'both-wrong.log').open('w')as log:r=subprocess.run([str(exe)],stdout=log,stderr=subprocess.STDOUT,timeout=600,env={**os.environ,'ASAN_OPTIONS':'detect_leaks=0'})
wrong=r.returncode==20 and 'mismatch'in(O/'both-wrong.log').read_text();unchanged=all(sha(ROOT/p)==h for p,h in before.items())
out={'passed':false and tamper and wrong and unchanged,'configured_jobs':32,'false_goal_rejected':false,'source_tamper_rejected':tamper,'both_ISAs_zero_FMA_rejected_by_independent_oracle':wrong,'live_inputs_unchanged':unchanged,'source_hashes':before};(O/'result.json').write_text(json.dumps(out,indent=2)+'\n');print({k:v for k,v in out.items()if k!='source_hashes'});raise SystemExit(not out['passed'])
