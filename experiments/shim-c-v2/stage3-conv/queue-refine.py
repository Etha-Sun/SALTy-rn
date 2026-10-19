from pathlib import Path
import subprocess,time,sys
here=Path(__file__).resolve().parent;deadline=time.monotonic()+2400
while not (here/'revision3/f32-conv-hwc2chw/logs/full03-result.json').exists():
 if time.monotonic()>deadline:raise SystemExit('Prior serialized full run not complete; no overlapping run started')
 time.sleep(5)
for name,mode,props in [('control05','control',''),('selected05','selected','stage3_vl,stage3_weight_block,stage3_store_range')]:
 cmd=[sys.executable,str(here/'run-case.py'),'revision5/f32-dwconv-minmax',name,mode,'--budget','180','--properties',props]
 p=subprocess.run(cmd,cwd=here.parents[2])
 if p.returncode:raise SystemExit('Stopped after failed control/orchestration')
