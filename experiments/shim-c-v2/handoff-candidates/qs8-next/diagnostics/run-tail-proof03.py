from pathlib import Path
import shutil,subprocess,json,time
here=Path(__file__).resolve().parent
old=here/'tail-proof02';d=here/'tail-proof03';d.mkdir(exist_ok=False);shutil.copytree(old/'annotated',d/'annotated');record=json.loads((old/'command.json').read_text());cmd=[x.replace(str(old),str(d)) for x in record['command']];start=time.monotonic()
with (d/'run.log').open('w') as f:
 try:p=subprocess.run(cmd,cwd=d/'annotated',stdout=f,stderr=subprocess.STDOUT,timeout=180);code=p.returncode
 except subprocess.TimeoutExpired:code=124
record.update(command=cmd,exit=code,seconds=time.monotonic()-start,environment_note='Run outside restricted IPC sandbox; previous tail-proof02 why3server became defunct before any solver goal result and was terminated.')
(d/'command.json').write_text(json.dumps(record,indent=2)+'\n');print('exit',code,'seconds',time.monotonic()-start)
