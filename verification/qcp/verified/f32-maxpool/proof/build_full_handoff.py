#!/usr/bin/env python3
"""Freeze current live CPP/body/goal/source inventory before full fresh replay.

This builder runs preprocessing and source/identity diagnostics only. It does
not rerun QCP/Coq or issue a whole-case verification certificate.
"""
from pathlib import Path
import argparse,hashlib,json,os,re,subprocess,tempfile,time
from full_inputs import CASE as C,NS,iter_current_unit_texts,sha
import coverage,audit_callee_cpp
PROVIDERS={'type_width':'WidthChecked.CheckedWidth','count':'CountChecked.CheckedCount','assert':'AssertChecked.CheckedAssert','read_table':'ReadTableChecked.CheckedReadTable','compare':'CompareChecked.CheckedCompare','load_views':'LoadViewsChecked.CheckedLoadViews','caller':'CallerChecked.CheckedCaller','neon_unit':'NeonChecked.CheckedNeon','rvv_unit':'RvvChecked.CheckedRvv','propagate':'NanArrayChecked.CheckedNanArray','nan_wrappers':'NanWrappersChecked.CheckedNanWrappers'}
OUTPUTS={'proof/frozen-full-handoff.json','proof/full-status.json','proof/status.json','proof/manifest.json','proof/assumption-audit.json','proof/full-preflight-status.json'}
def inventory():
 result={}
 for p in C.rglob('*'):
  relative=p.relative_to(C)
  if not p.is_file()or any(x in {'.build','__pycache__'}for x in relative.parts)or str(relative)in OUTPUTS or p.suffix in {'.vo','.vos','.vok','.glob','.aux','.pyc'}:continue
  result[str(relative)]=sha(p)
 return dict(sorted(result.items()))
