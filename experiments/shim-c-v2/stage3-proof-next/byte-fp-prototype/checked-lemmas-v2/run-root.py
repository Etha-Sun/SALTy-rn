from pathlib import Path
import json,sys,subprocess,time,hashlib,os,signal
H=Path(__file__).resolve().parent;prover=sys.argv[1];out=H/("root-"+prover+"01");out.mkdir(exist_ok=False);cmds=json.loads((H/"commands.json").read_text());sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();inputs={str(p):sha(p) for p in [H/"checked.mlw",H/"negative.mlw",H/"commands.json",Path(__file__).resolve()]};results=[]
for typ in ["checked","negative"]:
 cmd=cmds["prove-"+prover+"-"+typ]["command"];t=time.monotonic()
 with (out/(typ+".log")).open("x") as log:
  p=subprocess.Popen(cmd,stdout=log,stderr=subprocess.STDOUT,start_new_session=True)
  try:code=p.wait(timeout=300)
  except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait();code=124
 results.append({"type":typ,"command":cmd,"exit":code,"seconds":round(time.monotonic()-t,3),"log_sha256":sha(out/(typ+".log"))})
(out/"result.json").write_text(json.dumps({"runs":results,"input_sha256":inputs,"inputs_unchanged":all(sha(Path(p))==d for p,d in inputs.items()),"model_qualification":False},indent=2)+"\n");print(results,flush=True)
