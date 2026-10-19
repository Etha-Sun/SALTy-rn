from pathlib import Path
import subprocess,time,sys,json
H=Path(__file__).resolve().parent;R=H.parents[2]
finish=H/'queue-refined-2.json';start=time.monotonic()
while not finish.exists():
 if time.monotonic()-start>2200:raise SystemExit('previous serial queue wait bound exceeded')
 time.sleep(5)
cmd=[sys.executable,str(H/'run-r4.py'),'diagnostic','f32-gemm-minmax-r4','f32-igemm-minmax-r4']
with (H/'queue-fma.log').open('x') as out:p=subprocess.run(cmd,cwd=R,stdout=out,stderr=subprocess.STDOUT)
(H/'queue-fma.json').write_text(json.dumps({'command':cmd,'exit':p.returncode})+'\n')
