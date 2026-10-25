# Independent issuer migrated from x32-transposec 0234955ab4b8ba7eca9ebb12e3431a5971b433e1d2c1d17c52923b7230e779cf; adapted to13 actual C units,3 actual strategies and depthwise native/SDK/patch identities; no transferred proof credit.
#!/usr/bin/env python3
"""Independently audit and archive a completed whole Depthwise run.

No QCP/Coq proof is run here. Missing full evidence is rejected. This writer
never edits the global registry or treats a component as a verified kernel.
"""
import argparse,hashlib,importlib.util,json,re,shutil,subprocess,tempfile,sys
from pathlib import Path
NS='DwChw'
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
read=lambda p:json.loads(Path(p).read_text())
ALLOWED={
 'CNotation.LE_arrow_field_congr','CNotation.RE_addr_of_congr',
 'CNotation.eval_addr_expr','CNotation.eval_addr_expr_congr',
 'CNotation.sizeof_alias_type','CNotation.sizeof_enum_type',
 'CNotation.sizeof_struct_type','CNotation.sizeof_union_type',
 'ClassicalDedekindReals.sig_forall_dec','ClassicalDedekindReals.sig_not_dec',
 'Classical_Prop.classic','FunctionalExtensionality.functional_extensionality_dep',
 'PropExtensionality.propositional_extensionality',
 'SeparationLogic.Snaive_C_Rules64.eval_addr'}
def require(value,message):
 if not value:raise ValueError(message)
def module(name,path):
 sys.path.insert(0,str(Path(path).parent))
 spec=importlib.util.spec_from_file_location(name,path);m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m);return m
def preserve(source,target):
 source,target=Path(source),Path(target);target.parent.mkdir(parents=True,exist_ok=True)
 require(not target.exists()or source.read_bytes()==target.read_bytes(),'Immutable archive differs: '+str(target))
 if not target.exists():shutil.copyfile(source,target)
def check_hashes(case,values):
 require(bool(values),'Empty frozen source inventory')
 for name,digest in values.items():
  require(not Path(name).is_absolute()and(case/name).resolve().is_relative_to(case.resolve()),'Source escapes case: '+name)
  require(sha(case/name)==digest,'Source identity changed: '+name)
def assumption_names(text):
 names=set(re.findall(r'^([A-Za-z_]\w*(?:\.\w+)*)\s*:',text,re.M))-{'Axioms'};result=set()
 for name in names:
  matches={n for n in ALLOWED if n==name or('.'not in name and n.rsplit('.',1)[-1]==name)}
  if name in {'Snaive_C_Rules64.eval_addr','SimpleC.SL.SeparationLogic.Snaive_C_Rules64.eval_addr'}:matches={'SeparationLogic.Snaive_C_Rules64.eval_addr'}
  require(len(matches)==1,'Unknown/ambiguous inherited assumption: '+name);result|=matches
 return sorted(result)
def native_log(case,status_name,n,record):
 original=Path(n['run_directory'])/(record['label']+'.log')
 archived=case/'proof/evidence/native'/Path(status_name).stem/original.name
 return original if original.exists()else archived
def native_payload(n,path):
 lines=path.read_text().strip().splitlines()
 require(len(lines)==(2 if n['sanitizer']=='address'else 1),'Unexpected native runtime output shape')
 if n['sanitizer']=='address':
  require(json.loads(lines[0])=={'actual_memory_max':'17179869184','actual_memory_swap_max':'0'},'Actual runtime cgroup observer differs')
 return lines[-1]
def identity(case,work,handoff=None):
 from full_identity import identity as audit_identity
 return audit_identity(case,work,handoff)
