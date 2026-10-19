from pathlib import Path
import time,subprocess,sys,json
H=Path(__file__).resolve().parent;R=H.parents[2];start=time.monotonic()
while not (H/'qd8-f32-qc4w-gemm-minmax-r3/logs/components02-execution.json').exists():
 if time.monotonic()-start>200:raise SystemExit('previous run wait exceeded')
 time.sleep(2)
for mode in ['lemmas','components']:
 cmd=[sys.executable,str(H/f'run-qc4-{mode}-r4.py')]
 with (H/f'queue-qshift-{mode}.log').open('x') as f:p=subprocess.run(cmd,cwd=R,stdout=f,stderr=subprocess.STDOUT)
 (H/f'queue-qshift-{mode}.json').write_text(json.dumps({'command':cmd,'exit':p.returncode})+'\n')
