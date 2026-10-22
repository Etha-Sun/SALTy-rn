import hashlib,json,subprocess,sys
from pathlib import Path
HERE=Path(__file__).resolve().parent
QCP=HERE.parents[1]
cfg=json.loads(Path('/zp_vegeta/scratch_sb/ycsun/verus/research/qcp-shim-vadd/results/coq-flags.json').read_text())
records=[]
for name in sys.argv[1:] or ['NeonLoopBridge.v','neon_tail_strategy_goal.v','neon_tail_strategy_proof.v']:
 cmd=['qcp-env','coqc',*cfg['flags'][2:],'-Q',str(QCP/'shared/vadd'),'QcpVadd','-Q',str(HERE.parent/'vadd-neon/proofs'),'QcpNeon','-Q',str(HERE/'proofs'),'QcpNeonLoop',str(HERE/'proofs'/name)]
 r=subprocess.run(cmd,cwd=cfg['cwd'],text=True,capture_output=True,timeout=120)
 (HERE/'results'/(name+'.log')).write_text(r.stdout+r.stderr)
 records.append({'file':name,'sha256':hashlib.sha256((HERE/'proofs'/name).read_bytes()).hexdigest(),'command':cmd,'exit_code':r.returncode,'log':'results/'+name+'.log'})
 (HERE/'coqc-result.json').write_text(json.dumps(records,indent=2)+'\n')
 print(name,r.returncode,(r.stdout+r.stderr)[-500:])
 if r.returncode:raise SystemExit(r.returncode)
