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
_external=load_module('f16_external_dependencies',Path(__file__).resolve().parent/'external_dependencies.py')
external_imports=_external.external_imports
external_snapshot=_external.external_snapshot
EXPECTED_UNITS={'bits': 19, 'scalar': 185, 'integer': 24, 'literals': 2, 'memory_neon': 27, 'store_arrays': 24, 'active': 58, 'vdupq_n_u32': 2, 'vdupq_n_f32': 2, 'vdupq_n_u16': 2, 'vabsq_f32': 6, 'vreinterpretq_u32_f32': 6, 'vreinterpretq_f32_u32': 6, 'vmovn_u32': 6, 'qcp_f16_vshrn_13': 6, 'qcp_f16_vshrn_16': 6, 'vaddq_u32': 6, 'vandq_u32': 6, 'vmaxq_u32': 6, 'vcgtq_u32': 6, 'vmulq_f32': 6, 'vaddq_f32': 6, 'vandq_u16': 10, 'vand_u16': 6, 'vaddq_u16': 10, 'vadd_u16': 6, 'vorrq_u16': 10, 'vorr_u16': 6, 'vbslq_u16': 10, 'vbsl_u16': 6, 'vcombine_u16': 2, 'vget_low_u16': 2, 'qcp_f16_reinterpret_u32_u16': 2, '__riscv_vfabs_v_f32m8': 98, '__riscv_vadd_vx_u32m8': 98, '__riscv_vand_vx_u32m8': 98, '__riscv_vmaxu_vx_u32m8': 98, '__riscv_vmsgtu_vx_u32m8_b4': 98, '__riscv_vfmul_vf_f32m8': 98, '__riscv_vfadd_vv_f32m8': 98, 'qcp_f16_rvv_shrn_0': 98, 'qcp_f16_rvv_shrn_13': 98, 'qcp_f16_rvv_shrn_16': 98, '__riscv_vand_vx_u16m4': 98, '__riscv_vadd_vv_u16m4': 98, '__riscv_vmerge_vxm_u16m4': 98, '__riscv_vor_vv_u16m4': 98, '__riscv_vreinterpret_v_f32m8_u32m8': 34, '__riscv_vreinterpret_v_u32m8_f32m8': 34, 'qcp_f16_vext_u16_2': 2, 'memory_rvv_load': 104, 'rvv_control': 4, 'memory_rvv_store': 77, 'neon_unit': 419, 'rvv_unit': 115, 'wrapper_unit': 24}
EXPECTED_BODIES_COUNT=119
def current_inputs(case):
 assert Path(case).resolve()==Path(__file__).resolve().parent.parent
 return load_module('f16_live_inputs',Path(case)/'proof/full_inputs.py')
def render_unit_text(case,u,destination=None):
 if destination is None:
  folder=Path(tempfile.mkdtemp(prefix='current-unit-render-',dir=Path(case)/'.build'));destination=folder/(u['stem']+'.c')
 return current_inputs(case).render_unit(u['stem'],destination,u['construction'])['text']
def iter_current_unit_texts():
 case=Path(__file__).resolve().parent.parent
 handoff=json.loads((case/'proof/frozen-full-handoff.json').read_text())
 folder=Path(tempfile.mkdtemp(prefix='current-units-render-',dir=case/'.build'))
 for unit in handoff['units']:
  row=current_inputs(case).render_unit(unit['stem'],folder/(unit['stem']+'.c'),unit['construction'])
  yield {'label':unit['stem'],'stem':unit['stem'],'namespace':handoff['namespace'],'text':row['text'],'identity_text':row['identity_text'],'cpp_flags':row['cpp_flags']}
