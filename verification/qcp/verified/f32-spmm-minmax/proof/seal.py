#!/usr/bin/env python3
"""Seal only a successful complete admission, preserving checker provenance."""
from pathlib import Path
import argparse,datetime,gzip,hashlib,json,re,shutil
T=Path(__file__).resolve().parents[1];P=T/'proof';p=argparse.ArgumentParser();p.add_argument('--run',required=True);a=p.parse_args();sha=lambda f:hashlib.sha256(f.read_bytes()).hexdigest();read=lambda f:json.loads(f.read_text())
main=read(T/'.build'/a.run/'result.json');assert main['passed']and main['configured_jobs']==32 and all(x['exit']==0 for x in main['records'])
C=T/'.build'/main['compile_run']/'compile';comp=read(C/'result.json');audit=read(T/'.build'/a.run/'audit/result.json');dep=read(P/'dependencies.json');G=T/'.build'/main['generation_run'];gen=read(G/'generation-summary.json');A=T/'.build'/main['auxiliary_run'];N=T/'.build'/main['native_run']/'native';native=read(N/'result.json');R=T/'.build'/main['recursive_run']/'recursive-check';rec=read(R/'result.json')
assert comp['passed']and comp['inputs_unchanged']and audit['passed']and gen['passed']and rec['passed']and rec['recursive']and rec['inputs_unchanged']
assert dep==read(C/'manifest.json')and len(dep['modules'])==comp['fresh_modules']==audit['fresh_local_modules']
assert audit['C_fields']==788 and audit['strategy_fields']==19 and audit['intrinsic_active_entries']==26
for m in dep['modules']:assert sha(T/m['path'])==sha(C/m['path'])==m['sha256']
for m in comp['records']:assert m['exit']==0 and sha((C/m['path']).with_suffix('.vo'))==m['vo_sha256']
assert native['passed']and native['inputs_unchanged']
for n,h in native['source_hashes'].items():assert sha(T/n)==sha(N/'snapshot'/Path(n).name)==h
for kind in ['negative','dependency-audit']:assert read(A/kind/'result.json')['passed']
for x in read(A/'environment/result.json')['external_files']+read(A/'environment/result.json')['binaries']:assert sha(Path(x['path']))==x['sha256']
assert not(P/'manifest.json').exists()and not(P/'status.json').exists()
E=P/'evidence/full-run';E.mkdir(parents=True,exist_ok=False)
def copy(src,dest):dest.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(src,dest)
def compressed(src,dest):dest.parent.mkdir(parents=True,exist_ok=True);dest.write_bytes(gzip.compress(src.read_bytes(),compresslevel=9,mtime=0))
def text_tree(src,dest):
 for f in sorted(src.rglob('*')):
  if not f.is_file()or f.is_symlink():continue
  if f.suffix in ['.json','.log','.txt','.py','.c','.h','.v']:
   target=dest/f.relative_to(src)
   if f.stat().st_size>1024*1024 or f.suffix in ['.c','.h','.v']:compressed(f,target.with_name(target.name+'.gz'))
   else:copy(f,target)
for src,name in [(T/'.build'/a.run/'result.json','complete-check.json'),(C/'result.json','compilation.json'),(C/'manifest.json','compiled-manifest.json'),(C/'launch.json','compile-launch.json'),(C/'flags.json','compile-flags.json'),(T/'.build'/a.run/'audit/result.json','binding-audit.json'),(G/'generation-summary.json','generation-summary.json'),(N/'result.json','native.json')]:copy(src,E/name)
for kind in ['negative','environment','dependency-audit']:text_tree(A/kind,E/kind)
text_tree(R,E/'recursive-check');text_tree(T/'.build'/a.run/'audit',E/'binding-details')
if(C/'continuations').exists():text_tree(C/'continuations',E/'compilation-continuations')
for row in gen['units']:
 base=T/'.build'/row['source_run']/'generation'/row['unit'];dest=E/'generation'/row['unit'];copy(base/'result.json',dest/'result.json')
 for f in base.iterdir():
  if f.is_file()and(f.suffix in ['.log','.c']or f.name.endswith('_goal.v')):
   if f.suffix in ['.c','.v']:compressed(f,dest/(f.name+'.gz'))
   else:copy(f,dest/f.name)
for check in audit['assumption_checks']:
 src=(C/check['source']).with_suffix('.budget')/'command.log';assert sha(src)==check['log_sha256'];copy(src,E/'assumptions'/Path(check['source']).with_suffix('.txt'))
for variant in ['max','balanced','both_wrong']:text_tree(N/variant,E/'native'/variant)
# Preserve exact outcome/manifest summaries of every earlier actual-goal batch.
for run in ['rvvproof01','rvvproof02','rvvproof03','neonproof01','neonproof02','neonproof03','neonproof04']:
 base=T/'.build'/run/'compile'
 for name in ['result.json','manifest.json','launch.json']:
  f=base/name
  if f.exists():compressed(f,E/'development-history'/(run+'-'+name+'.gz'))
 if(base/'continuations').exists():text_tree(base/'continuations',E/'development-history'/run/'continuations')
for folder in ['before-do-entry-positive','before-entry-pre-links']:
 if(T/'.build'/folder).exists():text_tree(T/'.build'/folder,E/'development-history'/folder)
