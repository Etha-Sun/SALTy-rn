#!/usr/bin/env python3
"""Complete fresh actual-C/ordinary-Coq gate driven by a frozen case inventory.

Installed under case/proof after reviewing the completed kernel components.
A component certificate or copied object file cannot satisfy this gate.
"""
import argparse,hashlib,importlib.util,json,re,shutil,subprocess,sys,tempfile,threading,time
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor
sys.dont_write_bytecode=True

def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def tokens(t):return re.findall(r'\w+|[^\s\w]',re.sub(r'/\*.*?\*/|//[^\n]*','',t,flags=re.S))
def load_module(name,p):
 s=importlib.util.spec_from_file_location(name,p);m=importlib.util.module_from_spec(s);s.loader.exec_module(m);return m
EXPECTED_UNITS={'bits': 19, 'scalar': 161, 'active': 31, 'vmovq_n_u32': 2, 'vreinterpretq_f32_u32': 6, 'vabsq_f32': 6, 'vaddq_f32': 6, 'vsubq_f32': 6, 'vcaltq_f32': 6, 'vorrq_u32': 2, 'vbslq_f32': 6, '__riscv_vfabs_v_f32m8': 98, '__riscv_vfadd_vf_f32m8': 98, '__riscv_vfsub_vf_f32m8': 98, '__riscv_vfsgnj_vv_f32m8': 98, '__riscv_vmfgt_vf_f32m8_b4': 98, '__riscv_vor_vx_u32m8': 98, '__riscv_vmerge_vvm_f32m8': 98, '__riscv_vreinterpret_v_f32m8_u32m8': 34, '__riscv_vreinterpret_v_u32m8_f32m8': 34, 'qcp_rnd_vmfne_self': 98, 'memory_neon': 24, 'memory_rvv_load': 104, 'memory_rvv_store': 75, 'rvv_control': 4, 'neon_unit': 152, 'rvv_unit': 61, 'wrapper_unit': 37}
EXPECTED_BODIES_COUNT=71
def render_unit_text(case,u):
 source=case/u['translation_unit']
 return re.sub(r'(#\s*include\s*)"([^"]+)"',lambda m:m[1]+'"'+str((source.parent/m[2]).resolve())+'"',source.read_text())
def iter_current_unit_texts():
 case=Path(__file__).resolve().parent.parent
 handoff=json.loads((case/'proof/frozen-full-handoff.json').read_text())
 for unit in handoff['units']:
  yield {'label':unit['stem'],'stem':unit['stem'],'namespace':handoff['namespace'],'text':render_unit_text(case,unit),'cpp_flags':unit.get('cpp_flags',[])}