_HANDOFF=Path(__file__).resolve().parent/'frozen-full-handoff.json'
EXPECTED_BODIES={u['stem']:set(u['functions_defined']) for u in json.loads(_HANDOFF.read_text())['units']} if _HANDOFF.exists() else {}
def main():
 if not __debug__:raise RuntimeError('Verification gates require normal Python assertions; optimized mode is rejected')
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--config',type=Path,required=True);p.add_argument('--dependency-dir',type=Path,required=True);p.add_argument('--jobs',type=int,default=32);p.add_argument('--timeout',type=int,default=21600);p.add_argument('--proof-timeout',type=int,default=7200);p.add_argument('--heavy-proof-timeout',type=int,default=14400);a=p.parse_args()
 assert 16<=a.jobs<=32 and 0<a.timeout<=21600 and 0<a.proof_timeout<=14400 and 0<a.heavy_proof_timeout<=14400
 here=Path(__file__).resolve().parent;case=here.parent;root=next(p for p in case.parents if(p/'.git').exists());base=root/'verification/qcp/verified/f32-vadd';handoff=here/'frozen-full-handoff.json';handoff_sha=sha(handoff);h=json.loads(handoff.read_text());ns=h['namespace'];dep=a.dependency_dir.resolve()
 run=Path(tempfile.mkdtemp(prefix='full-',dir=case/'.build'));coq=run/'coq';local=coq/ns;local.mkdir(parents=True);records=[];units=[];strategies=[];modules=[];lock=threading.Lock()
 s={'passed':False,'whole_kernel_verified':False,'scope':'full','run_directory':str(run),'parallel_jobs':a.jobs,'ordinary_per_process_memory_GiB':16,'heavy_per_process_memory_GiB':32,'records':records,'actual_c_units':units,'strategies':strategies,'limits':h['limits'],'external_libraries_rebuilt':False,'handoff_sha256':handoff_sha}
 def save(): (run/'status.json').write_text(json.dumps(s,indent=2)+'\n')
 def execute(cmd,label,timeout=None,memory_gib=16):
  cmd=list(map(str,cmd))
  if cmd[:2]==['qcp-env','coqc']:
   heavy=label=='FinalCaseCheck' or any(x in label for x in ['RvvKernelPart','NeonKernelPart','RvvKernelMemory','NeonKernelMemory','rvv_unit_goal','neon_unit_goal','CaseTyped','CaseAssumptions','RvvChecked','NeonChecked'])
   timeout=max(timeout or 0,a.heavy_proof_timeout if heavy else a.proof_timeout)
   memory_gib=16  # Compact proof sources have all checked at16GiB; heavy affects wall budget only.
   if '-time'not in cmd:cmd.insert(2,'-time')
  assert memory_gib in {16,32};limit=memory_gib*1024**3
  cmd=['prlimit','--as='+str(limit)+':'+str(limit),'--',*cmd];work=run/'jobs'/label;work.mkdir(parents=True,exist_ok=True);log=run/(label+'.log');start=time.monotonic()
  with log.open('w')as f:
   try:code=subprocess.run(cmd,cwd=work,stdout=f,stderr=f,timeout=timeout or a.timeout).returncode
   except subprocess.TimeoutExpired:code=124
  with lock:
   records.append({'label':label,'command':cmd,'cwd':str(work),'exit_code':code,'memory_limit_GiB':memory_gib,'timeout_seconds':timeout or a.timeout,'seconds':time.monotonic()-start,'log_sha256':sha(log)});save()
  print(label,code,flush=True)
  if code:raise RuntimeError(label+': '+log.read_text()[-4000:])
 def cpp(src,dest,label,flags=()):execute(['gcc','-E','-P','-CC','-nostdinc',*flags,src,'-I',case,'-o',dest],label,600)
 try:
  config_start=sha(a.config);dependency_status_start=sha(dep.parent/'status.json');dependency_manifest_start=sha(base/'proof/manifest.json')
  tool_start={n:sha(Path(shutil.which(n)).resolve())for n in ['qcp','qcp-env','coqc','coqtop','gcc','prlimit','patch']}
  strategy_tool_start=sha(Path(shutil.which('qcp')).resolve().parent/'StrategyCheck')
  assert ns=='F32F16' and len(h['units'])==56 and all(isinstance(n,int) and n>0 for n in EXPECTED_UNITS.values()) and h['total_actual_c_vcs']==sum(EXPECTED_UNITS.values()) and h['actual_c_function_count']==EXPECTED_BODIES_COUNT
  assert {u['stem']:len(u['fields']) for u in h['units']}==EXPECTED_UNITS and len(h['strategies'])==13 and sum(len(u['fields']) for u in h['strategies'])==36
  inputs=h['frozen_source_sha256'];assert inputs and h['whole_kernel_bodies_required']==['test_neon','test_rvv','qcp_f16_compare','equivalent'];assert all(n in inputs for n in ['spec.c','proof/check_full.py',h['native_status']])
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
  assert len(h['native_input_sha256'])==h['native_recursive_source_count'] and h['native_recursive_source_count']>=60
  assert preparation.audit_implementations(run,execute)==h['implementations'],'Implementation compatibility identity changed'
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
  coverage=load_module('case_coverage',here/'c_coverage.py');coverage.C_KEYWORDS.add('return');parallel=load_module('case_parallel',here/'parallel.py')
  public=run/'public-expanded.c';cpp(case/'spec.c',public,'public-cpp',['-DQCP_FORMAL']);public_contracts={n:(sig,contract)for n,sig,contract,_ in coverage._functions(public.read_text(),'public spec')}
  definitions={};declarations={};calls=[];slp=['-slp',str(case/'shim'),ns,'-slp',str(here/'c'),ns]
  for d in sorted((base/'proof/c').iterdir()):
   if d.is_dir():slp+=['-slp',str(d),d.name]
  # Workers own a private C folder, QCP output, cwd and log. Only execute()
  # writes the shared records under lock. Closure is merged below in H order.
  def generate_unit(u):
   stem=u['stem'];assert re.fullmatch(r'\w+',stem);assert all(n in inputs and inputs[n]==d for n,d in u['construction']['direct_source_sha256'].items());label=ns+'/'+stem;folder=run/'units'/stem;folder.mkdir(parents=True);src=folder/(stem+'.c');rendered=current_inputs(case).render_unit(stem,src,u['construction']);assert rendered['cpp_flags']==u.get('cpp_flags',[]);expanded=folder/'expanded.c';cpp(src,expanded,stem+'-cpp',u.get('cpp_flags',[]));assert sha(expanded)==u['cpp_sha256'],label
   if 'identity_source'in u:
    assert u['identity_source']in inputs and rendered['identity_source']==u['identity_source'];raw_source=Path(rendered['private_identity_path']);raw_text=rendered['identity_text'];raw_clean=re.sub(r'/\*.*?\*/|//[^\n]*','',raw_text,flags=re.S)
    if any(line.strip()and not re.fullmatch(r'\s*#\s*include\s*"[^\"]+"\s*',line)for line in raw_clean.splitlines()):raise ValueError('Raw identity unit must only include authoritative live sources: '+label)
    required=str((case/u['identity_source']).resolve());included=[str(raw_source.parent.joinpath(n).resolve())for n in re.findall(r'#\s*include\s*"([^\"]+)"',raw_clean)];assert required in included,'Missing direct live identity include: '+label
    raw=folder/'raw-expanded.c';cpp(raw_source,raw,stem+'-raw-cpp',u.get('cpp_flags',[]));assert tokens(raw.read_text())==tokens(expanded.read_text()),label+' executable tokens'
   src.write_bytes(expanded.read_bytes());out=folder/'generated';out.mkdir();limit=int(u.get('strategy_application_limit',1024));assert 0<limit<=8192;execute(['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--strategy-application-limit',str(limit),'--input-file='+str(src),'--coq-output-dir='+str(out),'--coq-logic-path='+ns,*slp],stem+'-qcp',a.timeout,memory_gib=32 if stem in {'neon_unit','rvv_unit'}else 16)
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
  gate_builder=load_module('case_gate_sources',here/'gate_sources.py')
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
  generated_gate_sources=gate_builder.sources(ns,units,strategies)
  assert len(generated_gate_sources)==17
  for name,text in generated_gate_sources.items():
   source=local/(name+'.v');assert not source.exists(),'Reserved audit module collision';source.write_text(text)
   modules.append({'namespace':ns,'name':source.name,'path':str(source.relative_to(run))})
  constants=gate_builder.identifiers(ns,units,strategies)
  expected_constants=[ns+'.CaseTyped.ActualUnit'+str(i)+'.proof_of_'+field for i,u in enumerate(units)for field in u['fields']]+[ns+'.CaseTyped.ActualStrategy'+str(i)+'.'+field for i,u in enumerate(strategies)for field in u['fields']]
  assert constants==expected_constants and len(constants)==len(set(constants))
  s['assumptions_audit_mode']='parallel16_exact_partition'
  s['assumption_audit_parts']=[{'index':i,'namespace':ns,'module':gate_builder.PREFIX+str(i),'constants':constants[i::16],'report_count':len(constants[i::16])}for i in range(16)]
  s['typed_gate_module']=ns+'.'+gate_builder.TYPED
  s['final_assumptions_log']=gate_builder.REPORT
  flags=json.loads(a.config.read_text())['flags'][2:]
  for namespace in dict.fromkeys(m['namespace']for m in modules):flags+=['-Q',str(coq/namespace if namespace else coq/'relations'),namespace]
  assert sha(a.config)==config_start and sha(dep.parent/'status.json')==dependency_status_start and sha(base/'proof/manifest.json')==dependency_manifest_start and sha(strategy_tool)==strategy_tool_start
  for n,d in tool_start.items():assert sha(Path(shutil.which(n)).resolve())==d
  s.update(input_sha256=inputs,config_sha256=config_start,dependency_manifest_sha256=dependency_manifest_start,dependency_status_sha256=dependency_status_start,strategy_tool_sha256=strategy_tool_start,tool_sha256=tool_start)
  fresh_names={(m['namespace']+'.' if m['namespace'] else '')+Path(m['name']).stem for m in modules}
  project_prefixes={m['namespace'] for m in modules if m['namespace']}
  external=external_snapshot(run,external_imports([run/m['path']for m in modules],fresh_names),flags,execute,'external-before')
  assert external and not set(external)&fresh_names
  assert all(not any(n.startswith(pre+'.')for pre in project_prefixes)for n in external),'Project helper loaded outside fresh source inventory'
  s['external_recursive_vo_closure']=external;save();parallel.compile_modules(modules,run,flags,execute,a.jobs)
  loaded=external_snapshot(run,sorted(fresh_names),flags,execute,'external-after')
  assert {n:r for n,r in loaded.items()if n not in fresh_names}==external,'External recursive library closure differs'
  assert fresh_names<=set(loaded),'Fresh source module absent from loaded closure'
  for m in modules:
   name=(m['namespace']+'.'if m['namespace']else '')+Path(m['name']).stem
   assert Path(loaded[name]['path'])==(run/m['path']).with_suffix('.vo').resolve(),'Fresh module resolved to external object: '+name
  s['loaded_recursive_vo_closure']=loaded
  (run/'external-dependencies.json').write_text(json.dumps({'external':external,'loaded_after':loaded},indent=2)+'\n')
  s['coqdep_record']=json.loads((run/'coqdep-status.json').read_text());assert s['coqdep_record']['exit_code']==0
  report=run/gate_builder.REPORT
  with report.open('wb')as output:
   for part in s['assumption_audit_parts']:
    label=ns+'-'+part['module'];path=run/(label+'.log');text=path.read_text()
    assert text.count('Axioms:')+text.count('Closed under the global context')==part['report_count'],'Missing/duplicate Print report: '+label
    part.update(source_sha256=sha(local/(part['module']+'.v')),log_label=label,log_sha256=sha(path))
    output.write(path.read_bytes())
  assert report.read_text().count('Axioms:')+report.read_text().count('Closed under the global context')==len(constants)
  final=run/'FinalCaseCheck.v';final.write_text(gate_builder.final_source(ns,units,strategies));execute(['qcp-env','coqc','-time',*flags,final],'FinalCaseCheck')
  for n,row in external.items():assert sha(Path(row['path']))==row['sha256'],'External object drift: '+n
  for n,d in inputs.items():assert sha(case/n)==d,'Input drift: '+n
  for item in baseline['files']:assert sha(base/item['path'])==item['sha256']
  for n,d in s['tool_sha256'].items():assert sha(Path(shutil.which(n)).resolve())==d
  assert sha(a.config)==s['config_sha256'] and sha(dep.parent/'status.json')==s['dependency_status_sha256'] and sha(base/'proof/manifest.json')==s['dependency_manifest_sha256'] and sha(handoff)==handoff_sha and sha(strategy_tool)==s['strategy_tool_sha256']
  s.update(passed=True,whole_kernel_verified=True,verification_state='checked_compatible_literal_c_shim_partial_correctness',checked_c_units=len(units),checked_c_vcs=sum(u['c_vcs']for u in units),checked_strategy_fields=sum(len(u['fields'])for u in strategies),fresh_compiled_local_modules=len(modules)+1,no_component_vo_reused=True,final_gate_sha256=sha(final),final_assumptions_log_sha256=sha(report),compiled_source_sha256={m['namespace']+'.'+Path(m['name']).stem:sha(run/m['path'])for m in modules})
 except Exception as e:s['error']=str(e);print(e,flush=True)
 finally:
  save();dest=here/'full-status.json'
  if dest.exists():
   old_bytes=dest.read_bytes();history=here/'history';history.mkdir(exist_ok=True);(history/('full-status-'+hashlib.sha256(old_bytes).hexdigest()+'.json')).write_bytes(old_bytes)
  dest.write_text(json.dumps(s,indent=2)+'\n');print('RUN',run,flush=True)
 return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
