import subprocess,json,pathlib
p=pathlib.Path(__file__).parent
with (p/"sequent.log").open("w") as f: r=subprocess.run(json.loads((p/"command.json").read_text()),stdout=f,stderr=subprocess.STDOUT)
print(r.returncode)
