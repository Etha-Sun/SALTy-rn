#!/usr/bin/env python3
"""Use the existing QCP/C coverage pipeline for this case's real primitive body unit."""
from pathlib import Path
import argparse
import hashlib
import importlib.util
import json
import os
import re
import shutil
import subprocess
import tempfile
import time

HERE=Path(__file__).resolve().parent;CASE=HERE.parent
ROOT=next(p for p in CASE.parents if (p/'.git').exists())
BASE=ROOT/'verification/qcp/verified/f32-vadd'
EXPECTED={'qcp_vcmul_'+s for s in ['mul','add','sub','mla','mls','active_mul','active_add','active_sub']}|{'vmulq_f32','vmlaq_f32','vmlsq_f32','__riscv_vfmul_vv_f32m4','__riscv_vfadd_vv_f32m4','__riscv_vfsub_vv_f32m4'}
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 p=argparse.ArgumentParser();p.add_argument('--config',type=Path,required=True);p.add_argument('--dependency-dir',type=Path,required=True);p.add_argument('--generate-only',action='store_true');p.add_argument('--resume-run',type=Path);a=p.parse_args()
 os.environ['PYTHONDONTWRITEBYTECODE']='1'
 cfg=json.loads(a.config.read_text());dep=a.dependency_dir.resolve()
 build=CASE/'.build';build.mkdir(exist_ok=True)
 run=a.resume_run.resolve() if a.resume_run else Path(tempfile.mkdtemp(prefix='primitives-',dir=build));coq=run/'coq';coq.mkdir(exist_ok=True)
 if run.parent!=build.resolve():raise RuntimeError('Resume must stay inside this case build')
 files=[CASE/'shim/types.h',CASE/'shim/primitives.c',CASE/'shim/primitives.h',HERE/'coq/Model.v',HERE/'coq/FastFrame.v',Path(__file__),BASE/'proof/coverage.py']
 hashes={str(x.relative_to(ROOT)):sha(x) for x in files}
 if a.resume_run and json.loads((run/'inputs.json').read_text())!=hashes:raise RuntimeError('Primitive inputs changed; use a fresh run')
 (run/'inputs.json').write_text(json.dumps(hashes,indent=2)+'\n')
 flags=cfg['flags'][2:]
 for d in sorted(dep.iterdir()):
  if d.is_dir():flags+=['-Q',str(d),'' if d.name=='relations' else d.name]
 flags+=['-Q',str(coq),'VCMul']
 records=[];status={'passed':False,'whole_kernel_verified':False,'run_directory':str(run),'records':records,'scope':'Actual primitive C VC capability only; no original-kernel proof'}
 def execute(cmd,label,timeout=180):
  cmd=list(map(str,cmd));cwd=run/'jobs'/label;cwd.mkdir(parents=True,exist_ok=True);log=run/(label+'.log');started=time.monotonic()
  with log.open('w')as out:
   try:code=subprocess.run(cmd,cwd=cwd,stdout=out,stderr=subprocess.STDOUT,timeout=timeout).returncode
   except subprocess.TimeoutExpired:code=124
  records.append({'command':cmd,'label':label,'exit_code':code,'seconds':time.monotonic()-started,'log_sha256':sha(log),'cwd':str(cwd)})
  print(label,code,flush=True)
  if code:raise RuntimeError(log.read_text()[-7000:])
 def compile(name):execute(['qcp-env','coqc','-time',*flags,coq/(name+'.v')],name,900 if name=='PrimitivesChecked' else 180)
 try:
  if not a.resume_run:
   execute(['gcc','-E','-P','-CC','-nostdinc',CASE/'shim/primitives.c','-o',run/'primitives.c'],'cpp')
   spec=importlib.util.spec_from_file_location('vadd_coverage',BASE/'proof/coverage.py');cov=importlib.util.module_from_spec(spec);spec.loader.exec_module(cov);cov.C_KEYWORDS.add('return')
   definitions={};declarations={};calls={}
   for name,sig,contract,cs in cov._functions((run/'primitives.c').read_text(),'VCMul'):
    if name in declarations and declarations[name]!=(sig,contract):raise ValueError('Contract/signature mismatch '+name)
    declarations[name]=(sig,contract)
    if cs is not None:
     if name in definitions:raise ValueError('Duplicate body '+name)
     definitions[name]=True;calls[name]=sorted(cs)
   if set(definitions)!=EXPECTED:raise ValueError('Primitive C body coverage changed')
   missing=set(declarations)-set(definitions)|{f for c in calls.values()for f in c}-set(definitions)
   if missing:raise ValueError('C declarations/calls lack bodies: '+repr(missing))
   status['coverage']={'definitions':sorted(definitions),'calls':calls,'external_callees':[]}
   execute(['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--input-file='+str(run/'primitives.c'),'--coq-output-dir='+str(coq),'--coq-logic-path=VCMul'],'qcp',180)
   shutil.copyfile(HERE/'coq/Model.v',coq/'Model.v');compile('Model');compile('primitives_goal')
   (run/'generation.json').write_text(json.dumps({'goal_sha256':sha(coq/'primitives_goal.v'),'source_sha256':sha(run/'primitives.c'),'coverage':status['coverage'],'records':records},indent=2)+'\n')
  else:
   g=json.loads((run/'generation.json').read_text())
   if sha(coq/'primitives_goal.v')!=g['goal_sha256'] or sha(run/'primitives.c')!=g['source_sha256']:raise RuntimeError('Fresh input/goal changed')
   status['coverage']=g['coverage'];status['generation_records']=g['records']
  names=re.findall(r'^Axiom proof_of_(\w+) :',(coq/'primitives_goal.v').read_text(),re.M)
  status['generated_c_vcs']=len(names)
  if a.generate_only:status['generation_passed']=True
  else:
   proof=HERE/'coq/PrimitivesChecked.v';text=proof.read_text();clean=re.sub(r'\(\*.*?\*\)','',text,flags=re.S)
   if re.search(r'\b(?:Axiom|Parameter|Admitted|admit)\b',clean):raise RuntimeError('Unchecked proof declaration')
   if set(re.findall(r'^Lemma proof_of_(\w+) :',text,re.M))!=set(names):raise RuntimeError('Exact fresh VC proof coverage required')
   shutil.copyfile(HERE/'coq/FastFrame.v',coq/'FastFrame.v');compile('FastFrame')
   shutil.copyfile(proof,coq/proof.name);compile('PrimitivesChecked')
   gate='From VCMul Require Import primitives_goal PrimitivesChecked.\nModule Gate : primitives_goal.VC_Correct := PrimitivesChecked.CheckedPrimitives.\n'+'\n'.join('Print Assumptions Gate.proof_of_'+n+'.'for n in names)+'\n'
   (coq/'PrimitiveGate.v').write_text(gate);compile('PrimitiveGate')
   status.update(passed=True,vc_correct_passed=True,checked_c_vcs=len(names),proof_sha256=sha(proof),gate_sha256=sha(coq/'PrimitiveGate.v'))
  for path in files:
   if sha(path)!=hashes[str(path.relative_to(ROOT))]:raise RuntimeError('Inputs changed during checking')
  status.update(source_sha256=hashes,goal_sha256=sha(coq/'primitives_goal.v'),cpp_sha256=sha(run/'primitives.c'))
 except Exception as exc:status['error']=str(exc);print(exc,flush=True)
 finally:
  (run/'status.json').write_text(json.dumps(status,indent=2)+'\n');(HERE/'primitive-status.json').write_text(json.dumps(status,indent=2)+'\n');print('RUN',run,flush=True)
 return 0 if status.get('generation_passed') or status['passed'] else 1
if __name__=='__main__':raise SystemExit(main())
