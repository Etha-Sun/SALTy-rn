from pathlib import Path
import json,subprocess,os,time,signal,hashlib
C=Path(__file__).resolve().parent;R=C.parents[4];cmd=json.loads((C/'template-command.json').read_text());sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
B=R/'experiments/shim-c-v2';L=B/'stage3-unary-front/float_model_lock.json';lock=json.loads(L.read_text());watched={C/'controls.c':sha(C/'controls.c'),C/'run.py':sha(C/'run.py'),L:sha(L)};watched.update({Path(n) if Path(n).is_absolute() else R/n:s for n,s in lock['files'].items()});assert all(sha(p)==s for p,s in watched.items());assert not (C/'result.json').exists()
(C/'command.json').write_text(json.dumps({'command':cmd,'cwd':str(C),'budget':240,'watch':{str(p):s for p,s in watched.items()},'scope':'Minimal pointer Pre/explicit-label control; not kernel proof'},indent=2)+'\n');t=time.monotonic()
with (C/'run.log').open('x') as out:
 p=subprocess.Popen(cmd,cwd=C,stdout=out,stderr=subprocess.STDOUT,start_new_session=True,env=os.environ|{'PATH':str(B/'handoff-solvers/.build/bin')+':'+os.environ['PATH'],'WP_OBSERVER_JSONL':str(C/'events.jsonl')})
 try:code=p.wait(timeout=240)
 except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait();code=124
rows=json.loads((C/'raw.json').read_text()) if (C/'raw.json').exists() else None
r=dict(exit=code,seconds=time.monotonic()-t,raw_total=len(rows) if rows is not None else None,raw_passed=sum(x['passed'] for x in rows) if rows is not None else None,pending=[x['property'] for x in rows if not x['passed']] if rows is not None else None,inputs_unchanged=all(sha(p)==s for p,s in watched.items()))
(C/'result.json').write_text(json.dumps(r,indent=2)+'\n');print(r,flush=True)
