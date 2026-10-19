from pathlib import Path
import subprocess,time,json,sys
here=Path(__file__).resolve().parent
# The first complete attempt is already running; never overlap solver runs.
end=time.monotonic()+240
while not (here/'f32-maxpool/logs/full-01-summary.json').exists():
 if time.monotonic()>end:raise SystemExit('first complete attempt has no summary; inspect before proceeding')
 time.sleep(1)
for kernel,mode in [('f32-argmaxpool','diagnostic'),('f32-argmaxpool','full'),('f32-spmm-minmax','diagnostic'),('f32-spmm-minmax','full'),('f32-maxpool-step-v3','diagnostic'),('f32-maxpool-step-v3','full')]:
 print('START',kernel,mode,flush=True)
 with (here/kernel/(mode+'-01-driver.log')).open('x') as log:
  p=subprocess.run([sys.executable,str(here/'run.py'),kernel,mode],cwd=here.parents[2],stdout=log,stderr=subprocess.STDOUT)
 print('END',kernel,mode,p.returncode,flush=True)
 if p.returncode and not (mode=='full' and (here/kernel/'logs/full-01-summary.json').exists()):raise SystemExit('driver error; inspect retained log')
