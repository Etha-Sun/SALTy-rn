from pathlib import Path
import json,subprocess,os,time,signal
D=Path(__file__).resolve().parent;L=D/'dwconv2d-height-inline-r2/logs';r=json.loads((L/'selected-root01-command.json').read_text());cmd=r['command'];cmd[cmd.index('-wp-prover')+1]='none';cmd[cmd.index('-wp-prop')+1]='next_height_before,next_height_bound,next_height_rows';cmd[cmd.index('-wp-report-json')+1]=str(L/'height-inline-print01.json');cmd+=['-wp-no-qed','-wp-no-clean','-wp-print'];(L/'height-inline-print01-command.json').write_text(json.dumps(cmd,indent=2)+'\n');env=dict(os.environ);env['WP_OBSERVER_JSONL']=str(L/'height-inline-print01-events.jsonl');t=time.monotonic()
with (L/'height-inline-print01.log').open('x') as f:
 p=subprocess.Popen(cmd,cwd=r['cwd'],stdout=f,stderr=subprocess.STDOUT,env=env,start_new_session=True)
 try:code=p.wait(timeout=90)
 except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait();code=124
(L/'height-inline-print01-result.json').write_text(json.dumps({'exit':code,'seconds':time.monotonic()-t})+'\n');print(code)
