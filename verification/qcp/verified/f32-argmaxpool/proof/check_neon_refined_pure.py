#!/usr/bin/env python3
"""Independent actual-goal leaf proofs against one immutable fresh core.

Every field has its own source, ordinary command, budget, log and result.
Partial results do not constitute VC_Correct or a complete kernel proof.
"""
from pathlib import Path
import argparse,concurrent.futures,hashlib,json,os,re,shutil,subprocess,tempfile,time
C=Path(__file__).resolve().parents[1];R=C.parents[3]
def sha(p):
 h=hashlib.sha256()
 with Path(p).open('rb')as f:
  for b in iter(lambda:f.read(1024*1024),b''):h.update(b)
 return h.hexdigest()
def sample(xs,n):return [xs[i]for i in sorted(set(round(i*(len(xs)-1)/(n-1))for i in range(n)))]if len(xs)>n else xs
def main():
 ap=argparse.ArgumentParser();ap.add_argument('--jobs',type=int,default=32);ap.add_argument('--max-live',type=int,default=4);ap.add_argument('--timeout',type=int,default=300);ap.add_argument('--category',choices=['smoke','pure','safety','call'],default='smoke');ap.add_argument('--fields',nargs='+');a=ap.parse_args();assert 0<a.max_live<=4 and a.jobs==32 and 0<a.timeout<=14400
 assert not json.loads((R/'.build/memory/quota/state.json').read_text())['wind_down_requested']
 core_status=C/'proof/neon-core-status.json';core=json.loads(core_status.read_text());assert core['passed']and core['actual_C_fields']==1949
 original=Path(core['coherent_core_directory']);assert sha(original/'neon_unit_goal.vo')==core['goal_object_sha256']
 part=json.loads((C/'proof/neon-kernel-partition.json').read_text());assert part['goal_sha256']==core['actual_goal_sha256']
 groups=part['partitions'];requested=sample(groups['safety'],16)+sample(groups['pure'],16)+sample(groups['call'],32)if a.category=='smoke'else groups[a.category]
 if a.fields:
  assert len(a.fields)==len(set(a.fields))and set(a.fields)<=set(sum(groups.values(),[]))
  requested=a.fields
 run=Path(tempfile.mkdtemp(prefix='neon-leaves-'+a.category+'-',dir=C/'.build'));Q=run/'coq';Q.mkdir();records=[]
 copied={}
 for n,h in core['source_sha256'].items():
  assert sha(original/(n+'.v'))==h
  for ext in ['.v','.vo']:
   p=original/(n+ext);assert p.is_file();shutil.copy2(p,Q/p.name);copied[p.name]=sha(p)
 support=C/'proof/coq/NeonKernelSupport.v';shutil.copy2(support,Q/support.name);support_hash=sha(support)
 pure_support=C/'proof/coq/NeonKernelPureFacts.v';shutil.copy2(pure_support,Q/pure_support.name);pure_hash=sha(pure_support)
 extras=['NeonKernelReadabilityFacts','NeonKernelPureAutomation'];extra_hash={}
 for x in extras:
  f=C/'proof/coq'/(x+'.v');shutil.copy2(f,Q/f.name);extra_hash[x]=sha(f)
 goal=(Q/'neon_unit_goal.v').read_text();definitions=set(re.findall(r'^Definition (\w+) :=',goal,re.M));del goal
 root_modules={};leaf_sources={}
 for i,n in enumerate(requested):
  cat='safety'if'_safety_'in n else'pure'if n.endswith('_pure')else'call';module='NeonLeaf'+str(i).zfill(4)
  extra=',ArgmaxPool.neon_unit_goal.'+n+'_aux'if n+'_aux'in definitions else''
  tactic='apkp_call_goal'if cat=='call'else'apkra_pure_goal'
  body='From Coq Require Import ZArith Lia Ring List.\nFrom ArgmaxPool Require Import NeonKernelPureAutomation neon_unit_goal.\nImport Snaive_C_Rules64. Local Open Scope sac. Local Open Scope Z_scope.\nModule Checked.\nLemma proof_of_'+n+':ArgmaxPool.neon_unit_goal.'+n+'.\nProof. unfold ArgmaxPool.neon_unit_goal.'+n+extra+';'+tactic+'. Qed.\nEnd Checked.\nPrint Assumptions Checked.proof_of_'+n+'.\n'
  p=Q/(module+'.v');p.write_text(body);root_modules[module]=n;leaf_sources[module]=sha(p)
 cfg=json.loads((R/'.build/simple-kernels-bootstrap/coq-flags.json').read_text());base=R/'verification/qcp/verified/f32-vadd/.build/full-1f5wequq/coq'
 flags=cfg['flags']+sum((['-Q',str(p),''if p.name=='relations'else p.name]for p in sorted(base.iterdir())if p.is_dir()),[])+['-Q',str(Q),'ArgmaxPool'];assert flags[:2]==['qcp-env','coqc']and not set(flags)&{'-vos','-vok','-quick','-vio'}
 env={**os.environ,'PATH':str(R/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']}
 s=dict(passed=False,whole_kernel_verified=False,scope='independent_actual_NEON_leaf_proofs_only',run_directory=str(run),core_status_sha256=sha(core_status),actual_goal_sha256=core['actual_goal_sha256'],requested_fields=requested,field_modules=root_modules,leaf_source_sha256=leaf_sources,support_source_sha256=support_hash,pure_support_source_sha256=pure_hash,extra_support_source_sha256=extra_hash,copied_coherent_core=copied,records=records,configured_jobs=32,max_live_processes=a.max_live,per_process_memory_GiB=16,per_process_timeout_seconds=a.timeout,proof_category=a.category)
 def compile(n):
  command=['prlimit','--as=17179869184:17179869184','--',*flags,'-time',str(Q/(n+'.v'))];cwd=run/'jobs'/n;cwd.mkdir(parents=True);log=run/(n+'.log');start=time.monotonic()
  try:
   with log.open('w')as f:ec=subprocess.run(command,cwd=cwd,env=env,stdout=f,stderr=f,timeout=a.timeout).returncode
  except subprocess.TimeoutExpired:ec=124
  rec=dict(module=n,field=root_modules.get(n),command=command,exit_code=ec,seconds=time.monotonic()-start,source_sha256=sha(Q/(n+'.v')),log_sha256=sha(log));print(n,root_modules.get(n),ec,flush=True);return rec
 try:
  records.append(compile('NeonKernelSupport'));assert records[-1]['exit_code']==0,'support ordinary Coq failed'
  records.append(compile('NeonKernelPureFacts'));assert records[-1]['exit_code']==0,'pure support ordinary Coq failed'
  for x in extras:
   records.append(compile(x));assert records[-1]['exit_code']==0,'extra support ordinary Coq failed'
  (run/'status.json').write_text(json.dumps(s,indent=2)+'\n')
  with concurrent.futures.ThreadPoolExecutor(max_workers=a.max_live)as pool:
   active={pool.submit(compile,n):n for n in root_modules}
   for f in concurrent.futures.as_completed(active):
    records.append(f.result());s['passed_fields']=[r['field']for r in records if r['field']and r['exit_code']==0];s['failed_fields']=[r['field']for r in records if r['field']and r['exit_code']!=0];(run/'status.json').write_text(json.dumps(s,indent=2)+'\n')
  assert all(h==sha(C/'proof/coq'/(x+'.v'))for x,h in extra_hash.items()),'extra support source drift'
  assert pure_hash==sha(pure_support),'pure support source changed during leaf run'
  assert support_hash==sha(support),'support source changed during leaf run'
  assert len(s['passed_fields'])+len(s['failed_fields'])==len(requested)
  s['passed']=not s['failed_fields']
 except Exception as e:s['error']=str(e)
 (run/'status.json').write_text(json.dumps(s,indent=2)+'\n');print(json.dumps({k:s.get(k)for k in ['passed','run_directory','passed_fields','failed_fields','error']}),flush=True);return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
