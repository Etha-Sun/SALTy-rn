from pathlib import Path
import subprocess,json,time,hashlib
D=Path(__file__).resolve().parent; R=D.parents[2]; F=R/'experiments/shim-c-v2/stage3-unary-front/frama-c.py'; M=R/'experiments/shim-c-v2/handoff-model-plus/wp-share'; W=R/'experiments/shim-c-v2/handoff-model-front/why3.conf'
s=D/'control.c'; s.write_text(r'''/*@ \wp::strategy Inventory: \prover("z3",10); \wp::proof Inventory: positive,negative; */
/*@ assigns \nothing; ensures positive: \result==x; */
int identity(int x) {return x;}
/*@ assigns \nothing; ensures negative: \result!=x; */
int wrong(int x) {return x;}
''')
for name,opts in [('none',['-wp-prover','none']),('qedfast',['-wp-prover','qed','-wp-no-qed','-wp-no-clean']),('engineoff',['-wp-no-strategy-engine','-wp-prover','qed','-wp-no-qed','-wp-no-clean'])]:
 p=D/name;p.mkdir(exist_ok=True); cmd=[str(F),'-wp','-wp-rte','-wp-model','Typed+raw+float','-wp-share',str(M),'-wp-why3-config',str(W),'-wp-no-why3-detect',*opts,'-wp-par','1','-wp-cache','none','-wp-report-json',str(p/'raw.json'),'-wp-session',str(p/'.build/session'),str(s)]
 (p/'command.json').write_text(json.dumps(cmd,indent=2)+'\n');t=time.monotonic()
 with (p/'run.log').open('w') as f:
  try:r=subprocess.run(cmd,cwd=R,stdout=f,stderr=subprocess.STDOUT,timeout=30);code=r.returncode
  except subprocess.TimeoutExpired:code=124
 data={'exit':code,'seconds':time.monotonic()-t,'raw_exists':(p/'raw.json').exists()};(p/'result.json').write_text(json.dumps(data,indent=2)+'\n');print(name,data,flush=True)
