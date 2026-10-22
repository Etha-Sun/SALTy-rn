#!/usr/bin/env python3
import json,subprocess,sys
from pathlib import Path
HERE=Path(__file__).resolve().parent
QCP=HERE.parents[1]
CFG=Path('/zp_vegeta/scratch_sb/ycsun/verus/research/qcp-shim-vadd/results/coq-flags.json')
config=json.loads(CFG.read_text())
for name in sys.argv[1:] or ['NeonBridge.v']:
 cmd=['qcp-env','coqc',*config['flags'][2:],'-Q',str(QCP/'shared/vadd'),'QcpVadd','-Q',str(HERE/'proofs'),'QcpNeon',str(HERE/'proofs'/name)]
 r=subprocess.run(cmd,cwd=config['cwd'],capture_output=True,text=True,timeout=120)
 (HERE/'results'/(name+'.log')).write_text(r.stdout+r.stderr)
 print(name,r.returncode,(r.stdout+r.stderr)[-3000:])
 if r.returncode:raise SystemExit(r.returncode)
