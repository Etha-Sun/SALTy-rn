"""Complete WPO inventory plus bounded solver diagnostics with read-only streaming."""
from pathlib import Path
import sys,json,hashlib,subprocess,os,signal,time,re,ast
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2];BASE=HERE.parent
sys.path.insert(0,str(ROOT/'tools'))
import shim_c_campaign_closure as checker
source=ast.parse((HERE/'run.py').read_text());CASES=next(ast.literal_eval(n.value) for n in source.body if isinstance(n,ast.Assign) and any(isinstance(t,ast.Name) and t.id=='CASES' for t in n.targets))
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
kernel,run=sys.argv[1:3];assert re.fullmatch(r'[a-zA-Z0-9_-]+',run)
out=HERE/kernel/run;out.mkdir(parents=True,exist_ok=False)
case=BASE/CASES[kernel];digest=sha(case/'frozen.json');data,guard=checker.prepare(case,digest,'inventory-'+run)
assert guard['passed'];ann=Path(guard['annotated'])
(out/'guard.json').write_text(json.dumps(guard,indent=2)+'\n')
closure=checker.shim_c_call_closure.closure(ann/'unit.c',set())
(out/'closure.json').write_text(json.dumps(closure,indent=2)+'\n')
lockpath=ROOT/data['files']['float_model_lock.json']['path'];lock=json.loads(lockpath.read_text())
for p,d in lock['files'].items():assert sha(Path(p) if Path(p).is_absolute() else ROOT/p)==d,p
observer=BASE/'stage3-inventory-research/.build/observer.cmxs';observer_source=observer.parent.parent/'observer.ml'
assert sha(observer)=='df62e27ec11d707f2dee90423f3f42e485784b0dd7182a8848f3fd53f9de6d96'
assert sha(observer_source)=='d7402c109ac22c9f2b09274d80dcb771fef7155bef8f9846890ff9a04e9936c6'
frontend=BASE/('stage3-unary-front' if 'stage3-unary-front' in str(lockpath) else 'handoff-model-plus')/'frama-c.py'
base=[str(frontend),'-load-module',str(observer),'-machdep','gcc_x86_64','-inline-calls','test_neon,test_rvv','-inline-stmt-contracts','-remove-inlined','test_neon,test_rvv','-wp','-wp-rte','-wp-par','2','-wp-timeout','1','-wp-memlimit','1024','-wp-cache','none','-wp-model',data.get('wp_model_variant',data['model']),'-warn-special-float','none','-wp-share',str(ROOT/data['wp_share']),'-wp-why3-config',str(ROOT/data['wp_why3_config']),'-wp-no-why3-detect','-wp-driver',str(ann/data['driver']),str(ann/'unit.c')]
control=out/'control.c';control.write_text('#include '+json.dumps(str(ann/'unit.c'))+'\n/*@ assigns \\nothing; ensures \\true; */\nvoid inventory_true(void) {}\n/*@ assigns \\nothing; ensures \\false; */\nvoid inventory_false(void) {}\n')
helpers=sorted(set(closure['functions'])-{'equivalent','test_neon','test_rvv'})
phases=[('control',30),('inventory-body',180),('inventory-lemmas',60),('quick-helpers',90),('quick-main',120),('quick-lemmas',30)]
for phase,budget in phases:
 target=out/phase;target.mkdir();cmd=base+['-wp-report-json',str(target/'raw.json'),'-wp-session',str(target/'.build/session')]
 inventory=phase.startswith('inventory')
 if inventory:cmd+=['-wp-prover','none','-wp-no-qed','-wp-no-clean']
 else:cmd+=['-wp-prover','z3','-wp-steps','1000']
 if phase=='control':cmd[cmd.index(str(ann/'unit.c'))]=str(control);cmd+=['-wp-fct','inventory_true,inventory_false']
 elif phase.endswith('lemmas'):cmd+=['-wp-prop','@lemma']
 elif phase=='quick-helpers':cmd+=['-wp-fct',','.join(helpers)]
 elif phase=='quick-main':cmd+=['-wp-fct','equivalent']
 else:cmd+=['-wp-skip-fct',','.join(closure['unreachable_definitions'])]
 record={'kernel':kernel,'candidate':str(case.relative_to(ROOT)),'frozen_sha256':digest,'model_lock_sha256':sha(lockpath),'observer_sha256':sha(observer),'observer_source_sha256':sha(observer_source),'runner_sha256':sha(Path(__file__)),'phase':phase,'command':cmd,'cwd':str(ann),'budget':budget,'scope':'Read-only diagnostic inventory/quick screening; not canonical verification. Unproved dependencies remain obligations.'}
 (target/'command.json').write_text(json.dumps(record,indent=2)+'\n');t=time.monotonic()
 with (target/'run.log').open('x') as log:
  p=subprocess.Popen(cmd,cwd=ann,stdout=log,stderr=subprocess.STDOUT,start_new_session=True,env={**os.environ,'WP_OBSERVER_JSONL':str(target/'events.jsonl'),'PATH':str(BASE/'handoff-solvers/.build/bin')+':'+os.environ['PATH']})
  try:code=p.wait(timeout=budget)
  except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait();code=124
 rows=json.loads((target/'raw.json').read_text()) if (target/'raw.json').exists() else None
 events=[json.loads(l) for l in (target/'events.jsonl').read_text().splitlines()] if (target/'events.jsonl').exists() else []
 record.update(exit=code,seconds=round(time.monotonic()-t,3),raw_total=len(rows) if rows is not None else None,raw_passed=sum(bool(r['passed']) for r in rows) if rows is not None else None,normal_exit_marker=bool(events and events[-1]['event']=='normal_exit'),input_unchanged=checker.baseline(case,digest)==data and all(sha(ann/n)==d for n,d in guard['generated'].items()))
 if phase=='control':
  positive=[r for r in (rows or []) if r.get('function')=='inventory_true' and 'ensures' in r['property']]
  negative=[r for r in (rows or []) if r.get('function')=='inventory_false' and 'ensures' in r['property']]
  record['accepted']=code==0 and len(positive)==len(negative)==1 and positive[0]['passed'] and not negative[0]['passed']
 (target/'result.json').write_text(json.dumps(record,indent=2)+'\n');print(kernel,phase,code,record['raw_passed'],record['raw_total'],record['normal_exit_marker'],flush=True)
 if phase=='control' and not record['accepted']:raise RuntimeError('Model control rejected')
