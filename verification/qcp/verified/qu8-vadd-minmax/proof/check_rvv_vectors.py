#!/usr/bin/env python3
"""Fresh actual RVV providers,16 proof leaves,complete typed gate and parallel Print."""
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor
import argparse,hashlib,json,re,shutil,subprocess,tempfile,threading,time
from coverage import _functions
C=Path(__file__).resolve().parent.parent;NS="Qu8Add";UNSIGNED=True
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--config',required=True,type=Path);p.add_argument('--jobs',type=int,default=16);p.add_argument('--timeout',type=int,default=3600);a=p.parse_args();assert 16<=a.jobs<=64 and 0<a.timeout<=7200
 r=Path(tempfile.mkdtemp(prefix='rvv-vectors16-',dir=C/'.build'));coq=r/'coq';coq.mkdir();rows=json.loads((C/'proof/rvv-arithmetic-units.json').read_text());core=['Model','ShiftFacts']+(['UnsignedModel','UnsignedScalarModel']if UNSIGNED else[])+['Types','VectorModel','RvvModel','RvvActiveModel','RvvFrame','RvvArithmeticAutomation','RvvPureBounds'];parts=[f'RvvVectorsPart{i:02}'for i in range(16)];own=core+parts+['RvvVectorsChecked'];files=['proof/check_rvv_vectors.py','proof/coverage.py','proof/rvv-arithmetic-units.json','proof/rvv-vector-partitions.json','shim/rvv_arithmetic.h','shim/rvv_active.h','shim/neon_arithmetic.h','shim/scalar.h','shim/types.h','shim/types_def.h']+(['shim/unsigned_scalar.h']if UNSIGNED else[])+[u['source']for u in rows]+['proof/coq/'+n+'.v'for n in own];inputs={n:sha(C/n)for n in files};records=[];lock=threading.Lock();flags=json.loads(a.config.read_text())['flags'][2:]+['-Q',str(coq),NS];s=dict(passed=False,vc_correct_passed=False,whole_kernel_verified=False,scope='all selected actual RVV vector providers; complete kernel/call closure remains separate',parallel_jobs=a.jobs,per_process_memory_GiB=16,run_directory=str(r),input_sha256=inputs,records=records)
 def save():(r/'status.json').write_text(json.dumps(s,indent=2)+'\n')
 def execute(name,cmd):
  work=r/'jobs'/name;work.mkdir(parents=True,exist_ok=True);log=r/(name+'.log');t=time.monotonic();command=['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)]
  with log.open('w')as f:
   try:z=subprocess.run(command,cwd=work,stdout=f,stderr=f,timeout=a.timeout).returncode
   except subprocess.TimeoutExpired:z=124
  with lock:records.append(dict(label=name,command=command,cwd=str(work),exit_code=z,seconds=time.monotonic()-t,log_sha256=sha(log)));save()
  print(name,z,flush=True);assert not z,log.read_text()[-2600:]
 def cc(n):execute(n,['qcp-env','coqc','-time',*flags,coq/(n+'.v')])
 try:
  tool={n:sha(Path(shutil.which(n)).resolve())for n in ['qcp','qcp-env','coqc','gcc','prlimit']};config_sha=sha(a.config)
  for n in own:
   src=C/'proof/coq'/(n+'.v');assert not re.search(r'\b(?:Axiom|Parameter|Admitted|admit|Abort)\b',re.sub(r'\(\*.*?\*\)','',src.read_text(),flags=re.S));shutil.copyfile(src,coq/src.name)
  def generate(row):
   stem=row['stem'];folder=r/'units'/stem;folder.mkdir(parents=True);cpp=folder/(stem+'.c');execute(stem+'-cpp',['gcc','-E','-P','-CC','-nostdinc',C/row['source'],'-o',cpp]);defined={n for n,_,_,e in _functions(cpp.read_text(),stem)if e is not None};assert defined=={row['name']};out=folder/'generated';out.mkdir();execute(stem+'-qcp',['qcp','--arch=64','--endian=little','--no-exec-info','--strategy-application-limit=4096','--input-file='+str(cpp),'--coq-output-dir='+str(out),'--coq-logic-path='+NS,'-slp',C/'shim',NS]);goal=out/(stem+'_goal.v');fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',goal.read_text(),re.M);assert fields and len(fields)==len(set(fields));shutil.copyfile(goal,coq/goal.name);return dict(label=stem,stem=stem,fields=fields,actual_c_vcs=len(fields),actual_functions=sorted(defined),cpp_sha256=sha(cpp),goal_sha256=sha(goal))
  with ThreadPoolExecutor(max_workers=a.jobs)as pool:units=list(pool.map(generate,rows))
  for i,u in enumerate(units):u['checked_module']=NS+'.RvvVectorsChecked.CheckedVector'+str(i)
  prepared=json.loads((C/'proof/rvv-vector-partitions.json').read_text())['fields'];assert [(u['stem'],f)for u in units for f in u['fields']]==[(x['stem'],x['field'])for x in prepared]
  assert not list(coq.glob('*.vo'))
  for n in core:cc(n)
  with ThreadPoolExecutor(max_workers=a.jobs)as pool:list(pool.map(cc,[u['stem']+'_goal'for u in units]))
  with ThreadPoolExecutor(max_workers=a.jobs)as pool:list(pool.map(cc,parts))
  cc('RvvVectorsChecked');report=[]
  for i,u in enumerate(units):report+=['Print Assumptions '+u['checked_module']+'.proof_of_'+f+'.'for f in u['fields']]
  assumptions=[]
  for i in range(16):
   n=f'RvvVectorAssumptions{i:02}';(coq/(n+'.v')).write_text('From '+NS+' Require Import RvvVectorsChecked.\n'+'\n'.join(report[i::16])+'\n');assumptions.append(n)
  with ThreadPoolExecutor(max_workers=a.jobs)as pool:list(pool.map(cc,assumptions))
  counts=[len(re.findall(r'^(?:Axioms:|Closed under the global context)',(r/(n+'.log')).read_text(),re.M))for n in assumptions];assert counts==[len(report[i::16])for i in range(16)];combined=r/'RvvVectorsAssumptions.log';combined.write_bytes(b''.join((r/(n+'.log')).read_bytes()for n in assumptions))
  gate='From '+NS+' Require Import RvvVectorsChecked '+' '.join(assumptions)+'.\n'+''.join('Module Typed'+str(i)+' : '+NS+'.'+u['stem']+'_goal.VC_Correct := '+u['checked_module']+'.\n'for i,u in enumerate(units));(coq/'RvvVectorsFinalGate.v').write_text(gate);cc('RvvVectorsFinalGate');assert inputs=={n:sha(C/n)for n in files};assert sha(a.config)==config_sha and all(sha(Path(shutil.which(n)).resolve())==d for n,d in tool.items());s.update(passed=True,vc_correct_passed=True,actual_c_units=units,checked_c_vcs=len(report),no_component_vo_reused=True,compiled_source_sha256={NS+'.'+p.stem:sha(p)for p in coq.glob('*.v')},final_gate_sha256=sha(coq/'RvvVectorsFinalGate.v'),final_assumptions_log_sha256=sha(combined),assumption_parts=[dict(module=NS+'.'+n,reports=counts[i],source_sha256=sha(coq/(n+'.v')),log_sha256=sha(r/(n+'.log')))for i,n in enumerate(assumptions)],tool_sha256=tool,config_sha256=config_sha)
 except Exception as e:s['error']=str(e);print(e,flush=True)
 save();d=C/'proof/rvv-vectors-status.json'
 if d.exists():(C/'proof/history'/('rvv-vectors-status-'+sha(d)+'.json')).write_bytes(d.read_bytes())
 d.write_bytes((r/'status.json').read_bytes());print(json.dumps({k:s.get(k)for k in ['passed','run_directory','checked_c_vcs','error']},indent=2));return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
