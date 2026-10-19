from pathlib import Path
import subprocess,json,hashlib,time,os
H=Path(__file__).resolve().parent;B=H.parent;D=H/'.build/observer-new';D.mkdir(parents=True,exist_ok=False)
S=B/'stage3-inventory-research/observer.ml';sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();assert sha(S)=='d7402c109ac22c9f2b09274d80dcb771fef7155bef8f9846890ff9a04e9936c6'
(D/'observer.ml').write_bytes(S.read_bytes());O=B/'environment-recovery-local/.build/opam/shim-local'
cmd=[str(O/'bin/ocamlfind'),'ocamlopt','-thread','-shared','-linkall','-package','frama-c.kernel,frama-c-wp.core','-open','Frama_c_kernel','-o',str(D/'observer.cmxs'),'-impl','observer.ml']
t=time.monotonic();r=subprocess.run(cmd,cwd=D,env=os.environ|{'PATH':str(O/'bin')+':'+os.environ['PATH'],'OCAMLPATH':str(H/'.build/install/lib')},capture_output=True,text=True)
(H/'observer-build01.log').write_text(r.stdout+r.stderr);m={'command':cmd,'exit':r.returncode,'seconds':time.monotonic()-t,'source_sha256':sha(S),'binary_sha256':sha(D/'observer.cmxs') if r.returncode==0 else None,'qualified':False};(H/'observer-build01.json').write_text(json.dumps(m,indent=2)+'\n');print(m)
