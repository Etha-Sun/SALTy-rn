import json,subprocess, pathlib
p=pathlib.Path(__file__).resolve().parent
d=json.loads((p/"print-r1-command.json").read_text())
with (p/"print-r1.log").open("x") as f:
 try: r=subprocess.run(d["command"],cwd=d["cwd"],stdout=f,stderr=subprocess.STDOUT,timeout=180); code=r.returncode
 except subprocess.TimeoutExpired: code=124
(p/"print-r1-result.json").write_text(json.dumps({"exit":code,"scope":"none formula only"}))
print(code)
