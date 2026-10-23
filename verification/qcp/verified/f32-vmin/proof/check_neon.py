#!/usr/bin/env python3
"""Fresh ordinary Coq closure of the original NEON kernel and its memory C unit."""
import argparse,hashlib,json,re,shutil,subprocess,tempfile,time
from pathlib import Path
HERE=Path(__file__).resolve().parent;CASE=HERE.parent
ROOT=next(p for p in CASE.parents if(p/'.git').exists())
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def main():
 parser=argparse.ArgumentParser(description=__doc__)
 for n in ['config','dependency-dir','scalar-dir','vector-dir']:parser.add_argument('--'+n,type=Path,required=True)
 parser.add_argument('--generation-dir',type=Path);args=parser.parse_args()
 generation=args.generation_dir or Path(json.loads((HERE/'neon-generation-status.json').read_text())['run_directory'])
 gen=json.loads((generation/'status.json').read_text());assert gen['generation_passed'] and gen['same_frontend_cpp_tokens_identical']
 assert sha(CASE/'impl/testNEON.c')==gen['raw_c_sha256']
 for d in [args.scalar_dir,args.vector_dir]:assert json.loads((d.parent/'status.json').read_text())['passed']
 run=Path(tempfile.mkdtemp(prefix='neon-proof-',dir=CASE/'.build'));coq=run/'coq';coq.mkdir()
 flags=json.loads(args.config.read_text())['flags'][2:]
 for folder in sorted(args.dependency_dir.resolve().iterdir()):
  if folder.is_dir():flags+=['-Q',str(folder),''if folder.name=='relations'else folder.name]
 for folder in [args.scalar_dir,args.vector_dir,coq]:flags+=['-Q',str(folder.resolve()),'FMin']
 records=[];status={'passed':False,'whole_kernel_verified':False,'scope':'NEON kernel plus concrete NEON memory helpers; RVV and public wrapper still required','run_directory':str(run),'records':records}
 def execute(cmd,label,budget=1200):
  work=run/'jobs'/label;work.mkdir(parents=True);log=run/(label+'.log');cmd=['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)];start=time.monotonic()
  with log.open('w')as out:
   try:code=subprocess.run(cmd,cwd=work,stdout=out,stderr=out,timeout=budget).returncode
   except subprocess.TimeoutExpired:code=124
  records.append({'label':label,'command':cmd,'cwd':str(work),'exit_code':code,'seconds':time.monotonic()-start,'log_sha256':sha(log)});(run/'records.json').write_text(json.dumps(records,indent=2)+'\n');print(label,code,flush=True)
  if code:raise RuntimeError(log.read_text()[-6000:])
 def compile_module(n):
  if(HERE/'coq'/(n+'.v')).exists():shutil.copyfile(HERE/'coq'/(n+'.v'),coq/(n+'.v'))
  execute(['qcp-env','coqc','-time',*flags,coq/(n+'.v')],n)
 try:
  shutil.copyfile(generation/'neon_unit_goal.v',coq/'neon_unit_goal.v')
  for n in ['ProgramModel','NeonSupport','neon_unit_goal']:compile_module(n)
  execute(['gcc','-E','-P','-CC','-nostdinc',CASE/'shim/memory_neon.c','-o',run/'memory_neon.c'],'memory-cpp',60)
  execute(['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--input-file='+str(run/'memory_neon.c'),'--coq-output-dir='+str(coq),'--coq-logic-path=FMin','-slp',CASE/'shim','FMin'],'memory-qcp',300)
  compile_module('memory_neon_goal')
  names=re.findall(r'^Axiom proof_of_(\w+) :',(coq/'memory_neon_goal.v').read_text(),re.M)
  assert names and len(names)==len(set(names))
  proof='''From Coq Require Import ZArith Lia.
From FMin Require Import Types VectorFastFrame memory_neon_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedNeonMemoryHelpers : FMin.memory_neon_goal.VC_Correct.
'''
  for n in names:
   proof+=f'Lemma proof_of_{n} : {n}.\nProof. unfold {n}; unfold UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t; pre_process;subst;entailer!. Qed.\n'
  proof+='End CheckedNeonMemoryHelpers.\n';(coq/'NeonMemoryHelpers.v').write_text(proof);compile_module('NeonMemoryHelpers')
  for n in ['NeonPure','NeonCalls','NeonLoop','NeonBranches','NeonReturns','NeonMemory','NeonChecked']:compile_module(n)
  kernel=re.findall(r'^Axiom proof_of_(\w+) :',(coq/'neon_unit_goal.v').read_text(),re.M)
  gate='''From FMin Require Import neon_unit_goal NeonChecked memory_neon_goal NeonMemoryHelpers.
Module FinalNeonKernel : FMin.neon_unit_goal.VC_Correct := NeonChecked.CheckedNeon.
Module FinalNeonMemory : FMin.memory_neon_goal.VC_Correct := NeonMemoryHelpers.CheckedNeonMemoryHelpers.
'''
  gate+='\n'.join('Print Assumptions FinalNeonKernel.proof_of_'+n+'.'for n in kernel)+'\n'
  gate+='\n'.join('Print Assumptions FinalNeonMemory.proof_of_'+n+'.'for n in names)+'\n'
  (coq/'FinalNeonCheck.v').write_text(gate);compile_module('FinalNeonCheck')
  status.update(passed=True,kernel_c_vcs=len(kernel),memory_helper_c_vcs=len(names),vc_correct_passed=True)
 except Exception as e:status['error']=str(e);print(e,flush=True)
 finally:
  status['proof_sources_sha256']={p.name:sha(p)for p in sorted(coq.glob('*.v'))}
  status['public_c_sha256']={str(p.relative_to(CASE)):sha(p)for p in [CASE/'spec.c',CASE/'impl/testNEON.c',CASE/'shim/memory_neon.c',CASE/'shim/memory_neon.h',CASE/'shim/neon_frontend.h',HERE/'c/neon.annotations.json']}
  for target in [run/'status.json',HERE/'neon-proof-status.json']:target.write_text(json.dumps(status,indent=2)+'\n')
 print('RUN',run);return 0 if status['passed']else 1
if __name__=='__main__':raise SystemExit(main())
