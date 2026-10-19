"""Independent fixed Typed+float bridge controls; root executes solvers."""
from pathlib import Path
import os,sys,json,hashlib,subprocess,signal,time
R=Path('/srv/home/yuechunsun/tools/lean/build/shim-c'); H=Path(__file__).resolve().parent; B=R/'experiments/shim-c-v2'
o=H/sys.argv[1];o.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
lock=B/'handoff-model-plus/float_model_lock.json';locked=json.loads(lock.read_text())['files']
extra=[H/'controls.c',H/'run.py',lock,B/'handoff-model-plus/frama-c.py',B/'stage3-inventory-research/.build/observer.cmxs']
inputs={str(p):sha(p) for p in extra};inputs.update({str(Path(n) if Path(n).is_absolute() else R/n):v for n,v in locked.items()})
def changed():return [n for n,v in inputs.items() if sha(Path(n))!=v]
assert not changed(),'Frozen input mismatch'
(o/'inputs-sha256.json').write_text(json.dumps(inputs,indent=2)+'\n')
source=o/'controls.c';source.write_bytes((H/'controls.c').read_bytes());inputs[str(source)]=sha(source)
cmd=[str(B/'handoff-model-plus/frama-c.py'),'-load-module',str(B/'stage3-inventory-research/.build/observer.cmxs'),'-machdep','gcc_x86_64','-wp','-wp-rte','-wp-par','1','-wp-timeout','20','-wp-memlimit','2048','-wp-cache','none','-wp-model','Typed+float','-wp-share',str(B/'handoff-model-plus/wp-share'),'-wp-why3-config',str(B/'handoff-model-front/why3.conf'),'-wp-no-why3-detect','-wp-prover','z3,cvc5','-wp-print','-wp-report-json',str(o/'raw.json'),'-wp-session',str(o/'session'),str(source)]
(o/'command.json').write_text(json.dumps({'command':cmd,'cwd':str(o),'budget':180,'model':'Typed+float','scope':'All functions and all body obligations of the standalone source, including false postconditions.'},indent=2)+'\n')
t=time.monotonic()
with (o/'run.log').open('x') as f:
 p=subprocess.Popen(cmd,cwd=o,stdout=f,stderr=subprocess.STDOUT,start_new_session=True,env=os.environ|{'WP_OBSERVER_JSONL':str(o/'events.jsonl'),'PATH':str(B/'handoff-solvers/.build/bin')+':'+os.environ['PATH']})
 try:rc=p.wait(timeout=180)
 except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait();rc=124
rows=json.loads((o/'raw.json').read_text()) if (o/'raw.json').exists() else None
result={'exit':rc,'seconds':time.monotonic()-t,'input_changes':changed(),'raw_total':len(rows) if rows is not None else None,'raw_passed':sum(bool(x['passed']) for x in rows) if rows is not None else None,'strict_kernel_accepted':False,'note':'Inspect every named positive and deliberately_false post separately; a failed bridge control is a model proof gap, not a kernel counterexample.'}
(o/'result.json').write_text(json.dumps(result,indent=2)+'\n');print(result)