def validate(case,run,h,f):
 require(f['passed']is True and f['whole_kernel_verified']is True and f['no_component_vo_reused']is True,'Completed full ordinary source replay required')
 require((run/'status.json').read_bytes()==(case/'proof/full-status.json').read_bytes(),'Original/public full receipt differ')
 require(h['namespace']==NS and len(h['strategies'])==len(f['strategies'])==3,'Unexpected namespace/strategy scope')
 require(f['handoff_sha256']==sha(case/'proof/frozen-full-handoff.json')and f['input_sha256']==h['frozen_source_sha256']and f['limits']==h['limits'],'Full/H binding differs');check_hashes(case,f['input_sha256'])
 require(not({'proof/status.json','proof/manifest.json','proof/assumption-audit.json'}&set(f['input_sha256'])),'Mutable certificate outputs cannot be frozen proof inputs')
 require(f['parallel_jobs']==32 and 2<=f['initial_live_admission_slots']<=32 and f['ordinary_process_memory_GiB']==16 and f['heavy_process_memory_GiB']==32,'Unreviewed resource profile')
 units=f['actual_c_units'];stems={u['stem']for u in units}
 require(len(units)==f['checked_c_units']==len(h['units'])==len(stems)==13 and f['checked_strategy_fields']==11 and h['total_actual_c_vcs']==1167 and h['actual_c_function_count']==37,'Actual complete C/strategy inventory differs')

 require(sum(len(u['fields'])for u in units)==f['checked_c_vcs']==h['total_actual_c_vcs'],'Actual C field accounting differs')
 artifacts=[];cpp={}
 for actual,expected in zip(units,h['units']):
  stem=expected['stem'];goal=run/'units'/stem/'generated'/(stem+'_goal.v');expanded=run/'units'/stem/(stem+'.c')
  require(actual['namespace']==NS and actual['stem']==stem and actual['checked_module']==expected['typed_instance'],'Typed unit/H mismatch')
  require(all(actual[k]==expected[k]for k in ['fields','goal_sha256','cpp_sha256'])and actual['c_vcs']==len(actual['fields']),'Actual unit/H identity mismatch')
  require(sha(goal)==actual['goal_sha256']and sha(expanded)==actual['cpp_sha256']and(goal.read_bytes()==(run/'coq'/NS/goal.name).read_bytes()),'Fresh goal/CPP differs')
  require(re.findall(r'^Axiom proof_of_(\w+)\s*:',goal.read_text(),re.M)==actual['fields'],'Actual generated field inventory changed')
  qcp=[r for r in f['records']if r['label']==stem+'-qcp'];require(len(qcp)==1 and '--arch=64'in qcp[0]['command']and '--endian=little'in qcp[0]['command']and '--input-file='+str(Path(f['run_directory'])/'units'/stem/(stem+'.c'))in qcp[0]['command'],'Missing actual C generation command')
  cpp[stem]=expanded;artifacts.extend([(expanded,Path('units')/stem/'expanded.c'),(goal,Path('units')/stem/'goal.v')])
 for actual,expected in zip(f['strategies'],h['strategies']):
  stem=expected['stem'];goal=run/'strategies'/stem/(stem+'.v');target=run/'coq'/NS/(stem+'.v')
  require(actual['stem']==stem and actual['fields']==expected['fields'] and actual['checked_module']==expected['typed_instance'] and actual['module_type']==expected['module_type'],'Actual strategy interface differs')
  require(sha(goal)==sha(target)==expected['goal_sha256']==actual['goal_sha256'],'Fresh actual strategy goal differs')
  require(re.findall(r'^\s*(?:Axiom|Parameter)\s+(\w+)\s*:',goal.read_text(),re.M)==actual['fields'],'Actual strategy field inventory differs')
  commands=[r for r in f['records']if r['label']==stem+'-generate'];require(len(commands)==1,'Missing actual strategy generation')
  command=commands[0]['command'];require('--arch=64'in command and '--endian=little'in command and '--input-file='+str(case/expected['source'])in command,'Actual strategy generation input differs')
  require(sha(Path(command[3]))==f['strategy_tool_sha256'],'Strategy generator binary changed')
  artifacts.append((goal,Path('strategies')/(stem+'.v')))
 coverage=module('transpose_issuer_coverage',case/'proof/full_call_coverage.py');closure=json.loads(json.dumps(coverage.check(cpp,read(case/'proof/intrinsic-ledger.json'))))
 require(closure['source_closure_passed']and closure==f['call_closure']['source_audit']and closure['unique_actual_C_definitions']==h['actual_c_function_count']==f['call_closure']['unique_c_functions_with_bodies'],'Actual ordinary body/call/contract closure differs')
 require(f['call_closure']['unbound_callees']==f['call_closure']['declarations_without_checked_body']==[]and f['call_closure']['intrinsic_spec_body_credit']is False,'Unproved ordinary callees or incorrect intrinsic credit')
 records=f['records'];require(records and len({r['label']for r in records})==len(records)and all(r['exit_code']==0 for r in records),'Missing/duplicate/failed full execution')
 compiled=f['compiled_source_sha256'];ordinary={}
 for r in records:
  command=r['command'];mem=r['memory_GiB'];require(mem in{16,32}and command[:3]==['prlimit','--as='+str(mem*1024**3)+':'+str(mem*1024**3),'--']and 0<r['timeout_seconds']<=21600,'Finite execution/resource guard differs')
  require(sha(run/(r['label']+'.log'))==r['log_sha256'],'Full execution log changed: '+r['label'])
  if 'coqc'in command:
   require(command[3:5]==['qcp-env','coqc']and not any(a.startswith(('-vos','-vok','-quick','-vio'))for a in command),'Ordinary Coq compilation required')
   require(command[-1]not in ordinary,'Duplicate ordinary source compilation');ordinary[command[-1]]=r
 require(len(compiled)==len(ordinary)==f['fresh_compiled_local_modules'],'Ordinary source compilation inventory differs')
 gates={'UnitInterfaces','FinalCaseCheck'}|{'AssumptionsPart'+str(i).zfill(2)for i in range(16)}
 require(set(compiled)=={NS+'.'+n for n in set(h['own_modules'])|gates},'Unexpected/missing fresh source modules')
 generated={u['stem']+'_goal'for u in units}|{u['stem']for u in f['strategies']}
 for logical,digest in compiled.items():
  require(logical.startswith(NS+'.')and logical.count('.')==1,'Unexpected project namespace');stem=logical.split('.')[1];relative=Path('coq')/NS/(stem+'.v')
  require(sha(run/relative)==digest and str(Path(f['run_directory'])/relative)in ordinary,'Compiled source identity differs: '+logical)
  if stem in h['own_modules']and stem not in generated:require(sha(case/'proof/coq'/(stem+'.v'))==digest,'Public ordinary source differs: '+stem)
  artifacts.append((run/relative,relative))
 runner=module('transpose_issuer_runner',case/'proof/check_full.py')
 require((run/'coq'/NS/'UnitInterfaces.v').read_text()==runner.interface_source(units,f['strategies']),'Typed complete interfaces differ')
 c_reports=['Print Assumptions '+NS+'.UnitInterfaces.ActualUnit'+str(i)+'.proof_of_'+field+'.'for i,u in enumerate(units)for field in u['fields']]
 math_reports=['Print Assumptions '+NS+'.'+name+'.'+field+'.'for name in h['math_modules']for field in re.findall(r'(?m)^(?:Lemma|Theorem)\s+(\w+)',(run/'coq'/NS/(name+'.v')).read_text())if not field.startswith(('proof_of_','typed_','dw_proof_'))and field!='checked']
 require(math_reports==f['mathematical_support_reports']and 'PublicObservation'in h['math_modules'],'Program observation/full-state mathematical reports missing')
 strategy_reports=['Print Assumptions '+NS+'.UnitInterfaces.ActualStrategy'+str(i)+'.'+field+'.'for i,u in enumerate(f['strategies'])for field in u['fields']];require(len(strategy_reports)==11,'Incomplete strategy reports');reports=c_reports+strategy_reports+math_reports;require(len(reports)==len(set(reports)),'Duplicate final theorem report');parts=f['assumption_parts'];require(len(parts)==16,'Incomplete assumption shards');texts=[]
 for i,part in enumerate(parts):
  name='AssumptionsPart'+str(i).zfill(2);lines=reports[i::16];source='From DwChw Require Import UnitInterfaces '+' '.join(h['math_modules'])+'.\n'+'\n'.join(lines)+'\n'
  require(part['name']==name and part['reports']==lines and(run/'coq'/NS/(name+'.v')).read_text()==source,'Final Print source/partition differs')
  text=(run/(name+'.log')).read_bytes();require(len(re.findall(rb'^(?:Axioms:|Closed under the global context)',text,re.M))==len(lines),'Missing/duplicate actual Print result');texts.append(text)
 aggregate=run/'FinalAssumptions.log';require(aggregate.read_bytes()==b''.join(texts)and sha(aggregate)==f['final_assumptions_log_sha256'],'Final aggregated assumptions differ')
 final=run/'coq'/NS/'FinalCaseCheck.v';expected='From DwChw Require Import UnitInterfaces PublicObservation '+' '.join(p['name']for p in parts)+'.\nDefinition written_observation := DwChw.PublicObservation.dw_complete_program_observation.\nDefinition separate_own_frames := DwChw.PublicObservation.dw_complete_program_own_frames.\n'

 require(final.read_text()==expected and sha(final)==f['final_gate_sha256'],'Final full program gate differs')
 dep=read(run/'coqdep-status.json');require(dep['exit_code']==0 and dep['command'][:5]==['prlimit','--as=17179869184:17179869184','--','qcp-env','coqdep']and dep['stdout_sha256']==sha(run/'dependencies.mk')and dep['stderr_sha256']==sha(run/'coqdep.log'),'Actual finite dependency-extraction record differs')
 require({n for n in dep['command']if n.endswith('.v')}=={str(Path(f['run_directory'])/'coq'/NS/(n+'.v'))for n in h['own_modules']},'Actual dependency-extraction source inventory differs')
 external=module('transpose_issuer_external',case/'proof/external_dependencies.py');origin=external.validate_external(case,run,f,require)
 for name in ['external-before.v','external-before-locations.v','external-after.v','external-after-locations.v','external-dependencies.json','FinalAssumptions.log','coqdep-status.json','dependencies.mk','coqdep.log']:artifacts.append((run/name,Path(name)))
 return dict(passed=True,print_commands=len(reports),actual_C_print_commands=len(c_reports),strategy_print_commands=len(strategy_reports),mathematical_support_print_commands=len(math_reports),inherited_assumption_names=assumption_names(aggregate.read_text()),new_project_axioms_observed=False,library_origin_audit=origin),artifacts
