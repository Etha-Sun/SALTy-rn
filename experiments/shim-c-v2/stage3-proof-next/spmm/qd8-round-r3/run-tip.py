from pathlib import Path
import sys,json,hashlib,subprocess,os,signal,time
R=Path('/srv/home/yuechunsun/tools/lean/build/shim-c');H=Path(__file__).resolve().parent.parent;B=R/'experiments/shim-c-v2'
sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
case=H/sys.argv[1]; name=sys.argv[2];props=sys.argv[3]; budget=int(sys.argv[4]);out=case/name;out.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
d,g=checker.prepare(case,sha(case/'frozen.json'),name);assert g['passed'];a=Path(g['annotated']);(out/'guard.json').write_text(json.dumps(g,indent=2))
obs=B/'stage3-inventory-research/.build/observer.cmxs';assert sha(obs)=='df62e27ec11d707f2dee90423f3f42e485784b0dd7182a8848f3fd53f9de6d96'
cmd=[str(B/'handoff-model-plus/frama-c.py'),'-load-module',str(obs),'-machdep','gcc_x86_64','-inline-calls','test_neon,test_rvv','-inline-stmt-contracts','-remove-inlined','test_neon,test_rvv','-wp','-wp-rte','-wp-par','1','-wp-timeout','30','-wp-memlimit','2048','-wp-cache','none','-wp-model',d['wp_model_variant'],'-warn-special-float','none','-wp-share',str(R/d['wp_share']),'-wp-why3-config',str(R/d['wp_why3_config']),'-wp-no-why3-detect','-wp-prover','tip,z3,cvc5','-wp-driver',str(a/d['driver']),'-wp-prop',props,'-wp-report-json',str(out/'raw.json'),'-wp-session',str(case/'.build'/name/'session'),str(a/'unit.c')]
if props.startswith('fct:'):
 cmd[cmd.index('-wp-prop')]='-wp-fct';cmd[cmd.index('-wp-fct')+1]=props[4:]
(out/'command.json').write_text(json.dumps(dict(command=cmd,cwd=str(a),budget=budget,proof_sha256=d['proof_sha256']),indent=2));t=time.monotonic()
with (out/'run.log').open('x') as log:
 p=subprocess.Popen(cmd,cwd=a,stdout=log,stderr=subprocess.STDOUT,start_new_session=True,env={**os.environ,'WP_OBSERVER_JSONL':str(out/'events.jsonl'),'PATH':str(B/'handoff-solvers/.build/bin')+':'+os.environ['PATH']})
 try:code=p.wait(timeout=budget)
 except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait();code=124
rows=json.loads((out/'raw.json').read_text()) if (out/'raw.json').exists() else None
result=dict(exit=code,seconds=time.monotonic()-t,raw_total=len(rows) if rows is not None else None,raw_passed=sum(bool(x['passed']) for x in rows) if rows is not None else None,input_unchanged=all(sha(a/n)==v for n,v in g['generated'].items()),scope='Selected obligations only; every dependency remains a full-proof obligation.')
(out/'result.json').write_text(json.dumps(result,indent=2));print(result)
