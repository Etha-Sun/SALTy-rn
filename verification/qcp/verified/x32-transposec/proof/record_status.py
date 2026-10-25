#!/usr/bin/env python3
"""Independently audit and archive a completed whole Transpose run.

No QCP/Coq proof is run here. Missing full evidence is rejected. This writer
never edits the global registry or treats a component as a verified kernel.
"""
import argparse,hashlib,importlib.util,json,re,shutil,subprocess,tempfile,sys
from pathlib import Path
NS='X32Transpose'
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
# Exact fullUInt32 copy/permutation contracts reviewed in shim/neon_specs.h.
# These views have no additional mathematical function beyond their fields.
INLINE_CONTRACT_SHA={'vmov_n_u32': '0e70f3a1b64a3417624f251cb43fc8ddc9b8ec1c6aa88486cf7e4958b74618a9', 'xt_intrinsic_zip1': 'd1d90294fcea98bb51371ddc0cb2d1f363043ae0b939a16e27a3b61808d9110f', 'xt_intrinsic_zip2': 'aa3534da19088d8fa364ce1dcb7ef8f85479cac9684c5b2c79f0fb419c26c13d'}
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
 proof=case/'proof';repair=read(proof/'repair.json');originals=read(proof/'originals.json')['identity'];records=[]
 replay=work/'repair-replay';(replay/'impl').mkdir(parents=True);(replay/'shim').mkdir()
 for side in ['NEON','RVV']:
  origin=proof/'original'/('test'+side+'.c')
  require(sha(origin)==originals[side]['sha256']==repair['originals'][side],'Original source differs: '+side)
  require(sha(case/'impl'/('test'+side+'.c'))==repair['actual'][side],'Repaired implementation differs: '+side)
  shutil.copyfile(origin,replay/'impl'/('test'+side+'.c'))
 require(sha(proof/'repair.patch')==repair['exact_patch_sha256'],'Exact repair patch changed')
 command=['prlimit','--as=17179869184:17179869184','--','patch','--batch','--forward','--fuzz=0','-p1','-i',str(proof/'repair.patch')];log=work/'repair-patch.log'
 with log.open('w')as output:r=subprocess.run(command,cwd=replay,stdout=output,stderr=output,timeout=180)
 require(r.returncode==0,'Exact original-to-current repair replay failed')
 records.append(dict(label='exact-repair-patch',command=command,exit_code=r.returncode,log_sha256=sha(log)))
 expected={'impl/testNEON.c','impl/testRVV.c',*repair['added_helpers']}
 require(expected==set(repair['complete_replay_files_sha256']),'Complete repair-file inventory differs')
 for name in expected:
  require((case/name).read_bytes()==(replay/name).read_bytes(),'Repair replay bytes differ: '+name)
  require(sha(case/name)==repair['complete_replay_files_sha256'][name],'Repair file identity differs: '+name)
 for name,digest in repair['added_helpers'].items():require(sha(case/name)==digest,'Repair helper differs: '+name)
 ledger=read(proof/'intrinsic-ledger.json');require(len(ledger['entries'])==9,'Expected nine original-ISA specification views')
 for entry in ledger['entries']:
  require(not entry['unresolved_logical_symbols']and not entry['intrinsic_body_checked']and not entry['formal_ISA_or_compiler_refinement_proved'],'Incorrect intrinsic credit or unresolved view')
  require(entry['official_primary']and entry['official_version'],'Missing original intrinsic primary-source binding')
  require(sha(case/entry['contract_source'])==entry['contract_source_sha256'],'Intrinsic contract source changed')
  require(entry['direct_coq_definitions']or(entry['formal_symbol']in INLINE_CONTRACT_SHA and entry['contract_sha256']==INLINE_CONTRACT_SHA[entry['formal_symbol']]),'Missing exact intrinsic mathematical model or reviewed literal field-copy contract')
  for definition in entry['direct_coq_definitions']:
   require(definition['constant'].startswith(NS+'.')and sha(case/definition['source'])==definition['source_sha256'],'Intrinsic mathematical model changed')
 names=handoff['native_statuses']if handoff else ['proof/native-undefined-status.json','proof/native-address-status.json'];native=[];modes=set();ce=read(proof/'original-counterexample.json')
 for name in names:
  n=read(case/name);require(n['passed']and n['whole_kernel_verified']is False,'Actual finite native evidence required');check_hashes(case,n['input_sha256']);modes.add(n['sanitizer'])
  rr=n['repaired_regression']
  require(n['per_process_memory_GiB']==16 and rr['passed']and rr['cases']==8808 and rr['written_words_per_side']==1006296 and rr['public_caller_calls']==127014 and rr['empty_height_calls_per_side']==67 and rr['VL_modes']==3 and rr['tail_modes']==2,'Current actual caller/native matrix coverage or resource profile differs')
  require(n['both_wrong_still_equal_oracle_rejected']and n['zero_fuzz_patch_replay'],'Independent common-wrong rejection or exact patch evidence missing')
  require(n['original_counterexample']==ce and ce['counterexample'],'Original zero-width counterexample provenance differs')
  if n['sanitizer']=='address':require(int(n['actual_memory_max'])==17179869184 and int(n['actual_memory_swap_max'])==0 and n['LSan_enabled'],'Actual ASan 16GiB/swap0/LSan evidence required')
  labels={record['label']for record in n['records']}
  require({'repaired-regression','original-zero-width','wrong-one','wrong-both','compile-observe','compile-caller','compile-strided-store','compile-scalar'}<=labels,'Missing actual adapter/caller or negative-control command')
  for record in n['records']:
   expected_code=2 if record['label']in ['wrong-one','wrong-both']else 0
   require(record['exit_code']==record['expected_exit_code']==expected_code,'Unexpected finite native command outcome: '+record['label'])
   path=native_log(case,name,n,record);require(sha(path)==record['log_sha256'],'Native execution log missing or changed: '+record['label'])
   expected={'repaired-regression':rr,'original-zero-width':ce}.get(record['label'])
   if expected is not None:require(json.loads(native_payload(n,path))==expected,'Native receipt differs from executed output: '+record['label'])
   if record['label']in ['wrong-one','wrong-both']:
    comparison='0'if record['label']=='wrong-one'else'1'
    require(native_payload(n,path)=='negative compare='+comparison+' independent_oracle_rejected=1','Actual common-wrong/one-side negative control differs')
  native.append(dict(path=name,sha256=sha(case/name)))
 require(modes=={'address','undefined'},'Both actual sanitizer runs required')
 cross=read(proof/'cross-build-status.json');require(cross['passed']and not cross['whole_kernel_verified'],'Current native-ISA API build evidence required')
 require(sha(proof/'check_cross_build.py')==cross['script_sha256'],'SDK checker source changed')
 require({r['label']for r in cross['records']}=={'NEON','RVV'},'Both ISA SDK builds required')
 for record in cross['records']:
  require(record['exit_code']==0 and record['memory_limit_GiB']==16,'Finite SDK build failed')
  check_hashes(case,record['case_input_sha256'])
  original=Path(cross['run_directory'])/(record['label']+'.log');archived=proof/'evidence/sdk'/original.name
  require(sha(original if original.exists()else archived)==record['log_sha256'],'SDK execution log changed')
 if handoff:check_hashes(case,handoff['frozen_source_sha256'])
 return dict(formal_proof_replayed=False,repair_patch_records=records,native_statuses=native,source_reviewed_intrinsic_views=len(ledger['entries']),sdk_status_sha256=sha(proof/'cross-build-status.json'))
