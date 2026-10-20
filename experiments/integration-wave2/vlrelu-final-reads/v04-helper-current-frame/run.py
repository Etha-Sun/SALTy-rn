import pathlib,json,subprocess,os,signal
p=pathlib.Path(__file__).parent
env=dict(os.environ);env["PATH"]="/zp_vegeta/scratch_sb/ycsun/verus/research/agent-qs8-rsum/provers/bin:"+env["PATH"]
with (p/"verify.log").open("w") as f:
 proc=subprocess.Popen(json.loads((p/"command.json").read_text()),stdout=f,stderr=subprocess.STDOUT,env=env,start_new_session=True)
 try:s={"exit_code":proc.wait(timeout=90)}
 except subprocess.TimeoutExpired:
  os.killpg(proc.pid,signal.SIGTERM);proc.wait();s={"state":"administrative_timeout","seconds":90}
(p/"result.json").write_text(json.dumps(s,indent=2)+"\n");print(s)
