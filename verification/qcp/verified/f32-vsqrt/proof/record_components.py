"""Bind true ordinary typed component closures to current actual-C generation.
Never issues a full case certificate or copies proof objects.
"""
from pathlib import Path
import hashlib,json,re,argparse
H=Path(__file__).resolve().parent;C=H.parent;sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
TARGETS={'store_adapters':'StoreAdaptersChecked.CheckedStoreAdapters','rvv_store':'RvvStoreChecked.CheckedRvvStore','assert_unit':'AssertChecked.CheckedAssert','array_read':'ReadChecked.CheckedRead','bridge':'BridgeChecked.CheckedBridge','comparator':'ComparatorChecked.CheckedComparator','wrapper_unit':'WrapperChecked.CheckedWrapper','neon_unit':'NeonChecked.CheckedNeon','rvv_unit':'RvvChecked.CheckedRvv'}
def main():
 ap=argparse.ArgumentParser();ap.add_argument('--generation',type=Path,required=True);ap.add_argument('--include-rvv',action='store_true');a=ap.parse_args();g=json.loads((a.generation/'status.json').read_text());assert g['passed'];units={u['stem']:u for u in g['units']};assert len(units)==9
 helper_targets=['StoreAdaptersChecked','RvvStoreChecked','AssertChecked','ReadChecked','BridgeChecked','ComparatorChecked','WrapperChecked'];jobs=[('helper-proof',helper_targets,[s for s in units if s not in ['neon_unit','rvv_unit']]),('neon-proof',['NeonChecked'],['neon_unit'])]
 if a.include_rvv:jobs.append(('rvv-proof',['RvvChecked'],['rvv_unit']))
 for label,targets,stems in jobs:
  t='-'.join(targets);p=C/'.build'/('coq-status-'+t+'.json');cl=json.loads(p.read_text());assert cl['passed']and all(r['exit_code']==0 for r in cl['records']);coq=Path(cl['run_directory'])/'coq';proof_sources={}
  for name,d in cl['source_sha256'].items():
   f=H/'coq'/(name+'.v');assert sha(f)==d==sha(coq/f.name);proof_sources[str(f.relative_to(C))]=d
  rows=[]
  for stem in stems:
   u=dict(units[stem]);assert u['passed']and cl['source_sha256'][stem+'_goal']==u['goal_sha256']==sha(H/'coq'/(stem+'_goal.v'));assert sha(Path(u['generation_directory'])/(stem+'.c'))==u['cpp_sha256'];u.update(typed_instance='Sqrt.'+TARGETS[stem],checked_module='Sqrt.'+TARGETS[stem],actual_c_vcs=u['generated_c_vcs']);rows.append(u)
  inputs={str(p.relative_to(C)):sha(p)for p in [C/'spec.c',H/'originals.json',H/'full_inputs.py',H/'generate_kernel.py',H/'generate_public.py',*sorted((C/'impl').glob('*.c')),*sorted((C/'shim').glob('*.h')),*sorted((C/'shim').glob('*.c')),*sorted((H/'c').glob('*.strategies')),*sorted((H/'c').glob('*.annotations.json'))]}
  s=dict(passed=True,vc_correct_passed=True,whole_kernel_verified=False,scope='actual_C_component_only_under_explicit_intrinsic_specs_not_full_case',run_directory=cl['run_directory'],generation_run_directory=str(a.generation),units=rows,records=cl['records'],proof_source_sha256=proof_sources,input_sha256=inputs,component_ordinary_modules=cl['compiled_modules'],compiler_dependency_boundary='local source fresh ordinary Coq; BASE/tool objects reused for component only; whole gate must fresh rebuild them')
  if len(rows)==1:s.update(goal_sha256=rows[0]['goal_sha256'],checked_c_vcs=rows[0]['actual_c_vcs'],checked_module=rows[0]['typed_instance'])
  (H/(label+'-status.json')).write_text(json.dumps(s,indent=2)+'\n');print(label,'passed',sum(u['actual_c_vcs']for u in rows),flush=True)
if __name__=='__main__':main()
