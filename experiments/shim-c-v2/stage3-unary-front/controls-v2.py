from pathlib import Path
import json,subprocess,os,signal,time,hashlib
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2]
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
lock=json.loads((HERE/'float_model_lock.json').read_text())
base=[str(HERE/'frama-c.py'),'-machdep','gcc_x86_64','-wp','-wp-rte','-warn-special-float','none','-wp-share',str(ROOT/lock['share']),'-wp-why3-config',str(ROOT/lock['why3_config']),'-wp-no-why3-detect','-wp-prover','z3,cvc5','-wp-par','1','-wp-timeout','10','-wp-cache','none']
rows=[]
for name,model,source in [('unary-raw02','Typed+raw+float',HERE/'controls-v2.c'),('unary-typed02','Typed+float',HERE/'controls-v2.c')]:
 if not source.exists():
  rows.append({'name':name,'status':'source_missing','source':str(source)});continue
 out=HERE/'controls'/name;out.mkdir(parents=True,exist_ok=False)
 cmd=base+['-wp-model',model,'-wp-report-json',str(out/'raw.json'),'-wp-session',str(out/'.build/session'),str(source)]
 record={'name':name,'command':cmd,'cwd':str(ROOT),'model_lock_sha256':sha(HERE/'float_model_lock.json'),'source_sha256':sha(source)}
 (out/'command.json').write_text(json.dumps(record,indent=2)+'\n');t=time.monotonic()
 with (out/'run.log').open('x') as log:
  p=subprocess.Popen(cmd,cwd=ROOT,stdout=log,stderr=subprocess.STDOUT,start_new_session=True,env={**os.environ,'PATH':str(HERE.parent/'handoff-solvers/.build/bin')+':'+os.environ['PATH']})
  try:code=p.wait(timeout=240)
  except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait();code=124
 raw=json.loads((out/'raw.json').read_text()) if (out/'raw.json').exists() else None
 record.update(exit=code,seconds=time.monotonic()-t,raw_total=len(raw) if raw is not None else None,raw_passed=sum(r['passed'] for r in raw) if raw is not None else None,pending=[r for r in raw if not r['passed']] if raw is not None else None)
 (out/'result.json').write_text(json.dumps(record,indent=2)+'\n');rows.append(record);print(name,code,record['raw_passed'],record['raw_total'],flush=True)
(HERE/'control-results-v2.json').write_text(json.dumps(rows,indent=2)+'\n')
