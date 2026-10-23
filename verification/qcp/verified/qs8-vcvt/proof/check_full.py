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
import coverage,parallel
from audit_return_ownership import require_clean
HFILE=CASE/'proof/frozen-full-handoff.json'
EXPECTED_UNITS={u['stem']:u['expected_fields']for u in live_units()}
EXPECTED_BODIES={u['stem']:set(u['functions_defined'])for u in json.loads(HFILE.read_text())['units']}if HFILE.exists()else{}
def main():
 if not __debug__:raise RuntimeError('Optimized Python cannot run a verification gate')
 ap=argparse.ArgumentParser(description=__doc__);ap.add_argument('--config',type=Path,required=True);ap.add_argument('--jobs',type=int,default=16);ap.add_argument('--timeout',type=int,default=3600);a=ap.parse_args();assert 1<=a.jobs<=16 and 0<a.timeout<=14400
 h=json.loads(HFILE.read_text());handoff_sha=sha(HFILE);run=Path(tempfile.mkdtemp(prefix='full-',dir=CASE/'.build'));coq=run/'coq'/NS;coq.mkdir(parents=True);records=[];units=[];strategies=[];modules=[];lock=threading.Lock();s=dict(passed=False,whole_kernel_verified=False,scope='full',run_directory=str(run),parallel_jobs=a.jobs,per_process_memory_GiB=16,records=records,actual_c_units=units,strategies=strategies,external_libraries_rebuilt=False,limits=h['limits'])
 def save():(run/'status.json').write_text(json.dumps(s,indent=2)+'\n')
 def execute(cmd,label,timeout=None):
  cmd=list(map(str,cmd));budget=timeout or a.timeout
  if cmd[:2]==['qcp-env','coqc']:
   budget=max(a.timeout,budget)
   if '-time'not in cmd:cmd.insert(2,'-time')
  cmd=['prlimit','--as=17179869184:17179869184','--',*cmd];work=run/'jobs'/label;work.mkdir(parents=True,exist_ok=True);log=run/(label+'.log');t=time.monotonic()
  with log.open('w')as f:
   try:code=subprocess.run(cmd,cwd=work,stdout=f,stderr=f,timeout=budget).returncode
   except subprocess.TimeoutExpired:code=124
  with lock:records.append(dict(label=label,command=cmd,cwd=str(work),exit_code=code,seconds=time.monotonic()-t,log_sha256=sha(log)));save()
  print(label,code,flush=True)
  if code:raise RuntimeError(label+': '+log.read_text()[-3000:])
 def cpp(src,out,label,flags=()):execute(['gcc','-E','-P','-CC','-nostdinc',*flags,'-I',CASE,src,'-o',out],label,300)
 try:
  assert h['namespace']==NS and len(h['units'])==25 and h['total_actual_c_vcs']==1664 and h['actual_c_function_count']==64
  assert {u['stem']:len(u['fields'])for u in h['units']}==EXPECTED_UNITS and sum(len(u['fields'])for u in h['strategies'])==15
  inputs=h['frozen_source_sha256'];assert inputs and all(n in inputs for n in ['proof/check_full.py','proof/full_inputs.py','spec.c',h['native_status']]);source_guard()
  for n,d in inputs.items():assert not Path(n).is_absolute() and (CASE/n).resolve().is_relative_to(CASE.resolve()) and sha(CASE/n)==d,'Frozen source changed '+n
  config_sha=sha(a.config);tools={n:sha(Path(shutil.which(n)).resolve())for n in ['qcp','qcp-env','coqc','gcc','prlimit','patch']};stool=Path(shutil.which('qcp')).resolve().parent/'StrategyCheck';stool_sha=sha(stool)
  native=json.loads((CASE/h['native_status']).read_text());assert native['passed'] and sha(CASE/h['native_status'])==h['native_status_sha256'];assert set(native['variants'])=={'composed','canonical-nested'} and all(v['cases']==27496 and v['lanes_per_side']==1998725 for v in native['variants'].values()) and native['negative_controls'][0]['observed_exit_code']==1
  for n,d in native['input_sha256'].items():assert sha(CASE/n)==d,'Native source changed '+n
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
   source=CASE/'proof/coq'/(n+'.v');assert 'proof/coq/'+n+'.v'in inputs;clean=re.sub(r'\(\*.*?\*\)','',source.read_text(),flags=re.S);assert not re.search(r'\b(?:Axiom|Parameter|Admitted|admit)\b',clean),n;shutil.copyfile(source,coq/source.name);modules.append(dict(namespace=NS,name=source.name,path=str((coq/source.name).relative_to(run))))
  def generate_unit(u):
   stem=u['stem'];folder=run/'units'/stem;folder.mkdir(parents=True);src=folder/(stem+'.c');rendered=render_unit(u);src.write_text(rendered['text']);expanded=folder/'expanded.c';cpp(src,expanded,stem+'-cpp',rendered['cpp_flags']);assert sha(expanded)==u['cpp_sha256'],'Live CPP differs '+stem
   if rendered['identity_text']:
    raw=folder/'raw.c';raw.write_text(rendered['identity_text']);out=folder/'raw-expanded.c';cpp(raw,out,stem+'-identity-cpp',rendered['cpp_flags']);assert tokens(out.read_text())==tokens(expanded.read_text()),'Executable source mismatch '+stem
   src.write_bytes(expanded.read_bytes());out=folder/'generated';out.mkdir();limit=4096 if stem in ['scalar','rvv_load','rvv_store']else 1024
   execute(['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--strategy-application-limit='+str(limit),'--input-file='+str(src),'--coq-output-dir='+str(out),'--coq-logic-path='+NS,'-slp',CASE/'shim',NS,'-slp',CASE/'proof/c',NS],stem+'-qcp')
   goal=out/(stem+'_goal.v');require_clean(goal);assert sha(goal)==u['goal_sha256'],'Exact actual goal differs '+stem;fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',goal.read_text(),re.M);assert fields==u['fields'] and len(fields)==len(set(fields));dest=coq/goal.name;shutil.copyfile(goal,dest);parsed=list(coverage._functions(expanded.read_text(),stem));assert sorted(n for n,_,_,e in parsed if e is not None)==u['functions_defined'];return dict(label=NS+'/'+stem,namespace=NS,stem=stem,fields=fields,c_vcs=len(fields),checked_module=u['typed_instance'],fresh_goal_path=str(dest),goal_sha256=sha(goal),cpp_sha256=sha(expanded)),dict(namespace=NS,name=goal.name,path=str(dest.relative_to(run))),parsed
  with ThreadPoolExecutor(max_workers=a.jobs)as pool:got=list(pool.map(generate_unit,h['units']))
  for unit,mod,parsed in got:
   funcs=[]
   for name,sig,contract,edges in parsed:
    pair=sig,contract
    if name in declarations:assert declarations[name]==pair,'Contract/signature differs '+name
    if name in pub:assert pub[name]==pair,'Public contract/signature differs '+name
    declarations[name]=pair;funcs.append(dict(name=name,definition=edges is not None,signature_sha256=hashlib.sha256(repr(sig).encode()).hexdigest(),contract_sha256=hashlib.sha256(contract.encode()).hexdigest()))
    if edges is not None:definitions.setdefault(name,[]).append(unit['label']);calls.extend((name,e)for e in edges)
   unit['functions']=funcs;units.append(unit);modules.append(mod)
  missing=sorted(set(declarations)-set(definitions));unbound=sorted({e for _,e in calls}-set(definitions));assert not missing and not unbound and len(definitions)==64 and all(n in definitions for n in h['whole_kernel_bodies_required']);s['call_closure']=dict(definitions=definitions,calls=sorted(set(calls)),unbound_callees=unbound,declarations_without_checked_body=missing,unique_c_functions_with_bodies=len(definitions),exact_contract_and_signature_match=True)
  def generate_strategy(u):
   stem=u['stem'];out=run/('strategy-'+stem);out.mkdir();execute([stool,'--arch=64','--endian=little','--no-exec-info','--input-file='+str(CASE/u['file']),'--coq-output-dir='+str(out),'--coq-logic-path='+NS],stem+'-strategy',600);g=out/(stem+'_strategy_goal.v');assert sha(g)==u['goal_sha256'];fields=re.findall(r'^\s*Axiom (\w+)\s*:',g.read_text(),re.M);assert fields==u['fields'];dest=coq/g.name;shutil.copyfile(g,dest);return dict(label=NS+'/'+stem,namespace=NS,stem=stem,module_type=u['module_type'],fields=fields,checked_module=u['typed_instance'],goal_sha256=sha(g)),dict(namespace=NS,name=g.name,path=str(dest.relative_to(run)))
  with ThreadPoolExecutor(max_workers=a.jobs)as pool:got=list(pool.map(generate_strategy,h['strategies']))
  for st,mod in got:strategies.append(st);modules.append(mod)
  assert len(modules)==len(h['own_modules']) and not list((run/'coq').rglob('*.vo'));flags=json.loads(a.config.read_text())['flags'][2:]+['-Q',str(coq),NS];s.update(input_sha256=inputs,config_sha256=config_sha,tool_sha256=tools,strategy_tool_sha256=stool_sha);save();parallel.compile_modules(modules,run,flags,execute,a.jobs)
  gate=[]
  for i,u in enumerate(units):
   goal=NS+'.'+u['stem']+'_goal';proof=u['checked_module'];gate+=['Require Import '+goal+' '+proof.rsplit('.',1)[0]+'.',f'Module ActualUnit{i} : {goal}.VC_Correct := {proof}.']+['Print Assumptions ActualUnit'+str(i)+'.proof_of_'+f+'.'for f in u['fields']]
  for i,u in enumerate(strategies):
   goal=NS+'.'+u['stem']+'_strategy_goal';proof=u['checked_module'];gate+=['Require Import '+goal+' '+proof.rsplit('.',1)[0]+'.',f'Module ActualStrategy{i} : {goal}.{u["module_type"]} := {proof}.']+['Print Assumptions ActualStrategy'+str(i)+'.'+f+'.'for f in u['fields']]
  final=run/'FinalCaseCheck.v';final.write_text('\n'.join(gate)+'\n');execute(['qcp-env','coqc',*flags,final],'FinalCaseCheck')
  for n,d in inputs.items():assert sha(CASE/n)==d,'Frozen input drift '+n
  for n,d in tools.items():assert sha(Path(shutil.which(n)).resolve())==d,'Tool drift '+n
  assert sha(a.config)==config_sha and sha(stool)==stool_sha and sha(HFILE)==handoff_sha;assert len(units)==25 and sum(u['c_vcs']for u in units)==1664 and sum(len(u['fields'])for u in strategies)==15
  s.update(passed=True,whole_kernel_verified=True,verification_state='checked_repaired_c_shim_partial_correctness',checked_c_units=25,checked_c_vcs=1664,checked_strategy_fields=15,fresh_compiled_local_modules=len(modules)+1,no_component_vo_reused=True,final_gate_sha256=sha(final),final_assumptions_log_sha256=sha(run/'FinalCaseCheck.log'),compiled_source_sha256={NS+'.'+Path(m['name']).stem:sha(run/m['path'])for m in modules},handoff_sha256=handoff_sha)
 except Exception as e:s['error']=str(e);print(e,flush=True)
 finally:
  save();dest=CASE/'proof/full-status.json'
  if dest.exists():old=dest.read_bytes();(CASE/'proof/history'/('full-status-'+hashlib.sha256(old).hexdigest()+'.json')).write_bytes(old)
  dest.write_text(json.dumps(s,indent=2)+'\n');print('RUN',run,flush=True)
 return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
