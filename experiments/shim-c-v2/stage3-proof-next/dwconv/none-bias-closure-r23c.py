from pathlib import Path
import json,subprocess,os,time,signal
D=Path(__file__).resolve().parent;C=D/'bias-cases-r23c';L=C/'logs';L.mkdir(exist_ok=True);r=json.loads((D/'bias-cases-r23c/logs/cases-root01-command.json').read_text());a=json.loads((C/'source-guard.json').read_text())['annotated'];cmd=[x.replace(r['cwd'],a) for x in r['command']];cmd[cmd.index('-wp-prover')+1]='none';cmd[cmd.index('-wp-prop')+1]='next_bias_address,next_predicate_loaded0,next_prestate_loaded0,next_prestate_loaded_lane1,next_prestate_loaded_lane2,next_prestate_loaded_lane3,next_prestate_loaded_all,next_bias_local,next_bias_normalized,next_lane_bound,next_lane_prefix,next_case0,next_case1,next_case2,next_case3,next_case3_index,@assigns,@variant';cmd[cmd.index('-wp-report-json')+1]=str(L/'closure-none01.json');cmd+=['-wp-no-qed','-wp-no-clean'];(L/'closure-none01-command.json').write_text(json.dumps({'command':cmd,'cwd':a,'budget':90},indent=2)+'\n');env=dict(os.environ);env['WP_OBSERVER_JSONL']=str(L/'closure-none01-events.jsonl');t=time.monotonic()
with (L/'closure-none01.log').open('x') as f:
 p=subprocess.Popen(cmd,cwd=a,stdout=f,stderr=subprocess.STDOUT,env=env,start_new_session=True)
 try:code=p.wait(timeout=90)
 except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait();code=124
(L/'closure-none01-result.json').write_text(json.dumps({'exit':code,'seconds':time.monotonic()-t})+'\n');print(code)
