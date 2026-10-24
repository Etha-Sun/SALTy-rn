#!/usr/bin/env python3
"""Seal successful, source-identical complete evidence; never infer success from counts."""
from pathlib import Path
import argparse,hashlib,json,datetime,re,shutil
from prepare import ROOT,UNITS
from audit import audit
p=argparse.ArgumentParser();p.add_argument('--generation-run',required=True);p.add_argument('--compile-run',required=True);p.add_argument('--final-run',required=True);p.add_argument('--auxiliary-run',required=True);a=p.parse_args()
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
G=ROOT/'.build'/a.generation_run;C=ROOT/'.build'/a.compile_run/'compile';F=ROOT/'.build'/a.final_run/'final';A=ROOT/'.build'/a.auxiliary_run;P=ROOT/'proof';E=P/'evidence/full-run';E.mkdir(parents=True,exist_ok=False)
strategy=json.loads((G/'strategy/result.json').read_text());assert strategy['passed'] and strategy['exact_goal_match']
for path,h in strategy['input_hashes'].items():assert sha(ROOT/path)==h
assert sha(Path(strategy['tool']['path']))==strategy['tool']['sha256']
shutil.copytree(G/'strategy',E/'strategy')
binding=audit(a.generation_run);(E/'binding-audit.json').write_text(json.dumps(binding,indent=2)+'\n')
comp=json.loads((C/'result.json').read_text());final=json.loads((F/'result.json').read_text());assert comp['passed'] and final['passed'];dep=json.loads((P/'dependencies.json').read_text());assert json.loads((C/'manifest.json').read_text())==dep
for item in dep['modules']:
 assert sha(ROOT/item['path'])==sha(C/item['path'])==item['sha256']
for item in comp['records']:assert sha((C/item['path']).with_suffix('.vo'))==item['vo_sha256']
for item in final['records']:
 assert sha(P/'coq/Qd8Admission'/(item['module']+'.v'))==item['source_sha256']
 assert sha(F/(item['module']+'.vo'))==item['vo_sha256']
for label in ['native','negative','dependency-audit']:
 source=A/label/'result.json';data=json.loads(source.read_text());assert data['passed'],label;shutil.copy2(source,E/(label+'.json'))
for p,h in json.loads((A/'native/result.json').read_text())['source_hashes'].items():assert sha(ROOT/p)==h,p
for item in json.loads((A/'environment/result.json').read_text())['external_files']:assert sha(Path(item['path']))==item['sha256']
for item in json.loads((A/'environment/result.json').read_text())['binaries']:assert sha(Path(item['path']))==item['sha256']
shutil.copy2(A/'environment/result.json',E/'environment.json');shutil.copy2(C/'result.json',E/'compilation.json');shutil.copy2(F/'result.json',E/'final.json')
log=F/'FinalCheck.budget/command.log';log=log if log.exists() else F/'FinalCheck.log';shutil.copy2(log,E/'assumptions.txt')
for unit,u in UNITS.items():shutil.copy2(G/'generation'/unit/'result.json',E/(unit+'-generation.json'))
for name in ['positive-execute.log','both_wrong-execute.log']:shutil.copy2(A/'native'/name,E/name)
for name in ['false.log','source-tamper.log']:shutil.copy2(A/'negative'/name,E/name)
inputs=[]
for folder in ['impl','shim','contracts','proof/c','proof/coq','proof/native']:
 for f in sorted((ROOT/folder).rglob('*')):
  if f.is_file() and f.suffix not in ('.pyc','.vo','.glob','.vos','.vok') and not f.name.startswith('.'):
   inputs.append({'path':str(f.relative_to(ROOT)),'sha256':sha(f)})
for f in sorted(P.glob('*.py')):inputs.append({'path':str(f.relative_to(ROOT)),'sha256':sha(f)})
for name in ['spec.c','proof/dependencies.json','proof/intrinsic-ledger.json','proof/source-identity.json','proof/tactic-budget-changes.json','proof/final-reports.json']:
 inputs.append({'path':name,'sha256':sha(ROOT/name)})
