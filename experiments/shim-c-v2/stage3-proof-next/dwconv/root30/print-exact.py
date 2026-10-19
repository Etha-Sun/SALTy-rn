from pathlib import Path
import json,subprocess,os,time,signal
D=Path(__file__).resolve().parent.parent;C=D/'root30';L=C/'logs';L.mkdir(exist_ok=True);r=json.loads((D/'root30/logs/focus01-command.json').read_text());a=json.loads((C/'source-guard.json').read_text())['annotated'];cmd=[x.replace(r['cwd'],a) for x in r['command']];cmd[cmd.index('-wp-prover')+1]='none';cmd[cmd.index('-wp-prop')+1]='next_height_doz_exact';cmd[cmd.index('-wp-report-json')+1]=str(L/'exact-print01.json');cmd+=['-wp-no-qed','-wp-no-clean','-wp-print'];(L/'exact-print01-command.json').write_text(json.dumps({'command':cmd,'cwd':a,'budget':90},indent=2)+'\n');env=dict(os.environ);env['WP_OBSERVER_JSONL']=str(L/'exact-print01-events.jsonl');t=time.monotonic()
with (L/'exact-print01.log').open('x') as f:
 p=subprocess.Popen(cmd,cwd=a,stdout=f,stderr=subprocess.STDOUT,env=env,start_new_session=True)
 try:code=p.wait(timeout=90)
 except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait();code=124
(L/'exact-print01-result.json').write_text(json.dumps({'exit':code,'seconds':time.monotonic()-t})+'\n');print(code)
