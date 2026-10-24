#!/usr/bin/env python3
"""Seal exact successful evidence; original identity-failure record remains visible."""
from pathlib import Path
import argparse,json,hashlib,shutil,datetime
from prepare import ROOT,UNITS
from audit import audit
p=argparse.ArgumentParser();p.add_argument('--generation-run',required=True);p.add_argument('--compile-run',required=True);p.add_argument('--final-run',required=True);p.add_argument('--ordinary-run',required=True);p.add_argument('--auxiliary-run',required=True);p.add_argument('--environment-run',required=True);a=p.parse_args()
P=ROOT/'proof';G=ROOT/'.build'/a.generation_run;C=ROOT/'.build'/a.compile_run/'compile';F=ROOT/'.build'/a.final_run/'final';H=ROOT/'.build'/a.ordinary_run;A=ROOT/'.build'/a.auxiliary_run;V=ROOT/'.build'/a.environment_run
sha=lambda f:hashlib.sha256(f.read_bytes()).hexdigest();binding=audit(a.generation_run,a.ordinary_run)
comp=json.loads((C/'result.json').read_text());final=json.loads((F/'result.json').read_text());assert comp['passed'] and final['passed'];d=json.loads((P/'dependencies.json').read_text());assert d==json.loads((C/'manifest.json').read_text())
for m in d['modules']:assert sha(ROOT/m['path'])==sha(C/m['path'])==m['sha256']
for m in comp['records']:assert sha((C/m['path']).with_suffix('.vo'))==m['vo_sha256']
for m in final['records']:
 assert sha(P/'coq/F32Admission'/(m['module']+'.v'))==m['source_sha256']
 assert sha(F/(m['module']+'.vo'))==m['vo_sha256']
for folder,label in [(A,'native'),(A,'negative'),(V,'dependency-audit')]:assert json.loads((folder/label/'result.json').read_text())['passed']
native=json.loads((A/'native/result.json').read_text());assert all(sha(ROOT/f)==h for f,h in native['source_hashes'].items())
env=json.loads((V/'environment/result.json').read_text());assert all(sha(Path(x['path']))==x['sha256'] for x in env['external_files']+env['binaries'])
E=P/'evidence/full-run';E.mkdir(exist_ok=False)
(E/'binding-audit.json').write_text(json.dumps(binding,indent=2)+'\n')
for source,name in [(C/'result.json','compilation.json'),(F/'result.json','final.json'),(V/'environment/result.json','environment.json'),(V/'dependency-audit/result.json','dependency-audit.json'),(A/'native/result.json','native.json'),(A/'negative/result.json','negative.json')]:shutil.copy2(source,E/name)
for unit in UNITS:
 source=G/'generation'/unit;shutil.copy2(source/'result.json',E/(unit+'-generation.json'))
 if (source/'identity-recheck.json').exists():shutil.copy2(source/'identity-recheck.json',E/(unit+'-identity-recheck.json'))
shutil.copy2(H/'generation/ordinary/result.json',E/'ordinary-generation.json')
for label,names in [('native',['positive-execute.log','both_wrong-execute.log']),('negative',['false.log','source-tamper.log','original-execute.log'])]:
 for n in names:shutil.copy2(A/label/n,E/n)
log=F/'FinalCheck.budget/command.log';shutil.copy2(log if log.exists() else F/'FinalCheck.log',E/'assumptions.txt')
inputs=[]
for folder in ['impl','shim','contracts','proof/c','proof/coq','proof/native']:
 for f in sorted((ROOT/folder).rglob('*')):
  if f.is_file() and f.suffix not in ['.pyc','.vo','.vos','.vok','.glob'] and not f.name.startswith('.'):inputs.append({'path':str(f.relative_to(ROOT)),'sha256':sha(f)})
