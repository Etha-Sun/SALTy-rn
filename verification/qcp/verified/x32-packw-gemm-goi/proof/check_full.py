#!/usr/bin/env python3
"""Whole-case fresh C/Coq replay, requiring a completed frozen inventory.

No component object is copied. Registered original intrinsic contracts are
the explicit specification boundary; every ordinary callee has a checked body.
"""
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor
import argparse,hashlib,json,os,re,shutil,subprocess,tempfile,threading,time
from full_inputs import CASE as C,NS,iter_current_unit_texts,sha
import audit_callee_cpp,coverage,parallel,external_dependencies
HFILE=C/'proof/frozen-full-handoff.json'
EXPECTED_BODIES={u['stem']:set(u['functions_defined'])for u in json.loads(HFILE.read_text())['units']}if HFILE.exists()else{}
def interface_source(units):
 text=''
 for i,u in enumerate(units):
  goal=NS+'.'+u['stem']+'_goal';provider=u['checked_module'];text+='Require Import '+goal+' '+provider.rsplit('.',1)[0]+'.\nModule ActualUnit'+str(i)+' : '+goal+'.VC_Correct := '+provider+'.\n'
 return text
def final_source(parts):
 return 'From '+NS+' Require Import UnitInterfaces StateObservation '+' '.join(p['name']for p in parts)+'.\nDefinition complete_bitwise_state := X32Packw.StateObservation.pw_kernel_posts_full_map.\nDefinition own_optional_frame_cases := X32Packw.StateObservation.pw_static_memory_frames.\n'

