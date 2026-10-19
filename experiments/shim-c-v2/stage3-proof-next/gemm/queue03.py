from pathlib import Path
import json,time,subprocess,sys
H=Path(__file__).resolve().parent;p=H/'candidate03/logs/control01/result.json';start=time.monotonic()
while not p.exists():
 if time.monotonic()-start>120:raise SystemExit('control wait exceeded')
 time.sleep(2)
assert json.loads(p.read_text()).get('control_accepted')
raise SystemExit(subprocess.call([sys.executable,str(H/'run.py'),'candidate03','selected01','selected','600']))
