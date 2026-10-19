from pathlib import Path
import sys,json,subprocess,os,time,signal,hashlib
D=Path(__file__).resolve().parent.parent;R=D.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_call_closure
case=D/sys.argv[1];mode=sys.argv[2];assert mode in ['body','lemmas'];L=case/'logs';tag='projection-inventory-'+mode+'01';r=json.loads((L/'inventory-seed-command.json').read_text());cmd=r['command'];a=Path(r['cwd']);cmd[-1]=str(a/'unit.c');cmd[cmd.index('-wp-prover')+1]='none';cmd[cmd.index('-wp-report-json')+1]=str(L/(tag+'.json'));cmd+=['-wp-no-qed','-wp-no-clean'];closure=shim_c_call_closure.closure(a/'unit.c',set());(L/(tag+'-closure.json')).write_text(json.dumps(closure,indent=2)+'\n')
if mode=='lemmas':cmd+=['-wp-prop','@lemma']
else:cmd+=['-wp-skip-fct',','.join(closure['unreachable_definitions'])]
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();g=json.loads((case/'source-guard.json').read_text());watch={a/n:h for n,h in g['generated'].items()};assert all(sha(p)==h for p,h in watch.items());watch.update({case/'frozen.json':sha(case/'frozen.json'),case/'proof.patch':sha(case/'proof.patch')});env=dict(os.environ);env['WP_OBSERVER_JSONL']=str(L/(tag+'-events.jsonl'));budget=300 if mode=='body' else 90
(L/(tag+'-command.json')).write_text(json.dumps({'command':cmd,'cwd':str(a),'budget':budget,'watch':{str(p):h for p,h in watch.items()}},indent=2)+'\n');t=time.monotonic()
with (L/(tag+'.log')).open('x') as f:
 p=subprocess.Popen(cmd,cwd=a,env=env,stdout=f,stderr=subprocess.STDOUT,start_new_session=True)
 try:code=p.wait(timeout=budget)
 except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait();code=124
rows=[json.loads(x) for x in (L/(tag+'-events.jsonl')).read_text().splitlines()];result={'exit':code,'seconds':time.monotonic()-t,'normal_exit':rows[-1]['event']=='normal_exit','final_count':sum(v['event']=='final' for v in rows),'inputs_unchanged':all(sha(p)==h for p,h in watch.items()),'complete_kernel':False};(L/(tag+'-result.json')).write_text(json.dumps(result,indent=2)+'\n');print(result,flush=True)