def main():
 ap=argparse.ArgumentParser();ap.add_argument('--freeze',action='store_true');a=ap.parse_args();quota=json.loads((C.parents[3]/'.build/memory/quota/state.json').read_text());assert not quota['wind_down_requested'];r=Path(tempfile.mkdtemp(prefix='full-handoff-',dir=C/'.build'));records=[];s=dict(passed=False,whole_kernel_verified=False,formal_proof_replayed=False,scope='current source/CPP/callee inventory and alreadychecked-source identity only',run_directory=str(r),records=records,quota_state_at_start=quota);inputs=inventory()
 try:
  for name in ['native-status','native-address-status']:
   n=json.loads((C/'proof'/(name+'.json')).read_text());assert n['passed']and all(sha(C/k)==v for k,v in n['input_sha256'].items()),name
  for name in ['neon-proof-status','rvv-proof-status','nan-wrappers-status']:
   p=C/'proof'/(name+'.json');t=json.loads(p.read_text());assert t['passed'],name
  migration=json.loads((C/'.build/nan-production-current.json').read_text());migration=Path(migration['run_directory'])/'status.json';m=json.loads(migration.read_text());assert m['passed']and m['actual_c_vcs']==70
  for n,v in m['compiled_source_sha256'].items():assert sha(C/'proof/coq'/(n+'.v'))==v,'Production source drift: '+n
  units=[];cpps={}
  for u in iter_current_unit_texts():
   stem=u['stem'];p=r/(stem+'.in.c');p.write_text(u['text']);cpp=r/(stem+'.c');cmd=['prlimit','--as=17179869184:17179869184','--','gcc','-E','-P','-CC','-nostdinc','-I',str(C),*u['cpp_flags'],str(p),'-o',str(cpp)];start=time.monotonic();cp=subprocess.run(cmd,cwd=r,stdout=subprocess.PIPE,stderr=subprocess.STDOUT,timeout=300);log=r/(stem+'-cpp.log');log.write_bytes(cp.stdout);records.append(dict(label=stem+'-cpp',command=cmd,exit_code=cp.returncode,seconds=time.monotonic()-start,log_sha256=sha(log)));assert cp.returncode==0,stem+': '+cp.stdout.decode()[-1200:];goal=C/'proof/coq'/(stem+'_goal.v');text=goal.read_text();fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',text,re.M);assert fields and len(fields)==len(set(fields));functions=sorted(name for name,_,_,calls in coverage._functions(cpp.read_text(),stem)if calls is not None);assert functions and len(functions)==len(set(functions));cpps[stem]=cpp;provider=NS+'.'+PROVIDERS[stem];units.append(dict(label=u['label'],stem=stem,fields=fields,checked_module=provider,typed_instance=provider,cpp_sha256=sha(cpp),goal_sha256=sha(goal),functions_defined=functions,cpp_snapshot=str(cpp),goal_source=str(goal)))
  assert len(units)==11;closure=audit_callee_cpp.check(cpps,json.loads((C/'proof/intrinsic-ledger.json').read_text()));assert closure['source_closure_passed'],closure['errors'];assert closure['unique_actual_C_definitions']==26
  own=sorted(p.stem for p in(C/'proof/coq').glob('*.v'));generated={u['stem']+'_goal'for u in units};assert generated<=set(own);math=[]
  for n in own:
   source=C/'proof/coq'/(n+'.v');clean=re.sub(r'\(\*.*?\*\)','',source.read_text(),flags=re.S)
   if n not in generated:assert not re.search(r'\b(?:Axiom|Parameter|Admitted|admit|Abort)\b',clean),n
   lemmas=re.findall(r'(?m)^(?:Lemma|Theorem)\s+(\w+)',clean)
   if lemmas and not re.search(r'(?m)^Module\s',clean)and not any(x.startswith(('proof_of_','typed_'))or x=='checked'for x in lemmas):math.append(n)
  assert {'StateObservation','TraceLookup'}<=set(math);assert inputs==inventory(),'Sources changed during inventory'
  h=dict(schema=1,namespace=NS,whole_kernel_verified=False,scope='frozen full-replay inputs only, no certificate',units=units,strategies=[],own_modules=own,math_modules=math,actual_c_function_count=26,total_actual_c_vcs=sum(len(u['fields'])for u in units),frozen_source_sha256=inputs,native_statuses=['proof/native-status.json','proof/native-address-status.json'],limits=dict(configured_jobs=32,initial_live_admission_slots=16,ordinary_process_memory_GiB=16,heavy_process_memory_GiB=32,ordinary_timeout_seconds=7200,heavy_timeout_seconds=14400,long_generation_timeout_seconds=21600,group_verifier_process_limit=32,local_initial_process_limit=16,semantic_boundary='C-shim partialcorrectness under source-reviewed originalintrinsic contracts; case-local live32element stackarray adapters, no arbitrary ISO C pointer API or compilerABI refinement theorem'),live_cpp_source_closure=closure,production70_source_migration=dict(path=str(migration),sha256=sha(migration)),preflight_directory=str(r));(r/'handoff.json').write_text(json.dumps(h,indent=2)+'\n');s.update(passed=True,actual_c_units=len(units),actual_c_vcs=h['total_actual_c_vcs'],unique_actual_c_bodies=26,ordinary_input_modules=len(own),mathematical_modules=len(math),closure=closure,input_sha256=inputs)
  if a.freeze:
   dest=C/'proof/frozen-full-handoff.json'
   if dest.exists():assert dest.read_bytes()==(r/'handoff.json').read_bytes(),'Existing different handoff; preserve prior freeze explicitly before changing it'
   else:dest.write_bytes((r/'handoff.json').read_bytes())
   s['frozen_handoff_sha256']=sha(dest)
 except Exception as e:s['error']=str(e)
 (r/'status.json').write_text(json.dumps(s,indent=2)+'\n');(C/'proof/full-preflight-status.json').write_bytes((r/'status.json').read_bytes());print(json.dumps({k:s.get(k)for k in ['passed','run_directory','actual_c_units','actual_c_vcs','ordinary_input_modules','frozen_handoff_sha256','error']}));return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
