#!/usr/bin/env python3
"""Fresh actual RVV32 arithmetic C bodies, per-body ordinary-Coq typed gates."""
import argparse,concurrent.futures,hashlib,json,os,re,shutil,subprocess,tempfile,time,threading
from pathlib import Path
from coverage import _functions
C=Path(__file__).resolve().parent.parent;NS='Qu8Add'
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--config',type=Path,required=True);p.add_argument('--jobs',type=int,default=16);p.add_argument('--timeout',type=int,default=3600);a=p.parse_args();assert __debug__ and 16<=a.jobs<=64 and 0<a.timeout<=7200
 r=Path(tempfile.mkdtemp(prefix='rvv-arithmetic-proof-',dir=C/'.build'));coq=r/'coq';coq.mkdir();rows=json.loads((C/'proof/rvv-arithmetic-units.json').read_text());core=['Model','ShiftFacts','UnsignedModel','UnsignedScalarModel','Types','VectorModel','RvvModel','RvvActiveModel','RvvFrame','RvvArithmeticAutomation'];names=['proof/check_rvv_arithmetic.py','proof/coverage.py','proof/build_rvv_arithmetic.py','proof/rvv-arithmetic-units.json','shim/rvv_arithmetic.h','shim/rvv_active.h','shim/neon_arithmetic.h','shim/unsigned_scalar.h','shim/scalar.h','shim/types.h','shim/types_def.h']+[x['source']for x in rows]+['proof/coq/'+n+'.v'for n in core];inputs={n:sha(C/n)for n in names};records=[];lock=threading.Lock();s=dict(passed=False,vc_correct_passed=False,whole_kernel_verified=False,scope='all12 actual RVV vector arithmetic providers; complete kernel/callee closure still required',run_directory=str(r),input_sha256=inputs,records=records,parallel_jobs=a.jobs);flags=json.loads(a.config.read_text())['flags'][2:]+['-Q',str(coq),NS]
 def save():(r/'status.json').write_text(json.dumps(s,indent=2)+'\n')
 def execute(label,cmd,budget=None):
  budget=budget or a.timeout;cmd=['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)];job=r/'jobs'/label;job.mkdir(parents=True);log=r/(label+'.log');t=time.monotonic()
  with log.open('w')as f:
   try:code=subprocess.run(cmd,cwd=job,stdout=f,stderr=f,timeout=budget).returncode
   except subprocess.TimeoutExpired:code=124
  with lock:records.append(dict(label=label,command=cmd,exit_code=code,seconds=time.monotonic()-t,log_sha256=sha(log)));save()
  print(label,code,flush=True)
  if code:raise RuntimeError(label+':'+log.read_text()[-2000:])
 def cc(n):execute(n,['qcp-env','coqc','-time',*flags,coq/(n+'.v')])
 def unit(row):
  stem=row['stem'];cpp=r/(stem+'.c');execute(stem+'-cpp',['gcc','-E','-P','-CC','-nostdinc',C/row['source'],'-o',cpp]);defs={n for n,_,_,calls in _functions(cpp.read_text(),stem)if calls is not None};assert defs=={row['name']};g=r/'generated'/stem;g.mkdir(parents=True);execute(stem+'-qcp',['qcp','--arch=64','--endian=little','--no-exec-info','--strategy-application-limit=4096','--input-file='+str(cpp),'--coq-output-dir='+str(g),'--coq-logic-path='+NS,'-slp',C/'shim',NS]);goal=g/(stem+'_goal.v');text=goal.read_text();fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',text,re.M);assert fields and len(fields)==len(set(fields));shutil.copyfile(goal,coq/goal.name);cc(stem+'_goal');module=stem+'_checked';proof=f'From {NS} Require Import RvvArithmeticAutomation {stem}_goal.\nImport Snaive_C_Rules64.\nLocal Open Scope Z_scope.\nLocal Open Scope sac.\nModule Checked : {NS}.{stem}_goal.VC_Correct.\n'
  for f in fields:
   aux=','+NS+'.'+stem+'_goal.'+f+'_aux'if 'Definition '+f+'_aux 'in text else''
   proof+=f'Lemma proof_of_{f} : {NS}.{stem}_goal.{f}.\nProof. unfold {NS}.{stem}_goal.{f}'+aux+';try left;intros;subst;qu_rvv_vector. Qed.\n'
  proof+='End Checked.\n';(coq/(module+'.v')).write_text(proof);(C/'proof/coq'/(module+'.v')).write_text(proof);cc(module)
  return dict(label=stem,stem=stem,fields=fields,actual_c_vcs=len(fields),checked_module=NS+'.'+module+'.Checked',actual_functions=sorted(defs),cpp_sha256=sha(cpp),goal_sha256=sha(goal),proof_source_sha256=sha(coq/(module+'.v')))
 try:
  for n in core:
   text=(C/'proof/coq'/(n+'.v')).read_text();assert not re.search(r'\b(?:Axiom|Parameter|Admitted|admit)\b',re.sub(r'\(\*.*?\*\)','',text,flags=re.S));shutil.copyfile(C/'proof/coq'/(n+'.v'),coq/(n+'.v'));cc(n)
  with concurrent.futures.ThreadPoolExecutor(max_workers=a.jobs)as pool:units=list(pool.map(unit,rows))
  gate=[]
  for i,u in enumerate(units):gate+=[f'From {NS} Require Import {u["stem"]}_goal {u["stem"]}_checked.',f'Module Typed{i} : {NS}.{u["stem"]}_goal.VC_Correct := {u["checked_module"]}.']+['Print Assumptions Typed'+str(i)+'.proof_of_'+f+'.'for f in u['fields']]
  (coq/'RvvArithmeticGate.v').write_text('\n'.join(gate)+'\n');cc('RvvArithmeticGate');assert sum(len(u['fields'])for u in units)==len(re.findall(r'^(?:Axioms:|Closed under the global context)',(r/'RvvArithmeticGate.log').read_text(),re.M));assert inputs=={n:sha(C/n)for n in names};s.update(passed=True,vc_correct_passed=True,actual_c_units=units,checked_c_vcs=sum(len(u['fields'])for u in units),no_component_vo_reused=True,compiled_source_sha256={NS+'.'+p.stem:sha(p)for p in coq.glob('*.v')},final_gate_sha256=sha(coq/'RvvArithmeticGate.v'),final_assumptions_log_sha256=sha(r/'RvvArithmeticGate.log'),config_sha256=sha(a.config))
 except Exception as e:s['error']=str(e);print(e,flush=True)
 save();dest=C/'proof/rvv-arithmetic-status.json'
 if dest.exists():(C/'proof/history'/('rvv-arithmetic-status-'+sha(dest)+'.json')).write_bytes(dest.read_bytes())
 dest.write_bytes((r/'status.json').read_bytes());print('RUN',r,flush=True);return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