def main():
 if not __debug__:raise RuntimeError('Verification requires normal Python assertions')
 p=argparse.ArgumentParser();p.add_argument('--config',type=Path,required=True);p.add_argument('--jobs',type=int,default=32);p.add_argument('--live-slots',type=int,default=8);a=p.parse_args();assert 2<=a.live_slots<=a.jobs<=32
 if not HFILE.is_file():p.error('Completed frozen handoff is not ready; whole-case execution is refused')
 h=json.loads(HFILE.read_text());assert h['namespace']==NS and not h.get('strategies'), 'This case consumes no custom strategies'
 assert len(h['units'])==13 and h['actual_c_function_count']==14
 r=Path(tempfile.mkdtemp(prefix='full-',dir=C/'.build'));coq=r/'coq'/NS;coq.mkdir(parents=True);records=[];units=[];modules=[];lock=threading.Lock();cv=threading.Condition();active={'slots':0,'processes':0,'peak_slots':0,'peak_processes':0};control=r/'live-limit.json';control.write_text(json.dumps({'live_admission_slots':a.live_slots})+'\n')
 s=dict(passed=False,whole_kernel_verified=False,scope='actualC under explicit originalintrinsic specification boundary; not ISA/ABI/compilerrefinement',run_directory=str(r),configured_workers=a.jobs,parallel_jobs=a.jobs,initial_live_admission_slots=a.live_slots,address_space_slot_GiB=16,ordinary_process_memory_GiB=16,heavy_process_memory_GiB=32,limits=h['limits'],records=records,actual_c_units=units,strategies=[],external_libraries_rebuilt=False,handoff_sha256=sha(HFILE))
 env={**os.environ,'PATH':str(C.parents[3]/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']};os.environ['PATH']=env['PATH']
 def save():(r/'status.json').write_text(json.dumps(s,indent=2)+'\n')
 def execute(cmd,label,timeout=None,memory_gib=None):
  cmd=list(map(str,cmd));is_coq=cmd[:2]==['qcp-env','coqc'];heavy=is_coq and any(w in label for w in ['neon_unit_goal','rvv_unit_goal','NeonChecked','RvvChecked','AssumptionsPart','FinalCaseCheck'])
  mem=memory_gib or(32 if heavy else 16);assert mem in [16,32];budget=timeout or(14400 if heavy else 7200);weight=mem//16
  if is_coq and'-time'not in cmd:cmd.insert(2,'-time')
  wrapped=['prlimit','--as='+str(mem*1024**3)+':'+str(mem*1024**3),'--',*cmd]
  with cv:
   while active['slots']+weight>json.loads(control.read_text())['live_admission_slots']:cv.wait(timeout=.25)
   active['slots']+=weight;active['processes']+=1;active['peak_slots']=max(active['peak_slots'],active['slots']);active['peak_processes']=max(active['peak_processes'],active['processes'])
  log=r/(label+'.log');cwd=r/'jobs'/label;cwd.mkdir(parents=True);t=time.monotonic()
  try:
   with log.open('w')as out:
    try:code=subprocess.run(wrapped,cwd=cwd,env=env,stdout=out,stderr=out,timeout=budget).returncode
    except subprocess.TimeoutExpired:code=124
  finally:
   with cv:active['slots']-=weight;active['processes']-=1;cv.notify_all()
  with lock:records.append(dict(label=label,command=wrapped,cwd=str(cwd),exit_code=code,seconds=time.monotonic()-t,timeout_seconds=budget,memory_GiB=mem,log_sha256=sha(log)));s['peak_actual_live_processes']=active['peak_processes'];s['peak_address_space_admitted_bytes']=active['peak_slots']*16*1024**3;save()
  print(label,code,flush=True);assert code==0,label+': '+log.read_text()[-2500:]
 save();print(r,flush=True)
 try:
  inputs=h['frozen_source_sha256'];assert inputs and all(n in inputs for n in ['proof/check_full.py','proof/full_inputs.py','proof/intrinsic-ledger.json','spec.c'])
  for n,v in inputs.items():assert not Path(n).is_absolute()and(C/n).resolve().is_relative_to(C.resolve())and sha(C/n)==v,'Source changed: '+n
  for status_name in h['native_statuses']:
   native=json.loads((C/status_name).read_text());assert native['passed'];assert all(sha(C/n)==v for n,v in native['input_sha256'].items()),status_name
   assert native['original_compatible_regression']['cases']==41184 and native['original_compatible_regression']['public_caller_calls']==41184 and native['both_wrong_still_equal_oracle_rejected']
  assert h['total_actual_c_vcs']==sum(len(u['fields'])for u in h['units'])
  generated={u['stem']+'_goal'for u in h['units']};assert generated<=set(h['own_modules'])
  for n in h['own_modules']:
   if n in generated:continue
   source=C/'proof/coq'/(n+'.v');assert str(source.relative_to(C))in inputs
   clean=re.sub(r'\(\*.*?\*\)','',source.read_text(),flags=re.S);assert not re.search(r'\b(?:Axiom|Parameter|Admitted|admit|Abort)\b',clean),n
   shutil.copy2(source,coq/source.name);modules.append(dict(namespace=NS,name=source.name,path=str((coq/source.name).relative_to(r))))
  live={u['stem']:u for u in iter_current_unit_texts()};assert set(live)=={u['stem']for u in h['units']}
  def generate(u):
   stem=u['stem'];v=live[stem];folder=r/'units'/stem;folder.mkdir(parents=True);src=folder/(stem+'.in.c');src.write_text(v['text']);cpp=folder/(stem+'.c')
   execute(['gcc','-E','-P','-CC','-nostdinc','-I',C,*v['cpp_flags'],src,'-o',cpp],stem+'-cpp',300);assert sha(cpp)==u['cpp_sha256'],stem+' CPP identity'
   out=folder/'generated';out.mkdir();execute(['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--strategy-application-limit=4096','--input-file='+str(cpp),'--coq-output-dir='+str(out),'--coq-logic-path='+NS,'-slp',C/'shim',NS],stem+'-qcp',21600,32 if stem in ['neon_unit','rvv_unit','propagate']else 16)
   goal=out/(stem+'_goal.v');assert sha(goal)==u['goal_sha256'],stem+' goal identity';text=goal.read_text();fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',text,re.M);assert fields==u['fields']and len(fields)==len(set(fields))
   parsed=list(coverage._functions(cpp.read_text(),stem));assert sorted(n for n,_,_,edges in parsed if edges is not None)==u['functions_defined'];dest=coq/goal.name;shutil.copy2(goal,dest)
   return dict(label=NS+'/'+stem,namespace=NS,stem=stem,fields=fields,c_vcs=len(fields),checked_module=u['typed_instance'],cpp_sha256=sha(cpp),goal_sha256=sha(goal),fresh_goal_path=str(dest)),dict(namespace=NS,name=goal.name,path=str(dest.relative_to(r))),cpp
  with ThreadPoolExecutor(max_workers=a.jobs)as pool:results=list(pool.map(generate,h['units']))
  cpp_units={}
  for unit,mod,cpp in results:units.append(unit);modules.append(mod);cpp_units[unit['stem']]=cpp
  closure=audit_callee_cpp.check(cpp_units,json.loads((C/'proof/intrinsic-ledger.json').read_text()));assert closure['source_closure_passed']and closure['unique_actual_C_definitions']==h['actual_c_function_count'],closure['errors']
  s['call_closure']=dict(definitions=closure['actual_C_definitions'],calls=closure['calls'],unbound_callees=[],declarations_without_checked_body=[],unique_c_functions_with_bodies=h['actual_c_function_count'],exact_contract_and_signature_match=True,intrinsic_spec_declarations_without_c_body=sorted({e['formal_symbol']for e in json.loads((C/'proof/intrinsic-ledger.json').read_text())['entries']}),intrinsic_spec_body_credit=False,source_audit=closure)
  assert not list((r/'coq').rglob('*.vo'));assert {Path(m['name']).stem for m in modules}==set(h['own_modules'])
  flags=json.loads(a.config.read_text())['flags'][2:]+['-Q',str(coq),NS];fresh={NS+'.'+Path(m['name']).stem for m in modules};external_require=external_dependencies.external_imports([r/m['path']for m in modules],fresh)
  external=external_dependencies.external_snapshot(r,external_require,flags,execute,'external-before');assert not fresh&set(external)
  # The shared dependency scheduler supplies a legacy180s advisory argument.
  # Discard it here so execute enforces the frozen7200/14400s full-case budgets.
  s.update(input_sha256=inputs,config_sha256=sha(a.config),tool_sha256={n:sha(Path(shutil.which(n,path=env['PATH'])).resolve())for n in ['qcp','qcp-env','coqc','coqtop','gcc','prlimit']},external_recursive_vo_closure=external);save();parallel.compile_modules(modules,r,flags,lambda cmd,label,_helper_timeout:execute(cmd,label),a.jobs)
  interfaces=coq/'UnitInterfaces.v';interfaces.write_text(interface_source(units));execute(['qcp-env','coqc',*flags,interfaces],'UnitInterfaces');modules.append(dict(namespace=NS,name=interfaces.name,path=str(interfaces.relative_to(r))))
  reports=['Print Assumptions '+NS+'.UnitInterfaces.ActualUnit'+str(i)+'.proof_of_'+f+'.'for i,u in enumerate(units)for f in u['fields']]
  math_reports=['Print Assumptions '+NS+'.'+n+'.'+f+'.'for n in h['math_modules']for f in re.findall(r'(?m)^(?:Lemma|Theorem)\s+(\w+)',(coq/(n+'.v')).read_text())if not f.startswith(('proof_of_','typed_','checked_'))and f!='checked'];all_reports=reports+math_reports;parts=[]
  for i in range(16):
   name='AssumptionsPart'+str(i).zfill(2);p=coq/(name+'.v');lines=all_reports[i::16];p.write_text('From '+NS+' Require Import UnitInterfaces '+' '.join(h['math_modules'])+'.\n'+'\n'.join(lines)+'\n');parts.append(dict(name=name,reports=lines,path=str(p)))
  with ThreadPoolExecutor(max_workers=a.jobs)as pool:list(pool.map(lambda part:execute(['qcp-env','coqc',*flags,part['path']],part['name']),parts))
  modules += [dict(namespace=NS,name=p['name']+'.v',path=str(Path(p['path']).relative_to(r)))for p in parts]
  final=coq/'FinalCaseCheck.v';final.write_text(final_source(parts))
  execute(['qcp-env','coqc',*flags,final],'FinalCaseCheck');modules.append(dict(namespace=NS,name=final.name,path=str(final.relative_to(r))));fresh={NS+'.'+Path(m['name']).stem for m in modules}
  loaded=external_dependencies.external_snapshot(r,sorted(fresh),flags,execute,'external-after');assert fresh<=set(loaded)and{n:v for n,v in loaded.items()if n not in fresh}==external
  for n,v in loaded.items():
   if n in fresh:assert Path(v['path'])==(coq/(n.split('.')[-1]+'.vo')).resolve(),n
  (r/'external-dependencies.json').write_text(json.dumps(dict(external=external,loaded_after=loaded),indent=2)+'\n');report=r/'FinalAssumptions.log';report.write_bytes(b''.join((r/(p['name']+'.log')).read_bytes()for p in parts));assert all(sha(C/n)==v for n,v in inputs.items())and sha(HFILE)==s['handoff_sha256']
  s.update(passed=True,whole_kernel_verified=True,verification_state='actualC_under_explicit_intrinsic_spec_boundary',checked_c_units=len(units),checked_c_vcs=len(reports),checked_strategy_fields=0,fresh_compiled_local_modules=len(modules),no_component_vo_reused=True,final_gate_sha256=sha(final),final_gate_path=str(final),final_assumptions_log_sha256=sha(report),final_assumptions_log_path=str(report),assumption_parts=parts,mathematical_support_reports=math_reports,compiled_source_sha256={NS+'.'+Path(m['name']).stem:sha(r/m['path'])for m in modules},loaded_recursive_vo_closure=loaded)
 except Exception as e:s['error']=str(e)
 save();dest=C/'proof/full-status.json'
 if dest.exists():(C/'proof/history'/('full-status-'+sha(dest)+'.json')).write_bytes(dest.read_bytes())
 dest.write_bytes((r/'status.json').read_bytes());print(json.dumps({k:s.get(k)for k in ['passed','run_directory','checked_c_vcs','fresh_compiled_local_modules','error']}));return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
