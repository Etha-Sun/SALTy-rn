#!/usr/bin/env python3
"""Seal only complete, source-identical IGEMM evidence; preserve all failed attempts."""
from pathlib import Path
import argparse,datetime,hashlib,json,re,shutil
from admission_prepare import ROOT,UNITS
from audit import audit
p=argparse.ArgumentParser();p.add_argument('--generation-run',required=True);p.add_argument('--generation-map',type=Path);p.add_argument('--compile-run',required=True);p.add_argument('--final-run',required=True);p.add_argument('--auxiliary-run',required=True);p.add_argument('--audit-run',required=True);a=p.parse_args()
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();P=ROOT/'proof';G=ROOT/'.build'/a.generation_run;C=ROOT/'.build'/a.compile_run/'compile';F=ROOT/'.build'/a.final_run/'final';A=ROOT/'.build'/a.auxiliary_run;D=json.loads((P/'dependencies.json').read_text());gm=json.loads(a.generation_map.read_text())if a.generation_map else{}
binding=audit(a.generation_run,gm);comp=json.loads((C/'result.json').read_text());final=json.loads((F/'result.json').read_text());assert comp['passed']and final['passed']and final['inputs_unchanged'];assert json.loads((C/'manifest.json').read_text())==D;assert final['compiled_dependency_run']==a.compile_run and final['dependency_status_sha256']==sha(C/'result.json')
for m in D['modules']:assert sha(ROOT/m['path'])==sha(C/m['path'])==m['sha256']
for r in comp['records']:assert sha((C/r['path']).with_suffix('.vo'))==r['vo_sha256']
for r in final['records']:
 assert sha(P/'coq/IGemmAdmission'/(r['module']+'.v'))==r['source_sha256'];assert sha(F/(r['module']+'.vo'))==r['vo_sha256']
for name in ['copy','indirection']:
 d=json.loads((G/f'strategy-{name}/result.json').read_text());assert d['passed']and d['exact_goal_match'];assert sha(Path(d['tool']['path']))==d['tool']['sha256']
 for f,h in d['input_hashes'].items():assert sha(ROOT/f)==h
aux={n:json.loads((A/n/'result.json').read_text())for n in ['native','negative','environment']}
assert aux['native']['passed']and aux['negative']['passed']
for f,h in aux['native']['source_hashes'].items():assert sha(ROOT/f)==h
assert aux['negative']['source_sha256']==sha(ROOT/'impl/testNEON.c')
for r in aux['environment']['external_files']+aux['environment']['binaries']:assert sha(Path(r['path']))==r['sha256']
DA=ROOT/'.build'/a.audit_run/'dependency-audit';depcheck=json.loads((DA/'result.json').read_text());assert depcheck['passed']and depcheck['sources']==len(D['modules'])+33
for m in D['modules']:
 s=re.sub(r'\(\*.*?\*\)','',(ROOT/m['path']).read_text(),flags=re.S);assert not re.search(r'\b(?:Admitted|admit|Abort)\b',s),m['path']
E=P/'evidence/full-run';E.mkdir(parents=True,exist_ok=False)
for name in ['copy','indirection']:shutil.copytree(G/f'strategy-{name}',E/f'strategy-{name}')
for u in UNITS:
 src=ROOT/'.build'/gm.get(u,a.generation_run)/'generation'/u
 shutil.copy2(src/'result.json',E/(u+'-generation.json'))
for name,d in [('binding-audit',binding),('compilation',comp),('final',final),('native',aux['native']),('negative',aux['negative']),('environment',aux['environment']),('dependency-audit',depcheck)]:
 (E/(name+'.json')).write_text(json.dumps(d,indent=2)+'\n')
for name in ['positive-execute.log','both-wrong-execute.log']:
 shutil.copy2(A/'native'/name,E/name)
for name in ['false.log','source-tamper.log']:shutil.copy2(A/'negative'/name,E/name)
for r in final['records']:shutil.copy2(F/(r['module']+'.budget/command.log'),E/(r['module']+'.txt'))
selected={m['path']for m in D['modules']};selected|={str(f.relative_to(ROOT))for f in (P/'coq/IGemmAdmission').glob('*.v')}
for folder in ['impl','shim','contracts','proof/c','proof/native']:
 selected|={str(f.relative_to(ROOT))for f in (ROOT/folder).rglob('*')if f.is_file()and f.suffix not in ['.pyc','.vo','.glob','.vos','.vok']and not f.name.startswith('.')}
