from pathlib import Path
import json,subprocess,os,time,signal
D=Path(__file__).resolve().parent;C=D/'bias-load-diagnostic12';r=json.loads((C/'command.json').read_text());cmd=r['command'][:];cmd[cmd.index('-wp-prover')+1]='none';cmd[cmd.index('-wp-fct')+1]='next_dw_load_probe';cmd[cmd.index('-wp-report-json')+1]=str(C/'probe-print01.json');cmd+=['-wp-prop','probe_loaded0,probe_frame0,probe_local0','-wp-no-qed','-wp-no-clean','-wp-print'];(C/'probe-print01-command.json').write_text(json.dumps({'command':cmd,'cwd':r['cwd']},indent=2)+'\n');env=dict(os.environ);env['WP_OBSERVER_JSONL']=str(C/'probe-print01-events.jsonl');start=time.monotonic()
with (C/'probe-print01.log').open('x') as f:
 p=subprocess.Popen(cmd,cwd=r['cwd'],env=env,stdout=f,stderr=subprocess.STDOUT,start_new_session=True)
 try:code=p.wait(timeout=90)
 except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait();code=124
(C/'probe-print01-result.json').write_text(json.dumps({'exit':code,'seconds':time.monotonic()-start})+'\n');print(code)
