#!/usr/bin/env python3
"""Aggregate all378 actual NEON non-resource fields on one pinned core.

This partial component is not the complete442-field VC_Correct instance and
does not replace the final whole-case rebuild from .v sources.
"""
from pathlib import Path
import argparse,concurrent.futures,hashlib,json,os,re,shutil,subprocess,tempfile,threading,time
C=Path(__file__).resolve().parents[1]
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 p=argparse.ArgumentParser();p.add_argument('--config',type=Path,required=True);p.add_argument('--jobs',type=int,default=32);p.add_argument('--live-jobs',type=int,default=32);p.add_argument('--timeout',type=int,default=7200);p.add_argument('--prepare-only',action='store_true');a=p.parse_args();assert 1<=a.live_jobs<=a.jobs<=32
 goal=C/'proof/coq/neon_unit_goal.v';text=goal.read_text();generation=json.loads((C/'proof/neon-generation-status.json').read_text());assert generation['generation_passed']and sha(goal)==generation['goal_sha256']
 fields=[f for f in re.findall(r'^Axiom proof_of_(\w+)\s*:',text,re.M)if'safety'in f or'partial_solve'in f];assert len(fields)==378
 parts=[]
 for i in range(32):
  n='NeonNonMemoryPart'+str(i).zfill(2);names=fields[i::32];module='CheckedPart'+str(i).zfill(2);source='From MaxPool Require Import NeonAutomation.\nImport Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.\nModule '+module+'.\n'
  for f in names:
   aux='unfold MaxPool.neon_unit_goal.'+f+'_aux;'if re.search(r'^Definition '+re.escape(f)+r' :=\s*\w+_pure\s*->',text,re.M)else'';tactic='mp_pure'if'safety'in f or f.endswith('_pure')else'mp_call_frame'
   source+='Lemma proof_of_'+f+' : MaxPool.neon_unit_goal.'+f+'.\nProof. unfold MaxPool.neon_unit_goal.'+f+';'+aux+'try left;mp_intro;'+tactic+'. Qed.\n'
  source+='End '+module+'.\n'+''.join('Print Assumptions '+module+'.proof_of_'+f+'.\n'for f in names);(C/'proof/coq'/(n+'.v')).write_text(source);parts.append(dict(module=n,checked_module='MaxPool.'+n+'.'+module,fields=names))
 source='From MaxPool Require Import '+' '.join(x['module']for x in parts)+'.\nModule CheckedNeonNonMemory.\n'+''.join('Include '+x['checked_module']+'.\n'for x in parts)+'End CheckedNeonNonMemory.\n';(C/'proof/coq/NeonNonMemory.v').write_text(source)
 gate='From MaxPool Require Import NeonNonMemory.\n'+''.join('Definition typed_'+f+' : MaxPool.neon_unit_goal.'+f+' := MaxPool.NeonNonMemory.CheckedNeonNonMemory.proof_of_'+f+'.\n'for f in fields);(C/'proof/coq/NeonNonMemoryGate.v').write_text(gate)
 if a.prepare_only:print(json.dumps(dict(prepared=True,parts=32,fields=len(fields))));return 0
 r=Path(tempfile.mkdtemp(prefix='neon-nonmemory-aggregate-',dir=C/'.build'));coq=r/'coq';coq.mkdir();base=Path(json.loads((C/'.build/current-neon-core.json').read_text())['coq_directory']);manifest=json.loads((base.parent/'status.json').read_text());mods=[*manifest['cloned_modules'],'WordFacts','WindowExtra','NeonAutomation'];bundle={};inputs={'proof/check_neon_nonmemory.py':sha(__file__),'proof/neon-generation-status.json':sha(C/'proof/neon-generation-status.json')}
 for n in mods:
  for ext in ['.v','.vo']:shutil.copy2(base/(n+ext),coq/(n+ext))
  pub=C/'proof/coq'/(n+'.v');assert pub.read_bytes()==(coq/(n+'.v')).read_bytes(),n;inputs[str(pub.relative_to(C))]=sha(pub);bundle[n]=dict(source_sha256=sha(coq/(n+'.v')),vo_sha256=sha(coq/(n+'.vo')))
 for n in [x['module']for x in parts]+['NeonNonMemory','NeonNonMemoryGate']:
  pub=C/'proof/coq'/(n+'.v');shutil.copy2(pub,coq/pub.name);inputs[str(pub.relative_to(C))]=sha(pub)
 control=r/'live-limit.json';control.write_text(json.dumps(dict(live_jobs=a.live_jobs))+'\n');cv=threading.Condition();live={'active':0,'peak':0};lock=threading.Lock();records=[];s=dict(passed=False,whole_kernel_verified=False,vc_correct_passed=False,scope='378-field partial typed component; pinned explicit coherent dependency objects, not whole fresh proof',run_directory=str(r),configured_jobs=a.jobs,initial_live_jobs=a.live_jobs,ordinary_memory_GiB=16,per_process_timeout_seconds=a.timeout,goal_sha256=sha(goal),input_sha256=inputs,cloned_modules=bundle,parts=parts,records=records)
 flags=json.loads(a.config.read_text())['flags']+['-Q',str(coq),'MaxPool'];env={**os.environ,'PATH':str(C.parents[3]/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']}
 def save():(r/'status.json').write_text(json.dumps(s,indent=2)+'\n')
 def compile(n):
  queued=time.monotonic()
  with cv:
   while live['active']>=json.loads(control.read_text())['live_jobs']:cv.wait(timeout=.25)
   live['active']+=1;live['peak']=max(live['peak'],live['active'])
  begin=time.monotonic();log=r/(n+'.log');cmd=['prlimit','--as=17179869184:17179869184','--',*flags,'-time',str(coq/(n+'.v'))]
  try:
   with log.open('w')as out:code=subprocess.run(cmd,cwd=r,env=env,stdout=out,stderr=out,timeout=a.timeout).returncode
  except subprocess.TimeoutExpired:code=124
  finally:
   with cv:live['active']-=1;cv.notify_all()
  rec=dict(label=n,command=cmd,exit_code=code,seconds=time.monotonic()-begin,admission_wait_seconds=begin-queued,source_sha256=sha(coq/(n+'.v')),log_sha256=sha(log))
  with lock:records.append(rec);s['peak_actual_live_jobs']=live['peak'];save()
  return code
 save();print(r,flush=True)
 try:
  with concurrent.futures.ThreadPoolExecutor(max_workers=a.jobs)as pool:codes=list(pool.map(compile,[x['module']for x in parts]))
  assert all(x==0 for x in codes),'One or more actual-field parts failed; retained all logs/source snapshots'
  assert compile('NeonNonMemory')==0 and compile('NeonNonMemoryGate')==0
  assert inputs=={q:sha(C/q)for q in inputs}
  s.update(passed=True,typed_partial_interface_passed=True,checked_c_vcs=len(fields),checked_module='MaxPool.NeonNonMemory.CheckedNeonNonMemory',typed_gate_sha256=sha(coq/'NeonNonMemoryGate.v'),part_assumptions_fields=len(fields),compiled_modules=34)
 except Exception as e:s['error']=str(e)
 save();dest=C/'proof/neon-nonmemory-status.json'
 if dest.exists():(C/'proof/history'/('neon-nonmemory-status-'+sha(dest)+'.json')).write_bytes(dest.read_bytes())
 dest.write_bytes((r/'status.json').read_bytes());print(json.dumps({k:s.get(k)for k in ['passed','run_directory','checked_c_vcs','error']}));return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
