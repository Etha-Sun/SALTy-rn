"""Compile an independently audited prototype. No model qualification implied."""
from pathlib import Path
import os,json,subprocess,time,hashlib
H=Path(__file__).resolve().parent;B=H.parent;R=B/"environment-recovery-local";audit=json.loads((H/"source-audit.json").read_text())
for n,d in audit["source_after"].items():
 assert hashlib.sha256((H/".build/source"/n).read_bytes()).hexdigest()==d,n
assert not (H/"build-result.json").exists()
env=os.environ|{"OPAMROOT":str(R/".build/opam"),"OPAMSWITCH":"shim-local","OPAMJOBS":"2","CPATH":str(R/".build/gmp/usr/include/x86_64-linux-gnu")+":"+str(R/".build/gmp/usr/include"),"LIBRARY_PATH":str(R/".build/gmp/usr/lib/x86_64-linux-gnu"),"PKG_CONFIG_PATH":str(R/".build/gmp/usr/lib/x86_64-linux-gnu/pkgconfig")}
prefix=[str(R/".build/downloads/opam"),"exec","--","dune"]
commands=[prefix+["build","-j","2","--release","--promote-install-files=false","@install"],prefix+["install","--release","--prefix="+str(H/".build/install")]]
rows=[]
with (H/"build.log").open("x") as out:
 for cmd in commands:
  t=time.monotonic();r=subprocess.run(cmd,cwd=H/".build/source",env=env,stdout=out,stderr=subprocess.STDOUT);rows.append({"command":cmd,"exit":r.returncode,"seconds":round(time.monotonic()-t,3)})
  if r.returncode:break
(H/"build-result.json").write_text(json.dumps({"commands":rows,"status":"compiled-unqualified" if len(rows)==2 and not rows[-1]["exit"] else "build-failed"},indent=2)+"\n")
print(rows,flush=True)
