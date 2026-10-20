import pathlib,json,subprocess
p=pathlib.Path(__file__).parent
with (p/"verify.log").open("w") as f:
 try:
  r=subprocess.run(json.loads((p/"command.json").read_text()),stdout=f,stderr=subprocess.STDOUT,timeout=90)
  s={"exit_code":r.returncode}
 except subprocess.TimeoutExpired:s={"state":"administrative_timeout","seconds":90}
(p/"result.json").write_text(json.dumps(s,indent=2)+"\n")
print(s)
