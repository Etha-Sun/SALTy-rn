#!/usr/bin/env python3
"""Replay actual float store4/store2/lane0/assert C bodies from source."""
import argparse,hashlib,json,re,shutil,subprocess,tempfile,time
from pathlib import Path
HERE=Path(__file__).resolve().parent;CASE=HERE.parent
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--config',type=Path,required=True);a=p.parse_args();run=Path(tempfile.mkdtemp(prefix='float-memory-',dir=CASE/'.build'));coq=run/'coq';coq.mkdir();flags=json.loads(a.config.read_text())['flags'][2:]+['-Q',str(coq),'Qu8Cvt'];records=[];s={'passed':False,'whole_kernel_verified':False,'scope':'Four actual float store/assert C helpers only','run_directory':str(run),'records':records}
 def exe(cmd,label):
  work=run/'jobs'/label;work.mkdir(parents=True);cmd=['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)];t=time.monotonic()
  with(run/(label+'.log')).open('w')as f:
   try:code=subprocess.run(cmd,cwd=work,stdout=f,stderr=f,timeout=600).returncode
   except subprocess.TimeoutExpired:code=124
  records.append({'label':label,'command':cmd,'exit_code':code,'seconds':time.monotonic()-t});(run/'records.json').write_text(json.dumps(records,indent=2)+'\n');print(label,code,flush=True)
  if code:raise RuntimeError((run/(label+'.log')).read_text()[-4000:])
 try:
  exe(['gcc','-E','-P','-CC','-nostdinc',CASE/'shim/memory_float.c','-o',run/'memory_float.c'],'cpp');exe(['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--input-file='+str(run/'memory_float.c'),'--coq-output-dir='+str(coq),'--coq-logic-path=Qu8Cvt'],'qcp')
  for n in ['Model','UnsignedModel','Types','FastFrame','memory_float_goal','FloatMemoryChecked']:
   if(HERE/'coq'/(n+'.v')).exists():shutil.copyfile(HERE/'coq'/(n+'.v'),coq/(n+'.v'))
   exe(['qcp-env','coqc','-time',*flags,coq/(n+'.v')],n)
  names=re.findall(r'^Axiom proof_of_(\w+) :',(coq/'memory_float_goal.v').read_text(),re.M);assert len(names)==14
  (coq/'FinalFloatMemoryCheck.v').write_text('From Qu8Cvt Require Import memory_float_goal FloatMemoryChecked.\nModule Final : Qu8Cvt.memory_float_goal.VC_Correct := Qu8Cvt.FloatMemoryChecked.CheckedFloatMemory.\n'+''.join('Print Assumptions Final.proof_of_'+n+'.\n'for n in names));exe(['qcp-env','coqc','-time',*flags,coq/'FinalFloatMemoryCheck.v'],'FinalFloatMemoryCheck');s.update(passed=True,vc_correct_passed=True,actual_c_vcs=len(names),goal_sha256=sha(coq/'memory_float_goal.v'))
 except Exception as e:s['error']=str(e);print(e,flush=True)
 finally:
  s['source_sha256']={str(p.relative_to(CASE)):sha(p)for p in [CASE/'shim/memory_float.c',CASE/'shim/memory_float.h',HERE/'coq/FloatMemoryChecked.v']}
  for p in [run/'status.json',HERE/'float-memory-status.json']:p.write_text(json.dumps(s,indent=2)+'\n')
 print('RUN',run,flush=True);return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
