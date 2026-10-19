"""Bounded diagnostic/full WP attempts; not a replacement acceptance checker."""
from pathlib import Path
import sys,subprocess,json,time,hashlib,os,signal,re
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2];sys.path.insert(0,str(ROOT/'tools'))
import shim_c_call_closure
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
freeze=json.loads((HERE/'freeze.json').read_text());model=HERE.parent/'handoff-model-plus';lockpath=model/'float_model_lock.json';lock=json.loads(lockpath.read_text())
def audit():
 return all(sha(Path(n) if Path(n).is_absolute() else ROOT/n)==v for n,v in lock['files'].items())
assert audit()
os.environ['PATH']=str(HERE.parent/'handoff-solvers/.build/bin')+os.pathsep+os.environ['PATH']
for name,hashes in freeze.items():
 if name!='f32-dwconv2d-chw':continue
 case=HERE/name;assert sha(case/'frozen.json')==hashes['frozen_sha256'];assert sha(case/'proof.patch')==hashes['proof_sha256']
 data=json.loads((case/'frozen.json').read_text());guard=json.loads((case/'source-guard.json').read_text());ann=Path(guard['annotated']);logs=case/'logs';logs.mkdir(exist_ok=True)
 closure=shim_c_call_closure.closure(ann/'unit.c',set())
 (case/'call-closure.json').write_text(json.dumps(closure,indent=2)+'\n')
 base=[str(model/'frama-c.py'),'-machdep','gcc_x86_64','-inline-calls','test_neon,test_rvv','-inline-stmt-contracts','-remove-inlined','test_neon,test_rvv','-wp','-wp-rte','-wp-par','1','-wp-prover','z3,cvc5','-wp-timeout','3','-wp-memlimit','1024','-wp-cache','none','-wp-model',data['wp_model_variant'],'-warn-special-float','none','-wp-share',str(ROOT/data['wp_share']),'-wp-why3-config',str(ROOT/data['wp_why3_config']),'-wp-no-why3-detect','-wp-driver',str(ann/data['driver'])]
 # Resolve configured prover names only after loading the Why3 configuration.
 base.remove('-wp-prover');base.remove('z3,cvc5');base+=['-wp-prover','z3,cvc5']
 def run(tag,source,extra,budget):
  cmd=base+['-wp-report-json',str(logs/(tag+'.json')),str(source)]+extra
  (logs/(tag+'-command.json')).write_text(json.dumps(dict(command=cmd,cwd=str(ann),budget_seconds=budget,frozen_sha256=hashes['frozen_sha256'],proof_sha256=hashes['proof_sha256'],model_lock_sha256=sha(lockpath)),indent=2)+'\n')
  start=time.monotonic()
  with (logs/(tag+'.log')).open('x') as out:
   p=subprocess.Popen(cmd,cwd=ann,stdout=out,stderr=subprocess.STDOUT,start_new_session=True)
   try:code=p.wait(timeout=budget)
   except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait();code=124
  raw=logs/(tag+'.json');rows=json.loads(raw.read_text()) if raw.exists() else None
  report=dict(exit_code=code,seconds=round(time.monotonic()-start,3),body_report_present=rows is not None,raw_total=len(rows) if rows is not None else None,raw_passed=sum(bool(x['passed']) for x in rows) if rows is not None else None,pending=[x for x in rows if not x['passed']] if rows is not None else None)
  (logs/(tag+'-result.json')).write_text(json.dumps(report,indent=2)+'\n');print(name,tag,code,report['raw_passed'],report['raw_total'],flush=True)
  return report,rows
 # Same translation unit and frozen model, both controls require actual bodies.
 control=logs/'model-control.c';control.write_text('#include '+json.dumps(str(ann/'unit.c'))+'\n/*@ assigns \\nothing; ensures \\false; */\nvoid stage3_false(void) {}\n/*@ assigns \\nothing; ensures \\true; */\nvoid stage3_true(void) {}\n')
 cr,rows=run('control05',control,['-wp-fct','stage3_false,stage3_true'],90)
 neg=[x for x in (rows or []) if x['function']=='stage3_false' and 'ensures' in x['goal']];pos=[x for x in (rows or []) if x['function']=='stage3_true' and 'ensures' in x['goal']]
 accepted=cr['exit_code']==0 and len(neg)==len(pos)==1 and not neg[0]['passed'] and pos[0]['passed']
 assert accepted,(name,'control rejected')
 props=sorted(set(re.findall(r'(stage3_\w+)\s*:',(ann/'neon.c').read_text()+(ann/'rvv.c').read_text())))
 selected,_=run('selected01',ann/'unit.c',['-wp-fct','equivalent','-wp-prop',','.join(props)],120)
 lemma,_=run('lemmas01',ann/'unit.c',['-wp-prop','@lemma'],90)
 extra=['-wp-skip-fct',','.join(closure['unreachable_definitions'])] if closure['unreachable_definitions'] else []
 full,rows=run('full01',ann/'unit.c',extra,300)
 stable=sha(case/'frozen.json')==hashes['frozen_sha256'] and sha(case/'proof.patch')==hashes['proof_sha256'] and all(sha(ann/n)==v for n,v in guard['generated'].items()) and audit()
 summary=dict(case=name,classification='unproved full attempt; independent acceptance checker not run',complete=False,source_guard_passed=True,model_control_accepted=accepted,inputs_unchanged=stable,selected=selected,global_lemmas=lemma,full=full,scope='Full original reachable C bodies with fixed native IEEE model; missing raw report remains unknown, never 0/0')
 (case/'summary.json').write_text(json.dumps(summary,indent=2)+'\n')
