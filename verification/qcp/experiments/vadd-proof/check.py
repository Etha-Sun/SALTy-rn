#!/usr/bin/env python3
import hashlib,json,subprocess,re,sys
from pathlib import Path
HERE=Path(__file__).resolve().parent
SHARED=HERE.parents[1]/'shared/vadd'
sys.path.insert(0, str(HERE.parents[1] / 'tools'))
from environment import load_environment
ENV = load_environment()
config=ENV
records=[]
for name in ['VaddBits.v','intrinsics_goal.v','intrinsics_checked.v','float_array_strategy_goal.v','float_array_strategy_proof.v','array_read_goal.v','array_read_checked.v']:
 path=SHARED/name
 cmd=[ENV['coqc'],*config['flags'],'-Q',str(SHARED),'QcpVadd',str(path)]
 result=subprocess.run(cmd,cwd=config['cwd'],capture_output=True,text=True,timeout=180)
 log=HERE/(name+'.log');log.write_text(result.stdout+result.stderr)
 records.append({'file':str(path),'sha256':hashlib.sha256(path.read_bytes()).hexdigest(),'command':cmd,'exit_code':result.returncode,'log':str(log)})
 print(name,result.returncode,(result.stdout+result.stderr)[-300:])
 if result.returncode: break
(HERE/'coqc-result.json').write_text(json.dumps(records,indent=2)+'\n')
raise SystemExit(records[-1]['exit_code'])