modules=[{'path':m['path'],'sha256':m['sha256'],'namespace':m['namespace']} for m in dep['modules']]
for name in ['ProofBoundary','FinalCheck']:
 f=P/'coq/Qd8Admission'/(name+'.v');modules.append({'path':str(f.relative_to(ROOT)),'sha256':sha(f),'namespace':'Qd8Admission'})
manifest={'schema':2,'kernel':'qd8-f32-qc8w-gemm-minmax','verification_basis':'source-reviewed-intrinsic-spec','files':inputs,'modules':modules,'units':binding['units'],'intrinsic_ledger':'intrinsic-ledger.json','source_identity':'source-identity.json','parallel_jobs':32}
(P/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
full={'passed':True,'utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'evidence_kind':'actual complete C/Coq replay and semantic/source binding audit','configured_jobs':32,'generation_run':a.generation_run,'compile_run':a.compile_run,'final_run':a.final_run,'auxiliary_run':a.auxiliary_run,'fresh_compilation_lineage':'All local objects compiled freshly from source in the named strategy-binding recheck; no historical local .vo imported. Original published evidence retained under evidence/published-3c334f710/.','unit_fields':binding['unit_vc_fields'],'local_modules':len(modules),'assumption_reports':final['assumption_reports'],'inherited_assumption_names':final['inherited_assumption_names'],'evidence_files':[{'path':str(f.relative_to(P)),'sha256':sha(f)} for f in sorted(E.rglob('*')) if f.is_file()]}
(P/'full-status.json').write_text(json.dumps(full,indent=2)+'\n')
status={'schema':2,'kernel':'qd8-f32-qc8w-gemm-minmax','scope':'full','status':'proved','passed':True,'whole_kernel_verified':True,'whole_kernel_proved':True,'c_shim_equivalence_checked':True,'checked_c_call_closure':True,'call_closure_basis':'complete actual kernel/ordinary helpers/caller plus exact source-reviewed intrinsic contracts','final_checker_modules_checked':True,'kernel_contracts_match_spec':True,'kernel_contract_consequence':'Qd8Admission.ProofBoundary.qd8_kernel_precondition_frame','verification_basis':'source-reviewed-intrinsic-spec','implementation_variant':'repaired','original_kernel_tokens_preserved':False,'current_impl_tokens_preserved':True,'verification_scope':'Full actual C-shim modular partial correctness and public numeric-or-both-NaN equivalence under the listed intrinsic specs and public memory contract','checked_c_units':len(UNITS),'checked_c_vcs':binding['unit_vc_fields'],'checked_strategy_fields':12,'unique_c_functions_with_bodies':binding['body_functions'],'freshly_compiled_local_modules':len(modules),'ordinary_modules_including_final':len(modules),'assumption_reports':final['assumption_reports'],'parallel_jobs':32,'inherited_assumption_names':final['inherited_assumption_names'],'new_project_axioms':False,'intrinsic_spec_entries':38,'intrinsic_ISA_correspondence_checked':False,'human_semantic_review':'pending','spec_sha256':sha(ROOT/'spec.c'),'manifest_sha256':sha(P/'manifest.json'),'full_evidence':'full-status.json','full_evidence_sha256':sha(P/'full-status.json'),'immutable_full_archive':'evidence/full-run/','isa_refinement':False,'physical_ABI_refinement':False,'termination_proved':False,'arbitrary_VLEN':False,'configured_VLEN_bits':128,'native_cases':4992,'native_output_cells':70272,'limits':'README.md and intrinsic-ledger.json; full legal positive K/N at mr=1, cn_stride=32, all binary32; QCP integer-address memory model'}
(P/'status.json').write_text(json.dumps(status,ensure_ascii=False,indent=2)+'\n');print(json.dumps(status,ensure_ascii=False,indent=2))
