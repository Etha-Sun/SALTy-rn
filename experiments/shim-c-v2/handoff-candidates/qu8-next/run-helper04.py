from pathlib import Path
import subprocess,json,time
r=Path(__file__).resolve().parents[4];o=Path(__file__).resolve().parent
cmd=json.loads((o/'logs/helper03-command.json').read_text());cmd=[x.replace('helper03','helper04') for x in cmd]
(o/'logs/helper04-command.json').write_text(json.dumps(cmd,indent=2)+'\n');t=time.monotonic()
with (o/'logs/helper04.log').open('x') as f:
 try:p=subprocess.run(cmd,cwd=o/'.build/helper-diagnostic',stdout=f,stderr=subprocess.STDOUT,timeout=180);code=p.returncode
 except subprocess.TimeoutExpired:code=124
(o/'logs/helper04-exit.json').write_text(json.dumps(dict(exit=code,seconds=time.monotonic()-t))+'\n')
print(code)