_HANDOFF=Path(__file__).resolve().parent/'frozen-full-handoff.json'
EXPECTED_BODIES={u['stem']:set(u['functions_defined']) for u in json.loads(_HANDOFF.read_text())['units']} if _HANDOFF.exists() else {}
def main():
 if not __debug__:raise RuntimeError('Verification gates require normal Python assertions; optimized mode is rejected')
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--config',type=Path,required=True);p.add_argument('--dependency-dir',type=Path,required=True);p.add_argument('--jobs',type=int,default=16);p.add_argument('--timeout',type=int,default=3600);a=p.parse_args()
 assert 1<=a.jobs<=16 and 0<a.timeout<=14400
 here=Path(__file__).resolve().parent;case=here.parent;root=next(p for p in case.parents if(p/'.git').exists());base=root/'verification/qcp/verified/f32-vadd';handoff=here/'frozen-full-handoff.json';handoff_sha=sha(handoff);h=json.loads(handoff.read_text());ns=h['namespace'];dep=a.dependency_dir.resolve()
 run=Path(tempfile.mkdtemp(prefix='full-',dir=case/'.build'));coq=run/'coq';local=coq/ns;local.mkdir(parents=True);records=[];units=[];strategies=[];modules=[];lock=threading.Lock()
 s={'passed':False,'whole_kernel_verified':False,'scope':'full','run_directory':str(run),'parallel_jobs':a.jobs,'per_process_memory_GiB':16,'records':records,'actual_c_units':units,'strategies':strategies,'limits':h['limits'],'external_libraries_rebuilt':False,'handoff_sha256':handoff_sha}
 def save(): (run/'status.json').write_text(json.dumps(s,indent=2)+'\n')
 def execute(cmd,label,timeout=None):
  cmd=list(map(str,cmd))
  if cmd[:2]==['qcp-env','coqc']:
   timeout=max(timeout or 0,a.timeout)
   if '-time'not in cmd:cmd.insert(2,'-time')
  cmd=['prlimit','--as=17179869184:17179869184','--',*cmd];work=run/'jobs'/label;work.mkdir(parents=True,exist_ok=True);log=run/(label+'.log');start=time.monotonic()
  with log.open('w')as f:
   try:code=subprocess.run(cmd,cwd=work,stdout=f,stderr=f,timeout=timeout or a.timeout).returncode
   except subprocess.TimeoutExpired:code=124
  with lock:
   records.append({'label':label,'command':cmd,'cwd':str(work),'exit_code':code,'seconds':time.monotonic()-start,'log_sha256':sha(log)});save()
  print(label,code,flush=True)
  if code:raise RuntimeError(label+': '+log.read_text()[-4000:])
 def cpp(src,dest,label,flags=()):execute(['gcc','-E','-P','-CC','-nostdinc',*flags,src,'-I',case,'-o',dest],label,600)
 try:
  config_start=sha(a.config);dependency_status_start=sha(dep.parent/'status.json');dependency_manifest_start=sha(base/'proof/manifest.json')
  tool_start={n:sha(Path(shutil.which(n)).resolve())for n in ['qcp','qcp-env','coqc','gcc','prlimit','patch']}
  strategy_tool_start=sha(Path(shutil.which('qcp')).resolve().parent/'StrategyCheck')
  assert ns=='Rndne' and len(h['units'])==28 and all(isinstance(n,int) and n>0 for n in EXPECTED_UNITS.values()) and h['total_actual_c_vcs']==sum(EXPECTED_UNITS.values()) and h['actual_c_function_count']==EXPECTED_BODIES_COUNT
  assert {u['stem']:len(u['fields']) for u in h['units']}==EXPECTED_UNITS and len(h['strategies'])==10 and sum(len(u['fields']) for u in h['strategies'])==30
  inputs=h['frozen_source_sha256'];assert inputs and h['whole_kernel_bodies_required']==['test_neon','test_rvv','compare_outputs','equivalent'];assert all(n in inputs for n in ['spec.c','proof/check_full.py',h['native_status']])
  for n,d in inputs.items():
   assert not Path(n).is_absolute() and (case/n).resolve().is_relative_to(root.resolve()),'Input escapes repo: '+n
   if sha(case/n)!=d:raise ValueError('Frozen input changed: '+n)
  preparation=load_module('current_component_inputs',here/'build_full_handoff.py')
  component_proofs={}
  for item in h['components']:
   q=case/item['path'];d=json.loads(q.read_text());assert item['path']in inputs;assert sha(q)==item['sha256'] and d.get('passed'),item['path']
   component_proofs.update(preparation.check_component(item['path'],d,True))
  assert component_proofs==h['component_public_proof_sha256'],'Reviewed historical/current component proof inputs differ'
  for item in h['component_public_proof_sha256'].items():assert sha(case/item[0])==item[1],'Component public proof changed: '+item[0]
  native=json.loads((case/h['native_status']).read_text());assert native.get(h['native_success_field']) is True and sha(case/h['native_status'])==h['native_status_sha256']
  for n,v in h['native_required_values'].items():assert native[n]==v,'Native acceptance condition: '+n
  for n,d in h['native_input_sha256'].items():
   if sha(case/n)!=d:raise ValueError('Native input changed: '+n)
  assert len(h['native_input_sha256'])==h['native_recursive_source_count'] and h['native_recursive_source_count']>=52
  for side in ['neon','rvv']:
   item=h['implementations'][side];assert item['actual']in inputs;assert sha(case/item['actual'])==item['actual_sha256'];assert sha(root/item['original'])==item['original_sha256']
   if item['variant']=='original':
    assert item['actual_sha256']==item['original_sha256'] and sha(case/item['original_copy'])==item['actual_sha256']
   else:
    assert item['variant']=='repaired'and item['patch']in inputs;patch=case/item['patch'];assert sha(patch)==item['patch_sha256'];d=run/('patch-'+side);target=d/item['patch_target'];target.parent.mkdir(parents=True);shutil.copyfile(root/item['original'],target)
    execute(['patch','--batch','--fuzz=0','-p1','-d',d,'-i',patch],'patch-'+side,600);assert target.read_bytes()==(case/item['actual']).read_bytes()
    for n,digest in item['counterexample_sha256'].items():assert sha(case/n)==digest
  baseline=json.loads((base/'proof/manifest.json').read_text());old=json.loads((dep.parent/'status.json').read_text());assert old.get('passed') and old.get('scope')=='full'
  for item in baseline['files']:assert sha(base/item['path'])==item['sha256'],item['path']
  for item in baseline['modules']:
   source=base/'proof'/item['path'];assert source.read_bytes()==(dep/Path(item['path']).relative_to('coq')).read_bytes();dest=run/item['path'];dest.parent.mkdir(parents=True,exist_ok=True);shutil.copyfile(source,dest);modules.append({k:item[k]for k in ['namespace','name','path']})
  for name in h['own_modules']:
   assert re.fullmatch(r'\w+',name)
   if name.endswith('_goal'):continue
   assert name not in {'CheckedNeonSeedProbe','neon_seed_probe_goal'}
   source=here/'coq'/(name+'.v');assert str(source.relative_to(case))in inputs;clean=re.sub(r'\(\*.*?\*\)','',source.read_text(),flags=re.S)
   if re.search(r'\b(?:CheckedNeonSeedProbe|neon_seed_probe_goal)\b',clean):raise ValueError('Diagnostic dependency: '+name)
   if re.search(r'\b(?:Axiom|Parameter|Admitted|admit)\b',clean):raise ValueError('Unchecked declaration: '+name)
   shutil.copyfile(source,local/source.name);modules.append({'namespace':ns,'name':source.name,'path':str((local/source.name).relative_to(run))})
  coverage=load_module('case_coverage',base/'proof/coverage.py');coverage.C_KEYWORDS.add('return');parallel=load_module('case_parallel',base/'proof/parallel.py')
  public=run/'public-expanded.c';cpp(case/'spec.c',public,'public-cpp',['-DQCP_FORMAL']);public_contracts={n:(sig,contract)for n,sig,contract,_ in coverage._functions(public.read_text(),'public spec')}
  definitions={};declarations={};calls=[];slp=[]
  for d in sorted((base/'proof/c').iterdir()):
   if d.is_dir():slp+=['-slp',str(d),d.name]
  slp+=['-slp',str(case/'shim'),ns,'-slp',str(here/'c'),ns]
  # Workers own a private C folder, QCP output, cwd and log. Only execute()
  # writes the shared records under lock. Closure is merged below in H order.
  def generate_unit(u):
   stem=u['stem'];assert re.fullmatch(r'\w+',stem)and u['translation_unit']in inputs;label=ns+'/'+stem;folder=run/'units'/stem;folder.mkdir(parents=True);src=folder/(stem+'.c');text=render_unit_text(case,u);src.write_text(text);expanded=folder/'expanded.c';cpp(src,expanded,stem+'-cpp',u.get('cpp_flags',[]));assert sha(expanded)==u['cpp_sha256'],label
   if 'raw_translation_unit'in u:
    assert u['raw_translation_unit']in inputs and u['identity_source']in inputs;raw_text=(case/u['raw_translation_unit']).read_text();raw_clean=re.sub(r'/\*.*?\*/|//[^\n]*','',raw_text,flags=re.S)
    if any(line.strip()and not re.fullmatch(r'\s*#\s*include\s*"[^"]+"\s*',line)for line in raw_clean.splitlines()):raise ValueError('Raw identity unit must only include authoritative live sources: '+label)
    required=str((case/u['identity_source']).resolve());included=[str((case/u['raw_translation_unit']).parent.joinpath(n).resolve())for n in re.findall(r'#\s*include\s*"([^"]+)"',raw_clean)];assert required in included,'Missing direct live identity include: '+label
    raw=folder/'raw-expanded.c';cpp(case/u['raw_translation_unit'],raw,stem+'-raw-cpp',u.get('cpp_flags',[]));assert tokens(raw.read_text())==tokens(expanded.read_text()),label+' executable tokens'
   src.write_bytes(expanded.read_bytes());out=folder/'generated';out.mkdir();limit=int(u.get('strategy_application_limit',1024));assert 0<limit<=8192;execute(['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--strategy-application-limit',str(limit),'--input-file='+str(src),'--coq-output-dir='+str(out),'--coq-logic-path='+ns,*slp],stem+'-qcp')
   goal=out/(stem+'_goal.v');assert sha(goal)==u['goal_sha256'],label+' goal';fields=re.findall(r'^Axiom proof_of_(\w+) :',goal.read_text(),re.M);assert fields==u['fields'] and len(fields)==len(set(fields))
   dest=local/goal.name;shutil.copyfile(goal,dest);functions=list(coverage._functions(expanded.read_text(),label));body_names=[n for n,_,_,edges in functions if edges is not None];assert sorted(body_names)==sorted(u['functions_defined']),label+' actual bodies'
   checked={'label':label,'namespace':ns,'stem':stem,'goal_sha256':sha(goal),'cpp_sha256':sha(expanded),'fresh_goal_path':str(dest),'checked_module':u['typed_instance'],'fields':fields,'c_vcs':len(fields)}
   with lock:
    s.setdefault('generated_unit_matches',[]).append({'stem':stem,'c_vcs':len(fields),'goal_sha256':sha(goal)});save()
   return checked,{'namespace':ns,'name':goal.name,'path':str(dest.relative_to(run))},functions
  assert len({u['stem']for u in h['units']})==len(h['units'])
  assert len({Path(u['file']).stem for u in h['strategies']})==len(h['strategies']),'Ambiguous strategy filename search'
  with ThreadPoolExecutor(max_workers=a.jobs)as pool:generated=list(pool.map(generate_unit,h['units']))
  for checked,mod,parsed in generated:
   functions=[]
   for n,sig,contract,edges in parsed:
    pair=sig,contract
    if n in declarations:assert declarations[n]==pair,'C contract/signature mismatch: '+n
    if n in public_contracts:assert public_contracts[n]==pair,'Public contract/signature mismatch: '+n
    declarations[n]=pair;functions.append({'name':n,'definition':edges is not None,'signature_sha256':hashlib.sha256(repr(sig).encode()).hexdigest(),'contract_sha256':hashlib.sha256(contract.encode()).hexdigest()})
    if edges is not None:definitions.setdefault(n,[]).append(checked['label']);calls.extend((n,e)for e in edges)
   checked['functions']=functions;units.append(checked);modules.append(mod)
  assert len(units)==len(h['units']) and sum(u['c_vcs']for u in units)==h['total_actual_c_vcs']
  missing=sorted(set(declarations)-set(definitions));unbound=sorted({c for _,c in calls}-set(definitions));assert not missing and not unbound,(missing,unbound);assert len(definitions)==h['actual_c_function_count'];assert all(n in definitions for n in h['whole_kernel_bodies_required'])
  s['call_closure']={'definitions':definitions,'calls':sorted(set(calls)),'unbound_callees':unbound,'declarations_without_checked_body':missing,'unique_c_functions_with_bodies':len(definitions),'exact_contract_and_signature_match':True}
  strategy_tool=Path(shutil.which('qcp')).resolve().parent/'StrategyCheck'
  def generate_strategy(item):
   path=case/item['file'];assert item['file']in inputs;namespace=item['namespace'];stem=path.stem;out=run/('strategy-'+namespace+'-'+stem);out.mkdir();execute([strategy_tool,'--arch=64','--endian=little','--no-exec-info','--input-file='+str(path),'--coq-output-dir='+str(out),'--coq-logic-path='+namespace],'strategy-'+namespace+'-'+stem,600)
   goal=out/(stem+'_strategy_goal.v');assert sha(goal)==item['goal_sha256'];dest=coq/namespace/goal.name
   if namespace!=ns:assert dest.read_bytes()==goal.read_bytes()
   shutil.copyfile(goal,dest);key=str(dest.relative_to(run));types=re.findall(r'^Module Type (\w+)\.',goal.read_text(),re.M);fields=re.findall(r'^\s*Axiom (\w+) :',goal.read_text(),re.M);assert len(types)==1 and fields==item['fields']
   return {'namespace':namespace,'name':goal.name,'path':key},{'label':namespace+'/'+stem,'namespace':namespace,'stem':stem,'module_type':types[0],'fields':fields,'checked_module':item['typed_instance'],'goal_sha256':sha(goal)}
  with ThreadPoolExecutor(max_workers=a.jobs)as pool:generated_strategies=list(pool.map(generate_strategy,h['strategies']))
  for mod,checked in generated_strategies:
   if not any(m['path']==mod['path']for m in modules):modules.append(mod)
   strategies.append(checked)
  assert len(modules)==len(baseline['modules'])+len(h['own_modules']) and not list(coq.rglob('*.vo'))
  flags=json.loads(a.config.read_text())['flags'][2:]
  for namespace in dict.fromkeys(m['namespace']for m in modules):flags+=['-Q',str(coq/namespace if namespace else coq/'relations'),namespace]
  assert sha(a.config)==config_start and sha(dep.parent/'status.json')==dependency_status_start and sha(base/'proof/manifest.json')==dependency_manifest_start and sha(strategy_tool)==strategy_tool_start
  for n,d in tool_start.items():assert sha(Path(shutil.which(n)).resolve())==d
  s.update(input_sha256=inputs,config_sha256=config_start,dependency_manifest_sha256=dependency_manifest_start,dependency_status_sha256=dependency_status_start,strategy_tool_sha256=strategy_tool_start,tool_sha256=tool_start);save();parallel.compile_modules(modules,run,flags,execute,a.jobs)
  gate=[]
  for i,u in enumerate(units):
   goal=ns+'.'+u['stem']+'_goal';proof=u['checked_module'];gate+=['Require Import '+goal+' '+proof.rsplit('.',1)[0]+'.',f'Module ActualUnit{i} : {goal}.VC_Correct := {proof}.'];gate+=['Print Assumptions ActualUnit'+str(i)+'.proof_of_'+n+'.'for n in u['fields']]
  for i,u in enumerate(strategies):
   goal=u['namespace']+'.'+u['stem']+'_strategy_goal';proof=u['checked_module'];gate+=['Require Import '+goal+' '+proof.rsplit('.',1)[0]+'.',f'Module ActualStrategy{i} : {goal}.{u["module_type"]} := {proof}.'];gate+=['Print Assumptions ActualStrategy'+str(i)+'.'+n+'.'for n in u['fields']]
  final=run/'FinalCaseCheck.v';final.write_text('\n'.join(gate)+'\n');execute(['qcp-env','coqc','-time',*flags,final],'FinalCaseCheck')
  for n,d in inputs.items():assert sha(case/n)==d,'Input drift: '+n
  for item in baseline['files']:assert sha(base/item['path'])==item['sha256']
  for n,d in s['tool_sha256'].items():assert sha(Path(shutil.which(n)).resolve())==d
  assert sha(a.config)==s['config_sha256'] and sha(dep.parent/'status.json')==s['dependency_status_sha256'] and sha(base/'proof/manifest.json')==s['dependency_manifest_sha256'] and sha(handoff)==handoff_sha and sha(strategy_tool)==s['strategy_tool_sha256']
  s.update(passed=True,whole_kernel_verified=True,verification_state='checked_original_c_shim_partial_correctness',checked_c_units=len(units),checked_c_vcs=sum(u['c_vcs']for u in units),checked_strategy_fields=sum(len(u['fields'])for u in strategies),fresh_compiled_local_modules=len(modules)+1,no_component_vo_reused=True,final_gate_sha256=sha(final),final_assumptions_log_sha256=sha(run/'FinalCaseCheck.log'),compiled_source_sha256={m['namespace']+'.'+Path(m['name']).stem:sha(run/m['path'])for m in modules})
 except Exception as e:s['error']=str(e);print(e,flush=True)
 finally:
  save();dest=here/'full-status.json'
  if dest.exists():
   old_bytes=dest.read_bytes();history=here/'history';history.mkdir(exist_ok=True);(history/('full-status-'+hashlib.sha256(old_bytes).hexdigest()+'.json')).write_bytes(old_bytes)
  dest.write_text(json.dumps(s,indent=2)+'\n');print('RUN',run,flush=True)
 return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
