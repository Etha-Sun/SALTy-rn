"""Read-only actual WP formula diagnostic, never proof acceptance."""
from pathlib import Path
import json,subprocess,os,time,signal,hashlib
H=Path(__file__).resolve().parent
p=H/'cursor-r1/logs/selected01/command.json'
j=json.loads(p.read_text())
out=H/'cursor-r1/logs/print-cursor02'
out.mkdir()
cmd=j['command'][:]
for key,value in [('-wp-prover','none'),('-wp-prop','stage3_output_cursor'),('-wp-report-json',str(out/'raw.json')),('-wp-session',str(out/'.build/session'))]:
    cmd[cmd.index(key)+1]=value
cmd+=['-wp-print']
(out/'command.json').write_text(json.dumps({'command':cmd,'cwd':j['cwd'],'source_command_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'scope':'Formula inspection only, not acceptance'},indent=2)+'\n')
t=time.monotonic()
with (out/'run.log').open('x') as f:
    p=subprocess.Popen(cmd,cwd=j['cwd'],stdout=f,stderr=subprocess.STDOUT,env={**os.environ,'WP_OBSERVER_JSONL':str(out/'events.jsonl')},start_new_session=True)
    try: code=p.wait(timeout=180)
    except subprocess.TimeoutExpired:
        os.killpg(p.pid,signal.SIGKILL);p.wait();code=124
(out/'result.json').write_text(json.dumps({'exit':code,'seconds':time.monotonic()-t,'complete':False},indent=2)+'\n')
print(code)
