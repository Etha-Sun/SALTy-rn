#!/usr/bin/env python3
"""Finite actual-source replay, scalar IEEE-expression/tree oracle, no proof credit."""
from pathlib import Path
import hashlib,json,os,re,shlex,shutil,subprocess,tempfile,time
C=Path(__file__).resolve().parents[1];R=C.parents[3];sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def main():
 old=C/'proof/public-native-status.json'
 if old.exists():
  h=C/'proof/history';h.mkdir(exist_ok=True);shutil.copy2(old,h/('native-status-'+sha(old)+'.json'))
 run=Path(tempfile.mkdtemp(prefix='native-public-',dir=C/'.build'));records=[];s=dict(passed=False,whole_kernel_verified=False,scope='finite actual two-call public native only; both arrays are NEON-then-RVV final results; oracle is independent; no proof credit',configured_jobs=32,max_live_processes=1,per_process_memory_GiB=16,run_directory=str(run),records=records)
 def execute(label,args,expected=0,bounded=True,seconds=1800):
  cmd=list(map(str,args));cmd=['prlimit','--as=17179869184:17179869184','--',*cmd]if bounded else cmd;log=run/(label+'.log');start=time.monotonic()
  try:
   with log.open('w')as f:r=subprocess.run(cmd,cwd=run,stdout=f,stderr=f,timeout=seconds).returncode
  except subprocess.TimeoutExpired:r=124
  records.append(dict(label=label,command=cmd,exit_code=r,expected_exit_code=expected,seconds=time.monotonic()-start,timeout_seconds=seconds,log_sha256=sha(log)));(run/'status.json').write_text(json.dumps(s,indent=2)+'\n');assert r==expected,(label,log.read_text()[-3000:]);print(label,r,flush=True);return log.read_text()
 try:
  assert not json.loads((R/'.build/memory/quota/state.json').read_text())['wind_down_requested']
  harness=C/'shim/runtime/public_harness.c';deps=execute('dependencies',['gcc-12','-std=c11','-MM',harness]).replace('\\\n',' ');inventory={}
  for name in shlex.split(deps.split(':',1)[1]):
   p=Path(name).resolve();assert p.is_relative_to(C);inventory[str(p.relative_to(C))]=sha(p)
  for p in [Path(__file__),C/'proof/repair.json',C/'proof/repair.patch',C/'proof/originals.json',C/'proof/literal-conversion.json']:inventory[str(p.relative_to(C))]=sha(p)
  for name in inventory:
   p=run/'input-source-snapshot'/name;p.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(C/name,p)
  s.update(input_sha256=inventory,system_headers_in_inventory=False,compiler_version=execute('compiler-version',['gcc-12','--version']).splitlines()[0])
  launch="import pathlib,subprocess,json,sys;p=pathlib.Path('/proc/self/cgroup').read_text().strip().split('::',1)[1];d=pathlib.Path('/sys/fs/cgroup')/p.lstrip('/');m=(d/'memory.max').read_text().strip();s=(d/'memory.swap.max').read_text().strip();assert m=='17179869184'and s=='0';print(json.dumps({'actual_memory_max':m,'actual_memory_swap_max':s}),flush=True);sys.exit(subprocess.run(sys.argv[1:]).returncode)"
  for mode in ['undefined','address']:
   binary=run/mode;flags=['gcc-12','-std=c11','-O1','-g','-frounding-math','-ffp-contract=off','-fno-fast-math','-fno-pie','-no-pie','-fsanitize='+mode,'-fno-sanitize-recover=all','-Wall','-Wextra','-Werror','-Wno-unused-parameter','-Wno-unused-function']
   execute(mode+'-compile',[*flags,harness,'-lm','-o',binary])
   cmd=[binary]if mode=='undefined'else['systemd-run','--user','--wait','--pipe','--quiet','-p','MemoryMax=17179869184','-p','MemorySwapMax=0','python3','-c',launch,binary]
   out=execute(mode+'-run',cmd,bounded=mode=='undefined');assert all(x not in out for x in ['runtime error:','ERROR: AddressSanitizer','ERROR: LeakSanitizer']);m=re.search(r'cases=(\d+) lanes_per_pair_result=(\d+) original_sum_mismatches=(\d+) repaired_oracle_mismatches=0',out);assert m and int(m[3])>0;s[mode+'_counts']=dict(cases=int(m[1]),lanes_per_pair_result=int(m[2]),public_pair_invocations=2*int(m[1]),original_sum_mismatches=int(m[3]))
   out=execute(mode+'-common-wrong',[*cmd,'wrong'],expected=2,bounded=mode=='undefined');assert all(x not in out for x in ['runtime error:','ERROR: AddressSanitizer','ERROR: LeakSanitizer']);assert 'public_return=1,1' in out;m=re.search(r'independent oracle rejected .*first_final=(\w+) second_final=(\w+) oracle=(\w+)',out);assert m and m[1]==m[2]and m[1]!=m[3];s[mode+'_negative_control']=dict(first_final=m[1],second_final=m[2],oracle=m[3],exit_code=2,both_public_returns=1)
  assert inventory=={name:sha(C/name)for name in inventory},'current native input drift'
  s.update(passed=True,common_wrong_negative_control_rejected=True,covered='n1..129, full-bit special/random and finite FP32, two legal original VL choices, arbitrary inactive poison representative, max/input RO alias and sum/output repeated-write alias, padding/canary, NULL params',observation='numeric-or-bothNaN for final floating outputs and sum; no FP flags',independent_oracle='scalar fmaf/sub/mul/bit operations, explicit four-accumulator pairwise then 2+1 tail tree; vector APIs and VL not used',formal_C_fields=0)
 except Exception as e:s['error']=str(e);print(e,flush=True)
 (run/'status.json').write_text(json.dumps(s,indent=2)+'\n');(C/'proof/public-native-status.json').write_bytes((run/'status.json').read_bytes());print(run,flush=True);return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