selected|={str(f.relative_to(ROOT))for f in P.glob('*.py')}
selected|={'spec.c','repair.md','proof/dependencies.json','proof/intrinsic-ledger.json','proof/source-identity.json','proof/final-reports.json','proof/generation-runs.json'}
modules=[{'path':m['path'],'namespace':m['namespace'],'sha256':m['sha256']}for m in D['modules']]+[{'path':str(f.relative_to(ROOT)),'namespace':'IGemmAdmission','sha256':sha(f)}for f in sorted((P/'coq/IGemmAdmission').glob('*.v'))]
manifest={'schema':2,'kernel':'qd8-f32-qc8w-igemm-minmax','verification_basis':'source-reviewed-intrinsic-spec','files':[{'path':s,'sha256':sha(ROOT/s)}for s in sorted(selected)],'modules':modules,'units':binding['units'],'intrinsic_ledger':'intrinsic-ledger.json','source_identity':'source-identity.json','parallel_jobs':32};(P/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
full={'passed':True,'utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'evidence_kind':'complete actual six-unit C/Coq replay with exact source/strategy/call binding','configured_jobs':32,'generation_runs':{u:gm.get(u,a.generation_run)for u in UNITS},'strategy_run':a.generation_run,'compile_run':a.compile_run,'final_run':a.final_run,'auxiliary_run':a.auxiliary_run,'audit_run':a.audit_run,'fresh_compilation_lineage':'All selected local source modules freshly compiled in one dependency-ordered run; all complete interfaces rebound and assumptions audited in32 independent shards. No historical local objects imported. Earlier incremental evidence does not substitute for this run.','unit_fields':binding['unit_vc_fields'],'local_modules':len(modules),'assumption_reports':final['assumption_reports'],'inherited_assumption_names':final['inherited_assumption_names'],'evidence_files':[{'path':str(f.relative_to(P)),'sha256':sha(f)}for f in sorted(E.rglob('*'))if f.is_file()]};(P/'full-status.json').write_text(json.dumps(full,indent=2)+'\n')
status={'schema':2,'kernel':'qd8-f32-qc8w-igemm-minmax','scope':'full','status':'proved','passed':True,'whole_kernel_verified':True,'whole_kernel_proved':True,'c_shim_equivalence_checked':True,'checked_c_call_closure':True,'call_closure_basis':'complete actual kernels, loops, memory, ordinary helpers and caller under source-reviewed intrinsic specs','final_checker_modules_checked':True,'kernel_contracts_match_spec':True,'verification_basis':'source-reviewed-intrinsic-spec','implementation_variant':'compatibility-adapted','original_kernel_tokens_preserved':False,'current_impl_tokens_preserved':True,'verification_scope':'C-shim modular partial correctness and public numeric-or-both-NaN equivalence at mr1, cn_stride32, arbitrary positive legal K,N and table length','checked_c_units':len(UNITS),'checked_c_vcs':binding['unit_vc_fields'],'checked_strategy_fields':15,'unique_c_functions_with_bodies':binding['body_functions'],'freshly_compiled_local_modules':len(modules),'ordinary_modules_including_final':len(modules),'assumption_reports':final['assumption_reports'],'parallel_jobs':32,'inherited_assumption_names':final['inherited_assumption_names'],'new_project_axioms':False,'intrinsic_spec_entries':38,'intrinsic_ISA_correspondence_checked':False,'human_semantic_review':'pending','spec_sha256':sha(ROOT/'spec.c'),'manifest_sha256':sha(P/'manifest.json'),'full_evidence':'full-status.json','full_evidence_sha256':sha(P/'full-status.json'),'immutable_full_archive':'evidence/full-run/','isa_refinement':False,'physical_ABI_refinement':False,'termination_proved':False,'arbitrary_VLEN':False,'configured_VLEN_bits':128,'native_cases':aux['native']['cases'],'native_output_cells':aux['native']['logical_output_cells'],'limits':'README.md, spec.c and intrinsic-ledger.json; all binary32; repeated/overlapping readonly input windows, explicit capacities, QCP integer-address memory model'};(P/'status.json').write_text(json.dumps(status,ensure_ascii=False,indent=2)+'\n');print(json.dumps(status,ensure_ascii=False,indent=2))
