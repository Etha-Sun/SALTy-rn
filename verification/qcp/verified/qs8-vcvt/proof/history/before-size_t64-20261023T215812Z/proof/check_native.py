#!/usr/bin/env python3
"""Replay actual scalar-field C helpers/caller against independent 128-bit oracle.
Includes the canonical nested-expression frontend and exact composed frontend.
Finite native evidence supplements the full-domain ordinary Coq proof.
"""
import argparse,hashlib,json,re,shutil,subprocess,tempfile,time
from pathlib import Path
from check_neon_composed import source_guard
CASE=Path(__file__).resolve().parent.parent
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def body_replace(source,name,new):
 m=re.search(r'\b'+name+r'\s*\([^;{}]*\)\s*(?:/\*.*?\*/\s*)?\{',source,re.S)
 if not m:raise ValueError('Missing exact function body '+name)
 start=m.end()-1;depth=1;i=start+1
 while depth:
  if source[i]=='{':depth+=1
  elif source[i]=='}':depth-=1
  i+=1
 return source[:start]+'{'+new+'}'+source[i:]
def main():
 ap=argparse.ArgumentParser(description=__doc__);ap.parse_args();run=Path(tempfile.mkdtemp(prefix='native-formal-',dir=CASE/'.build'));records=[];s=dict(passed=False,scope='finite actual C formal-field closure and public caller; independent oracle; not formal proof',run_directory=str(run),records=records)
 def exe(label,cmd,expected=0):
  cmd=['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)];log=run/(label+'.log');t=time.monotonic()
  with log.open('w')as f:r=subprocess.run(cmd,cwd=run,stdout=f,stderr=f,timeout=1200)
  records.append(dict(label=label,command=cmd,exit_code=r.returncode,expected_exit_code=expected,seconds=time.monotonic()-t,log_sha256=sha(log)))
  if r.returncode!=expected:raise RuntimeError(label+': '+log.read_text()[-2500:])
  print(label,r.returncode,flush=True);return log
 try:
  source_guard();names=['proof/check_native.py','proof/check_neon_composed.py','spec.c','proof/repair.json','proof/semantics.json']+[str(p.relative_to(CASE))for root in ['shim','impl']for p in (CASE/root).rglob('*')if p.is_file()];inputs={n:sha(CASE/n)for n in sorted(set(names))};src=['shim/scalar.c','shim/control.c','shim/neon_load.c','shim/neon_store.c','shim/signed_tail.c','shim/neon_ext.c','shim/rvv_active.c','shim/rvv_load.c','shim/rvv_store.c','shim/neon_composed.c']+[x['source']for x in json.loads((CASE/'proof/neon-arithmetic-units.json').read_text())]+[x['source']for x in json.loads((CASE/'proof/rvv-arithmetic-units.json').read_text())]
  base=['gcc','-std=c11','-O2','-Wall','-Wextra','-fsanitize=undefined','-fno-sanitize-recover=undefined','-I',CASE/'shim'];outputs={}
  for label,extra in [('composed',[]),('canonical-nested',['-DQCV_NESTED_REFERENCE=1'])]:
   binary=run/label;exe(label+'-build',[*base,*extra,CASE/'shim/native_formal.c',*[CASE/x for x in src],'-o',binary]);log=exe(label,[binary]);match=re.search(r'scalar_checks=0 kernel_cases=(\d+) kernel_lanes_per_side=(\d+)',log.read_text())
   if not match or tuple(map(int,match.groups()))!=(27496,1998725):raise ValueError('Unexpected full-caller native coverage')
   outputs[label]=dict(cases=27496,lanes_per_side=1998725,log_sha256=sha(log),binary_sha256=sha(binary))
  bad=(CASE/'shim/scalar.c').read_text();bad=body_replace(bad,'qcp_qcv_neon_qrdmulh','(void)a;(void)b;return 0;');bad=body_replace(bad,'qcp_qcv_rvv_clip15','(void)p;return 0;');(run/'bad-scalar.c').write_text(bad);exe('both-wrong-build',[*base,CASE/'shim/native_formal.c',run/'bad-scalar.c',*[CASE/x for x in src if x!='shim/scalar.c'],'-o',run/'both-wrong']);badlog=exe('both-wrong-rejected',[run/'both-wrong','m'],expected=1)
  if 'mismatch ' not in badlog.read_text():raise ValueError('Oracle negative control rejected for unrelated reason')
  if inputs!={n:sha(CASE/n)for n in inputs}:raise ValueError('Native input drift')
  s.update(passed=True,input_sha256=inputs,variants=outputs,negative_controls=[dict(label='both qrdmulh and RVVclip replaced by zero; comparator agrees but independent oracle rejects',expected_exit_code=1,observed_exit_code=1,log_sha256=sha(badlog))],whole_kernel_verified=False,ubsan=True,independent_oracle='__int128 floor quotient and explicit wrap/saturation; does not call checked scalar helpers',source_composition_guard=source_guard(),historical_exhaustive_scalar_status_sha256=sha(CASE/'proof/native-oracle-status.json'))
 except Exception as e:s['error']=str(e)
 (run/'status.json').write_text(json.dumps(s,indent=2)+'\n');dest=CASE/'proof/native-status.json'
 if dest.exists():old=dest.read_bytes();(CASE/'proof/history'/('native-status-'+hashlib.sha256(old).hexdigest()+'.json')).write_bytes(old)
 dest.write_text(json.dumps(s,indent=2)+'\n');print(json.dumps({k:s.get(k)for k in ['passed','run_directory','error']},indent=2));return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
