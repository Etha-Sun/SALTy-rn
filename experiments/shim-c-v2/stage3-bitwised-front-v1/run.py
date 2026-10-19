"""Finite independent tool controls and QD8 replay; never whole-kernel acceptance."""
from pathlib import Path
import sys,json,hashlib,subprocess,os,signal,time
H=Path(__file__).resolve().parent;B=H.parent;R=B.parent.parent;run,mode=sys.argv[1:3];budget=int(sys.argv[3]);L=H/'runs'/run;L.mkdir(parents=True,exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();lock=H/'experimental-inputs01.json';watch=json.loads(lock.read_text())['files'];assert all(sha(Path(p))==s for p,s in watch.items());watch[str(lock)]=sha(lock)
if mode=='qd8':
 sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
 case=B/'stage3-proof-next/spmm/qd8-round-r4';d,g=checker.prepare(case,sha(case/'frozen.json'),'bitwised-'+run);assert g['passed'];a=Path(g['annotated']);source=a/'unit.c';(L/'guard.json').write_text(json.dumps(g,indent=2)+'\n');extra=['-inline-calls','test_neon,test_rvv','-inline-stmt-contracts','-remove-inlined','test_neon,test_rvv','-wp-fct','qd8_clear_low'];drivers=str(a/d['driver'])+','+str(B/'model-fma/fma.driver');watch.update({str(a/n):s for n,s in g['generated'].items()})
else:
 a=H;source=H/'controls.c';extra=[];drivers=str(B/'model-fma/fma.driver')
cmd=[str(H/'.build/install/bin/frama-c'),'-load-module',str(B/'stage3-inventory-research/.build/observer.cmxs'),'-machdep','gcc_x86_64','-wp','-wp-rte','-wp-debug','1','-wp-msg-key','script:allgoals,strategy','-wp-par','1','-wp-timeout','30','-wp-memlimit','2048','-wp-cache','none','-wp-model','Typed+float','-warn-special-float','none','-wp-share',str(B/'handoff-model-plus/wp-share'),'-wp-why3-config',str(B/'handoff-model-front/why3.conf'),'-wp-no-why3-detect','-wp-prover','tip,z3,cvc5','-wp-driver',drivers,'-cpp-command','gcc -E -C -I'+str(B/'model-plus/libc')+' -I.','-cpp-frama-c-compliant','-wp-report-json',str(L/'raw.json'),'-wp-session',str(L/'.build/session'),*extra,str(source)]
meta={'command':cmd,'cwd':str(a),'budget':budget,'qualification':False,'snapshot_sha256':sha(lock)};(L/'command.json').write_text(json.dumps(meta,indent=2)+'\n');t=time.monotonic()
with (L/'run.log').open('x') as out:
 p=subprocess.Popen(cmd,cwd=a,stdout=out,stderr=subprocess.STDOUT,start_new_session=True,env=os.environ|{'OCAMLPATH':str(H/'.build/install/lib'),'WP_OBSERVER_JSONL':str(L/'events.jsonl'),'PATH':str(B/'handoff-solvers/.build/bin')+':'+os.environ['PATH']})
 try:code=p.wait(timeout=budget)
 except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait();code=124
raw=json.loads((L/'raw.json').read_text()) if (L/'raw.json').exists() else None;meta.update(exit=code,seconds=time.monotonic()-t,raw_total=len(raw) if raw is not None else None,raw_passed=sum(bool(x['passed']) for x in raw) if raw is not None else None,inputs_unchanged=all(sha(Path(p))==s for p,s in watch.items()),pending=[x for x in raw if not x['passed']] if raw is not None else None)
(L/'result.json').write_text(json.dumps(meta,indent=2)+'\n');print({k:meta[k] for k in ['exit','seconds','raw_total','raw_passed','inputs_unchanged']},flush=True)
