#!/usr/bin/env python3
"""Run real original C kernels with independently distinct ISA native models.
Finite emulation evidence only; not a physical ISA or a formal kernel proof.
"""
from pathlib import Path
import json,hashlib,tempfile,subprocess,time
C=Path(__file__).resolve().parent.parent;sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 run=Path(tempfile.mkdtemp(prefix='original-counterexamples-',dir=C/'.build'));records=[];inputs={str(p.relative_to(C)):sha(p)for p in [C/'proof/native/isa_arrays.h',C/'proof/native/counterexamples.c',C/'proof/native/frama-repaired-rvv.c',C/'proof/original/testNEON.c',C/'proof/original/testRVV.c',C/'shim/qm_scale_is_nan.c',C/'shim/scalar_nan.h']};passed=True
 for label,cmd in [('compile',['gcc','-std=c11','-O1','-g','-frounding-math','-ffp-contract=off','-fsanitize=undefined','-fno-sanitize-recover=all',str(C/'proof/native/counterexamples.c'),'-lm','-o',str(run/'counterexamples')]),('run',[str(run/'counterexamples')])]:
  cmd=['prlimit','--as=17179869184:17179869184','--',*cmd];log=run/(label+'.log');start=time.monotonic()
  with log.open('w')as f:code=subprocess.run(cmd,cwd=run,stdout=f,stderr=f,timeout=7200).returncode
  records.append(dict(label=label,command=cmd,exit_code=code,seconds=time.monotonic()-start,log_sha256=sha(log)));print(label,code,flush=True)
  if code:passed=False;print(log.read_text()[-2500:]);break
 output=(run/'run.log').read_text()if(run/'run.log').exists()else'';passed=passed and'counterexamples=3'in output and inputs=={n:sha(C/n)for n in inputs}
 s=dict(passed=passed,whole_kernel_verified=False,scope='Three finite real C counterexamples in separate Arm-preserving/RVV-canonical NaN emulation; no ISA execution or proof',run_directory=str(run),input_sha256=inputs,records=records,finite_magic_bias_difference_reproduced=passed,frama_repair_still_differs_on_negative_NaN=passed)
 (run/'status.json').write_text(json.dumps(s,indent=2)+'\n');dest=C/'proof/original-counterexamples.json'
 if dest.exists():(C/'proof/history'/('original-counterexamples-'+sha(dest)+'.json')).write_bytes(dest.read_bytes())
 dest.write_bytes((run/'status.json').read_bytes());print(output);return 0 if passed else 1
if __name__=='__main__':raise SystemExit(main())
