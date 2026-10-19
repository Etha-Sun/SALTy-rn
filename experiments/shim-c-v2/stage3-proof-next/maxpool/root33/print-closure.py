import json,subprocess, pathlib
p=pathlib.Path(__file__).resolve().parent
d=json.loads((p/"print-closure-command.json").read_text())
with (p/"print-closure.log").open("x") as f:
 try: r=subprocess.run(d["command"],cwd=d["cwd"],stdout=f,stderr=subprocess.STDOUT,timeout=600); code=r.returncode
 except subprocess.TimeoutExpired: code=124
(p/"print-closure-result.json").write_text(json.dumps({"exit":code,"scope":"none formula only"}))
print(code)
