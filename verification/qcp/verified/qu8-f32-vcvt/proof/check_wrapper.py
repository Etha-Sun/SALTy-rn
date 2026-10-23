#!/usr/bin/env python3
"""Fresh ordinary Coq check of every live public wrapper C VC and strategy."""
import argparse,hashlib,json,re,shutil,subprocess,tempfile,time
from pathlib import Path
CASE=Path(__file__).resolve().parent.parent
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def main():
 p=argparse.ArgumentParser();p.add_argument('--config',type=Path,required=True);p.add_argument('--dependency-dir',type=Path,required=True);a=p.parse_args()
 gen=json.loads((CASE/'proof/wrapper-generation-status.json').read_text());assert gen['passed']and gen['public_spec_sha256']==sha(CASE/'spec.c')
 run=Path(tempfile.mkdtemp(prefix='wrapper-proof-',dir=CASE/'.build'));coq=run/'coq';coq.mkdir();flags=json.loads(a.config.read_text())['flags'][2:];records=[]
 for d in sorted(a.dependency_dir.resolve().iterdir()):
  if d.is_dir():flags+=['-Q',str(d),''if d.name=='relations'else d.name]
 flags+=['-Q',str(coq),'Qu8Cvt']
 s={'passed':False,'whole_kernel_verified':False,'scope':'Public comparator, caller and assert C only; actual kernel bodies still required','run_directory':str(run),'records':records}
 def exe(cmd,n):
  w=run/'jobs'/n;w.mkdir(parents=True);t=time.monotonic()
  with(run/(n+'.log')).open('w')as f:r=subprocess.run(['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)],cwd=w,stdout=f,stderr=f,timeout=600)
  records.append({'label':n,'exit_code':r.returncode,'seconds':time.monotonic()-t});print(n,r.returncode,flush=True)
  if r.returncode:raise RuntimeError((run/(n+'.log')).read_text()[-3500:])
 try:
  tool=Path(shutil.which('qcp')).resolve().parent/'StrategyCheck'
  exe([tool,'--arch=64','--endian=little','--no-exec-info','--input-file='+str(CASE/'proof/c/char_arrays.strategies'),'--coq-output-dir='+str(coq),'--coq-logic-path=Qu8Cvt'],'StrategyCheck')
  shutil.copyfile(Path(gen['run_directory'])/'wrapper_unit_goal.v',coq/'wrapper_unit_goal.v')
  for n in ['Model','UnsignedModel','Types','MemoryModel','ProgramModel','Observation','char_arrays_strategy_goal','UCharArraysStrategy','char_arrays_strategy_proof','wrapper_unit_goal','WrapperChecked']:
   if(CASE/'proof/coq'/(n+'.v')).exists():shutil.copyfile(CASE/'proof/coq'/(n+'.v'),coq/(n+'.v'))
   exe(['qcp-env','coqc','-time',*flags,coq/(n+'.v')],n)
  names=re.findall(r'^Axiom proof_of_(\w+) :',(coq/'wrapper_unit_goal.v').read_text(),re.M);assert len(names)==35
  (coq/'FinalWrapper.v').write_text('From Qu8Cvt Require Import wrapper_unit_goal WrapperChecked.\nModule Final : Qu8Cvt.wrapper_unit_goal.VC_Correct := Qu8Cvt.WrapperChecked.CheckedWrapper.\n'+''.join('Print Assumptions Final.proof_of_'+n+'.\n'for n in names))
  exe(['qcp-env','coqc','-time',*flags,coq/'FinalWrapper.v'],'FinalWrapper');s.update(passed=True,actual_c_vcs=len(names),vc_correct_passed=True)
 except Exception as e:s['error']=str(e);print(e,flush=True)
 finally:
  s['source_sha256']={str(q.relative_to(CASE)):sha(q)for q in [CASE/'spec.c',CASE/'proof/coq/WrapperChecked.v',CASE/'proof/c/wrapper.annotations.json']}
  for p in [run/'status.json',CASE/'proof/wrapper-proof-status.json']:p.write_text(json.dumps(s,indent=2)+'\n')
 print('RUN',run,flush=True);return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
