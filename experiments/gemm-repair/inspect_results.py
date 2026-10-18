from pathlib import Path
import ast,hashlib,json,re
b=Path(__file__).resolve().parent
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
for p in b.glob('*.py'):ast.parse(p.read_text(),filename=str(p))
gcc=json.loads((b/'gcc-wp-results.json').read_text())
target=b.parents[1]/'kernels/target/f32-gemm-minmax.c'
source_stable=all(sha(b/n)==h for n,h in gcc['source_sha256'].items())
native=(b/'logs/native.log').read_text()
# Compare the original shim body bytes with the pinned baseline digest.
shim=(b/'shim.h').read_text()
shim=shim.replace('/* Mask capacity follows the corresponding f32m4 data vector. */\ntypedef struct { unsigned char lane[RVV_CAP]; } vbool8_t;\n','')
start=shim.index('static inline vbool8_t __riscv_vmfne')
shim=shim[:start]+shim[shim.rfind('#endif'):]
baseline_sha='75c958c1c04bbd92d28f2405c81a9c49ad558d5ac6359fba08bfd01622a261ff'
result={
 'branch':'feat/shim-c',
 'actual_target_matches_tested_repair':target.read_bytes()==(b/'repaired_rvv.c').read_bytes(),
 'actual_target_sha256':sha(target),
 'arcadia_reference_preserved':sha(b/'reference_neon.c')=='b8f827cb5936e5333a0144d793e541730bf3e33ca538d46d42c92f86b9751c61',
 'arcadia_original_target_preserved':sha(b/'original_rvv.c')=='9ae2f510ae8991e8dc80606edd0fb4595e02d11dcba6ae57974e7b5ef0b2b4b7',
 'old_intrinsic_shim_bodies_unchanged':hashlib.sha256(shim.encode()).hexdigest()==baseline_sha,
 'new_rvv_intrinsics':['vmfne_vv_f32m4_b8','vfmerge_vfm_f32m4','vfmv_v_f_f32m4'],
 'native_cases_passed':2400 if 'repaired_cases_passed=2400' in native else 0,
 'old_counterexample_preserved_and_repair_passed':'reference=7fc00000 old=3f800000 repaired=7fc00000' in native,
 'native_observation':'bitwise output in canonical quiet-NaN C shim; no all-ISA-bit equality claim',
 'native_sanitizers':['address','undefined'],
 'real_rvv_syntax_check_exit':json.loads((b/'logs/rvv-compile-run.json').read_text())['exit'],
 'whole_c_frontend_exit':gcc['frontend']['exit'],
 'whole_c_verification_attempt':{'model':'gcc_x86_64 / Typed+float',
   'direct_full_kernel_sources':True,'schedule_shadow_program':False,
   'wall_timeout':gcc['wp']['wall_timeout'],'seconds':gcc['wp']['seconds'],
   'failure_stage':'whole-AST VC generation/scheduling did not finish before wall budget; no SMT inequivalence judgment',
   'raw_goal_report_available':(b/'logs/full-wp-gcc.json').exists(),
   'raw_proved':None,'raw_total':None,'source_hashes_match_current':source_stable,
   'observation':'forall active outputs: numerical == or both NaN',
   'memory_domain':'contiguous rows and NR8 packing; 4 full allocated rows even when mr<4; arbitrary legal positive dimensions, arbitrary strides not covered'},
 'proof_bridge_gaps':['fmaf common_fma external contract has no checked libc/ISA body bridge',
   'same_value FMA congruence or stronger word relation remains unproved',
   '__builtin_nanf recognized as GCC builtin but no verified NaN postcondition',
   'canonical_nan float/uint32 memcpy byte-memory representation bridge',
   'whole-kernel loop invariants, assigns and pointer/stride memory relations',
   'ISA-to-shim, NaN payload/FPCR/sNaN/FP flags/rounding/FTZ boundaries'],
 'complete_original_c_equivalence_proved':False,'admitted_to_verified':False,
 'source_sha256':{p.name:sha(p)for p in b.iterdir()if p.suffix in ['.c','.h','.py']}}
(b/'summary.json').write_text(json.dumps(result,indent=2)+'\n')
assert source_stable and result['actual_target_matches_tested_repair']
assert result['arcadia_reference_preserved']and result['arcadia_original_target_preserved']
assert result['old_intrinsic_shim_bodies_unchanged']
print(json.dumps({k:v for k,v in result.items()if k!='source_sha256'},indent=2))
