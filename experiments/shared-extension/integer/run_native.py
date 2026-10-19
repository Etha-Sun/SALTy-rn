#!/usr/bin/env python3
"""Compile actual kernels with the frozen shared C bodies; record finite tests."""
from pathlib import Path
import subprocess,json,hashlib,os
b=Path(__file__).resolve().parent
results={}
for d in sorted(b.iterdir()):
 if not (d/'native.c').exists():continue
 binary=Path('/tmp')/('integer-extension-'+d.name)
 cmd=['cc','-std=c11','-O1','-g','-I'+str(b/'shared'),'-fsanitize=address,undefined','-fno-omit-frame-pointer','-ffp-contract=off',str(d/'native.c'),'-lm','-o',str(binary)]
 compile_run=subprocess.run(cmd,text=True,capture_output=True)
 if compile_run.returncode:raise RuntimeError(compile_run.stderr)
 env=os.environ.copy();env['ASAN_OPTIONS']='detect_leaks=0'
 run=subprocess.run([str(binary)],text=True,capture_output=True,env=env)
 (d/'native-final.log').write_text(run.stdout+run.stderr)
 files=[d/'neon.c',d/'rvv.c',d/'spec.h',d/'harness.c',d/'unit.c',d/'native.c',b/'shared/shim.h',b/'shared'/('integer-'+d.name+'.c')]
 hashes={str(p.relative_to(b)):hashlib.sha256(p.read_bytes()).hexdigest() for p in files}
 results[d.name]={'exit':run.returncode,'stdout':run.stdout,'stderr':run.stderr,'command':cmd,'hashes':hashes,'finite_only':True,'rounding':'FE_TONEAREST','vlen':128}
 print(d.name,run.returncode,run.stdout,flush=True)
(b/'native-results.json').write_text(json.dumps(results,indent=2)+'\n')
