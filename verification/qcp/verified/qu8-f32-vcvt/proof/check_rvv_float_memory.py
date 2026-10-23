#!/usr/bin/env python3
"""Fresh actual 32lane float getter/store-next/store bodies and typed gate."""
import argparse,hashlib,json,re,shutil,subprocess,tempfile,time
from pathlib import Path
HERE=Path(__file__).resolve().parent;CASE=HERE.parent
ROOT=next(p for p in CASE.parents if(p/'.git').exists());BASE=ROOT/'verification/qcp/verified/f32-vadd'
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--config',type=Path,required=True);p.add_argument('--dependency-dir',type=Path,required=True);a=p.parse_args();run=Path(tempfile.mkdtemp(prefix='rvv-float-memory-',dir=CASE/'.build'));coq=run/'coq';coq.mkdir();records=[]
 flags=json.loads(a.config.read_text())['flags'][2:]
 for d in sorted(a.dependency_dir.resolve().iterdir()):
  if d.is_dir():flags+=['-Q',str(d),''if d.name=='relations'else d.name]
 flags+=['-Q',str(coq),'Qu8Cvt']
 s={'passed':False,'whole_kernel_verified':False,'scope':'Actual three RVV float store helper C bodies only; fixed32 fields','run_directory':str(run),'records':records}
 inputs=[CASE/'shim/memory_rvv_f32.c',CASE/'shim/memory_rvv_f32.h',CASE/'shim/formal_types.h',CASE/'shim/formal_model.h',HERE/'coq/Model.v',HERE/'coq/Types.v'];hashes={str(q.relative_to(CASE)):sha(q)for q in inputs}
 def exe(cmd,label):
  w=run/'jobs'/label;w.mkdir(parents=True);t=time.monotonic()
  with(run/(label+'.log')).open('w')as f:r=subprocess.run(['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)],cwd=w,stdout=f,stderr=f,timeout=1200)
  records.append({'label':label,'exit_code':r.returncode,'command':list(map(str,cmd)),'seconds':time.monotonic()-t});print(label,r.returncode,flush=True)
  if r.returncode:raise RuntimeError((run/(label+'.log')).read_text()[-3500:])
 try:
  original=ROOT/'verification/qcp/verified/f32-vmin/shim/memory_rvv_store.c';body=original.read_text().split('float qcp_rvv_get32(',1)[1];actual=(CASE/'shim/memory_rvv_f32.c').read_text().split('float qcp_rvv_get32(',1)[1];assert body==actual,'Actual three C bodies changed from checked original donor'
  exe(['gcc','-E','-P','-CC','-nostdinc',CASE/'shim/memory_rvv_f32.c','-o',run/'memory_rvv_f32.c'],'cpp')
  cmd=['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--input-file='+str(run/'memory_rvv_f32.c'),'--coq-output-dir='+str(coq),'--coq-logic-path=Qu8Cvt']
  for ns in ['QcpRvv32','QcpVadd']:cmd+=['-slp',str(BASE/'proof/c'/ns),ns]
  exe(cmd,'qcp');goal=coq/'memory_rvv_f32_goal.v';names=re.findall(r'^Axiom proof_of_(\w+) :',goal.read_text(),re.M);assert len(names)==75
  for n in ['Model','UnsignedModel','Types','memory_rvv_f32_goal','CheckedRvvFloatMemory']:
   if(HERE/'coq'/(n+'.v')).exists():shutil.copyfile(HERE/'coq'/(n+'.v'),coq/(n+'.v'))
   exe(['qcp-env','coqc','-time',*flags,coq/(n+'.v')],n)
  (coq/'FinalRvvFloatMemory.v').write_text('From Qu8Cvt Require Import memory_rvv_f32_goal CheckedRvvFloatMemory.\nModule Final : Qu8Cvt.memory_rvv_f32_goal.VC_Correct := Qu8Cvt.CheckedRvvFloatMemory.Checked.\n'+''.join('Print Assumptions Final.proof_of_'+n+'.\n'for n in names));exe(['qcp-env','coqc','-time',*flags,coq/'FinalRvvFloatMemory.v'],'FinalRvvFloatMemory')
  assert hashes=={str(q.relative_to(CASE)):sha(q)for q in inputs};s.update(passed=True,vc_correct_passed=True,actual_c_vcs=len(names),fields=names,goal_sha256=sha(goal),cpp_sha256=sha(run/'memory_rvv_f32.c'),source_sha256=hashes,actual_body_donor_sha256=sha(original),checked_module='Qu8Cvt.CheckedRvvFloatMemory.Checked')
 except Exception as e:s['error']=str(e);print(e,flush=True)
 finally:
  for q in [run/'status.json',HERE/'rvv-float-memory-status.json']:q.write_text(json.dumps(s,indent=2)+'\n')
 print('RUN',run,flush=True);return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
