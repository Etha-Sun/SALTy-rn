from pathlib import Path
import subprocess,time,sys,json
H=Path(__file__).resolve().parent;R=H.parents[2]
# Wait for the sole serial first-round queue, never overlap solver runs.
finish=H/'qd8-f32-qc4w-gemm-minmax-r1/logs/full01-launch-execution.json'
start=time.monotonic()
while not finish.exists():
 if time.monotonic()-start>600:raise SystemExit('first queue did not finish within wait bound')
 time.sleep(5)
commands=[
 [sys.executable,str(H/'run-refinement.py'),'diagnostic','f32-gemm-minmax-r3','f32-igemm-minmax-r3'],
 [sys.executable,str(H/'run-qc4-components.py')],
 [sys.executable,str(H/'run-refinement.py'),'full','f32-gemm-minmax-r3'],
]
for i,cmd in enumerate(commands):
 with (H/f'queue-refined-{i}.log').open('x') as out:p=subprocess.run(cmd,cwd=R,stdout=out,stderr=subprocess.STDOUT)
 (H/f'queue-refined-{i}.json').write_text(json.dumps({'command':cmd,'exit':p.returncode})+'\n');print(i,p.returncode,flush=True)
