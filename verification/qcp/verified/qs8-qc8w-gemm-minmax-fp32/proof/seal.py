#!/usr/bin/env python3
"""Seal a successful complete-case run; preserve all failed/continued-run provenance."""
from pathlib import Path
import argparse,datetime,gzip,hashlib,json,re,shutil
from prepare import ROOT as T
p=argparse.ArgumentParser();p.add_argument('--run',required=True);a=p.parse_args();sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
read=lambda p:json.loads(p.read_text());P=T/'proof';main=read(T/'.build'/a.run/'result.json');assert main['passed']and main['configured_jobs']==32 and all(x['exit']==0 for x in main['records'])
C=T/'.build'/main['compile_run']/'compile';comp=read(C/'result.json');audit=read(C.parent/'audit.json');dep=read(P/'dependencies.json');G=T/'.build'/main['generation_run'];generation=read(G/'generation-summary.json');A=T/'.build'/main['auxiliary_run'];N=T/'.build'/main['native_run']/'native';native=read(N/'result.json');R=T/'.build'/main['recursive_run']/'recursive-check';recursive=read(R/'result.json')
assert comp['passed']and comp['inputs_unchanged']and audit['passed']and generation['passed']and recursive['passed']and recursive['recursive']and recursive['inputs_unchanged']
assert dep==read(C/'manifest.json')and len(dep['modules'])==comp['fresh_modules']==audit['fresh_local_modules']
assert audit['C_fields']==1531 and audit['strategy_fields']==16 and audit['intrinsic_active_entries']==52
for m in dep['modules']:assert sha(T/m['path'])==sha(C/m['path'])==m['sha256']
for m in comp['records']:assert m['exit']==0 and sha((C/m['path']).with_suffix('.vo'))==m['vo_sha256']
assert native['passed']and native['live_inputs_unchanged']and native['snapshot_unchanged']
for n,h in native['source_hashes'].items():assert sha(T/n)==sha(N/'snapshot'/n)==h
for kind in ['negative','dependency-audit']:assert read(A/kind/'result.json')['passed']
environment=read(A/'environment/result.json')
for row in environment['external_files']+environment['binaries']:assert sha(Path(row['path']))==row['sha256']
assert not(P/'manifest.json').exists()and not(P/'status.json').exists()
E=P/'evidence/full-run';E.mkdir(parents=True,exist_ok=False)
def copy(src,dest):
 dest.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(src,dest)
def compressed(src,dest):
 dest.parent.mkdir(parents=True,exist_ok=True);dest.write_bytes(gzip.compress(src.read_bytes(),compresslevel=9,mtime=0))
def text_tree(src,dest):
 for f in sorted(src.rglob('*')):
  if not f.is_file()or f.is_symlink():continue
  if f.suffix in ['.json','.log','.txt','.py','.c','.h','.v']:
   target=dest/f.relative_to(src)
   if f.stat().st_size>1024*1024 or f.suffix in ['.c','.h','.v']:compressed(f,target.with_name(target.name+'.gz'))
   else:copy(f,target)
for source,name in [(T/'.build'/a.run/'result.json','complete-check.json'),(C/'result.json','compilation.json'),(C/'manifest.json','compiled-manifest.json'),(C/'launch.json','compile-launch.json'),(C/'flags.json','compile-flags.json'),(C.parent/'audit.json','binding-audit.json'),(G/'generation-summary.json','generation-summary.json'),(N/'result.json','native.json')]:copy(source,E/name)
for kind in ['negative','environment','dependency-audit']:text_tree(A/kind,E/kind)
text_tree(R,E/'recursive-check');text_tree(C.parent/'audit-attempts'/audit['attempt'],E/'binding-details')
if(C/'continuations').exists():text_tree(C/'continuations',E/'compilation-continuations')
for row in generation['units']:
 base=T/'.build'/row['source_run']/'generation'/row['unit'];dest=E/'generation'/row['unit'];copy(base/'result.json',dest/'result.json')
 for f in base.iterdir():
  if f.is_file()and(f.suffix in ['.log','.c']or f.name.endswith('_goal.v')):
   if f.suffix in ['.c','.v']:compressed(f,dest/(f.name+'.gz'))
   else:copy(f,dest/f.name)
for check in audit['assumption_checks']:
 src=(C/check['source']).with_suffix('.budget')/'command.log';assert sha(src)==check['log_sha256'];copy(src,E/'assumptions'/Path(check['source']).with_suffix('.txt'))
for variant in ['original','repaired','both_wrong']:text_tree(N/variant,E/'native'/variant)
# Failed exploration remains in the private candidate archive; publish its exact summaries.
for run in ['neonproof01','neonmanual02','neonmanual03','neonretry01','neonretry02','neonretry03','neonretry04','neonretry05','neonretry06']:
 f=T/'.build'/run/'compile/result.json'
 if f.exists():compressed(f,E/'development-history'/(run+'-result.json.gz'))
f=T/'.build/wholecase01/result.json'
if f.exists():copy(f,E/'development-history/wholecase01-initial-failure.json')
selected={m['path']for m in dep['modules']}
for folder in ['impl','shim','contracts','proof/c','proof/native','proof/original']:
 selected|={str(f.relative_to(T))for f in(T/folder).rglob('*')if f.is_file()and not f.is_symlink()and f.suffix not in ['.pyc','.vo','.vos','.vok','.glob']and not f.name.startswith('.')}
