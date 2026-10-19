from pathlib import Path
import subprocess,time,sys
here=Path(__file__).resolve().parent
end=time.monotonic()+600
while not (here/'f32-maxpool-step-v3/logs/diagnostic-01-exit.json').exists():
 if time.monotonic()>end:raise SystemExit('previous queue incomplete; inspect before proceeding')
 time.sleep(1)
for kernel,mode in [('f32-spmm-frame-v2','diagnostic'),('f32-spmm-frame-v2','full'),('f32-argmaxpool-typed-v2','diagnostic'),('f32-argmaxpool-typed-v2','full')]:
 print('START',kernel,mode,flush=True)
 with (here/kernel/(mode+'-01-driver.log')).open('x') as log:
  p=subprocess.run([sys.executable,str(here/'run.py'),kernel,mode],cwd=here.parents[2],stdout=log,stderr=subprocess.STDOUT)
 print('END',kernel,mode,p.returncode,flush=True)
 if p.returncode and not (mode=='full' and (here/kernel/'logs/full-01-summary.json').exists()):raise SystemExit('driver error; inspect retained log')
