"""Run one bounded attempt; never claims formal checker acceptance."""
from pathlib import Path
import argparse,sys,subprocess,json,time,hashlib,os,signal
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[3];sys.path.insert(0,str(ROOT/'tools'))
import shim_c_call_closure
p=argparse.ArgumentParser();p.add_argument('case');p.add_argument('name');p.add_argument('mode',choices=['control','selected','helpers','lemmas','full']);p.add_argument('--budget',type=int,default=180);p.add_argument('--properties',default='');a=p.parse_args()
case=(HERE/a.case).resolve();assert case.is_relative_to(HERE);logs=case/'logs';logs.mkdir(exist_ok=True);sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
assert not (logs/(a.name+'-command.json')).exists()
data=json.loads((case/'frozen.json').read_text());guard=json.loads((case/'source-guard.json').read_text());ann=Path(guard['annotated']);model=ROOT/'experiments/shim-c-v2/handoff-model-plus';lockpath=model/'float_model_lock.json';lock=json.loads(lockpath.read_text())
watch={case/'proof.patch':sha(case/'proof.patch'),case/'frozen.json':sha(case/'frozen.json'),Path(__file__).resolve():sha(Path(__file__).resolve()),lockpath:sha(lockpath)}
watch.update({ann/n:d for n,d in guard['generated'].items()});watch.update({Path(n) if Path(n).is_absolute() else ROOT/n:d for n,d in lock['files'].items()});assert all(sha(p)==d for p,d in watch.items())
cmd=[str(model/'frama-c.py'),'-load-module',str(ROOT/'experiments/shim-c-v2/stage3-inventory-research/.build/observer.cmxs'),'-machdep','gcc_x86_64','-inline-calls','test_neon,test_rvv,__riscv_vreinterpret_v_u32m1_i32m1,__riscv_vadd_vx_i32m1,__riscv_vsub_vx_i32m1','-inline-stmt-contracts','-remove-inlined','test_neon,test_rvv','-wp','-wp-rte','-wp-par','1','-wp-timeout','30','-wp-memlimit','2048','-wp-cache','none','-wp-model',data['wp_model_variant'],'-warn-special-float','none','-wp-share',str(ROOT/data['wp_share']),'-wp-why3-config',str(ROOT/data['wp_why3_config']),'-wp-no-why3-detect','-wp-prover','z3,cvc5','-wp-driver',str(ann/data['driver']),'-wp-report-json',str(logs/(a.name+'.json'))]
source=ann/'unit.c'
if a.mode=='control':
 source=logs/(a.name+'.c');source.write_text('#include '+json.dumps(str(ann/'unit.c'))+'\n/*@ assigns \\nothing; ensures \\false; */\nvoid stage3_false(void) {}\n/*@ assigns \\nothing; ensures \\true; */\nvoid stage3_true(void) {}\n');cmd+=['-wp-fct','stage3_false,stage3_true']
elif a.mode=='selected':cmd+=['-wp-fct','equivalent','-wp-prop',a.properties]
elif a.mode=='helpers':cmd+=['-wp-fct',a.properties]
elif a.mode=='lemmas':cmd+=['-wp-prop','@lemma']
else:
 closure=shim_c_call_closure.closure(source,set());(logs/(a.name+'-closure.json')).write_text(json.dumps(closure,indent=2)+'\n')
 if closure['unreachable_definitions']:cmd+=['-wp-skip-fct',','.join(closure['unreachable_definitions'])]
cmd+=[str(source)]
(logs/(a.name+'-command.json')).write_text(json.dumps({'command':cmd,'cwd':str(ann),'budget_seconds':a.budget,'frozen_sha256':sha(case/'frozen.json'),'proof_sha256':sha(case/'proof.patch'),'model_lock_sha256':sha(lockpath),'runner_sha256':sha(Path(__file__))},indent=2)+'\n')
env=os.environ|{'WP_OBSERVER_JSONL':str(logs/(a.name+'-events.jsonl')),'PATH':str(ROOT/'experiments/shim-c-v2/handoff-solvers/.build/bin')+os.pathsep+os.environ['PATH']};start=time.monotonic()
with (logs/(a.name+'.log')).open('x') as out:
 proc=subprocess.Popen(cmd,cwd=ann,env=env,stdout=out,stderr=subprocess.STDOUT,start_new_session=True)
 try:code=proc.wait(timeout=a.budget)
 except subprocess.TimeoutExpired:os.killpg(proc.pid,signal.SIGKILL);proc.wait();code=124
raw=logs/(a.name+'.json');rows=json.loads(raw.read_text()) if raw.exists() else None
result={'exit_code':code,'seconds':round(time.monotonic()-start,3),'raw_total':len(rows) if rows is not None else None,'raw_passed':sum(r['passed'] for r in rows) if rows is not None else None,'pending':[r for r in rows if not r['passed']] if rows is not None else None,'inputs_unchanged':all(sha(p)==d for p,d in watch.items()),'complete':False,'mode':a.mode,'scope':'Diagnostic/full attempt only; no formal acceptance checker has run'}
if a.mode=='control':
 neg=[r for r in (rows or []) if r['function']=='stage3_false' and 'ensures' in r['goal']];pos=[r for r in (rows or []) if r['function']=='stage3_true' and 'ensures' in r['goal']];result['control_accepted']=code==0 and len(neg)==len(pos)==1 and not neg[0]['passed'] and pos[0]['passed']
(logs/(a.name+'-result.json')).write_text(json.dumps(result,indent=2)+'\n');print(a.case,a.name,code,result['raw_passed'],result['raw_total'],flush=True)
if a.mode=='control' and not result['control_accepted']:sys.exit(2)
