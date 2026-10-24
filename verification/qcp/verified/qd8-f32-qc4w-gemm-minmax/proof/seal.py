"""Seal one complete QC4W result; all required checks must already exist and pass."""
from pathlib import Path
import argparse,datetime,hashlib,json,re,shutil
from prepare import ROOT,UNITS
from audit import audit
p=argparse.ArgumentParser();p.add_argument('--compile-run',required=True);p.add_argument('--generation-run',required=True);p.add_argument('--native-run',required=True);p.add_argument('--auxiliary-run',required=True);a=p.parse_args();sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
P=ROOT/'proof';C=ROOT/'.build'/a.compile_run/'compile';G=ROOT/'.build'/a.generation_run;N=ROOT/'.build'/a.native_run;A=ROOT/'.build'/a.auxiliary_run
binding=audit(a.compile_run,a.generation_run);dep=json.loads((P/'dependencies.json').read_text());comp=json.loads((C/'result.json').read_text());native=json.loads((N/'result.json').read_text());aux={n:json.loads((A/n/'result.json').read_text())for n in ['negative','environment','dependency-audit']}
assert native['passed']and native['inputs_unchanged']and native['results']['original']['same']is False
assert aux['negative']['passed']and aux['negative']['live_inputs_unchanged']
for f,h in native['sources'].items():assert sha(ROOT/f)==h,f
for f,h in aux['negative']['input_sha256'].items():assert sha(ROOT/f)==h,f
assert aux['dependency-audit']['passed']and aux['dependency-audit']['sources']==len(dep['modules'])==binding['fresh_local_modules']
for r in aux['environment']['external_files']+aux['environment']['binaries']:assert sha(Path(r['path']))==r['sha256'],r['path']
for m in dep['modules']:
 s=re.sub(r'\(\*.*?\*\)','',(ROOT/m['path']).read_text(),flags=re.S);assert not re.search(r'\b(?:Admitted|admit|Abort)\b',s),m['path']
E=P/'evidence/full-run';E.mkdir(parents=True,exist_ok=False)
for name,data in [('binding-audit',binding),('compilation',comp),('native',native),*aux.items()]:(E/(name+'.json')).write_text(json.dumps(data,indent=2)+'\n')
shutil.copy2(G/'generation-summary.json',E/'generation-summary.json')
if (C/'continuations').exists():shutil.copytree(C/'continuations',E/'compilation-continuations',ignore=shutil.ignore_patterns('*.glob'))
if (G/'neon-adoption.json').exists():shutil.copy2(G/'neon-adoption.json',E/'neon-adoption.json')
for unit,U in UNITS.items():
 for name in ['result.json',U['base']+'.c',U['base']+'_goal.v']:
  shutil.copy2(G/'generation'/unit/name,E/(unit+'-'+name))
 for name in ['plain.c','plain-cpp.c']:
  f=G/'generation'/unit/name
  if f.exists():shutil.copy2(f,E/(unit+'-'+name))
for side in ['neon','rvv']:
 O=E/('strategy-'+side);O.mkdir()
 for f in (G/'strategy'/side).iterdir():
  if f.is_file():shutil.copy2(f,O/f.name)
for r in binding['assumption_checks']:
 f=C/'proof/coq/QC4Admission'/(r['module']+'.budget/command.log');assert sha(f)==r['log_sha256'];shutil.copy2(f,E/(r['module']+'.txt'))
for f in N.glob('*.log'):shutil.copy2(f,E/('native-'+f.name))
for f in (A/'negative').glob('*.log'):shutil.copy2(f,E/('negative-'+f.name))
selected={m['path']for m in dep['modules']}
for folder in ['impl','shim','contracts','proof/c','proof/native']:
 selected|={str(f.relative_to(ROOT))for f in(ROOT/folder).rglob('*')if f.is_file()and f.suffix not in['.pyc','.vo','.glob','.vos','.vok']and not f.name.startswith('.')}
