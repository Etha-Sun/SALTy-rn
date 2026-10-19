from pathlib import Path
import json,os,subprocess,signal,time,hashlib,sys
C=Path(__file__).resolve().parent;R=C.parents[4];sys.path.insert(0,str(R/'tools'));import shim_c_call_closure
L=C/'inventory-root01';L.mkdir();d=json.loads((C/'logs/caller20-root01-command.json').read_text());cmd=list(d['command']);A=Path(d['cwd']);
for flag in ['-wp-prop','-wp-fct']:
 i=cmd.index(flag);del cmd[i:i+2]
cmd[cmd.index('-wp-prover')+1]='none';cmd[cmd.index('-wp-auto-depth')+1]='0';cmd[cmd.index('-wp-session')+1]=str(L/'.build/session');cmd[cmd.index('-wp-report-json')+1]=str(L/'raw.json');closure=shim_c_call_closure.closure(A/'unit.c',set());cmd+=['-wp-skip-fct',','.join(closure['unreachable_definitions']),'-print','-ocode',str(L/'inlined.c')];(L/'closure.json').write_text(json.dumps(closure,indent=2)+'\n');sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest();g=json.loads((C/'source-guard.json').read_text());watch={str(A/n):s for n,s in g['generated'].items()};watch.update({str(C/'frozen.json'):sha(C/'frozen.json'),str(C/'proof.patch'):sha(C/'proof.patch')});assert all(sha(p)==s for p,s in watch.items());(L/'command.json').write_text(json.dumps({'command':cmd,'cwd':str(A),'inputs_before':watch,'budget':300,'scope':'Full real call closure inventory; prover none'},indent=2)+'\n');t=time.monotonic()
with (L/'run.log').open('x') as out:
 p=subprocess.Popen(cmd,cwd=A,env=os.environ|{'WP_OBSERVER_JSONL':str(L/'events.jsonl')},stdout=out,stderr=subprocess.STDOUT,start_new_session=True)
 try:code=p.wait(timeout=300)
 except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait();code=124
events=[json.loads(x) for x in (L/'events.jsonl').read_text().splitlines()] if (L/'events.jsonl').exists() else [];final=[x for x in events if x['event']=='final'];(L/'inventory.json').write_text(json.dumps(final,indent=2)+'\n');r={'exit':code,'seconds':time.monotonic()-t,'normal_exit':bool(events and events[-1]['event']=='normal_exit'),'generated_goals':len(final),'inputs_unchanged':all(sha(p)==s for p,s in watch.items()),'complete':False};(L/'result.json').write_text(json.dumps(r,indent=2)+'\n');print(r,flush=True)