selected|={str(f.relative_to(T))for f in P.glob('*.py')}
selected|={str(f.relative_to(T))for f in P.glob('*.json')if f.name not in ['manifest.json','status.json','full-status.json','progress.json','neon-field-progress.json']}
selected|={'README.md','README.zh-CN.md','CONTINUE_PROMPT.zh-CN.md','.gitignore','spec.c','repair.md','proof/rvv-repair.patch','proof/generated/neon_goal.v.gz'}
selected|={str(f.relative_to(T))for f in(P/'evidence/official').rglob('*')if f.is_file()}
assert all((T/f).is_file()for f in selected)
for f in selected:
 assert (T/f).stat().st_size<100*2**20,f
 if f.endswith('.v'):
  s=re.sub(r'\(\*.*?\*\)','',(T/f).read_text(),flags=re.S);assert not re.search(r'\b(Admitted|admit|Abort)\b',s),f
full={'passed':True,'utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'configured_jobs':32,'evidence_kind':'Complete four-unit actual C verification, typed interfaces and recursive Coq checking under source-reviewed intrinsic specs','compile_run':main['compile_run'],'generation_run':main['generation_run'],'native_run':main['native_run'],'auxiliary_run':main['auxiliary_run'],'recursive_run':main['recursive_run'],'complete_check_run':a.run,'fresh_local_modules':audit['fresh_local_modules'],'C_fields':1531,'strategy_fields':16,'assumption_reports':audit['assumption_reports'],'same_environment_continuations':audit['same_environment_continuations'],'fresh_compilation_lineage':'Every selected module was freshly compiled in one dependency environment; continuations retain exact successful source/object identities, explicitly update only failed/uncompiled proof scripts, and preserve every old snapshot. No foreign local object was imported. This is not a claim that all modules were recompiled on each continuation.','inherited_assumption_names':audit['inherited_assumption_names'],'evidence_files':[{'path':str(f.relative_to(P)),'sha256':sha(f)}for f in sorted(E.rglob('*'))if f.is_file()]}
(P/'full-status.json').write_text(json.dumps(full,indent=2)+'\n')
manifest={'schema':2,'kernel':'qs8-qc8w-gemm-minmax-fp32','verification_basis':'source-reviewed-intrinsic-spec','files':[{'path':f,'sha256':sha(T/f)}for f in sorted(selected)],'modules':dep['modules'],'parallel_jobs':32,'intrinsic_ledger':'intrinsic-review.json','source_identity':'source-identity.json'};(P/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
status={'schema':2,'kernel':'qs8-qc8w-gemm-minmax-fp32','scope':'full','status':'proved','passed':True,'whole_kernel_verified':True,'whole_kernel_proved':True,'c_shim_equivalence_checked':True,'checked_c_call_closure':True,'call_closure_basis':'Complete actual kernels, loops, memory, ordinary helper and caller under source-reviewed intrinsic specifications','final_checker_modules_checked':True,'kernel_contracts_match_spec':True,'verification_basis':'source-reviewed-intrinsic-spec','implementation_variant':'RVV-ARM-NaN-priority-repaired; NEON-source-unchanged','original_kernel_tokens_preserved':False,'original_NEON_preserved':True,'current_impl_tokens_preserved':True,'verification_scope':'C-shim modular partial correctness and exact int8 output equivalence; MR1/NR8, cn_stride8; arbitrary positive uint64 N/K within explicit capacities and padded8 reads; all binary32 parameter patterns','checked_c_units':4,'checked_c_vcs':1531,'checked_strategy_fields':16,'freshly_compiled_local_modules':audit['fresh_local_modules'],'assumption_reports':audit['assumption_reports'],'parallel_jobs':32,'inherited_assumption_names':audit['inherited_assumption_names'],'new_project_axioms':False,'intrinsic_spec_entries':52,'intrinsic_raw_entries':53,'intrinsic_ISA_correspondence_checked':False,'human_semantic_review':'pending','spec_sha256':sha(T/'spec.c'),'manifest_sha256':sha(P/'manifest.json'),'full_evidence':'full-status.json','full_evidence_sha256':sha(P/'full-status.json'),'immutable_full_archive':'evidence/full-run/','recursive_coqchk':True,'isa_refinement':False,'physical_ABI_refinement':False,'termination_proved':False,'arbitrary_VLEN':False,'configured_VLEN_bits':128,'physical_VLMAX':8,'modeled_prefix_slots':8,'native_cases':native['cases'],'native_output_cells':native['output_cells'],'limits':'README.zh-CN.md, spec.c and intrinsic-review.json; AArch64 DN0/FZ0/AH0/RNE; RVV128/e32m2/e16m1/e8mf2; QCP integer-address memory model'};(P/'status.json').write_text(json.dumps(status,ensure_ascii=False,indent=2)+'\n');print({k:status[k]for k in ['passed','whole_kernel_verified','freshly_compiled_local_modules','checked_c_vcs','assumption_reports','parallel_jobs']})