selected={m['path']for m in dep['modules']}
for folder in ['impl','shim','contracts','proof/c','proof/native','proof/original']:
 selected|={str(f.relative_to(T))for f in(T/folder).rglob('*')if f.is_file()and not f.is_symlink()and f.suffix not in ['.pyc','.vo','.vos','.vok','.glob']and not f.name.startswith('.')}
selected|={str(f.relative_to(T))for f in P.glob('*.py')}
selected|={str(f.relative_to(T))for f in P.glob('*.json')if f.name not in ['manifest.json','status.json','full-status.json','progress.json']}
selected|={'README.md','README.zh-CN.md','CONTINUE_PROMPT.zh-CN.md','.gitignore','spec.c','repair.md','proof/neon-repair.patch','proof/rvv-repair.patch'}
# Source-review evidence and old frontend templates are retained as evidence,
# never imported into the checked proof dependency graph.
selected|={str(f.relative_to(T))for f in(P/'evidence').rglob('*')if f.is_file()and not f.is_relative_to(E)}
assert all((T/f).is_file()and(T/f).stat().st_size<100*2**20 for f in selected)
for m in dep['modules']:
 s=re.sub(r'\(\*.*?\*\)','',(T/m['path']).read_text(),flags=re.S);assert not re.search(r'\b(Admitted|admit|Abort)\b',s)
full={'passed':True,'utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'configured_jobs':32,'evidence_kind':'Complete four-unit actual C verification, typed interfaces and recursive Coq checking under source-reviewed intrinsic specs','compile_run':main['compile_run'],'generation_run':main['generation_run'],'native_run':main['native_run'],'auxiliary_run':main['auxiliary_run'],'recursive_run':main['recursive_run'],'complete_check_run':a.run,'fresh_local_modules':audit['fresh_local_modules'],'C_fields':788,'unit_fields':audit['unit_fields'],'strategy_fields':19,'probe_C_fields':9,'assumption_reports':audit['assumption_reports'],'same_environment_continuations':audit['same_environment_continuations'],'fresh_compilation_lineage':'Every selected source freshly compiled in one dependency environment. Any recorded continuation preserves successful sources/objects/direct imports and compiles added imports freshly; no foreign local objects.','inherited_assumption_names':audit['inherited_assumption_names'],'evidence_files':[{'path':str(f.relative_to(P)),'sha256':sha(f)}for f in sorted(E.rglob('*'))if f.is_file()]}
(P/'full-status.json').write_text(json.dumps(full,indent=2)+'\n')
manifest={'schema':2,'kernel':'f32-spmm-minmax','verification_basis':'source-reviewed-intrinsic-spec','files':[{'path':f,'sha256':sha(T/f)}for f in sorted(selected)],'modules':dep['modules'],'parallel_jobs':32,'intrinsic_ledger':'intrinsic-ledger.json','source_identity':'source-identity.json'};(P/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
status={'schema':2,'kernel':'f32-spmm-minmax','scope':'full','status':'proved','passed':True,'whole_kernel_verified':True,'whole_kernel_proved':True,'c_shim_equivalence_checked':True,'checked_c_call_closure':True,'call_closure_basis':'Complete actual kernels, loops, memory, ordinary helpers and caller under source-reviewed intrinsic specifications','final_checker_modules_checked':True,'kernel_contracts_match_spec':True,'verification_basis':'source-reviewed-intrinsic-spec','implementation_variant':'RVV-FMA/NaN repaired; both C expressions sequenced explicitly; RVV local pointer renamed','original_kernel_tokens_preserved':False,'original_NEON_preserved':False,'originals_archived':True,'current_impl_tokens_preserved':True,'verification_scope':'Full sparse M/N/nnz loops, NEON4/2/1 paths and all legal RVV VL choices; numeric-or-both-NaN output; all binary32; cyclic sparse streams within explicit capacities','checked_c_units':4,'checked_c_vcs':788,'checked_strategy_fields':19,'checked_probe_c_vcs':9,'freshly_compiled_local_modules':audit['fresh_local_modules'],'assumption_reports':audit['assumption_reports'],'parallel_jobs':32,'inherited_assumption_names':audit['inherited_assumption_names'],'new_project_axioms':False,'intrinsic_spec_entries':26,'intrinsic_ISA_correspondence_checked':False,'human_semantic_review':'pending','spec_sha256':sha(T/'spec.c'),'manifest_sha256':sha(P/'manifest.json'),'full_evidence':'full-status.json','full_evidence_sha256':sha(P/'full-status.json'),'immutable_full_archive':'evidence/full-run/','recursive_coqchk':True,'isa_refinement':False,'physical_ABI_refinement':False,'termination_proved':False,'arbitrary_VLEN':False,'configured_VLEN_bits':128,'physical_VLMAX':32,'modeled_prefix_slots':32,'native_variants':[{k:v for k,v in x.items()if k!='records'}for x in native['results']],'limits':'README.zh-CN.md, spec.c and intrinsic-ledger.json; fixedRVV128/e32m8, RNE/no-flush, QCP integer-address memory model'};(P/'status.json').write_text(json.dumps(status,ensure_ascii=False,indent=2)+'\n');print({k:status[k]for k in ['passed','whole_kernel_verified','freshly_compiled_local_modules','checked_c_vcs','assumption_reports','parallel_jobs']})
