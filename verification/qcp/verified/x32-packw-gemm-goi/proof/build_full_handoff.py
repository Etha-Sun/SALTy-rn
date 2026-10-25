#!/usr/bin/env python3
"""Freeze live CPP/call/body/goal/source inventory. No QCP/Coq run or certificate."""
from pathlib import Path
import argparse,json,os,re,subprocess,tempfile,time
from full_inputs import CASE as C,NS,iter_current_unit_texts,sha
import coverage,audit_callee_cpp
PROVIDERS={'scalar_memory':'ScalarMemoryChecked.CheckedScalarMemory','neon_pair':'NeonPairChecked.CheckedNeonPair','neon_odd':'NeonOddChecked.CheckedNeonOdd','neon_header':'NeonHeaderChecked.CheckedNeonHeader','rvv_store_pair':'RvvStorePairChecked.CheckedRvvStorePair','rvv_pair':'RvvPairChecked.CheckedRvvPair','rvv_odd':'RvvOddChecked.CheckedRvvOdd','rvv_header':'RvvHeaderChecked.CheckedRvvHeader','neon_unit':'NeonChecked.CheckedNeon','rvv_unit':'RvvChecked.CheckedRvv','observe':'ObserveChecked.CheckedObserve','assert':'AssertChecked.CheckedAssert','caller':'CallerChecked.CheckedCaller'}
OUTPUTS={'README.md','proof/frozen-full-handoff.json','proof/full-status.json','proof/status.json','proof/manifest.json','proof/assumption-audit.json','proof/full-preflight-status.json'}
def inventory():
 result={}
 for p in C.rglob('*'):
  relative=p.relative_to(C)
  if not p.is_file()or any(x in {'.build','__pycache__'}for x in relative.parts)or str(relative)in OUTPUTS or p.suffix in {'.vo','.vos','.vok','.glob','.aux','.pyc'}:continue
  result[str(relative)]=sha(p)
 return dict(sorted(result.items()))
def source_closure(roots):
 graph={}
 def visit(n):
  if n in graph:return
  p=C/'proof/coq'/(n+'.v');assert p.is_file(),n
  text=re.sub(r'\(\*.*?\*\)','',p.read_text(),flags=re.S);deps=set();graph[n]=[]
  for match in re.finditer(r'(?:From\s+([\w.]+)\s+)?Require\s+(?:(?:Import|Export)\s+)?([\w.\s]+?)\.(?=\s|$)',text):
   prefix,body=match.groups()
   for word in body.split():
    q=(prefix+'.'+word)if prefix else word
    if q.startswith(NS+'.'):
     local=q[len(NS)+1:];assert '.'not in local;deps.add(local)
  graph[n]=sorted(deps)
  for d in deps:visit(d)
 for n in roots:visit(n)
 return graph
MATH_EXCLUDE=('proof_of_','typed_','checked_')
def mathematical_lemmas(text):
 return [n for n in re.findall(r'(?m)^(?:Lemma|Theorem)\s+(\w+)',text)if not n.startswith(MATH_EXCLUDE)and n!='checked']
