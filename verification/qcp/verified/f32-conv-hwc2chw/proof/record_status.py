#!/usr/bin/env python3
"""Independently audit and archive a completed whole HWC run.

No QCP/Coq proof is run here. Missing full evidence is rejected. This writer
never edits the global registry or treats a component as a verified kernel.
"""
import argparse,gzip,hashlib,importlib.util,json,re,shutil,subprocess,tempfile,sys
from pathlib import Path
NS='HwcConv'
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
read=lambda p:json.loads(Path(p).read_text())
ALLOWED={
 'CNotation.LE_arrow_field_congr','CNotation.RE_addr_of_congr',
 'CNotation.eval_addr_expr','CNotation.eval_addr_expr_congr',
 'CNotation.sizeof_alias_type','CNotation.sizeof_enum_type',
 'CNotation.sizeof_struct_type','CNotation.sizeof_union_type',
 'ClassicalDedekindReals.sig_forall_dec','ClassicalDedekindReals.sig_not_dec',
 'Classical_Prop.classic','FunctionalExtensionality.functional_extensionality_dep',
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
 return archived if archived.exists()else original
def identity(case,work,handoff=None):
 from full_identity import identity as audit_identity
 return audit_identity(case,work,handoff)
def validate(case,run,h,f):
 from full_run_audit import validate as actual_audit
 return actual_audit(case,run,h,f)
def issue(case,run,h,f,audit,artifacts,identities):
 proof=case/'proof';archive=proof/'evidence/full-run';check_hashes(case,f['input_sha256'])
 for name in ['full-status.json','frozen-full-handoff.json']:preserve(proof/name,archive/('status.json'if name=='full-status.json'else name))
 for record in f['records']:preserve(run/(record['label']+'.log'),archive/'logs'/(record['label']+'.log'))
 artifact_index=[]
 for source,target in artifacts:
  source=Path(source);target=Path(target)
  if source.stat().st_size>8*1024**2:
   data=source.read_bytes();compressed=gzip.compress(data,mtime=0);dest=archive/(str(target)+'.gz');dest.parent.mkdir(parents=True,exist_ok=True)
   require(not dest.exists()or dest.read_bytes()==compressed,'Immutable gzip archive differs')
   if not dest.exists():dest.write_bytes(compressed)
   require(gzip.decompress(dest.read_bytes())==data,'Archive gzip roundtrip differs')
   artifact_index.append(dict(path=str(dest.relative_to(case)),sha256=sha(dest),raw_sha256=sha(source),raw_bytes=len(data),encoding='gzip'))
  else:
   preserve(source,archive/target);artifact_index.append(dict(path=str((archive/target).relative_to(case)),sha256=sha(archive/target),encoding='identity'))
 (archive/'artifact-index.json').write_text(json.dumps(artifact_index,indent=2)+'\n')
 for native in identities['native_statuses']:
  n=read(case/native['path']);dest=proof/'evidence/native'/Path(native['path']).stem
  for record in n['records']:
   log=native_log(case,native['path'],n,record);preserve(log,dest/log.name)
  preserve(case/native['path'],dest/'status.json')
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
 require(__debug__,'Normal Python assertion mode required')
 parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--proof-run',type=Path);parser.add_argument('--preflight',action='store_true');parser.add_argument('--dry-run',action='store_true');args=parser.parse_args();case=Path(__file__).resolve().parent.parent
 require(case.name=='f32-conv-hwc2chw','Unknown case');(case/'.build').mkdir(exist_ok=True);work=Path(tempfile.mkdtemp(prefix='record-audit-',dir=case/'.build'));report=dict(passed=False,formal_proof_replayed=False,certificate_issued=False,directory=str(work))
 try:
  hp=case/'proof/frozen-full-handoff.json';h=read(hp)if hp.exists()else None;report['identity']=identity(case,work,h)
  if not args.preflight:
   require(h is not None,'Complete frozen handoff required');f=read(case/'proof/full-status.json');run=args.proof_run.resolve()if args.proof_run else Path(f['run_directory']);audit,artifacts=validate(case,run,h,f);report['assumptions']=audit
   if not args.dry_run:issue(case,run,h,f,audit,artifacts,report['identity']);report['certificate_issued']=True
  report['passed']=True
 except Exception as error:report['error']=repr(error)
 (work/'status.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2));return 0 if report['passed']else 1
if __name__=='__main__':raise SystemExit(main())
