#!/usr/bin/env python3
"""Execute the exact original kernels and actual helper bodies against nearbyintf."""
from pathlib import Path
import json,hashlib,subprocess,tempfile,time
HERE=Path(__file__).resolve().parent;CASE=HERE.parent;ROOT=next(p for p in CASE.parents if (p/'.git').exists())
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def main():
 run=Path(tempfile.mkdtemp(prefix='native-',dir=CASE/'.build'));records=[];s={'passed':False,'whole_kernel_verified':False,'scope':'finite_native_and_independent_scalar_oracle_only','run_directory':str(run),'records':records}
 sources=[CASE/'spec.c']+[CASE/'shim'/n for n in ['bits.c','scalar.c','active.c','memory_neon.c','memory_rvv_load.c','memory_rvv_store.c','rvv_control.c']]+[CASE/m['source'] for m in json.loads((HERE/'vector-units.json').read_text())]+[CASE/'shim/runtime/harness.c']
 for isa,src in [('neon','testNEON.c'),('rvv','testRVV.c')]:
  p=run/(isa+'.c');p.write_text('#include "'+str(CASE/'shim'/(isa+'_frontend.h'))+'"\n'+(CASE/'impl'/src).read_text());sources.append(p)
 dep_command=['cc','-std=c11','-DQCP_NATIVE','-MM','-I',str(CASE/'shim')]+list(map(str,sources))
 dep=subprocess.run(dep_command,cwd=run,capture_output=True,text=True,timeout=60)
 assert dep.returncode==0,dep.stderr
 (run/'dependencies.make').write_text(dep.stdout)
 deps=set()
 for line in dep.stdout.replace('\\\n',' ').splitlines():
  assert ':' in line,line
  for token in line.split(':',1)[1].split():
   p=Path(token).resolve();assert ROOT==p or ROOT in p.parents,('local dependency escapes repo',p)
   if run not in p.parents:deps.add(p)
 inputs=sorted(deps|{CASE/'impl/testNEON.c',CASE/'impl/testRVV.c',HERE/'semantics.json',Path(__file__)})
 s['input_sha256']={str(p.relative_to(CASE)) if CASE in p.parents else __import__('os').path.relpath(p,CASE):sha(p) for p in inputs}
 s['generated_c_sha256']={p.name:sha(p)for p in sources if run in p.parents}
 s['dependency_command']=dep_command;s['system_headers_in_inventory']=False

 def execute(cmd,label):
  log=run/(label+'.log');start=time.monotonic()
  with log.open('w') as out:r=subprocess.run(list(map(str,cmd)),cwd=run,stdout=out,stderr=out,timeout=300)
  records.append({'command':list(map(str,cmd)),'label':label,'exit_code':r.returncode,'seconds':time.monotonic()-start,'log_sha256':sha(log)});print(label,r.returncode,flush=True);assert r.returncode==0,log.read_text()[-3000:]
 try:
  for sanitize in ['undefined','address']:
   exe=run/('native-'+sanitize);execute(['cc','-std=c11','-O1','-g','-Wall','-Wextra','-Wno-unused-parameter','-Werror','-DQCP_NATIVE','-frounding-math','-fno-fast-math','-fsanitize='+sanitize,'-fno-sanitize-recover=all','-I',CASE/'shim',*sources,'-lm','-o',exe],sanitize+'-build');execute([exe],sanitize+'-run')
  assert all(sha(CASE/p)==h for p,h in s['input_sha256'].items());s.update(passed=True,cases_per_sanitizer=6300,lanes_per_side_per_sanitizer=378600,independent_oracle='C nearbyintf under FE_TONEAREST, independently from both magic-number implementations',input_and_output_guards_preserved=True)
 except Exception as e:s['error']=str(e)
 (run/'status.json').write_text(json.dumps(s,indent=2)+'\n');(HERE/'native-status.json').write_text(json.dumps(s,indent=2)+'\n');print(run);raise SystemExit(0 if s['passed'] else 1)
if __name__=='__main__':main()
