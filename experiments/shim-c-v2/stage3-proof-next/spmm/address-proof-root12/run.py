from pathlib import Path
import sys,os,subprocess,json,hashlib,time,signal
H=Path(__file__).resolve().parent;R=H.parents[4];B=R/'experiments/shim-c-v2';sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();model=B/'handoff-model-plus';lock=model/'float_model_lock.json';d=json.loads(lock.read_text());watch={str(Path(p) if Path(p).is_absolute() else R/p):s for p,s in d['files'].items()};watch[str(lock)]=sha(lock)
for p in [H/'controls.c',Path(__file__),B/'stage3-inventory-research/.build/observer.cmxs']:watch[str(p)]=sha(p)
assert all(sha(Path(p))==s for p,s in watch.items());L=H/sys.argv[1];L.mkdir();budget=360
cmd=[str(model/'frama-c.py'),'-load-module',str(B/'stage3-inventory-research/.build/observer.cmxs'),'-machdep','gcc_x86_64','-wp','-wp-rte','-wp-model','Typed+raw+float','-warn-special-float','none','-wp-share',str(model/'wp-share'),'-wp-why3-config',str(B/'handoff-model-front/why3.conf'),'-wp-no-why3-detect','-wp-prover','z3,cvc5','-wp-par','2','-wp-timeout','30','-wp-memlimit','2048','-wp-cache','none','-wp-print','-wp-session',str(L/'.build/session'),'-wp-report-json',str(L/'raw.json'),str(H/'controls.c')]
meta={'command':cmd,'cwd':str(H),'budget':budget,'inputs_before':watch,'scope':'Independent diagnostic controls; requires belong only to these controls and do not alter kernel/spec. target_uintptr_step is the outstanding ABI bridge, not assumed true in abstract MemAddr.'};(L/'command.json').write_text(json.dumps(meta,indent=2)+'\n');t=time.monotonic()
with (L/'run.log').open('x') as out:
 p=subprocess.Popen(cmd,cwd=H,env=os.environ|{'WP_OBSERVER_JSONL':str(L/'events.jsonl'),'PATH':str(B/'handoff-solvers/.build/bin')+':'+os.environ['PATH']},stdout=out,stderr=subprocess.STDOUT,start_new_session=True)
 try:code=p.wait(timeout=budget)
 except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait();code=124
rows=json.loads((L/'raw.json').read_text()) if (L/'raw.json').exists() else None
meta.update(exit=code,seconds=time.monotonic()-t,raw_total=len(rows) if rows is not None else None,raw_passed=sum(bool(r['passed']) for r in rows) if rows is not None else None,pending=[r for r in rows if not r['passed']] if rows is not None else None,inputs_unchanged=all(sha(Path(p))==s for p,s in watch.items()),whole_kernel_accepted=False)
(L/'result.json').write_text(json.dumps(meta,indent=2)+'\n');print({k:meta[k] for k in ['exit','raw_total','raw_passed','inputs_unchanged']})
