#!/usr/bin/env python3
"""Fresh ordinary-Coq kernel component gate; full actual-C replay is separate."""
from pathlib import Path
import argparse,json,re,subprocess,sys,tempfile,time,hashlib,concurrent.futures
import generate_kernel
H=Path(__file__).resolve().parent;C=H.parent;sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def main():
 ap=argparse.ArgumentParser();ap.add_argument('--isa',choices=['neon','rvv'],required=True);ap.add_argument('--jobs',type=int,default=16);ap.add_argument('--timeout',type=int,default=3600);a=ap.parse_args();assert 0<a.jobs<=16 and 0<a.timeout<=14400
 run=Path(tempfile.mkdtemp(prefix=a.isa+'-component-',dir=C/'.build'));records=[];s={'passed':False,'whole_kernel_verified':False,'scope':'kernel_component_actual_goal_ordinary_Coq_and_typed_gate_not_full_case','run_directory':str(run),'records':records,'per_process_memory_GiB':16,'parallel_jobs':a.jobs};stem=a.isa+'_unit';mod=a.isa.title()+'Checked';checked='F32F16.'+mod+'.Checked'+a.isa.title();g=json.loads((H/(a.isa+'-generation-status.json')).read_text());sources={str(p.relative_to(C)):sha(p)for p in [C/'impl'/('testNEON.c'if a.isa=='neon'else'testRVV.c'),C/'spec.c',H/'generate_kernel.py',Path(__file__),*sorted((C/'shim').glob('*.h')),*sorted((H/'c').glob('*.strategies'))]}
 def execute(cmd,label,cwd,timeout):
  cmd=['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)];log=run/(label+'.log');t=time.monotonic()
  try:
   with log.open('w')as f:r=subprocess.run(cmd,cwd=cwd,stdout=f,stderr=f,timeout=timeout)
   ec=r.returncode
  except subprocess.TimeoutExpired:ec=124
  rec={'label':label,'command':cmd,'exit_code':ec,'seconds':time.monotonic()-t,'log_sha256':sha(log)};print(label,ec,flush=True);return rec
 try:
  assert g['generation_passed']and sha(H/'coq'/(stem+'_goal.v'))==g['goal_sha256'];gen=Path(g['run_directory']);assert sha(gen/(stem+'.c'))==g['cpp_sha256']
  raw,text,_=generate_kernel.kernel_text(a.isa);tu=run/(stem+'.raw.c');tu.write_text(generate_kernel.kernel_header(a.isa)+text);cpp=run/(stem+'.c');rec=execute(['gcc','-E','-P','-CC','-nostdinc',tu,'-o',cpp],'current-cpp',run,60);records.append(rec);assert rec['exit_code']==0 and sha(cpp)==g['cpp_sha256'],'current actual-C CPP drift'
  rec=execute([sys.executable,H/'check_coq.py','--targets',mod,'--jobs',str(a.jobs),'--timeout',str(a.timeout)],'ordinary-closure',C,a.timeout+7200);records.append(rec);assert rec['exit_code']==0
  closure=json.loads((C/'.build'/('coq-status-'+mod+'.json')).read_text());assert closure['passed'];coq=Path(closure['run_directory'])/'coq';flags=closure['records'][0]['command'][:-1];fields=g['fields'];assert fields==re.findall(r'^Axiom proof_of_(\w+)\s*:',(coq/(stem+'_goal.v')).read_text(),re.M)
  def audit(i):
   name=mod+'Audit'+str(i);p=coq/(name+'.v');p.write_text('Require Import F32F16.'+mod+'.\n'+''.join('Print Assumptions '+checked+'.proof_of_'+f+'.\n'for f in fields[i::16]));cwd=run/'jobs'/name;cwd.mkdir(parents=True);rec=execute(flags+[str(p)],name,cwd,a.timeout);rec['source_sha256']=sha(p);rec['fields']=fields[i::16];return rec
  with concurrent.futures.ThreadPoolExecutor(max_workers=a.jobs)as ex:
   reports=list(ex.map(audit,range(16)))
  records.extend(reports);assert all(x['exit_code']==0 for x in reports);report=b''.join((run/(x['label']+'.log')).read_bytes()for x in reports);(run/'AssumptionsReport.log').write_bytes(report);assert len(re.findall(rb'^Axioms:|^Closed under the global context',report,re.M))==len(fields)
  p=coq/(mod+'Final.v');p.write_text('From F32F16 Require Import '+mod+' '+' '.join(mod+'Audit'+str(i)for i in range(16))+'.\nModule ActualKernel : F32F16.'+stem+'_goal.VC_Correct := '+checked+'.\n');rec=execute(flags+[str(p)],'FinalKernelCheck',run,a.timeout);records.append(rec);assert rec['exit_code']==0
  assert all(sha(C/n)==h for n,h in sources.items()),'component input drift';assert all(sha(H/'coq'/(n+'.v'))==h for n,h in closure['source_sha256'].items())
  s.update(passed=True,vc_correct_passed=True,checked_c_vcs=len(fields),goal_sha256=g['goal_sha256'],generation_directory=str(gen),checked_module=checked,ordinary_closure=closure,source_sha256={**sources,**{'proof/coq/'+n+'.v':h for n,h in closure['source_sha256'].items()}},assumption_reports=len(fields),assumptions_log_sha256=sha(run/'AssumptionsReport.log'),final_source_sha256=sha(p))
 except Exception as e:s['error']=str(e)
 (run/'status.json').write_text(json.dumps(s,indent=2)+'\n');(H/(a.isa+'-proof-status.json')).write_text(json.dumps(s,indent=2)+'\n');print(run);raise SystemExit(0 if s['passed']else 1)
if __name__=='__main__':main()
