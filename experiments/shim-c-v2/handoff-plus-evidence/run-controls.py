from pathlib import Path
import subprocess,json
here=Path(__file__).resolve().parent;campaign=here.parent;root=campaign.parents[1]
command=json.loads((campaign/'handoff-local/semantic-local-02-command.json').read_text())
command[0]=str(campaign/'handoff-model-plus/frama-c.py')
command[command.index('-wp-share')+1]=str(campaign/'handoff-model-plus/wp-share')
command[command.index('-wp-timeout')+1]='30'
command[command.index('-wp-report-json')+1]=str(here/'controls-local-01.json')
command[-1]='experiments/shim-c-v2/model-plus/controls.c'
(here/'controls-local-01-command.json').write_text(json.dumps(command,indent=2)+'\n')
with (here/'controls-local-01.log').open('x') as out:
 result=subprocess.run(command,cwd=root,stdout=out,stderr=subprocess.STDOUT,timeout=300)
(here/'controls-local-01-exit.json').write_text(json.dumps({'exit_code':result.returncode})+'\n')