def main():
 ap=argparse.ArgumentParser();ap.add_argument('--freeze',action='store_true');a=ap.parse_args();quota=json.loads((C.parents[3]/'.build/memory/quota/state.json').read_text());assert not quota['wind_down_requested'];r=Path(tempfile.mkdtemp(prefix='full-handoff-',dir=C/'.build'));records=[];s={'passed':False,'whole_kernel_verified':False,'formal_proof_replayed':False,'scope':'source/CPP/callee inventory only, not a proof certificate','run_directory':str(r),'records':records,'quota_state_at_start':quota};inputs=inventory()
 try:
  for name in ['native-undefined-status','native-address-status']:
   n=json.loads((C/'proof'/(name+'.json')).read_text());assert n['passed']and all(sha(C/k)==v for k,v in n['input_sha256'].items()),name
   assert n['original_compatible_regression']['cases']==41184 and n['original_compatible_regression']['public_caller_calls']==41184 and n['both_wrong_still_equal_oracle_rejected']
  sdk=json.loads((C/'proof/cross-build-status.json').read_text());assert sdk['passed']
  for rec in sdk['records']:assert all(sha(Path(p))==v for p,v in rec['dependencies_sha256'].items())
  units=[];cpps={}
  for u in iter_current_unit_texts():
   stem=u['stem'];src=r/(stem+'.in.c');src.write_text(u['text']);cpp=r/(stem+'.c');cmd=['prlimit','--as=17179869184:17179869184','--','gcc','-E','-P','-CC','-nostdinc','-I',str(C),*u['cpp_flags'],str(src),'-o',str(cpp)];start=time.monotonic();cp=subprocess.run(cmd,cwd=r,capture_output=True,timeout=300);log=r/(stem+'-cpp.log');log.write_bytes(cp.stdout+cp.stderr);records.append({'label':stem+'-cpp','command':cmd,'exit_code':cp.returncode,'seconds':time.monotonic()-start,'log_sha256':sha(log)});assert cp.returncode==0,stem+':'+log.read_text()[-2000:]
   goal=C/'proof/coq'/(stem+'_goal.v');text=goal.read_text();fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',text,re.M);assert fields and len(fields)==len(set(fields));functions=sorted(n for n,_,_,edges in coverage._functions(cpp.read_text(),stem)if edges is not None);assert functions and len(functions)==len(set(functions));cpps[stem]=cpp;provider=NS+'.'+PROVIDERS[stem];units.append({'label':u['label'],'stem':stem,'fields':fields,'checked_module':provider,'typed_instance':provider,'cpp_sha256':sha(cpp),'goal_sha256':sha(goal),'functions_defined':functions,'cpp_snapshot':str(cpp),'goal_source':str(goal)})
  assert len(units)==13;closure=audit_callee_cpp.check(cpps,json.loads((C/'proof/intrinsic-ledger.json').read_text()));assert closure['source_closure_passed'],closure['errors'];assert closure['unique_actual_C_definitions']==14
  roots=[v.split('.')[0]for v in PROVIDERS.values()]+['StateObservation'];graph=source_closure(roots);own=sorted(graph);generated={u['stem']+'_goal'for u in units};assert generated<=set(own);math=[]
  for n in own:
   clean=re.sub(r'\(\*.*?\*\)','',(C/'proof/coq'/(n+'.v')).read_text(),flags=re.S)
   if n not in generated:assert not re.search(r'\b(?:Axiom|Parameter|Admitted|admit|Abort)\b',clean),n
   if mathematical_lemmas(clean):math.append(n)
  assert 'StateObservation'in math;assert inputs==inventory(),'Sources changed during inventory'
  h={'schema':1,'namespace':NS,'whole_kernel_verified':False,'scope':'frozen full-replay inputs only; no certificate','units':units,'strategies':[],'own_modules':own,'local_source_dependencies':graph,'math_modules':math,'actual_c_function_count':14,'total_actual_c_vcs':sum(len(u['fields'])for u in units),'frozen_source_sha256':inputs,'native_statuses':['proof/native-undefined-status.json','proof/native-address-status.json'],'limits':{'configured_jobs':32,'initial_live_admission_slots':8,'ordinary_process_memory_GiB':16,'heavy_process_memory_GiB':32,'ordinary_timeout_seconds':7200,'heavy_timeout_seconds':14400,'long_generation_timeout_seconds':21600,'group_verifier_process_limit':32,'local_initial_process_limit':8,'semantic_boundary':'C-shim modular partial correctness under reviewed original-ISA functional views; fixedXLEN64/VLEN128 e32m4 main and e32m1 header; logical64LE live-object/ABI mappings explicit; no compiler or formalISA refinement/independenttermination theorem'},'live_cpp_source_closure':closure,'preflight_directory':str(r)}
  assert h['total_actual_c_vcs']==312
  (r/'handoff.json').write_text(json.dumps(h,indent=2)+'\n');s.update(passed=True,actual_c_units=13,actual_c_vcs=h['total_actual_c_vcs'],unique_actual_c_bodies=14,ordinary_input_modules=len(own),mathematical_modules=len(math),closure=closure,input_sha256=inputs)
  if a.freeze:
   dest=C/'proof/frozen-full-handoff.json'
   if dest.exists():assert dest.read_bytes()==(r/'handoff.json').read_bytes(),'Different prior H must be preserved explicitly'
   else:dest.write_bytes((r/'handoff.json').read_bytes())
   s['frozen_handoff_sha256']=sha(dest)
 except Exception as e:s['error']=str(e)or'failed source identity guard'
 (r/'status.json').write_text(json.dumps(s,indent=2)+'\n');(C/'proof/full-preflight-status.json').write_bytes((r/'status.json').read_bytes());print(json.dumps({k:s.get(k)for k in ['passed','run_directory','actual_c_units','actual_c_vcs','ordinary_input_modules','frozen_handoff_sha256','error']}));return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
