"""Deterministic concatenation; no kernel-body extraction/rewrite in proof build."""
from pathlib import Path
import hashlib,json
b=Path(__file__).resolve().parent
shim=(b/'shim.h').read_text()
primitive='''
/* EXPLICIT LIBRARY TCB: a shared pure IEEE primitive up to numerical/NaN
   observation. No body establishes libc fmaf satisfies this specification.
   No matrix specification, no kernel/shim correctness axiom. */
/*@ logic float common_fma(float a,float b,float acc);
    predicate same_value(float a,float b) = a==b || (\\is_NaN(a) && \\is_NaN(b)); */
/*@ assigns errno;
    ensures same_value(\\result,common_fma(a,b,acc)); */
extern float fmaf(float a,float b,float acc);
'''
wrapper='''
/* Complete original reference and repaired target are called below. The
   layout here is contiguous rows, packed NR8 weights; arbitrary positive
   dimensions within normal C allocation limits, all float values allowed.
   No assertion that the inlined source product or all proof goals close. */
/*@ requires 1 <= mr <= 4 && nc>0 && k>0;
    requires nc <= PTRDIFF_MAX/(4*sizeof(float))-8;
    requires k <= PTRDIFF_MAX/(4*sizeof(float))-1;
    requires ((nc+7)/8)*(k+1)*8 <= PTRDIFF_MAX/sizeof(float);
    requires \\valid_read(a+(0..4*k-1));
    requires \\valid_read(w+(0..((nc+7)/8)*(k+1)*8-1));
    requires \\valid(left+(0..4*nc-1)) && \\valid(right+(0..4*nc-1));
    requires \\separated(a+(0..4*k-1),w+(0..((nc+7)/8)*(k+1)*8-1),left+(0..4*nc-1),right+(0..4*nc-1));
    assigns errno,left[0..4*nc-1],right[0..4*nc-1];
    ensures \\forall integer i; 0<=i<mr*nc ==> same_value(left[i],right[i]); */
void equivalent(size_t mr,size_t nc,size_t k,const float *a,const float *w,
                float lo,float hi,float *left,float *right) {
  struct xnn_f32_minmax_params params={{lo,hi}};
  test_neon(mr,nc,k*sizeof(float),a,k*sizeof(float),w,left,nc*sizeof(float),8*sizeof(float),&params);
  test_rvv(mr,nc,k*sizeof(float),a,k*sizeof(float),w,right,nc*sizeof(float),8*sizeof(float),&params);
}
'''
# Insert the primitive declaration before shim functions call fmaf.
at=shim.index('/* Quiet NaN behavior')
shim=shim[:at]+primitive+shim[at:]
parts=[shim,(b/'reference_neon.c').read_text(),(b/'repaired_rvv.c').read_text(),wrapper]
(b/'proof.c').write_text('\n'.join(parts))
prelude='''#include <stddef.h>
#include <stdint.h>
#include <riscv_vector.h>
#define assert(x) ((void)0)
struct xnn_f32_minmax_params { struct { float min,max; } scalar; };
'''
names=['vsetvl_e32m4','vle32_v_f32m4','vfmacc_vf_f32m4','vfmin_vf_f32m4','vfmax_vf_f32m4','vse32_v_f32m4','vmfne_vv_f32m4_b8','vfmv_v_f_f32m4']
prelude+='\n'.join('#define __riscv_'+n+' '+n for n in names)
prelude+='\n#define __riscv_vfmerge_vfm_f32m4(v,x,m,vl) vfmerge_vfm_f32m4(m,v,x,vl)\n'
(b/'.build/rvv_compile.c').write_text(prelude+(b/'repaired_rvv.c').read_text())
target=b.parents[1]/'kernels/target/f32-gemm-minmax.c'
(b/'source-manifest.json').write_text(json.dumps({
 'arcadia_commit':'4a0627dc72d39de8b8e5c1971bcc23b267e2d4ca',
 'proof_is_concatenated_full_sources':True,'proof_model_is_original_kernel_not_schedule_shadow':True,
 'reference_source_unchanged':True,'intrinsic_minmax_semantics_unchanged':True,
 'branch':'feat/shim-c',
 'actual_target':'kernels/target/f32-gemm-minmax.c',
 'actual_target_matches_tested_repair':target.read_bytes()==(b/'repaired_rvv.c').read_bytes(),
 'actual_target_sha256':hashlib.sha256(target.read_bytes()).hexdigest(),
 'admitted_to_verified':False,
 'model_scope':'canonical quiet NaN; no ISA-to-shim/NaN-payload/flags proof',
 'source_sha256':{n:hashlib.sha256((b/n).read_bytes()).hexdigest()for n in ['reference_neon.c','original_rvv.c','repaired_rvv.c','shim.h','proof.c',Path(__file__).name]}},indent=2)+'\n')
