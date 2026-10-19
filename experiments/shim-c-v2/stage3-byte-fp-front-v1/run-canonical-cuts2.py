"""Bounded controls for an isolated, UNQUALIFIED byte/IEEE prototype."""
from pathlib import Path
import sys,json,hashlib,subprocess,os,signal,time
H=Path(__file__).resolve().parent;B=H.parent;run,mode=sys.argv[1:3];budget=int(sys.argv[3]);F=sys.argv[4] if len(sys.argv)>4 else "";L=H/"controls"/run;L.mkdir(parents=True,exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();lock=H/"experimental-inputs01.json";watch=json.loads(lock.read_text())["files"];watch[str(H/"canonical-cuts02.c")]=sha(H/"canonical-cuts02.c");watch[str(lock)]=sha(lock);watch[str(Path(__file__).resolve())]=sha(Path(__file__).resolve());assert all(sha(Path(p))==s for p,s in watch.items())
cmd=[str(H/".build/install/bin/frama-c"),"-machdep","gcc_x86_64","-wp","-wp-rte","-wp-model","Bytes+float","-warn-special-float","none","-wp-share",str(H/"wp-share"),"-wp-why3-config",str(H/"why3.conf"),"-wp-no-why3-detect","-wp-prover","none" if mode=="print" else "z3,cvc5","-wp-timeout","30","-wp-memlimit","2048","-wp-par","1","-wp-cache","none","-wp-driver",str(H/"bytefloat.driver")+","+str(B/"model-fma/fma.driver"),"-cpp-command","gcc -E -C -I"+str(B/"model-plus/libc")+" -I.","-cpp-frama-c-compliant","-wp-debug","1","-wp-out",str(L/"generated"),"-wp-session",str(L/".build/session"),"-wp-report-json",str(L/"raw.json"),str(H/"canonical-cuts02.c")]
if mode=="print":cmd+=["-wp-print"]
if F:cmd+=["-wp-fct",F]
env=os.environ|{"OCAMLPATH":str(H/".build/install/lib"),"PATH":str(B/"handoff-solvers/.build/bin")+":"+os.environ["PATH"]};meta={"command":cmd,"cwd":str(H),"input_snapshot_sha256":sha(lock),"runner_sha256":sha(Path(__file__)),"budget_seconds":budget,"qualification":False};(L/"command.json").write_text(json.dumps(meta,indent=2)+"\n");t=time.monotonic()
with (L/"run.log").open("x") as out:
 p=subprocess.Popen(cmd,cwd=H,env=env,stdout=out,stderr=subprocess.STDOUT,start_new_session=True)
 try:code=p.wait(timeout=budget)
 except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait();code=124
raw=json.loads((L/"raw.json").read_text()) if (L/"raw.json").exists() else None
meta.update(exit=code,seconds=round(time.monotonic()-t,3),raw_total=len(raw) if raw is not None else None,raw_passed=sum(bool(x["passed"]) for x in raw) if raw is not None else None,inputs_unchanged=all(sha(Path(p))==s for p,s in watch.items()),pending=[x for x in raw if not x["passed"]] if raw is not None else None)
(L/"result.json").write_text(json.dumps(meta,indent=2)+"\n");print({k:meta[k] for k in ["exit","seconds","raw_total","raw_passed","inputs_unchanged"]},flush=True)
