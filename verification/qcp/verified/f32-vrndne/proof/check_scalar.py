#!/usr/bin/env python3
"""Fresh actual scalar C goals, ordinary Coq leaf proof groups, exact typed gate."""
from pathlib import Path
import json,hashlib,subprocess,tempfile,time,shutil,re,os,concurrent.futures,argparse
HERE=Path(__file__).resolve().parent;CASE=HERE.parent;ROOT=next(p for p in CASE.parents if (p/'.git').exists())
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def main():
 ap=argparse.ArgumentParser();ap.add_argument('--jobs',type=int,default=16);a=ap.parse_args()
 run=Path(tempfile.mkdtemp(prefix='scalar-proof-',dir=CASE/'.build'));coq=run/'coq';coq.mkdir();records=[]
 cfg=json.loads((ROOT/'.build/simple-kernels-bootstrap/coq-flags.json').read_text())
 dep=ROOT/'verification/qcp/verified/f32-vadd/.build/full-1f5wequq/coq'
 ns=[p.name for p in sorted(dep.iterdir()) if p.is_dir()]
 flags=list(cfg['flags'])+sum((['-Q',str(dep/n),'' if n=='relations' else n] for n in ns),[])+['-Q',str(coq),'Rndne']
 status={'passed':False,'whole_kernel_verified':False,'scope':'actual_scalar_helpers_only','run_directory':str(run),'records':records};sources=[CASE/'shim/scalar.c',CASE/'shim/scalar.h',CASE/'shim/bits.h',HERE/'coq/Model.v',HERE/'coq/Bits.v',HERE/'coq/ScalarSupport.v',Path(__file__)]
 status['input_sha256']={str(p.relative_to(CASE)):sha(p) for p in sources}
 def execute(cmd,label,timeout=600):
  cmd=list(map(str,cmd));log=run/(label+'.log');cwd=run/'jobs'/label;cwd.mkdir(parents=True,exist_ok=True);start=time.monotonic()
  try:
   with log.open('w') as out:r=subprocess.run(['prlimit','--as='+str(16*1024**3),'--']+cmd,cwd=cwd,stdout=out,stderr=out,timeout=timeout)
   ec=r.returncode
  except subprocess.TimeoutExpired:ec=124
  rec={'label':label,'command':cmd,'exit_code':ec,'seconds':time.monotonic()-start,'log':str(log),'log_sha256':sha(log)};records.append(rec);print(label,ec,flush=True);return ec
 try:
  if execute(['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--input-file='+str(CASE/'shim/scalar.c'),'--coq-output-dir='+str(coq),'--coq-logic-path=Rndne','-slp',CASE/'shim','Rndne'],'qcp'):raise RuntimeError('qcp failed')
  goal=(coq/'scalar_goal.v').read_text();fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',goal,re.M);assert fields
  for name in ['Bits','Model','ScalarSupport']:
   shutil.copyfile(HERE/'coq'/f'{name}.v',coq/f'{name}.v')
  for name in ['Bits','Model','scalar_goal','ScalarSupport']:
   if execute(flags+[coq/f'{name}.v'],name):raise RuntimeError(name+' failed')
  groups=[fields[i::a.jobs] for i in range(min(a.jobs,len(fields)))];names=[]
  for i,fs in enumerate(groups):
   name='ScalarPart'+str(i);names.append(name)
   text='From Rndne Require Import ScalarSupport scalar_goal.\nImport Snaive_C_Rules64.\nLocal Open Scope Z_scope.\nLocal Open Scope sac.\nModule Checked'+name+'.\n'
   for f in fs:text+=f'Lemma proof_of_{f} : Rndne.scalar_goal.{f}.\nProof. unfold Rndne.scalar_goal.{f}; rndne_scalar_finish. Qed.\n'
   text+='End Checked'+name+'.\n';(coq/(name+'.v')).write_text(text)
  results=list(concurrent.futures.ThreadPoolExecutor(max_workers=a.jobs).map(lambda n:execute(flags+[coq/(n+'.v')],n,1800),names))
  status['checked_c_vcs']=len(fields)
  if any(results):raise RuntimeError('scalar leaf group failed')
  text='From Rndne Require Import scalar_goal '+' '.join(names)+'.\nModule CheckedScalar : Rndne.scalar_goal.VC_Correct.\n'
  for n in names:text+='Include '+n+'.Checked'+n+'.\n'
  text+='End CheckedScalar.\n'+'\n'.join('Print Assumptions CheckedScalar.proof_of_'+f+'.' for f in fields)+'\n'
  (coq/'ScalarChecked.v').write_text(text)
  if execute(flags+[coq/'ScalarChecked.v'],'ScalarChecked',1800):raise RuntimeError('typed gate failed')
  for n in names+['ScalarChecked']:shutil.copyfile(coq/(n+'.v'),HERE/'coq'/(n+'.v'))
  shutil.copyfile(coq/'scalar_goal.v',HERE/'coq/scalar_goal.v')
  assert all(sha(CASE/p)==h for p,h in status['input_sha256'].items())
  status.update(passed=True,vc_correct_passed=True,goal_sha256=sha(coq/'scalar_goal.v'),checked_module='Rndne.ScalarChecked.CheckedScalar',fields=fields,source_sha256={str(p.relative_to(CASE)):sha(p) for p in sources+[HERE/'coq'/(n+'.v') for n in names+['ScalarChecked']]})
 except Exception as e:status['error']=str(e)
 (run/'status.json').write_text(json.dumps(status,indent=2)+'\n');(HERE/'scalar-status.json').write_text(json.dumps(status,indent=2)+'\n');print(run,flush=True);raise SystemExit(0 if status['passed'] else 1)
if __name__=='__main__':main()
