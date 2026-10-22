#!/usr/bin/env python3
import hashlib,json,subprocess,re
from pathlib import Path
HERE=Path(__file__).resolve().parent
SHARED=HERE.parents[1]/'shared/vadd'
CFG=Path('/zp_vegeta/scratch_sb/ycsun/verus/research/qcp-shim-vadd/results/coq-flags.json')
config=json.loads(CFG.read_text())
records=[]
for name in ['VaddBits.v','intrinsics_goal.v','intrinsics_checked.v','float_array_strategy_goal.v','float_array_strategy_proof.v','array_read_goal.v','array_read_checked.v']:
 path=SHARED/name
 cmd=['qcp-env','coqc',*config['flags'][2:],'-Q',str(SHARED),'QcpVadd',str(path)]
 result=subprocess.run(cmd,cwd=config['cwd'],capture_output=True,text=True,timeout=180)
 log=HERE/(name+'.log');log.write_text(result.stdout+result.stderr)
 records.append({'file':str(path),'sha256':hashlib.sha256(path.read_bytes()).hexdigest(),'command':cmd,'exit_code':result.returncode,'log':str(log)})
 print(name,result.returncode,(result.stdout+result.stderr)[-300:])
 if result.returncode: break
(HERE/'coqc-result.json').write_text(json.dumps(records,indent=2)+'\n')
raise SystemExit(records[-1]['exit_code'])
