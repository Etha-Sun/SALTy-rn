from pathlib import Path
import json,subprocess,os,time
D=Path(__file__).resolve().parent;R=D.parents[2]
for base in ['none','qedfast']:
 name=base+'-observer01';p=D/name;p.mkdir(); cmd=json.loads((D/base/'command.json').read_text());cmd=[v.replace('/'+base+'/', '/'+name+'/') for v in cmd];cmd[1:1]=['-load-script',str(D/'observer.ml')]
 (p/'command.json').write_text(json.dumps(cmd,indent=2)+'\n');env=dict(os.environ);env['WP_OBSERVER_JSONL']=str(p/'events.jsonl');t=time.monotonic()
 with (p/'run.log').open('w') as f:
  try:result=subprocess.run(cmd,cwd=R,env=env,stdout=f,stderr=subprocess.STDOUT,timeout=45);code=result.returncode
  except subprocess.TimeoutExpired:code=124
 (p/'result.json').write_text(json.dumps({'exit':code,'seconds':time.monotonic()-t},indent=2)+'\n');print(name,code,flush=True)
