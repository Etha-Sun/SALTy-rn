from pathlib import Path
import json,os,subprocess,time,hashlib,sys
D=Path(__file__).resolve().parent;cases=json.loads((D/'commands.json').read_text());name=sys.argv[1];v=cases[name];L=D/name;L.mkdir(exist_ok=False);env=os.environ|v['env'];start=time.monotonic()
with (L/'run.log').open('x') as f:
 try:r=subprocess.run(v['command'],cwd=v['cwd'],env=env,stdout=f,stderr=subprocess.STDOUT,timeout=v['budget']);code=r.returncode
 except subprocess.TimeoutExpired:code=124
files={str(p.relative_to(D)):hashlib.sha256(p.read_bytes()).hexdigest() for p in (L/'generated').rglob('*') if p.is_file()} if (L/'generated').exists() else {}
(L/'result.json').write_text(json.dumps({'exit':code,'seconds':time.monotonic()-start,'solver_invoked':False,'no_verification_result_claimed':True,'generated_sha256':files,'backend':'/bin/true dummy output only'},indent=2)+'\n');print(name,code,len(files))
