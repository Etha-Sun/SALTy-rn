#!/usr/bin/env python3
"""Fresh actual borrowed self-ext2/ext4 bodies, full typed ordinary Coq gate."""
import argparse,hashlib,json,re,shutil,subprocess,tempfile,time
from pathlib import Path
CASE=Path(__file__).resolve().parent.parent
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 ap=argparse.ArgumentParser(description=__doc__);ap.add_argument('--config',type=Path,required=True);a=ap.parse_args();run=Path(tempfile.mkdtemp(prefix='ext-proof-',dir=CASE/'.build'));coq=run/'coq';coq.mkdir();records=[];s=dict(passed=False,vc_correct_passed=False,whole_kernel_verified=False,run_directory=str(run),records=records)
 def exe(label,cmd):
  cmd=['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)];log=run/(label+'.log');t=time.monotonic()
  with log.open('w')as f:r=subprocess.run(cmd,cwd=run,stdout=f,stderr=f,timeout=1200)
  records.append(dict(label=label,command=cmd,exit_code=r.returncode,seconds=time.monotonic()-t,log_sha256=sha(log)))
  if r.returncode:raise RuntimeError(label+': '+log.read_text()[-3000:])
 try:
  mods=['Model','Types','NeonFrame','NeonExtChecked'];names=['proof/check_ext.py','shim/scalar.h','shim/types.h','shim/types_def.h','shim/neon_ext.c','shim/neon_ext.h']+['proof/coq/'+n+'.v'for n in mods];hashes={n:sha(CASE/n)for n in names}
  src=run/'neon_ext.c';out=run/'generated';out.mkdir();exe('cpp',['gcc','-E','-P','-CC','-nostdinc',CASE/'shim/neon_ext.c','-o',src]);exe('qcp',['qcp','--arch=64','--endian=little','--no-exec-info','--input-file='+str(src),'--coq-output-dir='+str(out),'--coq-logic-path=Qs8I8Cvt','-slp',CASE/'shim','Qs8I8Cvt','-slp',CASE/'proof/c','Qs8I8Cvt']);goal=out/'neon_ext_goal.v';fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',goal.read_text(),re.M);assert len(fields)==10,len(fields);shutil.copyfile(goal,coq/goal.name)
  for n in mods:shutil.copyfile(CASE/'proof/coq'/(n+'.v'),coq/(n+'.v'))
  flags=list(json.loads(a.config.read_text())['flags'])+['-Q',str(coq),'Qs8I8Cvt']
  for n in ['Model','Types','NeonFrame','neon_ext_goal','NeonExtChecked']:exe(n,[*flags,coq/(n+'.v')])
  gate='Require Import Qs8I8Cvt.NeonExtChecked.\nModule Typed : Qs8I8Cvt.neon_ext_goal.VC_Correct := Qs8I8Cvt.NeonExtChecked.CheckedNeonExt.\n'+'\n'.join('Print Assumptions Typed.proof_of_'+n+'.'for n in fields)+'\n';(coq/'ExtGate.v').write_text(gate);exe('ExtGate',[*flags,coq/'ExtGate.v']);assert hashes=={n:sha(CASE/n)for n in names}
  s.update(passed=True,vc_correct_passed=True,checked_c_vcs=10,fields=fields,checked_module='Qs8I8Cvt.NeonExtChecked.CheckedNeonExt',input_sha256=hashes,cpp_sha256=sha(src),goal_sha256=sha(goal),final_gate_sha256=sha(coq/'ExtGate.v'),final_assumptions_log_sha256=sha(run/'ExtGate.log'),no_component_vo_reused=True)
 except Exception as e:s['error']=str(e)
 (run/'status.json').write_text(json.dumps(s,indent=2)+'\n');dest=CASE/'proof/ext-status.json'
 if dest.exists():old=dest.read_bytes();(CASE/'proof/history'/('ext-status-'+hashlib.sha256(old).hexdigest()+'.json')).write_bytes(old)
 dest.write_text(json.dumps(s,indent=2)+'\n');print(json.dumps({k:s.get(k)for k in ['passed','run_directory','checked_c_vcs','error']},indent=2));return 0 if s['passed'] else 1
if __name__=='__main__':raise SystemExit(main())
