"""Run an isolated native SMT semantic fragment; never installs a model."""
from pathlib import Path
import json,hashlib,subprocess,sys,time
H=Path(__file__).resolve().parent
R=H.parents[4]
source=H/sys.argv[1]
out=H/sys.argv[2]
out.mkdir()
binary=(R/'experiments/shim-c-v2/handoff-solvers/.build/bin/z3').resolve()
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
j={'command':[str(binary),'-smt2',str(source)],'solver_sha256':sha(binary),'source_sha256':sha(source),'runner_sha256':sha(Path(__file__)),'scope':'Native SMT fragment, not a Frama-C memory model or kernel proof.'}
(out/'command.json').write_text(json.dumps(j,indent=2)+'\n')
t=time.monotonic()
with (out/'run.log').open('x') as f:
    try: code=subprocess.run(j['command'],stdout=f,stderr=subprocess.STDOUT,timeout=120).returncode
    except subprocess.TimeoutExpired: code=124
j.update(exit=code,seconds=time.monotonic()-t,inputs_unchanged=sha(binary)==j['solver_sha256'] and sha(source)==j['source_sha256'])
(out/'result.json').write_text(json.dumps(j,indent=2)+'\n')
print(code,(out/'run.log').read_text())
