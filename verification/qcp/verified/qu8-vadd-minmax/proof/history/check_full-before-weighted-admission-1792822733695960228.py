#!/usr/bin/env python3
"""Regenerate every actual C body/strategy and compile all local .v freshly.
No BASE/component objects are copied; exact fully qualified unit interfaces and
all actual C/strategy fields are checked together in one ordinary Coq gate.
"""
import argparse,hashlib,json,re,shutil,subprocess,tempfile,threading,time
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor
from full_inputs import CASE,NS,units as live_units,render_unit,iter_current_unit_texts,sha,tokens
from check_neon_composed import source_guard
import coverage
from split_goal import project,identity
import parallel
from audit_return_ownership import require_clean
HFILE=CASE/'proof/frozen-full-handoff.json'
EXPECTED_UNITS={u['stem']:u['expected_fields']for u in live_units()}if HFILE.exists()else{}
EXPECTED_BODIES={u['stem']:set(u['functions_defined'])for u in json.loads(HFILE.read_text())['units']}if HFILE.exists()else{}
def main():
 if not __debug__:raise RuntimeError('Optimized Python cannot run a verification gate')
 ap=argparse.ArgumentParser(description=__doc__);ap.add_argument('--config',type=Path,required=True);ap.add_argument('--jobs',type=int,default=32);ap.add_argument('--timeout',type=int,default=7200);ap.add_argument('--generation-timeout',type=int,default=21600);ap.add_argument('--heavy-timeout',type=int,default=14400);a=ap.parse_args();assert 16<=a.jobs<=64 and 0<a.timeout<=14400 and 0<a.generation_timeout<=21600 and 0<a.heavy_timeout<=28800
 h=json.loads(HFILE.read_text());handoff_sha=sha(HFILE);run=Path(tempfile.mkdtemp(prefix='full-',dir=CASE/'.build'));coq=run/'coq'/NS;coq.mkdir(parents=True);records=[];units=[];strategies=[];modules=[];lock=threading.Lock();s=dict(passed=False,whole_kernel_verified=False,scope='full',run_directory=str(run),parallel_jobs=a.jobs,per_process_memory_GiB=16,heavy_process_memory_GiB=32,generation_timeout_seconds=a.generation_timeout,ordinary_timeout_seconds=a.timeout,heavy_timeout_seconds=a.heavy_timeout,records=records,actual_c_units=units,strategies=strategies,external_libraries_rebuilt=False,limits=h['limits'])
 def save():(run/'status.json').write_text(json.dumps(s,indent=2)+'\n')
 def execute(cmd,label,timeout=None):
  cmd=list(map(str,cmd));budget=timeout or a.timeout;memory_bytes=17179869184
  if cmd[0]=='qcp':
   budget=a.generation_timeout;memory_bytes=34359738368
  if cmd[:2]==['qcp-env','coqc']:
   heavy=any(token in label for token in ['KernelCalls','KernelStoreFast','UnitInterfaces','AssumptionsPart','FinalCaseCheck'])
   budget=max(a.heavy_timeout if heavy else a.timeout,budget)
   if heavy:memory_bytes=34359738368
   if '-time'not in cmd:cmd.insert(2,'-time')
  cmd=['prlimit','--as='+str(memory_bytes)+':'+str(memory_bytes),'--',*cmd];work=run/'jobs'/label;work.mkdir(parents=True,exist_ok=True);log=run/(label+'.log');t=time.monotonic()
  with log.open('w')as f:
   try:code=subprocess.run(cmd,cwd=work,stdout=f,stderr=f,timeout=budget).returncode
   except subprocess.TimeoutExpired:code=124
  with lock:records.append(dict(label=label,command=cmd,cwd=str(work),exit_code=code,seconds=time.monotonic()-t,memory_limit_bytes=memory_bytes,timeout_seconds=budget,log_sha256=sha(log)));save()
  print(label,code,flush=True)
  if code:raise RuntimeError(label+': '+log.read_text()[-3000:])
 def cpp(src,out,label,flags=()):execute(['gcc','-E','-P','-CC','-nostdinc',*flags,'-I',CASE,src,'-o',out],label,300)
 try:
  assert h['namespace']==NS and len(h['units'])==len(EXPECTED_UNITS) and h['total_actual_c_vcs']==sum(EXPECTED_UNITS.values())
  assert {u['stem']:len(u['fields'])for u in h['units']}==EXPECTED_UNITS and sum(len(u['fields'])for u in h['strategies'])==15
  inputs=h['frozen_source_sha256'];assert inputs and all(n in inputs for n in ['proof/check_full.py','proof/full_inputs.py','spec.c',h['native_status']]);source_guard()
  for n,d in inputs.items():assert not Path(n).is_absolute() and (CASE/n).resolve().is_relative_to(CASE.resolve()) and sha(CASE/n)==d,'Frozen source changed '+n
  config_sha=sha(a.config);tools={n:sha(Path(shutil.which(n)).resolve())for n in ['qcp','qcp-env','coqc','gcc','prlimit','patch']};stool=Path(shutil.which('qcp')).resolve().parent/'StrategyCheck';stool_sha=sha(stool)
  native=json.loads((CASE/h['native_status']).read_text());assert native['passed'] and sha(CASE/h['native_status'])==h['native_status_sha256'];assert native['cases']==21472 and native['public_wrapper_cases']==21472 and native['lanes_per_side_per_path']==2665773 and native['shared_wrong_result_rejected'] and native['all256_low_byte_controls']
  raw_native=json.loads((CASE/'proof/native-status.json').read_text());assert raw_native['passed'] and raw_native['shared_wrong_wrap_rejected'] and raw_native['cases']==21472 and raw_native['lanes_per_side']==2665773
  controls=json.loads((CASE/'proof/control-status.json').read_text());assert controls['passed'] and controls['vc_correct_passed'] and controls['actual_probe_c_vcs']==16 and controls['pure_math_lemmas']==6
  widths=json.loads((CASE/'proof/type-width-status.json').read_text());assert widths['passed'] and widths['selected_model_widths']['size_t']==8 and widths['native_selected_widths_equal']
  asan=json.loads((CASE/'proof/native-asan-status.json').read_text());assert asan['passed'] and asan['ASan_UBSan'] and asan['actual_memory_max']==17179869184 and asan['actual_memory_swap_max']==0 and asan['cases']==asan['public_wrapper_cases']==21472 and asan['lanes_per_side_per_path']==2665773 and asan['shared_wrong_result_rejected']
  for record in [native,raw_native,controls,widths,asan]:
   for n,d in record['input_sha256'].items():assert sha(CASE/n)==d,'Support/native source changed '+n
  # Replay the exact implementation patch against immutable original bytes.
  repair=json.loads((CASE/'proof/repair.json').read_text());assert repair['variant']=='repaired' and sha(CASE/repair['patch'])==repair['patch_sha256'];patched=run/'repair';(patched/'impl').mkdir(parents=True)
  for isa,label in [('NEON','neon'),('RVV','rvv')]:
   orig=CASE/'proof/original'/('test'+isa+'.c');assert sha(orig)==repair['original_'+label+'_sha256'];shutil.copyfile(orig,patched/'impl'/orig.name)
  # patch requires this specific cwd, still isolated and bounded.
  log=run/'repair-patch.log';cmd=['patch','--batch','--fuzz=0','-p1','-i',str(CASE/repair['patch'])];t=time.monotonic()
  with log.open('w')as out:r=subprocess.run(cmd,cwd=patched,stdout=out,stderr=out,timeout=60)
  records.append(dict(label='repair-patch',command=cmd,cwd=str(patched),exit_code=r.returncode,seconds=time.monotonic()-t,log_sha256=sha(log)));assert r.returncode==0
  for isa,label in [('NEON','neon'),('RVV','rvv')]:assert sha(patched/'impl'/('test'+isa+'.c'))==sha(CASE/'impl'/('test'+isa+'.c'))==repair['repaired_'+label+'_sha256']
  public=run/'public.c';cpp(CASE/'spec.c',public,'public-cpp',['-DQCP_FORMAL']);pub={n:(sig,contract)for n,sig,contract,_ in coverage._functions(public.read_text(),'public')};declarations={};definitions={};calls=[];generated=set(h['generated_modules'])
  for n in h['own_modules']:
   if n in generated:continue
   source=CASE/'proof/coq'/(n+'.v');assert 'proof/coq/'+n+'.v'in inputs;clean=re.sub(r'\(\*.*?\*\)','',source.read_text(),flags=re.S);assert not re.search(r'\b(?:Axiom|Parameter|Admitted|admit|Abort)\b',clean),n;shutil.copyfile(source,coq/source.name);modules.append(dict(namespace=NS,name=source.name,path=str((coq/source.name).relative_to(run))))
  def generate_unit(u):
   stem=u['stem'];folder=run/'units'/stem;folder.mkdir(parents=True);src=folder/(stem+'.c');rendered=render_unit(u);src.write_text(rendered['text']);expanded=folder/'expanded.c';cpp(src,expanded,stem+'-cpp',rendered['cpp_flags']);assert sha(expanded)==u['cpp_sha256'],'Live CPP differs '+stem
   if rendered['identity_text']:
    raw=folder/'raw.c';raw.write_text(rendered['identity_text']);out=folder/'raw-expanded.c';cpp(raw,out,stem+'-identity-cpp',rendered['cpp_flags']);assert tokens(out.read_text())==tokens(expanded.read_text()),'Executable source mismatch '+stem
   src.write_bytes(expanded.read_bytes());out=folder/'generated';out.mkdir();limit=4096 if stem in ['scalar','rvv_load','rvv_store','neon_unit','rvv_unit']else 1024
   execute(['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--strategy-application-limit='+str(limit),'--input-file='+str(src),'--coq-output-dir='+str(out),'--coq-logic-path='+NS,'-slp',CASE/'shim',NS,'-slp',CASE/'proof/c',NS],stem+'-qcp')
   goal=out/(stem+'_goal.v');require_clean(goal);assert sha(goal)==u['goal_sha256'],'Exact actual goal differs '+stem;fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',goal.read_text(),re.M);assert fields==u['fields'] and len(fields)==len(set(fields));dest=coq/goal.name;projection=None
   if u.get('goal_projection_identity'):
    projection=project(goal,coq,NS,stem);assert identity(projection)==u['goal_projection_identity'],'Fresh raw/projection identity differs '+stem
    module_rows=[dict(namespace=NS,name=Path(x['path']).name,path=str(Path(x['path']).relative_to(run)))for x in projection['chunks']+projection['auxiliary_modules']]
   else:shutil.copyfile(goal,dest);module_rows=[]
   module_rows.append(dict(namespace=NS,name=goal.name,path=str(dest.relative_to(run))))
   parsed=list(coverage._functions(expanded.read_text(),stem));assert sorted(n for n,_,_,e in parsed if e is not None)==u['functions_defined'];unit=dict(label=NS+'/'+stem,namespace=NS,stem=stem,fields=fields,c_vcs=len(fields),checked_module=u['typed_instance'],fresh_goal_path=str(dest),raw_goal_path=str(goal.relative_to(run)),goal_sha256=sha(goal),compiled_goal_sha256=sha(dest),cpp_sha256=sha(expanded))
   if projection:unit['goal_projection']=projection;unit['goal_projection_identity']=identity(projection)
   return unit,module_rows,parsed
  with ThreadPoolExecutor(max_workers=a.jobs)as pool:got=list(pool.map(generate_unit,h['units']))
  for unit,unit_modules,parsed in got:
   funcs=[]
   for name,sig,contract,edges in parsed:
    pair=sig,contract
    if name in declarations:assert declarations[name]==pair,'Contract/signature differs '+name
    if name in pub:assert pub[name]==pair,'Public contract/signature differs '+name
    declarations[name]=pair;funcs.append(dict(name=name,definition=edges is not None,signature_sha256=hashlib.sha256(repr(sig).encode()).hexdigest(),contract_sha256=hashlib.sha256(contract.encode()).hexdigest()))
    if edges is not None:definitions.setdefault(name,[]).append(unit['label']);calls.extend((name,e)for e in edges)
   unit['functions']=funcs;units.append(unit);modules.extend(unit_modules)
  missing=sorted(set(declarations)-set(definitions));unbound=sorted({e for _,e in calls}-set(definitions));assert not missing and not unbound and len(definitions)==h['actual_c_function_count'] and all(n in definitions for n in h['whole_kernel_bodies_required']);s['call_closure']=dict(definitions=definitions,calls=sorted(set(calls)),unbound_callees=unbound,declarations_without_checked_body=missing,unique_c_functions_with_bodies=len(definitions),exact_contract_and_signature_match=True)
  def generate_strategy(u):
   stem=u['stem'];out=run/('strategy-'+stem);out.mkdir();execute([stool,'--arch=64','--endian=little','--no-exec-info','--input-file='+str(CASE/u['file']),'--coq-output-dir='+str(out),'--coq-logic-path='+NS],stem+'-strategy',600);g=out/(stem+'_strategy_goal.v');assert sha(g)==u['goal_sha256'];fields=re.findall(r'^\s*Axiom (\w+)\s*:',g.read_text(),re.M);assert fields==u['fields'];dest=coq/g.name;shutil.copyfile(g,dest);return dict(label=NS+'/'+stem,namespace=NS,stem=stem,module_type=u['module_type'],fields=fields,checked_module=u['typed_instance'],goal_sha256=sha(g)),dict(namespace=NS,name=g.name,path=str(dest.relative_to(run)))
  with ThreadPoolExecutor(max_workers=a.jobs)as pool:got=list(pool.map(generate_strategy,h['strategies']))
  for st,mod in got:strategies.append(st);modules.append(mod)
  assert len(modules)==len(h['own_modules']) and not list((run/'coq').rglob('*.vo'));flags=json.loads(a.config.read_text())['flags'][2:]+['-Q',str(coq),NS];s.update(input_sha256=inputs,config_sha256=config_sha,tool_sha256=tools,strategy_tool_sha256=stool_sha);save();parallel.compile_modules(modules,run,flags,execute,a.jobs)
  interfaces=[];reports=[]
  for i,u in enumerate(units):
   goal=NS+'.'+u['stem']+'_goal';proof=u['checked_module'];interfaces+=['Require Import '+goal+' '+proof.rsplit('.',1)[0]+'.',f'Module ActualUnit{i} : {goal}.VC_Correct := {proof}.'];reports += ['Print Assumptions '+NS+'.UnitInterfaces.ActualUnit'+str(i)+'.proof_of_'+f+'.'for f in u['fields']]
  for i,u in enumerate(strategies):
   goal=NS+'.'+u['stem']+'_strategy_goal';proof=u['checked_module'];interfaces+=['Require Import '+goal+' '+proof.rsplit('.',1)[0]+'.',f'Module ActualStrategy{i} : {goal}.{u["module_type"]} := {proof}.'];reports += ['Print Assumptions '+NS+'.UnitInterfaces.ActualStrategy'+str(i)+'.'+f+'.'for f in u['fields']]
  # C fields and strategies are printed exactly once here. Mathematical support
  # with the case/byte prefix is separately reported, without C-VC credit.
  math_reports=[]
  for u in units:
   if u.get('goal_projection_identity'):
    pr=u['goal_projection_identity'];interfaces.append('Require Import '+pr['source_identity_module']+'.')
    for item in pr.get('source_identity_reports',[dict(module=pr['source_identity_module'],lemma=pr['source_identity_lemma'])]):math_reports.append('Print Assumptions '+item['module']+'.'+item['lemma']+'.')
  for mod in modules:
   name=Path(mod['name']).stem
   if name in h['generated_modules']:continue
   text=(run/mod['path']).read_text()
   for lemma in re.findall(r'^Lemma\s+((?:qa_|qu_|s8_|u8_|byte_)\w+)\s*:',text,re.M):
    if 'strategy'in lemma:continue
    math_reports.append('Print Assumptions '+NS+'.'+name+'.'+lemma+'.')
  reports+=math_reports
  interface_file=coq/'UnitInterfaces.v';interface_file.write_text('\n'.join(interfaces)+'\n');execute(['qcp-env','coqc',*flags,interface_file],'UnitInterfaces');extra_modules=[dict(namespace=NS,name=interface_file.name,path=str(interface_file.relative_to(run)))]
  parts=[]
  for i in range(16):
   name=f'AssumptionsPart{i:02}';source=coq/(name+'.v');items=reports[i::16];source.write_text('From '+NS+' Require Import UnitInterfaces.\n'+'\n'.join(items)+'\n');parts.append(dict(name=name,path=source,reports=len(items),source_sha256=sha(source)));extra_modules.append(dict(namespace=NS,name=source.name,path=str(source.relative_to(run))))
  def check_assumptions(part):
   execute(['qcp-env','coqc',*flags,part['path']],part['name']);log=run/(part['name']+'.log');actual=len(re.findall(r'^(?:Axioms:|Closed under the global context)',log.read_text(),re.M));assert actual==part['reports'],(part['name'],actual,part['reports']);return dict(module=NS+'.'+part['name'],source_path=str(part['path'].relative_to(run)),source_sha256=part['source_sha256'],log_sha256=sha(log),reports=actual)
  with ThreadPoolExecutor(max_workers=a.jobs)as pool:assumption_parts=list(pool.map(check_assumptions,parts))
  combined=run/'FinalAssumptions.log';combined.write_bytes(b''.join((run/(p['name']+'.log')).read_bytes()for p in parts));assert sum(p['reports']for p in assumption_parts)==len(reports)
  final_lines=['From '+NS+' Require Import UnitInterfaces '+' '.join(p['name']for p in parts)+'.']
  for i,u in enumerate(units):final_lines.append('Module ActualUnit'+str(i)+' : '+NS+'.'+u['stem']+'_goal.VC_Correct := '+NS+'.UnitInterfaces.ActualUnit'+str(i)+'.')
  for i,u in enumerate(strategies):final_lines.append('Module ActualStrategy'+str(i)+' : '+NS+'.'+u['stem']+'_strategy_goal.'+u['module_type']+' := '+NS+'.UnitInterfaces.ActualStrategy'+str(i)+'.')
  final=coq/'FinalCaseCheck.v';final.write_text('\n'.join(final_lines)+'\n');execute(['qcp-env','coqc',*flags,final],'FinalCaseCheck');shutil.copyfile(final,run/'FinalCaseCheck.v');extra_modules.append(dict(namespace=NS,name=final.name,path=str(final.relative_to(run))));modules+=extra_modules
  for n,d in inputs.items():assert sha(CASE/n)==d,'Frozen input drift '+n
  for n,d in tools.items():assert sha(Path(shutil.which(n)).resolve())==d,'Tool drift '+n
  assert sha(a.config)==config_sha and sha(stool)==stool_sha and sha(HFILE)==handoff_sha;assert len(units)==len(h['units']) and sum(u['c_vcs']for u in units)==h['total_actual_c_vcs'] and sum(len(u['fields'])for u in strategies)==15
  s.update(passed=True,whole_kernel_verified=True,verification_state='checked_repaired_c_shim_partial_correctness',checked_c_units=len(units),checked_c_vcs=sum(u['c_vcs']for u in units),checked_strategy_fields=15,fresh_compiled_local_modules=len(modules),no_component_vo_reused=True,final_gate_sha256=sha(final),final_assumptions_log_sha256=sha(combined),final_assumptions_log_path=str(combined.relative_to(run)),assumption_parts=assumption_parts,assumption_reports=len(reports),mathematical_support_reports=len(math_reports),final_gate_path=str(final.relative_to(run)),compiled_source_sha256={NS+'.'+Path(m['name']).stem:sha(run/m['path'])for m in modules},handoff_sha256=handoff_sha)
 except Exception as e:s['error']=str(e);print(e,flush=True)
 finally:
  save();dest=CASE/'proof/full-status.json'
  if dest.exists():old=dest.read_bytes();(CASE/'proof/history'/('full-status-'+hashlib.sha256(old).hexdigest()+'.json')).write_bytes(old)
  dest.write_text(json.dumps(s,indent=2)+'\n');print('RUN',run,flush=True)
 return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