for f in sorted(P.glob('*.py')):inputs.append({'path':str(f.relative_to(ROOT)),'sha256':sha(f)})
for name in ['spec.c','proof/dependencies.json','proof/intrinsic-ledger.json','proof/source-identity.json','proof/tactic-budget-changes.json','proof/final-reports.json']:inputs.append({'path':name,'sha256':sha(ROOT/name)})
mods=[{'path':m['path'],'sha256':m['sha256'],'namespace':m['namespace']} for m in d['modules']]
for name in ['ordinary_goal','OrdinaryChecked','Boundary','FinalCheck']:
 f=P/'coq/F32Admission'/(name+'.v');mods.append({'path':str(f.relative_to(ROOT)),'sha256':sha(f),'namespace':'F32Admission'})
assert len(mods)==1063 and binding['unit_vc_fields']==895 and final['assumption_reports']==923
manifest={'schema':2,'kernel':'f32-gemm-minmax','verification_basis':'source-reviewed-intrinsic-spec','files':inputs,'modules':mods,'units':binding['units'],'intrinsic_ledger':'intrinsic-ledger.json','source_identity':'source-identity.json','parallel_jobs':32};(P/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
full={'passed':True,'utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'configured_jobs':32,'generation_run':a.generation_run,'compile_run':a.compile_run,'final_run':a.final_run,'ordinary_run':a.ordinary_run,'auxiliary_run':a.auxiliary_run,'environment_run':a.environment_run,'fresh_compilation_lineage':'All1063 local objects first compiled in this current admission. Exact-source/dependency/object-validated objects from admission01 reused for admission03; changed RVV import and affected consumers recompiled. No historical project.vo loaded.','generation_identity_history':'RVV generator exited0 and emitted391 current-source formulas; initial expected import identity failed. Two qualified imports adopted, identity rechecked, all affected consumers recompiled; original failure preserved.','unit_fields':895,'local_modules':len(mods),'assumption_reports':923,'inherited_assumption_names':final['inherited_assumption_names'],'evidence_files':[{'path':str(f.relative_to(P)),'sha256':sha(f)} for f in sorted(E.rglob('*')) if f.is_file()]};(P/'full-status.json').write_text(json.dumps(full,indent=2)+'\n')
status={'schema':2,'kernel':'f32-gemm-minmax','scope':'full','status':'proved','passed':True,'whole_kernel_verified':True,'whole_kernel_proved':True,'c_shim_equivalence_checked':True,'checked_c_call_closure':True,'final_checker_modules_checked':True,'kernel_contracts_match_spec':True,'kernel_contract_consequence':'six FullDomainConsequence.FullConsequence theorems; scalar call-entry identity source-audited; QCP frontend/contract instantiation trusted','verification_basis':'source-reviewed-intrinsic-spec','implementation_variant':'repaired','original_kernel_tokens_preserved':False,'current_impl_tokens_preserved':True,'verification_scope':'full current C kernels and actual caller under public contract; modular partial correctness, numeric-or-both-NaN equivalence','checked_c_units':4,'checked_c_vcs':895,'checked_strategy_fields':13,'unique_c_functions_with_bodies':10,'freshly_compiled_local_modules':1063,'ordinary_modules_including_final':1063,'assumption_reports':923,'parallel_jobs':32,'inherited_assumption_names':final['inherited_assumption_names'],'new_project_axioms':False,'intrinsic_spec_entries':23,'intrinsic_ISA_correspondence_checked':False,'human_semantic_review':'pending','spec_sha256':sha(ROOT/'spec.c'),'manifest_sha256':sha(P/'manifest.json'),'full_evidence':'full-status.json','full_evidence_sha256':sha(P/'full-status.json'),'immutable_full_archive':'evidence/full-run/','isa_refinement':False,'physical_ABI_refinement':False,'source_refinement_original_to_repaired':False,'termination_proved':False,'arbitrary_VLEN':False,'configured_VLEN_bits':128,'physical_VLMAX_e32m4':16,'modeled_prefix_slots':8,'native_cases':native['geometry']['cases'],'native_output_cells':native['geometry']['output_cells'],'limits':'README.md; full legal positive K/N, mr1..4, mapper strides, allbinary32. QCP integer-address memory model.'};(P/'status.json').write_text(json.dumps(status,indent=2)+'\n');print(json.dumps(status,indent=2))
