"""Independent diagnostic execution layer. Frozen checker/model inputs unchanged."""
from pathlib import Path
import sys,json,hashlib,subprocess,os,signal,time
H=Path(__file__).resolve().parent;R=H.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
name,run,mode=sys.argv[1:4];budget=int(sys.argv[4]) if len(sys.argv)>4 else 600;C=H/name;L=C/'logs'/run;L.mkdir(parents=True,exist_ok=False);m=json.loads((C/'frozen.json').read_text());g=json.loads((C/'source-guard.json').read_text());A=Path(g['annotated']);sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();B=R/'experiments/shim-c-v2';O=B/'stage3-inventory-research/.build/observer.cmxs';OS=O.parent.parent/'observer.ml';lockpath=R/m['files']['float_model_lock.json']['path'];lock=json.loads(lockpath.read_text())
assert sha(O)=='df62e27ec11d707f2dee90423f3f42e485784b0dd7182a8848f3fd53f9de6d96';assert sha(OS)=='d7402c109ac22c9f2b09274d80dcb771fef7155bef8f9846890ff9a04e9936c6'
watched={str(C/'frozen.json'):sha(C/'frozen.json'),str(Path(__file__).resolve()):sha(Path(__file__)),str(O):sha(O),str(OS):sha(OS)};watched.update({str(R/v['path']):v['sha256'] for v in m['files'].values()});watched.update({str(A/n):s for n,s in g['generated'].items()});watched.update({str(R/n):s for n,s in g['proof'].items()});watched.update({str(Path(p) if Path(p).is_absolute() else R/p):s for p,s in lock['files'].items()});assert all(sha(Path(p))==s for p,s in watched.items())
cmd=[str(B/'handoff-model-plus/frama-c.py'),'-load-module',str(O),'-machdep','gcc_x86_64','-inline-calls','test_neon,test_rvv','-inline-stmt-contracts','-remove-inlined','test_neon,test_rvv','-wp','-wp-rte','-wp-model',m['wp_model_variant'],'-warn-special-float','none','-wp-share',str(R/m['wp_share']),'-wp-why3-config',str(R/m['wp_why3_config']),'-wp-no-why3-detect','-wp-prover','tip,z3,cvc5','-wp-par','1','-wp-timeout','30','-wp-memlimit','2048','-wp-cache','none','-wp-driver',str(A/m['driver']),'-wp-session',str(L/'.build/session'),'-wp-report-json',str(L/'raw.json'),str(A/'unit.c')]
selected='stage3_channel_bounds,stage3_output_cursor,stage3_vl_bound,stage3_next_bound,stage3_store_cursor,next_output_rebase,next_size_sub_exact,next_pool_seed_relation'
if mode=='selected':cmd+=['-wp-prop',selected]
elif mode=='helper':cmd+=['-wp-fct','next_size_sub,next_pool_seed']
elif mode=='globals':cmd+=['-wp-prop','@lemma']
elif mode=='full':
 closure=checker.shim_c_call_closure.closure(A/'unit.c',set());(L/'closure.json').write_text(json.dumps(closure,indent=2)+'\n');cmd+=['-wp-skip-fct',','.join(closure['unreachable_definitions'])]
elif mode=='control':
 p=L/'control.c';p.write_text('#include '+json.dumps(str(A/'unit.c'))+'\n/*@ assigns \\nothing; ensures \\true; */\nvoid next_control_true(void) {}\n/*@ assigns \\nothing; ensures \\false; */\nvoid next_control_false(void) {}\n');cmd[cmd.index(str(A/'unit.c'))]=str(p);cmd+=['-wp-fct','next_control_true,next_control_false']
else:raise SystemExit('unknown mode')
r={'command':cmd,'cwd':str(A),'mode':mode,'budget_seconds':budget,'frozen_sha256':sha(C/'frozen.json'),'proof_sha256':sha(C/'proof.patch'),'source_guard_passed':g['passed'],'input_sha256_before':watched,'scope':'Diagnostic only; all new assertions/lemmas selected with old target. Full mode still requires complete raw+coverage+controls+independent checker acceptance.'};(L/'command.json').write_text(json.dumps(r,indent=2)+'\n');t=time.monotonic()
with (L/'run.log').open('x') as out:
 p=subprocess.Popen(cmd,cwd=A,env={**os.environ,'PATH':str(B/'handoff-solvers/.build/bin')+':'+os.environ['PATH'],'WP_OBSERVER_JSONL':str(L/'events.jsonl')},stdout=out,stderr=subprocess.STDOUT,start_new_session=True)
 try:code=p.wait(timeout=budget)
 except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait();code=124
raw=json.loads((L/'raw.json').read_text()) if (L/'raw.json').exists() else None;et=(L/'events.jsonl').read_text() if (L/'events.jsonl').exists() else '';el=et.splitlines() if et.endswith('\n') else et.splitlines()[:-1];events=[json.loads(l) for l in el];final=[e for e in events if e['event']=='final'];marker=events[-1] if events and events[-1]['event']=='normal_exit' else None
r.update(exit=code,seconds=round(time.monotonic()-t,3),normal_exit_marker=marker,raw_total=len(raw) if raw is not None else None,raw_passed=sum(bool(x['passed']) for x in raw) if raw is not None else None,pending=[x for x in raw if not x['passed']] if raw is not None else None,inputs_unchanged=all(sha(Path(p))==s for p,s in watched.items()),complete=False)
if mode=='control':
 pos=[x for x in (raw or []) if x.get('function')=='next_control_true' and 'ensures' in x['property']];neg=[x for x in (raw or []) if x.get('function')=='next_control_false' and 'ensures' in x['property']];r['control_accepted']=bool(code==0 and marker and len(pos)==len(neg)==1 and pos[0]['passed'] and not neg[0]['passed'] and r['inputs_unchanged'])
(L/'result.json').write_text(json.dumps(r,indent=2)+'\n');print(name,run,code,r['raw_passed'],r['raw_total'],r['inputs_unchanged'],flush=True)
