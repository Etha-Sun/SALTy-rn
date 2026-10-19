from pathlib import Path
import json,subprocess,os,signal,time
H=Path(__file__).resolve().parent;C=H/'candidate03';L=C/'logs/print-b0-01';L.mkdir();rec=json.loads((C/'logs/selected01/command.json').read_text());cmd=list(rec['command']);cmd[cmd.index('-wp-prover')+1]='none';cmd[cmd.index('-wp-prop')+1]='next_b0_load';cmd[cmd.index('-wp-report-json')+1]=str(L/'raw.json');cmd[cmd.index('-wp-session')+1]=str(L/'.build/session');cmd+=['-wp-print'];(L/'command.json').write_text(json.dumps({'command':cmd,'budget_seconds':90,'mode':'print-only-no-solver','input_sha256_before':rec['input_sha256_before']},indent=2)+'\n');t=time.monotonic()
with (L/'run.log').open('x') as f:
 p=subprocess.Popen(cmd,cwd=rec['cwd'],env={**os.environ,'WP_OBSERVER_JSONL':str(L/'events.jsonl')},stdout=f,stderr=subprocess.STDOUT,start_new_session=True)
 try:code=p.wait(timeout=90)
 except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait();code=124
(L/'result.json').write_text(json.dumps({'exit':code,'seconds':time.monotonic()-t,'scope':'Printed goal only; not proof'})+'\n')
