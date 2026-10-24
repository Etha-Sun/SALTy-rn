#!/usr/bin/env python3
"""Fresh checked C literal providers and exact RNE decimal/power/bit bridges."""
from pathlib import Path
import json,re,subprocess,tempfile,time,hashlib,shutil
H=Path(__file__).resolve().parent;C=H.parent;R=next(p for p in C.parents if(p/'.git').exists());sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def main():
 run=Path(tempfile.mkdtemp(prefix='literal-proof-',dir=C/'.build'));coq=run/'coq';coq.mkdir();records=[];sources=[C/'shim/literals.c',C/'shim/literals.h',C/'shim/scalar.h',C/'shim/bits.h',H/'coq/Bits.v',H/'coq/Model.v',H/'coq/LiteralModel.v',H/'coq/Literal.v',Path(__file__)];inputs={str(p.relative_to(C)):sha(p)for p in sources};s={'passed':False,'whole_kernel_verified':False,'scope':'literal_helpers_and_exact_constant_bridge_only','run_directory':str(run),'records':records,'input_sha256':inputs}
 cfg=json.loads((R/'.build/simple-kernels-bootstrap/coq-flags.json').read_text());dep=R/'verification/qcp/verified/f32-vadd/.build/full-1f5wequq/coq';flags=cfg['flags']+sum((['-Q',str(p),''if p.name=='relations'else p.name]for p in sorted(dep.iterdir())if p.is_dir()),[])+['-Q',str(coq),'F32F16']
 def execute(cmd,label):
  cmd=list(map(str,cmd));work=run/'jobs'/label;work.mkdir(parents=True);log=run/(label+'.log');t=time.monotonic()
  with log.open('w')as f:
   try:ec=subprocess.run(['prlimit','--as=17179869184:17179869184','--']+cmd,cwd=work,stdout=f,stderr=f,timeout=1800).returncode
   except subprocess.TimeoutExpired:ec=124
  records.append({'label':label,'command':cmd,'exit_code':ec,'seconds':time.monotonic()-t,'log_sha256':sha(log)});print(label,ec,flush=True);assert ec==0,log.read_text()[-5000:]
 try:
  execute(['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--input-file='+str(C/'shim/literals.c'),'--coq-output-dir='+str(coq),'--coq-logic-path=F32F16','-slp',str(C/'shim'),'F32F16'],'qcp')
  fs=re.findall(r'^Axiom proof_of_(\w+) :',(coq/'literals_goal.v').read_text(),re.M);assert len(fs)==2 and set(fs)=={'qcp_f16_scale_hi_return_wit_1','qcp_f16_scale_lo_return_wit_1'}
  for n in ['Bits','Model','LiteralModel','Literal']:shutil.copyfile(H/'coq'/(n+'.v'),coq/(n+'.v'))
  text='From F32F16 Require Import Bits Model Literal literals_goal.\nImport Snaive_C_Rules64. Local Open Scope sac.\nModule CheckedLiterals : F32F16.literals_goal.VC_Correct.\n'
  for f in fs:text+=f'Lemma proof_of_{f} : F32F16.literals_goal.{f}.\nProof. unfold F32F16.literals_goal.{f}; left; intros; unfold f16_same_bits in *; rewrite ?f16_scale_hi_decimal, ?f16_scale_lo_decimal in *; entailer!. Qed.\n'
  text+='End CheckedLiterals.\n'+'\n'.join('Print Assumptions CheckedLiterals.proof_of_'+f+'.'for f in fs)+'\n';(coq/'LiteralsChecked.v').write_text(text)
  for n in ['Bits','Model','LiteralModel','Literal','literals_goal','LiteralsChecked']:execute(flags+[str(coq/(n+'.v'))],n)
  for n in ['literals_goal','LiteralsChecked']:shutil.copyfile(coq/(n+'.v'),H/'coq'/(n+'.v'))
  assert all(sha(C/p)==v for p,v in inputs.items());s.update(passed=True,vc_correct_passed=True,checked_c_vcs=2,fields=fs,goal_sha256=sha(coq/'literals_goal.v'),checked_module='F32F16.LiteralsChecked.CheckedLiterals',source_sha256={**inputs,'proof/coq/LiteralsChecked.v':sha(H/'coq/LiteralsChecked.v')})
 except Exception as e:s['error']=str(e)
 (run/'status.json').write_text(json.dumps(s,indent=2)+'\n');(H/'literal-status.json').write_text(json.dumps(s,indent=2)+'\n');print(run);raise SystemExit(0 if s['passed'] else 1)
if __name__=='__main__':main()
