"""Independent rejection controls; live C and annotation inputs are read-only."""
from pathlib import Path
import argparse,concurrent.futures,json,hashlib,subprocess,shutil,os
from prepare import ROOT
p=argparse.ArgumentParser();p.add_argument('--run',required=True);p.add_argument('--jobs',type=int,default=32);a=p.parse_args();assert a.jobs==32
O=ROOT/'.build'/a.run/'negative';O.mkdir(parents=True,exist_ok=False);sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();files=[*list((ROOT/'impl').glob('*.c')),*list((ROOT/'proof/native').glob('*')),ROOT/'proof/c/neon.json',ROOT/'proof/prepare.py',ROOT/'spec.c',Path(__file__)];before={str(p.relative_to(ROOT)):sha(p)for p in files if p.is_file()}
records=[]
def run(label,cmd,seconds=600,limit_virtual=True):
 r=subprocess.run(['/usr/bin/prlimit',*(['--as=17179869184']if limit_virtual else[]),'--cpu='+str(seconds),'--',*cmd],capture_output=True,text=True,timeout=seconds+30,env={**os.environ,'ASAN_OPTIONS':'detect_leaks=0'});(O/(label+'.log')).write_text(r.stdout+r.stderr);records.append({'label':label,'command':cmd,'exit':r.returncode,'cpu_seconds':seconds,'virtual_memory_limit_gib':16 if limit_virtual else None,'physical_memory_budget':'enclosing finite16GiB cgroup lease; ASan reserves large virtual shadow'});return r

def false_goal():
 f=O/'RejectFalse.v';f.write_text('Lemma rejected_false : False.\nProof. exact I. Qed.\n');r=run('false',['/tmp/qcp-coq820-install/bin/coqc','-q',str(f)],120)
 return r.returncode!=0 and 'Error:'in r.stderr and not f.with_suffix('.vo').exists()
def tamper():
 M=O/'mutant';(M/'impl').mkdir(parents=True);(M/'proof/c').mkdir(parents=True)
 for src in ['proof/prepare.py','proof/c/neon.json','impl/testNEON.c','spec.c']:shutil.copy2(ROOT/src,M/src)
 f=M/'impl/testNEON.c';s=f.read_text();assert s.count('assert(mr != 0)')==1;f.write_text(s.replace('assert(mr != 0)','assert(mr == 0)',1))
 r=run('source-tamper',['python3','-c',"import sys;sys.path.insert(0,sys.argv[1]);import prepare;prepare.source('neon')",str(M/'proof')],30)
 return r.returncode!=0 and 'AssertionError'in r.stderr

def both_wrong():
 # Override only the intrinsic definitions included before the independent oracle.
 # Include math.h first so the macro cannot rewrite its function declarations.
 s=(ROOT/'proof/native/driver.c').read_text();assert s.count('#include "repaired.c"')==1
 prefix='#include <math.h>\n#define fmaf(a,b,c) 0.0f\n#include '+json.dumps(str(ROOT/'proof/native/repaired.c'))+'\n#undef fmaf'
 f=O/'BothWrong.c';f.write_text(s.replace('#include "repaired.c"',prefix));exe=O/'both-wrong'
 r=run('both-wrong-build',['gcc','-std=c11','-O1','-frounding-math','-ffp-contract=off','-fno-builtin-fmaf','-fsanitize=address,undefined',str(f),'-lm','-o',str(exe)]);assert r.returncode==0
 r=run('both-wrong',[str(exe)],limit_virtual=False);return r.returncode==21 and 'expected='in r.stdout
with concurrent.futures.ThreadPoolExecutor(max_workers=32)as pool:
 fut={n:pool.submit(f)for n,f in [('false_goal_rejected',false_goal),('source_tamper_rejected',tamper),('both_ISAs_zero_FMA_rejected_by_independent_oracle',both_wrong)]};results={n:f.result()for n,f in fut.items()}
unchanged=all(sha(ROOT/p)==h for p,h in before.items());out={'passed':all(results.values())and unchanged,'configured_jobs':32,'independent_controls':3,**results,'live_inputs_unchanged':unchanged,'input_sha256':before,'records':records};(O/'result.json').write_text(json.dumps(out,indent=2)+'\n');print({k:v for k,v in out.items()if k not in ['input_sha256','records']});raise SystemExit(not out['passed'])
