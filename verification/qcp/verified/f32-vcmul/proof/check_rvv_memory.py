#!/usr/bin/env python3
"""Check the three real RVV16 load/VL helper bodies and their exact C-call closure."""
import argparse,hashlib,importlib.util,json,re,shutil,subprocess,tempfile,time
from pathlib import Path
HERE=Path(__file__).resolve().parent;CASE=HERE.parent
ROOT=next(p for p in CASE.parents if(p/'.git').exists())
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--config',type=Path,required=True);p.add_argument('--dependency-dir',type=Path,required=True);a=p.parse_args()
 cfg=json.loads(a.config.read_text());dep=a.dependency_dir.resolve();dependency=json.loads((dep.parent/'status.json').read_text());assert dependency['passed']and dependency['scope']=='full';run=Path(tempfile.mkdtemp(prefix='rvv-memory-proof-',dir=CASE/'.build'));coq=run/'coq';coq.mkdir();records=[]
 flags=cfg['flags'][2:]
 for folder in sorted(dep.iterdir()):
  if folder.is_dir():flags+=['-Q',str(folder),''if folder.name=='relations'else folder.name]
 flags+=['-Q',str(coq),'VCMul']
 sources=[CASE/'shim/rvv_memory.c',CASE/'shim/rvv_memory.h',CASE/'shim/rvv_memory_def.h',CASE/'shim/types.h',HERE/'coq/Model.v',HERE/'coq/FastFrame.v',HERE/'coq/WindowMemory.v',HERE/'coq/RvvMemoryModel.v',HERE/'coq/RvvMemoryChecked.v',Path(__file__)]
 hashes={str(p.relative_to(CASE)):sha(p)for p in sources}
 status={'passed':False,'whole_kernel_verified':False,'scope':'Three real RVV16 load/VL C bodies preserving whole input arrays; no complete kernel proof','run_directory':str(run),'records':records,'sources_sha256':hashes}
 def execute(cmd,label,timeout=300):
  prlimit=shutil.which('prlimit');assert prlimit,'Linux prlimit required'
  cmd=[prlimit,'--as=17179869184:17179869184','--',*map(str,cmd)];work=run/'jobs'/label;work.mkdir(parents=True,exist_ok=True);start=time.monotonic();log=run/(label+'.log')
  with log.open('w')as out:
   try:code=subprocess.run(cmd,cwd=work,stdout=out,stderr=out,timeout=timeout).returncode
   except subprocess.TimeoutExpired:code=124
  records.append({'command':cmd,'label':label,'exit_code':code,'seconds':time.monotonic()-start,'log_sha256':sha(log)})
  print(label,code,flush=True)
  if code:raise RuntimeError(log.read_text()[-7000:])
 try:
  execute(['gcc','-E','-P','-CC','-nostdinc',CASE/'shim/rvv_memory.c','-o',run/'rvv_memory.c'],'cpp')
  coverage_file=ROOT/'verification/qcp/verified/f32-vadd/proof/coverage.py'
  spec=importlib.util.spec_from_file_location('window_coverage',coverage_file);coverage=importlib.util.module_from_spec(spec);spec.loader.exec_module(coverage);coverage.C_KEYWORDS.add('return')
  functions=list(coverage._functions((run/'rvv_memory.c').read_text(),'VCMul.rvv_memory'));declarations={};definitions={}
  for name,signature,contract,calls in functions:
   if name in declarations:assert declarations[name]==(signature,contract),'Declaration/body contract mismatch'
   declarations[name]=(signature,contract)
   if calls is not None:assert name not in definitions;definitions[name]=calls
  assert set(definitions)=={'qcp_vcmul_read_lane','qcp_vcmul_load16','__riscv_vsetvl_e32m4'}and set(declarations)==set(definitions),'Unexpected C definition/declaration'
  assert {callee for calls in definitions.values()for callee in calls}<=set(definitions),'Unchecked external C callee'
  status['coverage']={'functions':sorted(definitions),'external_c_callees':[],'declaration_body_contracts_exact':True,'coverage_checker_sha256':sha(coverage_file)}
  execute(['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--input-file='+str(run/'rvv_memory.c'),'--coq-output-dir='+str(coq),'--coq-logic-path=VCMul'],'qcp')
  names=re.findall(r'^Axiom proof_of_(\w+) :',(coq/'rvv_memory_goal.v').read_text(),re.M)
  proof=(HERE/'coq/RvvMemoryChecked.v').read_text();assert set(names)==set(re.findall(r'^Lemma proof_of_(\w+) :',proof,re.M))and len(names)==58
  for name in ['Model','FastFrame','WindowMemory','RvvMemoryModel','rvv_memory_goal','RvvMemoryChecked']:
   if name!='rvv_memory_goal':
    source=HERE/'coq'/(name+'.v');clean=re.sub(r'\(\*.*?\*\)','',source.read_text(),flags=re.S);assert not re.search(r'\b(Axiom|Parameter|Admitted|admit)\b',clean);shutil.copyfile(source,coq/source.name)
   execute(['qcp-env','coqc','-time',*flags,coq/(name+'.v')],name)
  gate='From VCMul Require Import rvv_memory_goal RvvMemoryChecked.\nModule Gate : rvv_memory_goal.VC_Correct := RvvMemoryChecked.CheckedMemory.\n'+'\n'.join('Print Assumptions Gate.proof_of_'+n+'.'for n in names)+'\n';(coq/'RvvMemoryGate.v').write_text(gate)
  execute(['qcp-env','coqc','-time',*flags,coq/'RvvMemoryGate.v'],'RvvMemoryGate')
  assert all(sha(CASE/k)==v for k,v in hashes.items()),'Inputs changed'
  status.update(passed=True,checked_c_vcs=58,checked_c_functions=sorted(definitions),external_c_callees=[],vc_correct_passed=True,goal_sha256=sha(coq/'rvv_memory_goal.v'),gate_sha256=sha(coq/'RvvMemoryGate.v'),config_sha256=sha(a.config),dependency_directory=str(dep),dependency_status_sha256=sha(dep.parent/'status.json'),tool_sha256={name:sha(Path(shutil.which(name)).resolve())for name in ['qcp','qcp-env','coqc','prlimit']})
 except Exception as error:status['error']=str(error);print(error,flush=True)
 finally:
  (run/'status.json').write_text(json.dumps(status,indent=2)+'\n');(HERE/'rvv-memory-status.json').write_text(json.dumps(status,indent=2)+'\n');print('RUN',run,flush=True)
 return 0 if status['passed'] else 1
if __name__=='__main__':raise SystemExit(main())
