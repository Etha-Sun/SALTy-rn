#!/usr/bin/env python3
"""Check all public wrapper/helper actual C VCs and print every assumption set."""
import argparse,hashlib,json,re,shutil,subprocess,tempfile,time
from pathlib import Path
HERE=Path(__file__).resolve().parent;CASE=HERE.parent
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def main():
 p=argparse.ArgumentParser(description=__doc__)
 for n in ['config','dependency-dir','scalar-dir','vector-dir','models-dir']:p.add_argument('--'+n,type=Path,required=True)
 p.add_argument('--generation-dir',type=Path);args=p.parse_args();generation=args.generation_dir or Path(json.loads((HERE/'wrapper-generation-status.json').read_text())['run_directory']);gen=json.loads((generation/'status.json').read_text());assert gen['generation_passed']and gen['same_frontend_cpp_tokens_identical'];assert sha(CASE/'spec.c')==gen['public_spec_sha256']
 for name in ['NanFacts','ProgramModel','Observation']:assert(HERE/'coq'/(name+'.v')).read_bytes()==(args.models_dir/(name+'.v')).read_bytes(),'Mathematical model source drift'
 run=Path(tempfile.mkdtemp(prefix='wrapper-proof-',dir=CASE/'.build'));coq=run/'coq';coq.mkdir();records=[]
 flags=json.loads(args.config.read_text())['flags'][2:]
 for d in sorted(args.dependency_dir.resolve().iterdir()):
  if d.is_dir():flags+=['-Q',str(d),''if d.name=='relations'else d.name]
 for d in [args.scalar_dir,args.vector_dir,args.models_dir,coq]:flags+=['-Q',str(d.resolve()),'FMin']
 status={'passed':False,'whole_kernel_verified':False,'scope':'Public wrapper, comparator, and readonly observation helper C only; both kernel bodies and their C call closure still required','run_directory':str(run),'records':records}
 def compile_module(n):
  source=HERE/'coq'/(n+'.v')
  if source.exists():shutil.copyfile(source,coq/(n+'.v'))
  work=run/'jobs'/n;work.mkdir(parents=True);log=run/(n+'.log');cmd=['prlimit','--as=17179869184:17179869184','--','qcp-env','coqc','-time',*flags,str(coq/(n+'.v'))];start=time.monotonic()
  with log.open('w')as out:
   try:code=subprocess.run(cmd,cwd=work,stdout=out,stderr=out,timeout=600).returncode
   except subprocess.TimeoutExpired:code=124
  records.append({'name':n,'command':cmd,'cwd':str(work),'exit_code':code,'seconds':time.monotonic()-start,'log_sha256':sha(log)});print(n,code,flush=True)
  if code:raise RuntimeError(log.read_text()[-6000:])
 try:
  shutil.copyfile(generation/'wrapper_unit_goal.v',coq/'wrapper_unit_goal.v')
  for n in ['wrapper_unit_goal','WrapperHelpers','WrapperCalls','WrapperChecked']:compile_module(n)
  names=re.findall(r'^Axiom proof_of_(\w+) :',(coq/'wrapper_unit_goal.v').read_text(),re.M);assert len(names)==len(set(names))==39
  gate='From FMin Require Import wrapper_unit_goal WrapperChecked.\nModule FinalWrapper : FMin.wrapper_unit_goal.VC_Correct := FMin.WrapperChecked.CheckedWrapper.\n'+'\n'.join('Print Assumptions FinalWrapper.proof_of_'+n+'.'for n in names)+'\n';(coq/'FinalWrapperCheck.v').write_text(gate);compile_module('FinalWrapperCheck');status.update(passed=True,actual_c_vcs=len(names),vc_correct_passed=True)
 except Exception as e:status['error']=str(e);print(e,flush=True)
 finally:
  status['source_sha256']={'spec.c':sha(CASE/'spec.c'),'proof/c/wrapper.annotations.json':sha(HERE/'c/wrapper.annotations.json')};status['proof_source_sha256']={q.name:sha(q)for q in coq.glob('*.v')}
  for q in [run/'status.json',HERE/'wrapper-proof-status.json']:q.write_text(json.dumps(status,indent=2)+'\n')
 print('RUN',run);return 0 if status['passed']else 1
if __name__=='__main__':raise SystemExit(main())