def issue(case,run,h,f,audit,artifacts,identities):
 proof=case/'proof';archive=proof/'evidence/full-run';check_hashes(case,f['input_sha256'])
 for name in ['full-status.json','frozen-full-handoff.json']:preserve(proof/name,archive/('status.json'if name=='full-status.json'else name))
 for record in f['records']:preserve(run/(record['label']+'.log'),archive/'logs'/(record['label']+'.log'))
 for source,target in artifacts:preserve(source,archive/target)
 for native in identities['native_statuses']:
  n=read(case/native['path']);dest=proof/'evidence/native'/Path(native['path']).stem
  for record in n['records']:
   log=native_log(case,native['path'],n,record);preserve(log,dest/log.name)
  preserve(case/native['path'],dest/'status.json')
 from full_identity import sdk_file
 for sdk in identities['sdk_statuses']:
  n=read(case/sdk['path']);name=Path(sdk['path']).name;dest=proof/'evidence/sdk'/Path(name).stem
  for filename in ['compile.log','unit.c']:
   preserve(sdk_file(case,name,n,filename),dest/filename)
  preserve(case/sdk['path'],dest/'status.json')
 for name in ['status.json','manifest.json']:
  path=proof/name
  if path.exists():
   require(not read(path).get('whole_kernel_verified',read(path).get('whole_kernel_proved',False)),'Refuse to overwrite issued certificate');preserve(path,proof/'evidence/candidate-history'/(path.stem+'-'+sha(path)+'.json'))
 (proof/'assumption-audit.json').write_text(json.dumps(dict(audit,full_status_sha256=sha(proof/'full-status.json')),indent=2)+'\n')
 files=[]
 for path in sorted(case.rglob('*')):
  relative=path.relative_to(case)
  if not path.is_file()or any(n in{'.build','__pycache__'}for n in relative.parts)or path in{proof/'status.json',proof/'manifest.json'}or path.suffix in{'.vo','.vos','.vok','.glob','.aux','.pyc'}:continue
  files.append(dict(path=str(relative),sha256=sha(path)))
 manifest=dict(schema=2,kernel=case.name,variant=read(proof/'repair.json')['variant'],whole_kernel_proved=True,files=files,full_evidence='proof/evidence/full-run/status.json',full_evidence_sha256=sha(proof/'full-status.json'),intrinsic_spec_body_credit=False)
 (proof/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
 status=dict(schema=2,kernel=case.name,passed=True,scope='full',status='proved',whole_kernel_verified=True,whole_kernel_proved=True,checked_c_units=f['checked_c_units'],checked_c_vcs=f['checked_c_vcs'],checked_strategy_fields=f['checked_strategy_fields'],unique_c_functions_with_bodies=h['actual_c_function_count'],ordinary_modules_including_final=f['fresh_compiled_local_modules'],final_assumptions_report_count=audit['print_commands'],full_evidence='full-status.json',full_evidence_sha256=sha(proof/'full-status.json'),manifest_sha256=sha(proof/'manifest.json'),assumption_audit_sha256=sha(proof/'assumption-audit.json'),inherited_assumption_names=audit['inherited_assumption_names'],human_intrinsic_spec_review='pending',formal_isa_refinement_established=False,intrinsic_spec_body_credit=False,implementation_variant=manifest['variant'],limits=h['limits'],remaining=[],formal_proof_replayed_by_writer=False,verified_manifest_changed=False)
 (proof/'status.json').write_text(json.dumps(status,indent=2)+'\n')
def main():
 parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--proof-run',type=Path);parser.add_argument('--preflight',action='store_true');parser.add_argument('--dry-run',action='store_true');args=parser.parse_args();case=Path(__file__).resolve().parent.parent
 require(case.name=='f32-dwconv2d-chw','Unknown case');work=Path(tempfile.mkdtemp(prefix='record-audit-',dir=case/'.build'));report=dict(passed=False,formal_proof_replayed=False,certificate_issued=False,directory=str(work))
 try:
  hp=case/'proof/frozen-full-handoff.json';h=read(hp)if hp.exists()else None;report['identity']=identity(case,work,h)
  if not args.preflight:
   require(h is not None,'Complete frozen handoff required');f=read(case/'proof/full-status.json');run=args.proof_run.resolve()if args.proof_run else Path(f['run_directory']);audit,artifacts=validate(case,run,h,f);report['assumptions']=audit
   if not args.dry_run:issue(case,run,h,f,audit,artifacts,report['identity']);report['certificate_issued']=True
  report['passed']=True
 except Exception as error:report['error']=repr(error)
 (work/'status.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2));return 0 if report['passed']else 1
if __name__=='__main__':raise SystemExit(main())
