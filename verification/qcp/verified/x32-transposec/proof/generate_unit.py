#!/usr/bin/env python3
"""Fresh actual ordinary C helper generation; no body or whole-case credit."""
from pathlib import Path
import argparse,hashlib,json,os,re,subprocess,tempfile,time
C=Path(__file__).resolve().parents[1]
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 ap=argparse.ArgumentParser();ap.add_argument('--unit',choices=['scalar','control','strided_store','width','observe','caller'],required=True);ap.add_argument('--timeout',type=int,default=21600);a=ap.parse_args();r=Path(tempfile.mkdtemp(prefix=a.unit+'-generation-',dir=C/'.build'));stem=a.unit;src=C/'spec.c'if a.unit=='caller'else C/'shim'/(stem+'.c');assert src.is_file();gen=r/'generated';gen.mkdir();env={**os.environ,'PATH':str(C.parents[3]/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']};rec=[];pins={str(p.relative_to(C)):sha(p)for p in [Path(__file__),src,*sorted((C/'shim').glob('*.h')),*[C/'proof/coq'/(n+'.v')for n in ['WordModel','InputMemory','OutputMemory','Geometry','Types','VectorModel','ProgressModel','StrideModel','ProgramModel','ArithmeticModel','NeonProgramModel','ObservationModel']]]};s={'generation_passed':False,'whole_kernel_verified':False,'run_directory':str(r),'input_sha256':pins,'records':rec}
 def run(label,cmd,budget):
  cmd=['prlimit','--as=34359738368:34359738368','--',*map(str,cmd)];t=time.monotonic();log=r/(label+'.log')
  with log.open('w')as f:ec=subprocess.run(cmd,cwd=r,env=env,stdout=f,stderr=f,timeout=budget).returncode
  rec.append({'label':label,'command':cmd,'exit_code':ec,'seconds':time.monotonic()-t,'timeout_seconds':budget,'memory_GiB':32,'log_sha256':sha(log)});assert ec==0,log.read_text()[-4000:]
 try:
  inp=r/(stem+'.in.c');inp.write_text('#include "'+str(C/'shim/program_model.h')+'"\n#include "'+str(src)+'"\n');cpp=r/(stem+'.c');run('cpp',['gcc','-E','-P','-CC','-nostdinc',inp,'-o',cpp],180);run('qcp',['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--strategy-application-limit=4096','--input-file='+str(cpp),'--coq-output-dir='+str(gen),'--coq-logic-path=X32Transpose','-slp',C/'shim','X32Transpose'],a.timeout);g=gen/(stem+'_goal.v');fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',g.read_text(),re.M);assert fields;assert all(sha(C/p)==h for p,h in pins.items()),'input changed';s.update(generation_passed=True,generated_c_vcs=len(fields),fields=fields,goal_sha256=sha(g),cpp_sha256=sha(cpp))
 except Exception as e:s['error']=str(e)or'failed input guard'
 (r/'status.json').write_text(json.dumps(s,indent=2)+'\n');print(json.dumps({k:s.get(k)for k in ['generation_passed','run_directory','generated_c_vcs','error']}));return 0 if s['generation_passed']else 1
if __name__=='__main__':raise SystemExit(main())