def validate(case,run,h,f):
 require(f['passed']is True and f['whole_kernel_verified']is True and f['no_component_vo_reused']is True,'Completed full ordinary source replay required')
 require((run/'status.json').read_bytes()==(case/'proof/full-status.json').read_bytes(),'Original/public full receipt differ')
 require(h['namespace']==NS and h['strategies']==f['strategies']==[],'Unexpected namespace/strategy scope')
 require(f['handoff_sha256']==sha(case/'proof/frozen-full-handoff.json')and f['input_sha256']==h['frozen_source_sha256']and f['limits']==h['limits'],'Full/H binding differs');check_hashes(case,f['input_sha256'])
 require(not({'proof/status.json','proof/manifest.json','proof/assumption-audit.json'}&set(f['input_sha256'])),'Mutable certificate outputs cannot be frozen proof inputs')
 require(f['parallel_jobs']==32 and 2<=f['initial_live_admission_slots']<=32 and f['ordinary_process_memory_GiB']==16 and f['heavy_process_memory_GiB']==32,'Unreviewed resource profile')
 units=f['actual_c_units'];stems={u['stem']for u in units};require(len(units)==f['checked_c_units']==len(h['units'])==len(stems)and stems=={'control','scalar','strided_store','width','observe','caller','neon_unit','rvv_unit'} and f['checked_strategy_fields']==0,'Actual C target inventory differs')
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
 coverage=module('transpose_issuer_coverage',case/'proof/audit_callee_cpp.py');closure=json.loads(json.dumps(coverage.check(cpp,read(case/'proof/intrinsic-ledger.json'))))
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
 generated={u['stem']+'_goal'for u in units}
 for logical,digest in compiled.items():
  require(logical.startswith(NS+'.')and logical.count('.')==1,'Unexpected project namespace');stem=logical.split('.')[1];relative=Path('coq')/NS/(stem+'.v')
  require(sha(run/relative)==digest and str(Path(f['run_directory'])/relative)in ordinary,'Compiled source identity differs: '+logical)
  if stem in h['own_modules']and stem not in generated:require(sha(case/'proof/coq'/(stem+'.v'))==digest,'Public ordinary source differs: '+stem)
  artifacts.append((run/relative,relative))
 runner=module('transpose_issuer_runner',case/'proof/check_full.py')
 require((run/'coq'/NS/'UnitInterfaces.v').read_text()==runner.interface_source(units),'Typed complete interfaces differ')
 c_reports=['Print Assumptions '+NS+'.UnitInterfaces.ActualUnit'+str(i)+'.proof_of_'+field+'.'for i,u in enumerate(units)for field in u['fields']]
 math_reports=['Print Assumptions '+NS+'.'+name+'.'+field+'.'for name in h['math_modules']for field in re.findall(r'(?m)^(?:Lemma|Theorem)\s+(\w+)',(run/'coq'/NS/(name+'.v')).read_text())if not field.startswith(('proof_of_','typed_','xt_proof_'))]
 require(math_reports==f['mathematical_support_reports']and 'StateObservation'in h['math_modules'],'Program observation/full-state mathematical reports missing')
 reports=c_reports+math_reports;require(len(reports)==len(set(reports)),'Duplicate final theorem report');parts=f['assumption_parts'];require(len(parts)==16,'Incomplete assumption shards');texts=[]
 for i,part in enumerate(parts):
  name='AssumptionsPart'+str(i).zfill(2);lines=reports[i::16];source='From X32Transpose Require Import UnitInterfaces '+' '.join(h['math_modules'])+'.\n'+'\n'.join(lines)+'\n'
  require(part['name']==name and part['reports']==lines and(run/'coq'/NS/(name+'.v')).read_text()==source,'Final Print source/partition differs')
  text=(run/(name+'.log')).read_bytes();require(len(re.findall(rb'^(?:Axioms:|Closed under the global context)',text,re.M))==len(lines),'Missing/duplicate actual Print result');texts.append(text)
 aggregate=run/'FinalAssumptions.log';require(aggregate.read_bytes()==b''.join(texts)and sha(aggregate)==f['final_assumptions_log_sha256'],'Final aggregated assumptions differ')
 final=run/'coq'/NS/'FinalCaseCheck.v';expected='From X32Transpose Require Import UnitInterfaces StateObservation '+' '.join(p['name']for p in parts)+'.\nDefinition all_written_bits_and_own_frames := X32Transpose.StateObservation.xt_kernel_posts_written_and_frames.\nDefinition full_map_when_frames_agree := X32Transpose.StateObservation.xt_kernel_posts_full_map.\n'
 require(final.read_text()==expected and sha(final)==f['final_gate_sha256'],'Final full program gate differs')
 dep=read(run/'coqdep-status.json');require(dep['exit_code']==0 and dep['command'][:5]==['prlimit','--as=17179869184:17179869184','--','qcp-env','coqdep']and dep['stdout_sha256']==sha(run/'dependencies.mk')and dep['stderr_sha256']==sha(run/'coqdep.log'),'Actual finite dependency-extraction record differs')
 require({n for n in dep['command']if n.endswith('.v')}=={str(Path(f['run_directory'])/'coq'/NS/(n+'.v'))for n in h['own_modules']},'Actual dependency-extraction source inventory differs')
 external=module('transpose_issuer_external',case/'proof/external_dependencies.py');origin=external.validate_external(case,run,f,require)
 for name in ['external-before.v','external-before-locations.v','external-after.v','external-after-locations.v','external-dependencies.json','FinalAssumptions.log','coqdep-status.json','dependencies.mk','coqdep.log']:artifacts.append((run/name,Path(name)))
 return dict(passed=True,print_commands=len(reports),actual_C_print_commands=len(c_reports),mathematical_support_print_commands=len(math_reports),inherited_assumption_names=assumption_names(aggregate.read_text()),new_project_axioms_observed=False,library_origin_audit=origin),artifacts
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
 cross=read(proof/'cross-build-status.json')
 for record in cross['records']:
  origin=Path(cross['run_directory'])/(record['label']+'.log');preserve(origin if origin.exists()else proof/'evidence/sdk'/origin.name,proof/'evidence/sdk'/origin.name)
 preserve(proof/'cross-build-status.json',proof/'evidence/sdk/status.json')
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
 status=dict(schema=2,kernel=case.name,passed=True,scope='full',status='proved',whole_kernel_verified=True,whole_kernel_proved=True,checked_c_units=f['checked_c_units'],checked_c_vcs=f['checked_c_vcs'],checked_strategy_fields=0,unique_c_functions_with_bodies=h['actual_c_function_count'],ordinary_modules_including_final=f['fresh_compiled_local_modules'],final_assumptions_report_count=audit['print_commands'],full_evidence='full-status.json',full_evidence_sha256=sha(proof/'full-status.json'),manifest_sha256=sha(proof/'manifest.json'),assumption_audit_sha256=sha(proof/'assumption-audit.json'),inherited_assumption_names=audit['inherited_assumption_names'],human_intrinsic_spec_review='pending',formal_isa_refinement_established=False,intrinsic_spec_body_credit=False,implementation_variant=manifest['variant'],limits=h['limits'],remaining=[],formal_proof_replayed_by_writer=False,verified_manifest_changed=False)
 (proof/'status.json').write_text(json.dumps(status,indent=2)+'\n')
def main():
 parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--proof-run',type=Path);parser.add_argument('--preflight',action='store_true');parser.add_argument('--dry-run',action='store_true');args=parser.parse_args();case=Path(__file__).resolve().parent.parent
 require(case.name=='x32-transposec','Unknown case');work=Path(tempfile.mkdtemp(prefix='record-audit-',dir=case/'.build'));report=dict(passed=False,formal_proof_replayed=False,certificate_issued=False,directory=str(work))
 try:
  hp=case/'proof/frozen-full-handoff.json';h=read(hp)if hp.exists()else None;report['identity']=identity(case,work,h)
  if not args.preflight:
   require(h is not None,'Complete frozen handoff required');f=read(case/'proof/full-status.json');run=args.proof_run.resolve()if args.proof_run else Path(f['run_directory']);audit,artifacts=validate(case,run,h,f);report['assumptions']=audit
   if not args.dry_run:issue(case,run,h,f,audit,artifacts,report['identity']);report['certificate_issued']=True
  report['passed']=True
 except Exception as error:report['error']=repr(error)
 (work/'status.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2));return 0 if report['passed']else 1
if __name__=='__main__':raise SystemExit(main())
