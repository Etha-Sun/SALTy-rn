#!/usr/bin/env python3
"""Generate actual C VC from an annotated ordinary-helper translation unit."""
from pathlib import Path
import argparse,subprocess,tempfile,json,time,hashlib,re,os,shutil
C=Path(__file__).resolve().parents[1];sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 p=argparse.ArgumentParser();p.add_argument('stem');p.add_argument('source');a=p.parse_args();assert re.fullmatch('[a-z_]+',a.stem);r=Path(tempfile.mkdtemp(prefix=a.stem+'-generation-',dir=C/'.build'));out=r/'generated';out.mkdir();src=r/(a.stem+'.in.c');src.write_text('#include "'+str(C/a.source)+'"\n');records=[];s={'passed':False,'whole_kernel_verified':False,'run_directory':str(r),'records':records}
 try:
  for label,cmd in [('cpp',['gcc','-E','-P','-CC','-nostdinc',src,'-o',r/(a.stem+'.c')]),('qcp',['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--strategy-application-limit=4096','--input-file='+str(r/(a.stem+'.c')),'--coq-output-dir='+str(out),'--coq-logic-path=X32Packw','-slp',C/'shim','X32Packw'])]:
   cmd=list(map(str,cmd));env={**os.environ,'PATH':str(C.parents[3]/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']};t=time.monotonic();v=subprocess.run(['prlimit','--as=17179869184:17179869184','--',*cmd],cwd=r,env=env,capture_output=True,timeout=300);log=r/(label+'.log');log.write_bytes(v.stdout+v.stderr);records.append({'label':label,'command':cmd,'exit_code':v.returncode,'seconds':time.monotonic()-t,'log_sha256':sha(log)});assert v.returncode==0,log.read_text()[-3000:]
  goal=out/(a.stem+'_goal.v');fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',goal.read_text(),re.M);assert fields;shutil.copy2(goal,C/'proof/coq'/goal.name);s.update(passed=True,actual_c_vcs=len(fields),fields=fields,goal_sha256=sha(goal),cpp_sha256=sha(r/(a.stem+'.c')))
 except Exception as e:s['error']=str(e)
 (r/'status.json').write_text(json.dumps(s,indent=2)+'\n');dest=C/'proof'/(a.stem+'-generation-status.json')
 if dest.exists():
  h=C/'proof/history';h.mkdir(exist_ok=True);(h/(dest.stem+'-'+sha(dest)+'.json')).write_bytes(dest.read_bytes())
 dest.write_bytes((r/'status.json').read_bytes());print(json.dumps({k:s.get(k)for k in ['passed','run_directory','actual_c_vcs','error']}));return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
