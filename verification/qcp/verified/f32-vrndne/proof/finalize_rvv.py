#!/usr/bin/env python3
"""Complete the exact same fresh RVV leaf run with memory, typed61 and Print.

Existing own-case objects may only be from this run's recorded successful ordinary
compilations and must have byte-identical current sources. Full-case replay
subsequently rebuilds every local module without component objects.
"""
from pathlib import Path
import argparse,hashlib,json,re,shutil,subprocess,time
H=Path(__file__).resolve().parent;C=H.parent;R=next(p for p in C.parents if(p/'.git').exists());sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def main():
 a=argparse.ArgumentParser();a.add_argument('--leaf-run',type=Path,required=True);args=a.parse_args();run=args.leaf_run.resolve();assert run.parent==C/'.build';old=json.loads((run/'status.json').read_text());assert old.get('leaves_passed')and old['parts_passed']==old['parts_total']==16 and all(r['exit_code']==0 for r in old['records']);records=list(old['records']);coq=run/'coq';goal=coq/'rvv_unit_goal.v';assert sha(goal)==old['goal_sha256']==sha(H/'coq/rvv_unit_goal.v');fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',goal.read_text(),re.M);assert len(fields)==61
 before={}
 for p in coq.glob('*.v'):
  q=H/'coq'/p.name;assert q.is_file() and q.read_bytes()==p.read_bytes(),p;before[str(q.relative_to(C))]=sha(q)
 cfg=json.loads((R/'.build/simple-kernels-bootstrap/coq-flags.json').read_text());dep=R/'verification/qcp/verified/f32-vadd/.build/full-1f5wequq/coq';flags=cfg['flags']+sum((['-Q',str(p),''if p.name=='relations'else p.name]for p in sorted(dep.iterdir())if p.is_dir()),[])+['-Q',str(coq),'Rndne'];s={'passed':False,'vc_correct_passed':False,'whole_kernel_verified':False,'scope':'complete_original_rvv_C_function_partial_correctness_under_declared_callee_contracts','run_directory':str(run),'records':records,'goal_sha256':sha(goal),'checked_c_vcs':len(fields),'checked_module':'Rndne.RvvChecked.CheckedRvv','generation_run_directory':json.loads((H/'rvv-generation-status.json').read_text())['run_directory'],'case_objects_reused_from_other_runs':False,'inherited_dependency_objects_reused':True,'whole_case_gate_pending':True}
 try:
  for name in ['NanFacts','BitFacts','BitCore','Observation','Literal','RvvResult','ProgramFacts','RvvMemory','RvvChecked']:
   p=coq/(name+'.v');assert not p.exists(),'Refuse to overwrite a prior ordinary source: '+name;shutil.copyfile(H/'coq'/p.name,p);before[str((H/'coq'/p.name).relative_to(C))]=sha(p);cmd=list(map(str,flags+[p]));label='complete-'+name;log=run/(label+'.log');cwd=run/'jobs'/label;cwd.mkdir(parents=True);start=time.monotonic()
   try:
    with log.open('w')as f:ec=subprocess.run(['prlimit','--as=17179869184:17179869184','--',*cmd],cwd=cwd,stdout=f,stderr=f,timeout=3600).returncode
   except subprocess.TimeoutExpired:ec=124
   records.append({'label':label,'command':cmd,'exit_code':ec,'seconds':time.monotonic()-start,'log_sha256':sha(log)});print(label,ec,flush=True);assert ec==0,name
  assert all(sha(C/n)==d for n,d in before.items()),'Public source drift';assert sha(goal)==s['goal_sha256'];s.update(passed=True,vc_correct_passed=True,proof_sources_sha256=before)
 except Exception as e:s['error']=str(e)
 (run/'complete-status.json').write_text(json.dumps(s,indent=2)+'\n');(H/'rvv-proof-status.json').write_text(json.dumps(s,indent=2)+'\n');print(run);return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
