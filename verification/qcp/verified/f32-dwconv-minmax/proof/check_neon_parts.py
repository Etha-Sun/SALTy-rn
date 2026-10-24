#!/usr/bin/env python3
"""Independently check actual nonmemory VC leaves, then retain exact evidence.
Component-only dependency reuse is explicit. Whole-case admission rebuilds all.
"""
from pathlib import Path
import argparse,json,hashlib,re,tempfile,shutil,os,subprocess,time,concurrent.futures
C=Path(__file__).resolve().parents[1];R=next(p for p in C.parents if(p/'.git').exists());sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def main():
 ap=argparse.ArgumentParser();ap.add_argument('--bundle',type=Path,required=True);ap.add_argument('--jobs',type=int,default=32);ap.add_argument('--max-live',type=int,default=16);ap.add_argument('--timeout',type=int,default=7200);a=ap.parse_args();assert 0<a.max_live<=a.jobs<=32 and 0<a.timeout<=14400
 bundle=a.bundle.resolve();bs=json.loads((bundle/'status.json').read_text());assert bs['passed'];source=bundle/'coq';assert sha(source/'neon_unit_goal.v')==sha(C/'proof/coq/neon_unit_goal.v');assert sha(source/'KernelSupport.v')==sha(C/'proof/coq/KernelSupport.v')
 audit_spec=__import__('importlib.util',fromlist=['spec_from_file_location']);spec=audit_spec.spec_from_file_location('owner_audit',C/'proof/audit_output_ownership.py');m=audit_spec.module_from_spec(spec);spec.loader.exec_module(m);ownership=m.audit(source/'neon_unit_goal.v');assert ownership['passed'],ownership['violations']
 available_kib=int(re.search(r'^MemAvailable:\s+(\d+)',Path('/proc/meminfo').read_text(),re.M)[1]);assert available_kib>=320*1024**2,'insufficient memory for a 16x16GiB component batch plus reserve'
 run=Path(tempfile.mkdtemp(prefix='neon-nonmemory-',dir=C/'.build'));coq=run/'coq';shutil.copytree(source,coq);records=[];base_cmd=next(x['command']for x in bs['records']if x['module']=='neon_unit_goal');flags=[x.replace(str(source),str(coq))for x in base_cmd[:-1]];env=os.environ.copy();env['PATH']=str(R/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+env['PATH']
 goal=(source/'neon_unit_goal.v').read_text();all_fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',goal,re.M);fields=[n for n in all_fields if'_entail_'not in n and'_return_'not in n];assert len(all_fields)==283 and len(fields)==250
 before={n:sha(C/'proof/coq'/(n+'.v'))for n in bs['source_sha256']};s=dict(passed=False,whole_kernel_verified=False,scope='actual250 nonmemory leaves, no complete-kernel credit',run_directory=str(run),component_dependency_origin=str(bundle),no_wholecase_vo_credit=True,configured_jobs=a.jobs,max_live_processes=a.max_live,per_process_memory_GiB=16,maximum_process_budget_GiB=16*a.max_live,mem_available_kib_at_launch=available_kib,goal_sha256=sha(source/'neon_unit_goal.v'),source_sha256=before,ownership_audit=ownership,records=records)
 (run/'status.json').write_text(json.dumps(s,indent=2)+'\n')
 def check(item):
  idx,name=item;mod='NLeaf'+str(idx).zfill(3);src=coq/(mod+'.v');aux=name+'_aux';unfold='Dwconv.neon_unit_goal.'+name+(',Dwconv.neon_unit_goal.'+aux if re.search(r'^Definition '+aux+r'\s*:=',goal,re.M)else'')
  text='''From Coq Require Import ZArith.
From Dwconv Require Import KernelSupport neon_unit_goal.
Import Snaive_C_Rules64. Local Open Scope sac.
Local Opaque Dwconv.Model.dw_arm_add Dwconv.Model.dw_arm_mul Dwconv.Model.dw_arm_fma Dwconv.Model.dw_arm_min Dwconv.Model.dw_arm_max Dwconv.FmaModel.fma_rne fp32_add fp32_mul.
'''+ 'Lemma proof_of_'+name+' : Dwconv.neon_unit_goal.'+name+'.\nProof. unfold '+unfold+';dw_call_finish. Qed.\n';src.write_text(text);cwd=run/'jobs'/mod;cwd.mkdir(parents=True);cmd=['prlimit','--as=17179869184:17179869184','--',*flags,'-time',str(src)];log=run/(mod+'.log');start=time.monotonic()
  try:
   with log.open('w')as f:p=subprocess.run(cmd,cwd=cwd,env=env,stdout=f,stderr=f,timeout=a.timeout)
   code=p.returncode
  except subprocess.TimeoutExpired:code=124
  return dict(field=name,module=mod,exit_code=code,seconds=time.monotonic()-start,command=cmd,source_sha256=sha(src),log_sha256=sha(log))
 with concurrent.futures.ThreadPoolExecutor(max_workers=a.max_live)as pool:
  pending={pool.submit(check,item):item for item in enumerate(fields)}
  for f in concurrent.futures.as_completed(pending):
   rec=f.result();records.append(rec);s['passed_leaves']=sum(x['exit_code']==0 for x in records);s['failed_leaves']=sum(x['exit_code']!=0 for x in records);print(rec['field'],rec['exit_code'],round(rec['seconds'],2),flush=True);(run/'status.json').write_text(json.dumps(s,indent=2)+'\n')
 s['source_unchanged']=all(sha(C/'proof/coq'/(n+'.v'))==h for n,h in before.items());s['passed']=len(records)==250 and s['passed_leaves']==250 and s['source_unchanged'];(run/'status.json').write_text(json.dumps(s,indent=2)+'\n');dest=C/'proof/neon-nonmemory-status.json'
 if dest.exists():(C/'proof/history'/('neon-nonmemory-'+sha(dest)+'.json')).write_bytes(dest.read_bytes())
 dest.write_bytes((run/'status.json').read_bytes());print(run,flush=True);raise SystemExit(0 if s['passed']else 1)
if __name__=='__main__':main()
