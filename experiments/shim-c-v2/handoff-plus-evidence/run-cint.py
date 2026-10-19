from pathlib import Path
import subprocess,json
here=Path(__file__).resolve().parent;campaign=here.parent;root=campaign.parents[1]
command=[str(campaign/'environment-recovery-local/.build/opam/shim-local/bin/why3'),'prove','-L',str(campaign/'handoff-model-plus/wp-share/why3'),'-C',str(campaign/'handoff-model-front/why3.conf'),'-P','Z3','-t','30','--json',str(campaign/'handoff-model-plus/wp-share/why3/frama_c_wp/cint.mlw')]
(here/'cint-local-01-command.json').write_text(json.dumps(command,indent=2)+'\n')
with (here/'cint-local-01.jsonl').open('x') as out,(here/'cint-local-01.stderr').open('x') as err:
 result=subprocess.run(command,cwd=root,stdout=out,stderr=err,timeout=300)
(here/'cint-local-01-exit.json').write_text(json.dumps({'exit_code':result.returncode})+'\n')
