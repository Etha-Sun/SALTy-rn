"""Compile selected new proof modules against the recorded fresh NEON goal."""
from pathlib import Path
import json
import shutil
import subprocess
import sys
import hashlib
import time
HERE=Path(__file__).resolve().parent
QCP=HERE.parents[1]
WORKSPACE=HERE.parents[5]

def compile_files(names):
    out=Path(json.loads((HERE/'neon-status.json').read_text())['run_directory'])
    config=json.loads((WORKSPACE/'research/qcp-shim-vadd/results/coq-flags.json').read_text())
    flags=config['flags'][2:]
    for directory,namespace in [(QCP/'shared/vadd','QcpVadd'),(HERE.parent/'vadd-neon/proofs','QcpNeon'),
          (HERE.parent/'vadd-neon-loop/proofs','QcpNeonLoop'),(HERE.parent/'vadd-relations',''),
          (HERE.parent/'vadd-rvv','QcpRvv32'),(out,'ByValue')]:
        flags+=['-Q',str(directory),namespace]
    records=[]
    for name in names:
        target=out/name
        if (HERE/name).exists():shutil.copyfile(HERE/name,target)
        command=['qcp-env','coqc',*flags,str(target)]
        started=time.monotonic()
        result=subprocess.run(command,cwd=config['cwd'],capture_output=True,text=True,timeout=90)
        (out/(target.stem+'-coqc.log')).write_text(result.stdout+result.stderr)
        records.append({'file':name,'source_sha256':hashlib.sha256(target.read_bytes()).hexdigest(),'command':command,'exit_code':result.returncode,'elapsed_seconds':time.monotonic()-started})
        (HERE/'compile-status.json').write_text(json.dumps({'goal_sha256':hashlib.sha256((out/'neon_unit_goal.v').read_bytes()).hexdigest(),'run_directory':str(out),'records':records},indent=2)+'\n')
        print(name,result.returncode,(result.stdout+result.stderr)[-2000:],flush=True)
        if result.returncode:raise SystemExit(result.returncode)

if __name__=='__main__':compile_files(sys.argv[1:])
