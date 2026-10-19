from pathlib import Path
import json,subprocess,hashlib
here=Path(__file__).resolve().parent;root=here.parents[2];front=here.parent/'handoff-model-front'
command=json.loads((here.parent/'handoff-local/semantic-local-02-command.json').read_text())
command[command.index('-wp-par')+1]='1'
command[command.index('-wp-report-json')+1]=str(here/'probe01.json')
command[-1]=str(here/'controls.c');command+=['-wp-print']
inputs=[here/'controls.c',here/'run.py',front/'float_model_lock.json']
(here/'probe01-command.json').write_text(json.dumps({'command':command,'timeout':180,'files_sha256':{str(p.relative_to(root)):hashlib.sha256(p.read_bytes()).hexdigest() for p in inputs}},indent=2)+'\n')
with (here/'probe01.log').open('x') as out:
 try:result=subprocess.run(command,cwd=root,stdout=out,stderr=subprocess.STDOUT,timeout=180);status={'exit_code':result.returncode}
 except subprocess.TimeoutExpired:status={'timeout':180}
(here/'probe01-exit.json').write_text(json.dumps(status)+'\n')