selected|={str(f.relative_to(ROOT))for f in P.glob('*.py')}
selected|={'README.md','README.zh-CN.md','CONTINUE_PROMPT.zh-CN.md','.gitignore','spec.c','repair.md','proof/dependencies.json','proof/intrinsic-ledger.json','proof/source-identity.json','proof/final-reports.json','proof/evidence/original-rvv.c','proof/evidence/rvv-repair.patch','proof/evidence/rvv-patch-identity.json'}
for name in ['rvv-field-selection.json','neon-field-selection.json']:
 f=P/'evidence'/name
 if f.exists():selected.add(str(f.relative_to(ROOT)))
manifest={'schema':2,'kernel':'qd8-f32-qc4w-gemm-minmax','verification_basis':'source-reviewed-intrinsic-spec','files':[{'path':f,'sha256':sha(ROOT/f)}for f in sorted(selected)],'modules':dep['modules'],'parallel_jobs':32,'intrinsic_ledger':'intrinsic-ledger.json','source_identity':'source-identity.json'};(P/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
full={'passed':True,'utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'evidence_kind':'Complete actual five-unit C/Coq verification with exact source, strategy and call binding; adopted generation provenance is explicit','configured_jobs':32,'compile_run':a.compile_run,'generation_run':a.generation_run,'native_run':a.native_run,'auxiliary_run':a.auxiliary_run,'fresh_local_modules':binding['fresh_local_modules'],'C_fields':binding['C_fields'],'strategy_fields':12,'assumption_reports':binding['assumption_reports'],'fresh_compilation_lineage':'Every selected local module, complete interface and final assumption shard compiled freshly in one dependency environment; any unchanged-source continuation and failed attempts are preserved; no foreign historical local object imported.','inherited_assumption_names':binding['inherited_assumption_names'],'evidence_files':[{'path':str(f.relative_to(P)),'sha256':sha(f)}for f in sorted(E.rglob('*'))if f.is_file()]};(P/'full-status.json').write_text(json.dumps(full,indent=2)+'\n')
old=P/'status.json'
if old.exists():shutil.copy2(old,P/'evidence/pre-admission-status.json')
status={'schema':2,'kernel':'qd8-f32-qc4w-gemm-minmax','scope':'full','status':'proved','passed':True,'whole_kernel_verified':True,'whole_kernel_proved':True,'c_shim_equivalence_checked':True,'checked_c_call_closure':True,'call_closure_basis':'Complete actual kernels, loops, memory, ordinary helpers and caller under source-reviewed intrinsic specifications','final_checker_modules_checked':True,'kernel_contracts_match_spec':True,'verification_basis':'source-reviewed-intrinsic-spec','implementation_variant':'RVV-NaN-clamp-repaired-and-equivalent-while-loop; NEON-source-unchanged','original_kernel_tokens_preserved':False,'original_NEON_preserved':True,'current_impl_tokens_preserved':True,'verification_scope':'C-shim modular partial correctness and public numeric-or-both-NaN equivalence; MR1, NR16, cn_stride64; arbitrary positive N,K within public capacities','checked_c_units':5,'checked_c_vcs':binding['C_fields'],'checked_strategy_fields':12,'freshly_compiled_local_modules':binding['fresh_local_modules'],'assumption_reports':binding['assumption_reports'],'parallel_jobs':32,'inherited_assumption_names':binding['inherited_assumption_names'],'new_project_axioms':False,'intrinsic_spec_entries':45,'intrinsic_ISA_correspondence_checked':False,'human_semantic_review':'pending','spec_sha256':sha(ROOT/'spec.c'),'manifest_sha256':sha(P/'manifest.json'),'full_evidence':'full-status.json','full_evidence_sha256':sha(P/'full-status.json'),'immutable_full_archive':'evidence/full-run/','isa_refinement':False,'physical_ABI_refinement':False,'termination_proved':False,'arbitrary_VLEN':False,'configured_VLEN_bits':128,'physical_VLMAX':32,'modeled_prefix_slots':16,'native_cases':native['results']['repaired']['cases'],'native_output_cells':native['results']['repaired']['output_cells'],'limits':'README.zh-CN.md, spec.c and intrinsic-ledger.json; full binary32; rounded/padded depth and explicit capacities; QCP integer-address memory model'};old.write_text(json.dumps(status,ensure_ascii=False,indent=2)+'\n');print({k:status[k]for k in ['passed','whole_kernel_verified','freshly_compiled_local_modules','checked_c_vcs','assumption_reports','parallel_jobs']})
