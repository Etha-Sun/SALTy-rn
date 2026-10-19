from pathlib import Path
import sys,subprocess,json,time,hashlib,os,signal,re
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2];sys.path.insert(0,str(ROOT/'tools'))
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
model=HERE.parent/'handoff-model-plus';ld=json.loads((model/'float_model_lock.json').read_text());os.environ['PATH']=str(HERE.parent/'handoff-solvers/.build/bin')+os.pathsep+os.environ['PATH']
for name,freeze in json.loads((HERE/'revision2/freeze.json').read_text()).items():
 case=HERE/'revision2'/name;assert sha(case/'frozen.json')==freeze['frozen_sha256'];assert sha(case/'proof.patch')==freeze['proof_sha256']
 data=json.loads((case/'frozen.json').read_text());guard=json.loads((case/'source-guard.json').read_text());ann=Path(guard['annotated']);logs=case/'logs';logs.mkdir(exist_ok=True)
 base=[str(model/'frama-c.py'),'-machdep','gcc_x86_64','-inline-calls','test_neon,test_rvv','-inline-stmt-contracts','-remove-inlined','test_neon,test_rvv','-wp','-wp-rte','-wp-par','1','-wp-timeout','3','-wp-memlimit','1024','-wp-cache','none','-wp-model',data['wp_model_variant'],'-warn-special-float','none','-wp-share',str(ROOT/data['wp_share']),'-wp-why3-config',str(ROOT/data['wp_why3_config']),'-wp-no-why3-detect','-wp-prover','z3,cvc5','-wp-driver',str(ann/data['driver'])]
 control=logs/'model-control.c';control.write_text('#include '+json.dumps(str(ann/'unit.c'))+'\n/*@ assigns \\nothing; ensures \\false; */\nvoid stage3_false(void) {}\n/*@ assigns \\nothing; ensures \\true; */\nvoid stage3_true(void) {}\n')
 # Narrow key new/previously timed-out properties to obtain complete local reports.
 props={'f32-conv-hwc2chw':'stage3_cursor,stage3_vl,stage3_ky_bounds','f32-dwconv-minmax':'stage3_vl,stage3_weight_block,stage3_store_range','f32-dwconv2d-chw':'stage3_height,stage3_rows,stage3_vl'}[name]
 for tag,source,extra,budget in [('control02',control,['-wp-fct','stage3_false,stage3_true'],90),('selected02',ann/'unit.c',['-wp-fct','equivalent','-wp-prop',props],240)]:
  command=base+['-wp-report-json',str(logs/(tag+'.json')),str(source)]+extra
  assert not (logs/(tag+'-command.json')).exists();(logs/(tag+'-command.json')).write_text(json.dumps({'command':command,'cwd':str(ann),'budget_seconds':budget,'frozen_sha256':freeze['frozen_sha256'],'proof_sha256':freeze['proof_sha256']},indent=2)+'\n');start=time.monotonic()
  with (logs/(tag+'.log')).open('x') as out:
   proc=subprocess.Popen(command,cwd=ann,stdout=out,stderr=subprocess.STDOUT,start_new_session=True)
   try:code=proc.wait(timeout=budget)
   except subprocess.TimeoutExpired:os.killpg(proc.pid,signal.SIGKILL);proc.wait();code=124
  raw=logs/(tag+'.json');rows=json.loads(raw.read_text()) if raw.exists() else None
  result={'exit_code':code,'seconds':round(time.monotonic()-start,3),'raw_total':len(rows) if rows is not None else None,'raw_passed':sum(r['passed'] for r in rows) if rows is not None else None,'pending':[r for r in rows if not r['passed']] if rows is not None else None,'scope':'selected proof obligations only, not kernel acceptance'}
  (logs/(tag+'-result.json')).write_text(json.dumps(result,indent=2)+'\n');print(name,tag,code,result['raw_passed'],result['raw_total'],flush=True)
  if tag=='control02':
   assert code==0 and rows
   assert any(r['function']=='stage3_false' and 'ensures' in r['goal'] and not r['passed'] for r in rows)
   assert any(r['function']=='stage3_true' and 'ensures' in r['goal'] and r['passed'] for r in rows)
