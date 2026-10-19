from pathlib import Path
import os,json,subprocess,signal,time,hashlib
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[3];ENV=ROOT/'experiments/shim-c-v2/stage3-unary-front'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
lock=json.loads((ENV/'float_model_lock.json').read_text())
for name,model in [('raw01','Typed+raw+float'),('typed01','Typed+float')]:
 out=HERE/name;out.mkdir(exist_ok=False)
 cmd=[str(ENV/'frama-c.py'),'-machdep','gcc_x86_64','-wp','-wp-rte','-wp-model',model,'-warn-special-float','none','-wp-share',str(ROOT/lock['share']),'-wp-why3-config',str(ROOT/lock['why3_config']),'-wp-no-why3-detect','-wp-prover','z3,cvc5','-wp-par','1','-wp-timeout','5','-wp-cache','none','-wp-report-json',str(out/'raw.json'),'-wp-session',str(out/'.build/session'),str(HERE/'control.c')]
 record={'command':cmd,'cwd':str(ROOT),'source_sha256':sha(HERE/'control.c'),'model_lock_sha256':sha(ENV/'float_model_lock.json'),'budget':120}
 (out/'command.json').write_text(json.dumps(record,indent=2)+'\n');t=time.monotonic()
 with (out/'run.log').open('x') as f:
  p=subprocess.Popen(cmd,cwd=ROOT,stdout=f,stderr=subprocess.STDOUT,start_new_session=True,env={**os.environ,'PATH':str(ENV.parent/'handoff-solvers/.build/bin')+':'+os.environ['PATH']})
  try:code=p.wait(timeout=120)
  except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait();code=124
 raw=json.loads((out/'raw.json').read_text()) if (out/'raw.json').exists() else None
 record.update(exit=code,seconds=time.monotonic()-t,raw_passed=sum(r['passed'] for r in raw) if raw is not None else None,raw_total=len(raw) if raw is not None else None)
 (out/'result.json').write_text(json.dumps(record,indent=2)+'\n');print(name,record['raw_passed'],record['raw_total'],flush=True)
