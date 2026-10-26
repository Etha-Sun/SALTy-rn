#!/usr/bin/env python3
"""Exact original/patch replay and compiler bit probe, no Coq proof credit."""
from pathlib import Path
from fractions import Fraction
import hashlib,json,subprocess,tempfile,time,shutil
C=Path(__file__).resolve().parents[1];sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def main():
 run=Path(tempfile.mkdtemp(prefix='repair-check-',dir=C/'.build'));s=dict(passed=False,whole_kernel_verified=False,scope='zero-fuzz repair replay and exact-rational/compiler literal identity only',run_directory=str(run),records=[])
 def call(label,args,seconds=300):
  cmd=['prlimit','--as=17179869184:17179869184','--',*map(str,args)];log=run/(label+'.log');start=time.monotonic()
  with log.open('w')as f:r=subprocess.run(cmd,cwd=run,stdout=f,stderr=f,timeout=seconds).returncode
  s['records'].append(dict(label=label,command=cmd,exit_code=r,seconds=time.monotonic()-start,log_sha256=sha(log),memory_GiB=16,timeout_seconds=seconds));assert r==0,(label,log.read_text());return log.read_text()
 try:
  originals=json.loads((C/'proof/originals.json').read_text());(run/'impl').mkdir()
  for isa,row in originals['implementations'].items():
   original=C/row['archived_source'];current=C/row['current_implementation'];assert sha(original)==row['sha256']and sha(current)==row['current_sha256'];shutil.copy2(original,run/row['current_implementation'])
  call('patch',['patch','--batch','--fuzz=0','-p1','-i',C/'proof/repair.patch'])
  assert all(sha(run/row['current_implementation'])==row['current_sha256']for row in originals['implementations'].values())
  constants=json.loads((C/'proof/literal-conversion.json').read_text())['constants']
  for row in constants.values():assert Fraction(row['decimal_literal'][:-1])==Fraction(row['exact_numerator'],row['exact_denominator'])
  call('literal-compile',['gcc','-std=c11','-O1',C/'shim/runtime/literal_probe.c','-o',run/'literals'])
  literal=call('literal-run',[run/'literals'],60);assert literal.count('literal[')==9
  s.update(passed=True,exact_patch_replay=True,exact_rational_literals=9,compiler_bit_identity_literals=9,ordinary_Coq_literal_bridge_passed=False,source_sha256={str(p.relative_to(C)):sha(p)for p in[C/'proof/originals.json',C/'proof/repair.patch',C/'proof/literal-conversion.json',C/'impl/testNEON.c',C/'impl/testRVV.c',C/'shim/runtime/literal_probe.c']})
 except Exception as e:s['error']=str(e)
 (run/'status.json').write_text(json.dumps(s,indent=2)+'\n');(C/'proof/repair-check-status.json').write_bytes((run/'status.json').read_bytes());print(json.dumps(s,indent=2));return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
