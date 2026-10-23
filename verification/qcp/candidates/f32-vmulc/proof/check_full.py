#!/usr/bin/env python3
"""Audit actual C bindings; optionally check the full fresh Coq module closure.

--final-check requires completed component replays against the specified fresh
dependency directory and compiles every unit as a VC_Correct module instance.
Without it, exit 2 explicitly reports incomplete integration.
"""
from pathlib import Path
import argparse, hashlib, importlib.util, json, re, shutil, subprocess, tempfile, time
from concurrent.futures import ThreadPoolExecutor

HERE=Path(__file__).resolve().parent;CASE=HERE.parent
REPO=next(p for p in CASE.parents if (p/'.git').exists())
BASE=REPO/'verification/qcp/verified/f32-vmul'
parser=argparse.ArgumentParser(description=__doc__)
parser.add_argument('--dependency-dir',type=Path,required=True)
parser.add_argument('--final-check',action='store_true')
parser.add_argument('--dependency-status',type=Path)
parser.add_argument('--dependency-manifest',type=Path,required=True)
args=parser.parse_args();dep=args.dependency_dir.resolve()
status_path=args.dependency_status or dep.parent/'status.json'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
load=lambda p:json.loads(p.read_text())
s=importlib.util.spec_from_file_location('vmulc_coverage',BASE/'proof/coverage.py');coverage=importlib.util.module_from_spec(s);s.loader.exec_module(coverage)
run=Path(tempfile.mkdtemp(prefix='integration-audit-',dir=CASE/'.build'))
report={'audit_passed':False,'verification_state':'incomplete','whole_kernel_verified':False,'scope':'Actual C binding audit; unified fresh QCP and VC_Correct binding is not implemented by this audit.','run_directory':str(run),'spec_sha256':sha(CASE/'spec.c'),'missing_stages':[]}
try:
 dependency=load(status_path);manifest=load(args.dependency_manifest)
 assert Path(dependency['run_directory']).resolve()==dep.parent,'Dependency status/run mismatch'
 assert sha(args.dependency_manifest)==sha(BASE/'proof/manifest.json'),'Dependency manifest differs from reviewed VMUL manifest'
 local_sources=[]
 for item in manifest['modules']:
  copied=dep/item['path'].removeprefix('coq/')
  reviewed=BASE/'proof'/item['path']
  assert copied.read_bytes()==reviewed.read_bytes(),'Dependency Coq source drift: '+str(copied)
  local_sources.append({'path':str(copied),'sha256':sha(copied)})
 report['dependency_identity']={'coq_directory':str(dep),'status_path':str(status_path),'status_sha256':sha(status_path),'manifest_path':str(args.dependency_manifest),'manifest_sha256':sha(args.dependency_manifest),'fresh_run_passed':dependency.get('passed',False),'module_source_sha256':local_sources}
 if not dependency.get('passed'):report['missing_stages'].append('The isolated VMUL dependency replay has not completed.')
 originals=[]
 for side,file in [('source','testNEON.c'),('target','testRVV.c')]:
  original=REPO/'kernels'/side/'f32-vmulc.c';copied=CASE/'impl'/file
  assert original.read_bytes()==copied.read_bytes(),'Original implementation drift'
  originals.append({'original':str(original),'copy':str(copied),'sha256':sha(copied),'byte_identical':True})
 report['originals']=originals
 components={key:load(HERE/name)for key,name in [('primitive','primitive-status.json'),('rvv','rvv-proof-status.json'),('neon','neon-proof-status.json'),('wrapper','wrapper-proof-status.json')]}
 public_cpp=subprocess.run(['gcc','-E','-P','-CC','-nostdinc',str(CASE/'spec.c')],capture_output=True,text=True,check=True).stdout
 public={name:(sig,contract)for name,sig,contract,calls in coverage._functions(public_cpp,'live spec')}
 units=[];missing=[]
 for namespace,stem in [('ByValue','shim_unit'),('ByvalueRvv','shim'),('QcpRvv32','rvv_load'),('QcpRvv32','rvv_add'),('QcpRvv32','rvv_store')]:
  directory=dep.parent/'units'/namespace
  units.append((namespace+'/'+stem,directory/(stem+'.c'),directory/'generated'/(stem+'_goal.v')))
 for key,stem in [('rvv','rvv_unit'),('neon','neon_unit')]:
  directory=Path(components[key]['run_directory']);units.append((key,directory/(stem+'.c'),directory/(stem+'_goal.v')))
 primitive=Path(components['primitive']['run_directory']);units.append(('primitive',CASE/'shim/primitives.c',primitive/'coq/primitives_goal.v'))
 for item in components['wrapper']['actual_c_units']:units.append((item['stem'],Path(item['actual_c_path']),Path(item['fresh_goal_path'])))
 declarations={};definitions={};calls=[];unit_records=[]
 for label,source,goal in units:
  if not source.exists() or not goal.exists():missing.append(label);continue
  expanded=subprocess.run(['gcc','-E','-P','-CC','-nostdinc',str(source)],capture_output=True,text=True,check=True).stdout
  cpp_dir=run/'actual-cpp'/label.replace('/','-');cpp_dir.mkdir(parents=True)
  cpp_source=cpp_dir/source.name;cpp_source.write_text(expanded)
  rows=[]
  for name,signature,contract,edges in coverage._functions(expanded,label):
   if name in declarations:assert declarations[name]==(signature,contract),'C declaration/body mismatch: '+name
   declarations[name]=(signature,contract)
   if name in public:assert public[name]==(signature,contract),'Live spec contract mismatch: '+name
   row={'function':name,'definition':edges is not None,'contract_sha256':hashlib.sha256(contract.encode()).hexdigest(),'public_contract_matches':name in public}
   rows.append(row)
   if edges is not None:
    definitions.setdefault(name,[]).append(label);calls.extend((name,edge)for edge in edges)
  unit_records.append({'label':label,'actual_c_path':str(source),'actual_c_sha256':sha(source),'cpp_path':str(cpp_source),'cpp_sha256':sha(cpp_source),'goal_path':str(goal),'goal_sha256':sha(goal),'generated_c_vcs':len(re.findall(r'^Axiom proof_of_',goal.read_text(),re.M)),'functions':rows})
  packaged=(dep/label.split('/')[0]/goal.name)if '/'in label else HERE/'coq'/goal.name
  assert packaged.read_bytes()==goal.read_bytes(),'Actual/generated goal differs from reviewed Coq source: '+label
  unit_records[-1]['reviewed_goal_path']=str(packaged)
  unit_records[-1]['goal_matches_reviewed_source']=True
 checked_aliases={namespace+'/'+stem:namespace+'.'+checked+'.'+instance for namespace,stem,checked,instance,_ in coverage.UNITS}
 checked_aliases.update({'primitive':'VMulc.primitives_checked.CheckedBroadcast','rvv':'VMulc.RvvChecked.KernelChecked','neon':'VMulc.NeonChecked.CheckedOriginalNeon'})
 checked_aliases.update({item['stem']:item['checked_module_alias'].split(' : ')[0]for item in components['wrapper']['actual_c_units']})
 for item in unit_records:item['component_checked_alias']=checked_aliases.get(item['label'])
 report['actual_c_units']=unit_records
 report['driver_sha256']=sha(Path(__file__))
 if missing:report['missing_stages'].append('Dependency C/goal units still absent: '+', '.join(missing))
 unbound=sorted({callee for _,callee in calls}-set(definitions));report['unbound_callees']=unbound
 report['c_calls']=[{'caller':caller,'callee':callee,'body_units':definitions.get(callee,[])}for caller,callee in sorted(set(calls))]
 if unbound:report['missing_stages'].append('Unbound C callees: '+', '.join(unbound))
 # Compare the exact original source under the same frontend, ignoring only annotations.
 token=lambda t:re.findall(r'\w+|[^\s\w]',re.sub(r'/\*.*?\*/|//[^\n]*','',t,flags=re.S))
 original_tokens=[]
 for key,file in [('neon','testNEON.c'),('rvv','testRVV.c')]:
  source=run/(key+'-original.c');source.write_text('#include "'+str(CASE/'shim'/(key+'_frontend.h'))+'"\n'+(CASE/'impl'/file).read_text())
  expanded=subprocess.run(['gcc','-E','-P','-CC','-nostdinc',str(source)],capture_output=True,text=True,check=True).stdout
  actual=Path(components[key]['run_directory'])/(key+'_unit.c')
  assert token(expanded)==token(actual.read_text()),'Original/annotated CPP token drift: '+key
  original_tokens.append({'kernel':key,'same_frontend_cpp_tokens_match':True,'public_contract_sha256':hashlib.sha256(public['test_'+('neon'if key=='neon'else'rvv')][1].encode()).hexdigest()})
 report['kernel_contract_identity']=original_tokens
 report['components']={key:{'passed':value.get('passed'), 'checked_c_vcs':value.get('checked_c_vcs',value.get('checked_wrapper_c_vcs')),'open_vcs':value.get('open_vcs',[]),'run_directory':value['run_directory']}for key,value in components.items()}
 for key,value in components.items():
  if not value.get('passed'):report['missing_stages'].append(key+' is incomplete: '+', '.join(value.get('open_vcs',[])))
 # Snapshot every candidate Coq source. This does not treat an existing .vo as a check.
 report['candidate_coq_source_sha256']={str(p.relative_to(CASE)):sha(p)for p in sorted((HERE/'coq').glob('*.v'))}
 proof_sources={}
 for key,value in components.items():
  for record in value.get('records',[]):
   command=record.get('command',[])
   if record.get('exit_code')!=0 or command[:2]!=['qcp-env','coqc']:continue
   actual=Path(command[-1]);current=HERE/'coq'/actual.name
   if not actual.exists():continue
   if current.exists():assert actual.read_bytes()==current.read_bytes(),'Component checked source differs from current candidate: '+actual.name
   proof_sources[str(actual)]={'sha256':sha(actual),'current_candidate_copy_matches':current.exists()}
 report['component_checked_coq_source_identity']=proof_sources

 report['wrapper_checked_aliases']=[item['checked_module_alias']for item in components['wrapper']['actual_c_units']]
 if args.final_check and not report['missing_stages']:
  assert not missing and not unbound,'Incomplete actual C closure'
  assert len(unit_records)==12,'Unexpected actual C unit set'
  assert Path(components['rvv']['reused_dependency_directory']).resolve()==dep,'RVV was not rebound to fresh dependencies'
  assert Path(components['wrapper']['reused_verified_vmul_coq']).resolve()==dep,'Wrapper was not rebound to fresh dependencies'
  assert str(dep) in components['neon']['reused_dependencies'],'NEON was not rebound to fresh dependencies'
  assert all(record['exit_code']==0 for record in components['rvv']['records']),'RVV replay failed'
  assert all(record['exit_code']==0 for record in components['wrapper']['records']),'Wrapper replay failed'
  assert any(Path(record.get('command',[''])[-1]).name=='NeonChecked.v'and record['exit_code']==0 for record in components['neon']['records']),'NEON aggregate has not been compiled'
  assert any(Path(record.get('command',[''])[-1]).name=='RvvChecked.v'and record['exit_code']==0 for record in components['rvv']['records']),'RVV aggregate has not been compiled'
  config=json.loads((REPO.parents[1]/'research/qcp-shim-vadd/results/coq-flags.json').read_text())
  slp=[]
  for folder in sorted((BASE/'proof/c').iterdir()):slp+=['-slp',str(folder),folder.name]
  slp+=['-slp',str(CASE/'shim'),'VMulc','-slp',str(HERE/'c'),'VMulc']
  def regenerate(item):
   output=run/'fresh-goals'/item['label'].replace('/','-');output.mkdir(parents=True)
   namespace=item['label'].split('/')[0]if '/'in item['label']else('VMulcWrapper'if item['label'].startswith('Wrapper')else'VMulc')
   command=['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--input-file='+item['cpp_path'],'--coq-output-dir='+str(output),'--coq-logic-path='+namespace,*slp]
   log=output/'qcp.log';started=time.monotonic()
   with log.open('w')as stream:result=subprocess.run(command,cwd=config['cwd'],stdout=stream,stderr=stream,timeout=240)
   assert result.returncode==0,'Fresh QCP failed: '+item['label']+' '+log.read_text()[-1500:]
   fresh=output/Path(item['goal_path']).name
   assert fresh.read_bytes()==Path(item['goal_path']).read_bytes(),'Fresh goal differs: '+item['label']
   return {'unit':item['label'],'command':command,'exit_code':result.returncode,'seconds':time.monotonic()-started,'source_sha256':item['cpp_sha256'],'goal_sha256':sha(fresh),'log_sha256':sha(log)}
  with ThreadPoolExecutor(max_workers=12)as pool:report['fresh_qcp_replays']=list(pool.map(regenerate,unit_records))
  report['fresh_strategy_replays']=[]
  strategy=Path(shutil.which('qcp')).resolve().parent/'StrategyCheck'
  for source in sorted((HERE/'c').glob('*.strategies')):
   output=run/('strategy-'+source.stem);output.mkdir()
   command=[str(strategy),'--arch=64','--endian=little','--no-exec-info','--input-file='+str(source),'--coq-output-dir='+str(output),'--coq-logic-path=VMulc']
   log=output/'strategy.log'
   with log.open('w')as stream:result=subprocess.run(command,cwd=config['cwd'],stdout=stream,stderr=stream,timeout=120)
   assert result.returncode==0,'Fresh strategy failed'
   fresh=output/(source.stem+'_strategy_goal.v');assert fresh.read_bytes()==(HERE/'coq'/fresh.name).read_bytes(),'Strategy goal drift'
   report['fresh_strategy_replays'].append({'source':str(source),'source_sha256':sha(source),'command':command,'exit_code':result.returncode,'goal_sha256':sha(fresh),'log_sha256':sha(log)})
  # New primitive proofs depend only on the external libraries and the same Model.
  primitive_coq=Path(components['primitive']['run_directory'])/'coq'
  rvv_coq=Path(components['rvv']['run_directory'])/'coq'
  neon_coq=Path(components['neon']['run_directory'])/'coq'
  wrapper_coq=Path(components['wrapper']['run_directory'])/'coq'
  assert (primitive_coq/'Model.vo').read_bytes()==(rvv_coq/'Model.vo').read_bytes(),'Primitive/loop Model binary differs'
  # Rebind the independent primitive proof to the same FastFrame/Model library.
  old_primitive_coq=primitive_coq;primitive_coq=run/'rebound-primitives';primitive_coq.mkdir()
  rebind_flags=['qcp-env','coqc',*config['flags'][2:]]
  for folder in dep.iterdir():rebind_flags+=['-Q',str(folder),''if folder.name=='relations'else folder.name]
  rebind_flags+=['-Q',str(rvv_coq),'VMulc','-Q',str(primitive_coq),'VMulc']
  rebind_records=[]
  for name in ['primitives_goal.v','primitives_checked.v']:
   source=primitive_coq/name;shutil.copyfile(old_primitive_coq/name,source)
   assert source.read_bytes()==(HERE/'coq'/name).read_bytes(),'Primitive source drift'
   command=rebind_flags+[str(source)];log=run/(name+'-rebind.log');started=time.monotonic()
   with log.open('w')as stream:result=subprocess.run(command,cwd=config['cwd'],stdout=stream,stderr=stream,timeout=120)
   rebind_records.append({'command':command,'exit_code':result.returncode,'seconds':time.monotonic()-started,'source_sha256':sha(source),'log_path':str(log),'log_sha256':sha(log)})
   assert result.returncode==0,'Primitive environment rebind failed: '+log.read_text()[-2000:]
  report['primitive_environment_rebind']={'new_directory':str(primitive_coq),'unified_model_directory':str(rvv_coq),'source_content_unchanged':True,'records':rebind_records}

  for source in (HERE/'coq').glob('*.v'):
   if source.name.endswith('_goal.v'):continue
   code=re.sub(r'\(\*.*?\*\)','',source.read_text(),flags=re.S)
   assert not re.search(r'\b(?:Admitted|admit|Axiom|Parameter)\b',code),'Unchecked assumption: '+str(source)
  imports=[];checks=[]
  for index,item in enumerate(unit_records):
   alias=item['component_checked_alias'];assert alias,'Missing complete VC_Correct module'
   goal_module=(item['label'].split('/')[0]if '/'in item['label']else('VMulcWrapper'if item['label'].startswith('Wrapper')else'VMulc'))+'.'+Path(item['goal_path']).stem
   imports.append('Require Import '+goal_module+' '+alias.rsplit('.',1)[0]+'.')
   checks.append('Module CaseUnit'+str(index)+' : '+goal_module+'.VC_Correct := '+alias+'.')
  final=run/'FinalCaseCheck.v';final.write_text('\n'.join(imports+checks)+ '\nPrint Assumptions VMulcWrapper.WrapperChecked.CheckedWrapper.proof_of_equivalent_return_wit_1.\n')
  config=json.loads((REPO.parents[1]/'research/qcp-shim-vadd/results/coq-flags.json').read_text());command=['qcp-env','coqc',*config['flags'][2:]]
  for folder in dep.iterdir():command+=['-Q',str(folder),''if folder.name=='relations'else folder.name]
  for folder,namespace in [(primitive_coq,'VMulc'),(rvv_coq,'VMulc'),(neon_coq,'VMulc'),(wrapper_coq,'VMulcWrapper')]:command+=['-Q',str(folder),namespace]
  command+=[str(final)];log=run/'FinalCaseCheck.log';started=time.monotonic()
  with log.open('w')as output:result=subprocess.run(command,cwd=config['cwd'],stdout=output,stderr=output,timeout=120)
  report['final_case_check']={'command':command,'exit_code':result.returncode,'seconds':time.monotonic()-started,'source_path':str(final),'source_sha256':sha(final),'log_path':str(log),'log_sha256':sha(log),'checked_unit_aliases':len(checks)}
  assert result.returncode==0,'FinalCaseCheck failed: '+log.read_text()[-2500:]
  assert all(sha(CASE/name)==digest for name,digest in report['candidate_coq_source_sha256'].items()),'Candidate Coq source changed during final check'
  compiled={}
  for origin,evidence in [('fresh_dependency',dependency),*components.items(),('primitive_environment_rebind',report['primitive_environment_rebind'])]:
   for record in evidence.get('records',[]):
    cmd=record.get('command',[])
    if record.get('exit_code')!=0 or cmd[:2]!=['qcp-env','coqc']:continue
    source=Path(cmd[-1]);logical=source.stem;best=-1
    for index,word in enumerate(cmd[:-2]):
     if word not in ['-Q','-R']:continue
     folder=Path(cmd[index+1])
     if source.is_relative_to(folder)and len(str(folder))>best:
      suffix='.'.join(source.relative_to(folder).with_suffix('').parts);logical='.'.join(x for x in [cmd[index+2],suffix]if x);best=len(str(folder))
    digest=sha(source)
    if logical in compiled:assert compiled[logical]['source_sha256']==digest,'Conflicting compiled Coq module: '+logical
    compiled[logical]={'logical_module':logical,'source_path':str(source),'source_sha256':digest,'origin':origin}
  compiled['FinalCaseCheck']={'logical_module':'FinalCaseCheck','source_path':str(final),'source_sha256':sha(final),'origin':'final_case_gate'}
  report['fresh_compiled_modules']=list(compiled.values());report['fresh_compiled_unique_module_count']=len(compiled)
  assert all(sha(Path(item['actual_c_path']))==item['actual_c_sha256']for item in unit_records),'Actual C source changed during final replay'
  report.update(whole_kernel_verified=True,verification_state='checked_c_shim_partial_correctness',scope='Both original C kernels, all 12 actual C units, contract/call binding and full VC_Correct module closure checked against the isolated fresh VMUL dependency replay.')
 else:
  report['missing_stages'].append('Fresh dependency/component replays and FinalCaseCheck VC_Correct binding must pass; component JSON flags alone never establish this stage.')

 assert sha(CASE/'spec.c')==report['spec_sha256'],'Spec changed during audit'
 report['audit_passed']=True
except (AssertionError,OSError,ValueError,KeyError,subprocess.CalledProcessError,subprocess.TimeoutExpired)as error:
 report['error']=str(error)
 report.update(whole_kernel_verified=False,verification_state='incomplete')
report['limits']=['No original kernel is accepted solely through its declared contract.','Full status requires FinalCaseCheck plus the actual C/source/contract and completed fresh dependency guards; JSON flags alone are insufficient.','External QCP/Coq/Flocq and the reviewed C-shim/ISA boundary remain explicit dependencies.']
(HERE/'integration-audit.json').write_text(json.dumps(report,indent=2)+'\n')
if args.final_check:(HERE/'full-status.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps({key:report[key]for key in ['audit_passed','verification_state','whole_kernel_verified','missing_stages']},indent=2))
if 'error'in report:print(report['error'])
raise SystemExit((0 if report['whole_kernel_verified']else 2)if report['audit_passed']else 1)
