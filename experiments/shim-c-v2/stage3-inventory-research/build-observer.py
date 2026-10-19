from pathlib import Path
import os,subprocess,json,hashlib
D=Path(__file__).resolve().parent;R=D.parents[2];B=D/'.build';B.mkdir(exist_ok=True)
I=R/'experiments/shim-c-v2/stage3-unary-front/.build/install';O=R/'experiments/shim-c-v2/environment-recovery-local/.build/opam/shim-local'
env=dict(os.environ);env['PATH']=str(O/'bin')+':'+env['PATH'];env['OCAMLPATH']=str(I/'lib')
cmd=[str(O/'bin/ocamlfind'),'ocamlopt','-thread','-shared','-linkall','-package','frama-c.kernel,frama-c-wp.core','-open','Frama_c_kernel','-o',str(B/'observer.cmxs'),'-impl','observer.ml']
(B/'observer.ml').write_bytes((D/'observer.ml').read_bytes())
(D/'build-final-command.json').write_text(json.dumps(cmd,indent=2)+'\n')
r=subprocess.run(cmd,cwd=B,env=env,stdout=subprocess.PIPE,stderr=subprocess.STDOUT,text=True)
(D/'build-final.log').write_text(r.stdout)
print(r.returncode,r.stdout)
raise SystemExit(r.returncode)
