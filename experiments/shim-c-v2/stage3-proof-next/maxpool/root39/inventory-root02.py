from pathlib import Path
import json,os,subprocess,signal,time,hashlib
C=Path(__file__).resolve().parent; R=C.parents[4]; L=C/'inventory-root02';L.mkdir();old=C/'inventory-root01';d=json.loads((old/'command.json').read_text());cmd=[x.replace(str(old),str(L)) for x in d['command'] if x!='-wp-no-strategy-engine'];cmd+=['-wp-auto-depth','0'];sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest();watch=d['inputs_before'];assert all(sha(p)==s for p,s in watch.items());(L/'command.json').write_text(json.dumps({'command':cmd,'cwd':d['cwd'],'inputs_before':watch,'budget':300,'scope':'Full generated VC inventory with strategy annotations registered, prover none; no proof acceptance'},indent=2)+'\n');t=time.monotonic()
with (L/'run.log').open('x') as out:
 p=subprocess.Popen(cmd,cwd=d['cwd'],env=os.environ|{'WP_OBSERVER_JSONL':str(L/'events.jsonl')},stdout=out,stderr=subprocess.STDOUT,start_new_session=True)
 try: code=p.wait(timeout=300)
 except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait();code=124
events=[json.loads(x) for x in (L/'events.jsonl').read_text().splitlines()] if (L/'events.jsonl').exists() else [];final=[x for x in events if x['event']=='final'];(L/'inventory.json').write_text(json.dumps(final,indent=2)+'\n');r={'exit':code,'seconds':time.monotonic()-t,'normal_exit':bool(events and events[-1]['event']=='normal_exit'),'generated_goals':len(final),'inputs_unchanged':all(sha(p)==s for p,s in watch.items()),'complete':False};(L/'result.json').write_text(json.dumps(r,indent=2)+'\n');print(r,flush=True)
