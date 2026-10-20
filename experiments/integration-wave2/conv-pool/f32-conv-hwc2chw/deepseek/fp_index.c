#include "fp_primitives.h"
/*@ \wp::strategy CiMemorySolve: \prover("cvc5",5),\prover("z3",5);
 \wp::strategy CiMemoryUnfold:
  \tactic("Wp.unfold",\ingoal(shiftfield_F20_lane(P)),\children(CiMemoryUnfold)),
  \tactic("Wp.unfold",\ingoal(shiftfield_F21_lane(P)),\children(CiMemoryUnfold)),
  \tactic("Wp.unfold",\ingoal(shift_uint32(P,I)),\children(CiMemoryUnfold)),
  \tactic("Wp.unfold",\ingoal(shift_sint32(P,I)),\children(CiMemoryUnfold)),
  \tactic("Wp.unfold",\ingoal(shift_uint8(P,I)),\children(CiMemoryUnfold)),
  \tactic("Wp.unfold",\ingoal(shift_sint8(P,I)),\children(CiMemoryUnfold)),CiMemorySolve;
*/
/*@ lemma core_u32_bytes{L}: \forall uint32_t *p;
 \valid_read(p) ==> *p==((unsigned char*)p)[0]+256*((unsigned char*)p)[1]+65536*((unsigned char*)p)[2]+16777216*((unsigned char*)p)[3]; */
/*@ lemma ci_cast_roundtrip: \forall integer x;0<=x<=4294967295 ==> (uint32_t)(int32_t)x==x;
    lemma ci_unsigned_view{L}: \forall uint32_t *p;\valid_read(p) ==> *(int32_t*)p==(int32_t)*p;
*/

/*@ lemma core_equal_u32_bytes{L}: \forall uint32_t *p,*q;
 \valid_read(p) && \valid_read(q) && (\forall integer b;0<=b<4 ==> ((unsigned char*)p)[b]==((unsigned char*)q)[b]) ==> *p==*q; */

/*@ lemma core_u32_byte_offset{L}: \forall uint32_t *p; \forall integer i,b;
 0<=i && 0<=b<4 && \valid_read(p+i) ==> ((unsigned char*)(p+i))[b]==((unsigned char*)p)[4*i+b]; */

/*@
 \wp::strategy CoreOffsetSolve: \prover("cvc5",5),\prover("z3",5);
 \wp::strategy CoreOffsetUnfold:
  \tactic("Wp.unfold",\ingoal(shift_uint32(P,I)),\children(CoreOffsetUnfold)),
  \tactic("Wp.unfold",\ingoal(shift_uint8(P,I)),\children(CoreOffsetUnfold)),CoreOffsetSolve;
 \wp::proof CoreOffsetUnfold:core_u32_byte_offset;
*/


/*@ lemma ci_u32_add_cast: \forall integer a,b; (uint32_t)((uint32_t)a+(uint32_t)b)==(uint32_t)(a+b);
 lemma ci_u32_sub_cast: \forall integer a,b; (uint32_t)((uint32_t)a-(uint32_t)b)==(uint32_t)(a-b); */
/*@ requires vl<=4; assigns \nothing; ensures \forall integer j;0<=j<vl ==> \result.lane[j]==j; */
vuint32m1_t __riscv_vid_v_u32m1(size_t vl) { vuint32m1_t r={{0}};/*@ loop invariant 0<=i<=vl; loop invariant \forall integer j;0<=j<i ==> r.lane[j]==j; loop assigns i,r; loop variant vl-i; */
for(size_t i=0;i<vl;i++)r.lane[i]=i;return r; }

/*@ requires vl<=4; assigns \nothing; ensures \forall integer j;0<=j<vl ==> \result.lane[j]==((uint32_t)(a.lane[j]+x)); */
vuint32m1_t __riscv_vadd_vx_u32m1(vuint32m1_t a,uint32_t x,size_t vl) { /*@ loop invariant 0<=i<=vl; loop invariant \forall integer j;0<=j<i ==> a.lane[j]==((uint32_t)(\at(a.lane[j],Pre)+x)); loop invariant \forall integer j;i<=j<vl ==> a.lane[j]==\at(a.lane[j],Pre); loop assigns i,a; loop variant vl-i; */
for(size_t i=0;i<vl;i++)a.lane[i]+=x;return a; }

/*@ requires vl<=4; assigns \nothing; ensures \forall integer j;0<=j<vl ==> \result.lane[j]==((uint32_t)(a.lane[j]*x)); */
vuint32m1_t __riscv_vmul_vx_u32m1(vuint32m1_t a,uint32_t x,size_t vl) { /*@ loop invariant 0<=i<=vl; loop invariant \forall integer j;0<=j<i ==> a.lane[j]==((uint32_t)(\at(a.lane[j],Pre)*x)); loop invariant \forall integer j;i<=j<vl ==> a.lane[j]==\at(a.lane[j],Pre); loop assigns i,a; loop variant vl-i; */
for(size_t i=0;i<vl;i++)a.lane[i]*=x;return a; }

/*@ assigns \nothing; ensures \forall integer j;0<=j<4 ==> \result.lane[j]==((int32_t)(a.lane[j])); */
vint32m1_t __riscv_vreinterpret_v_u32m1_i32m1(vuint32m1_t a) { vint32m1_t r;memcpy(&r,&a,sizeof r); /*@ assert source_bytes_unchanged: \forall integer b;0<=b<16 ==> ((unsigned char*)&a)[b]==\at(((unsigned char*)&a)[b],Pre); */ /*@ assert source_word_0_unchanged: ((uint32_t*)&a)[0]==\at(((uint32_t*)&a)[0],Pre); */ /*@ assert source_word_1_unchanged: ((uint32_t*)&a)[1]==\at(((uint32_t*)&a)[1],Pre); */ /*@ assert source_word_2_unchanged: ((uint32_t*)&a)[2]==\at(((uint32_t*)&a)[2],Pre); */ /*@ assert source_word_3_unchanged: ((uint32_t*)&a)[3]==\at(((uint32_t*)&a)[3],Pre); */ /*@ assert source_words_unchanged: \forall integer j;0<=j<4 ==> ((uint32_t*)&a)[j]==\at(((uint32_t*)&a)[j],Pre); */ /*@ assert copied_bytes_ci_reinterpret: \forall integer b;0<=b<16 ==> ((unsigned char*)&r)[b]==((unsigned char*)&a)[b]; */ /*@ assert copied_four_bytes_0_ci_reinterpret: \forall integer b;0<=b<4 ==> ((unsigned char*)(((uint32_t*)&r)+0))[b]==((unsigned char*)(((uint32_t*)&a)+0))[b]; */ /*@ assert copied_word_0_ci_reinterpret: ((uint32_t*)&r)[0]==((uint32_t*)&a)[0]; */ /*@ assert copied_four_bytes_1_ci_reinterpret: \forall integer b;0<=b<4 ==> ((unsigned char*)(((uint32_t*)&r)+1))[b]==((unsigned char*)(((uint32_t*)&a)+1))[b]; */ /*@ assert copied_word_1_ci_reinterpret: ((uint32_t*)&r)[1]==((uint32_t*)&a)[1]; */ /*@ assert copied_four_bytes_2_ci_reinterpret: \forall integer b;0<=b<4 ==> ((unsigned char*)(((uint32_t*)&r)+2))[b]==((unsigned char*)(((uint32_t*)&a)+2))[b]; */ /*@ assert copied_word_2_ci_reinterpret: ((uint32_t*)&r)[2]==((uint32_t*)&a)[2]; */ /*@ assert copied_four_bytes_3_ci_reinterpret: \forall integer b;0<=b<4 ==> ((unsigned char*)(((uint32_t*)&r)+3))[b]==((unsigned char*)(((uint32_t*)&a)+3))[b]; */ /*@ assert copied_word_3_ci_reinterpret: ((uint32_t*)&r)[3]==((uint32_t*)&a)[3]; */ /*@ assert copied_words_ci_reinterpret: \forall integer j;0<=j<4 ==> ((uint32_t*)&r)[j]==((uint32_t*)&a)[j]; */ /*@ assert source_typed_layout: \forall integer j;0<=j<4 ==> \at(((uint32_t*)&a)[j],Pre)==\at(a.lane[j],Pre); */ /*@ assert destination_typed_layout: \forall integer j;0<=j<4 ==> r.lane[j]==(int32_t)(((uint32_t*)&r)[j]); */ return r; }

/*@ requires vl<=4; assigns \nothing; ensures \forall integer j;0<=j<vl ==> \result.lane[j]==((int32_t)(a.lane[j]+x)); */
vint32m1_t __riscv_vadd_vx_i32m1(vint32m1_t a,int32_t x,size_t vl) { /*@ loop invariant 0<=i<=vl; loop invariant \forall integer j;0<=j<i ==> a.lane[j]==((int32_t)(\at(a.lane[j],Pre)+x)); loop invariant \forall integer j;i<=j<vl ==> a.lane[j]==\at(a.lane[j],Pre); loop assigns i,a; loop variant vl-i; */
for(size_t i=0;i<vl;i++){uint32_t u; /*@ assert ci_source_pre_before: a.lane[i]==\at(a,Pre).lane[i]; */ /*@ assert ci_read_src_valid: \valid_read(&a.lane[i]+(0..3)); */ memcpy(&u,&a.lane[i],4); /*@ assert ci_source_pre_after: a.lane[i]==\at(a,Pre).lane[i]; */  /*@ assert ci_read_bytes: \forall integer b;0<=b<4 ==> ((unsigned char*)&u)[b]==((unsigned char*)&a.lane[i])[b]; */  /*@ assert ci_read_physical: u==*(uint32_t*)&a.lane[i]; */  /*@ assert ci_read_layout: a.lane[i]==(int32_t)(*(uint32_t*)&a.lane[i]); */  /*@ assert ci_read_bits: u==(uint32_t)\at(a,Pre).lane[i]; */ u+=(uint32_t)x; /*@ assert ci_updated_bits: u==(uint32_t)(\at(a,Pre).lane[i]+x); */  /*@ assert ci_write_separated: \forall integer j;i<j<vl ==> \separated(&a.lane[i],&a.lane[j]); */ /*@ assert ci_write_dst_valid: \valid(&a.lane[i]+(0..3)); */ memcpy(&a.lane[i],&u,4); /*@ assert ci_write_bytes: \forall integer b;0<=b<4 ==> ((unsigned char*)&a.lane[i])[b]==((unsigned char*)&u)[b]; */  /*@ assert ci_write_physical: *(uint32_t*)&a.lane[i]==u; */  /*@ assert ci_write_layout: a.lane[i]==(int32_t)(*(uint32_t*)&a.lane[i]); */  /*@ assert ci_written_bits: a.lane[i]==(int32_t)(\at(a,Pre).lane[i]+x); */  /*@ assert ci_future_unchanged: \forall integer j;i<j<vl ==> a.lane[j]==\at(a,Pre).lane[j]; */ }return a; }

/*@ requires vl<=4; assigns \nothing; ensures \forall integer j;0<=j<vl ==> \result.lane[j]==((int32_t)(a.lane[j]-x)); */
vint32m1_t __riscv_vsub_vx_i32m1(vint32m1_t a,int32_t x,size_t vl) { /*@ loop invariant 0<=i<=vl; loop invariant \forall integer j;0<=j<i ==> a.lane[j]==((int32_t)(\at(a.lane[j],Pre)-x)); loop invariant \forall integer j;i<=j<vl ==> a.lane[j]==\at(a.lane[j],Pre); loop assigns i,a; loop variant vl-i; */
for(size_t i=0;i<vl;i++){uint32_t u; /*@ assert ci_source_pre_before: a.lane[i]==\at(a,Pre).lane[i]; */ /*@ assert ci_read_src_valid: \valid_read(&a.lane[i]+(0..3)); */ memcpy(&u,&a.lane[i],4); /*@ assert ci_source_pre_after: a.lane[i]==\at(a,Pre).lane[i]; */  /*@ assert ci_read_bytes: \forall integer b;0<=b<4 ==> ((unsigned char*)&u)[b]==((unsigned char*)&a.lane[i])[b]; */  /*@ assert ci_read_physical: u==*(uint32_t*)&a.lane[i]; */  /*@ assert ci_read_layout: a.lane[i]==(int32_t)(*(uint32_t*)&a.lane[i]); */  /*@ assert ci_read_bits: u==(uint32_t)\at(a,Pre).lane[i]; */ u-=(uint32_t)x; /*@ assert ci_updated_machine: u==(uint32_t)((uint32_t)\at(a,Pre).lane[i]-(uint32_t)x); */
 /*@ assert ci_updated_cast_bridge: (uint32_t)((uint32_t)\at(a,Pre).lane[i]-(uint32_t)x)==(uint32_t)(\at(a,Pre).lane[i]-x); */  /*@ assert ci_updated_bits: u==(uint32_t)(\at(a,Pre).lane[i]-x); */  /*@ assert ci_write_separated: \forall integer j;i<j<vl ==> \separated(&a.lane[i],&a.lane[j]); */ /*@ assert ci_write_dst_valid: \valid(&a.lane[i]+(0..3)); */ memcpy(&a.lane[i],&u,4); /*@ assert ci_write_bytes: \forall integer b;0<=b<4 ==> ((unsigned char*)&a.lane[i])[b]==((unsigned char*)&u)[b]; */  /*@ assert ci_write_physical: *(uint32_t*)&a.lane[i]==u; */  /*@ assert ci_write_layout: a.lane[i]==(int32_t)(*(uint32_t*)&a.lane[i]); */  /*@ assert ci_written_bits: a.lane[i]==(int32_t)(\at(a,Pre).lane[i]-x); */  /*@ assert ci_future_unchanged: \forall integer j;i<j<vl ==> a.lane[j]==\at(a,Pre).lane[j]; */ }return a; }

/*@ requires vl<=4; assigns \nothing; ensures \forall integer j;0<=j<vl ==> \result.lane[j]==(a.lane[j]>=x?1:0); */
vbool32_t __riscv_vmsge_vx_i32m1_b32(vint32m1_t a,int32_t x,size_t vl) { vbool32_t r={{0}};/*@ loop invariant 0<=i<=vl; loop invariant \forall integer j;0<=j<i ==> r.lane[j]==(a.lane[j]>=x?1:0); loop assigns i,r; loop variant vl-i; */
for(size_t i=0;i<vl;i++)r.lane[i]=a.lane[i]>=x;return r; }

/*@ requires vl<=4; assigns \nothing; ensures \forall integer j;0<=j<vl ==> \result.lane[j]==(a.lane[j]<x?1:0); */
vbool32_t __riscv_vmslt_vx_i32m1_b32(vint32m1_t a,int32_t x,size_t vl) { vbool32_t r={{0}};/*@ loop invariant 0<=i<=vl; loop invariant \forall integer j;0<=j<i ==> r.lane[j]==(a.lane[j]<x?1:0); loop assigns i,r; loop variant vl-i; */
for(size_t i=0;i<vl;i++)r.lane[i]=a.lane[i]<x;return r; }

/*@ requires vl<=4; assigns \nothing; ensures \forall integer j;0<=j<vl ==> \result.lane[j]==((a.lane[j]!=0 && b.lane[j]!=0)?1:0); */
vbool32_t __riscv_vmand_mm_b32(vbool32_t a,vbool32_t b,size_t vl) { /*@ loop invariant 0<=i<=vl; loop invariant \forall integer j;0<=j<i ==> a.lane[j]==((\at(a.lane[j],Pre)!=0 && b.lane[j]!=0)?1:0); loop invariant \forall integer j;i<=j<vl ==> a.lane[j]==\at(a.lane[j],Pre); loop assigns i,a; loop variant vl-i; */
for(size_t i=0;i<vl;i++)a.lane[i]=a.lane[i]&&b.lane[i];return a; }

/*@ requires vl<=4; requires stride>=0 && stride%sizeof(float)==0; requires (vl>0) ==> 0*stride<=SIZE_MAX && \valid_read(p+0*(stride/sizeof(float))); requires (vl>1) ==> 1*stride<=SIZE_MAX && \valid_read(p+1*(stride/sizeof(float))); requires (vl>2) ==> 2*stride<=SIZE_MAX && \valid_read(p+2*(stride/sizeof(float))); requires (vl>3) ==> 3*stride<=SIZE_MAX && \valid_read(p+3*(stride/sizeof(float))); assigns \nothing; ensures \forall integer j;0<=j<vl ==> ext_same(\result.lane[j],\at(p[j*(stride/sizeof(float))],Pre)); */
vfloat32m1_t __riscv_vlse32_v_f32m1(const float *p,ptrdiff_t stride,size_t vl) { vfloat32m1_t r={{0}};/*@ loop invariant 0<=i<=vl; loop invariant \forall integer j;0<=j<i ==> ext_same(r.lane[j],\at(p[j*(stride/sizeof(float))],Pre)); loop assigns i,r; loop variant vl-i; */
for(size_t i=0;i<vl;i++)/*@ assert ci_stride_lane: i==0 || i==1 || i==2 || i==3; */ /*@ assert ci_stride_nonnegative: i*stride>=0; */ /*@ assert ci_stride_no_wrap: i*stride<=SIZE_MAX; */
/*@ assert ci_stride_quotient: i*stride==4*(i*(stride/4)); */
/*@ assert ci_stride_cast: (size_t)(i*stride)==i*stride; */
/*@ assert ci_stride_typed_valid: \valid_read(p+i*(stride/4)); */
/*@ assert ci_stride_pointer: (float*)((char*)p+i*stride)==p+i*(stride/4); */
r.lane[i]=*(const float*)((const char*)p+i*stride);return r; }

/*@ requires vl<=4; requires stride>=0 && stride%sizeof(float)==0; requires (vl>0 && mask.lane[0]!=0) ==> 0*stride<=SIZE_MAX && \valid_read(p+0*(stride/sizeof(float))); requires (vl>1 && mask.lane[1]!=0) ==> 1*stride<=SIZE_MAX && \valid_read(p+1*(stride/sizeof(float))); requires (vl>2 && mask.lane[2]!=0) ==> 2*stride<=SIZE_MAX && \valid_read(p+2*(stride/sizeof(float))); requires (vl>3 && mask.lane[3]!=0) ==> 3*stride<=SIZE_MAX && \valid_read(p+3*(stride/sizeof(float))); assigns \nothing; ensures \forall integer j;0<=j<vl ==> ext_same(\result.lane[j],(mask.lane[j]?\at(p[j*(stride/sizeof(float))],Pre):0.0f)); */
vfloat32m1_t __riscv_vlse32_v_f32m1_m(vbool32_t mask,const float *p,ptrdiff_t stride,size_t vl) { vfloat32m1_t r={{0}};/*@ loop invariant 0<=i<=vl; loop invariant \forall integer j;0<=j<i ==> ext_same(r.lane[j],(mask.lane[j]?\at(p[j*(stride/sizeof(float))],Pre):0.0f)); loop invariant \forall integer j;i<=j<vl ==> ext_same(r.lane[j],0.0f); loop assigns i,r; loop variant vl-i; */
for(size_t i=0;i<vl;i++)/*@ assert ci_mask_zero: mask.lane[i]==0 ==> ext_same(r.lane[i],0.0f); */
/*@ assert ci_mask_input: \forall integer j;j==i && mask.lane[j]!=0 ==> ext_same(p[j*(stride/4)],\at(p[j*(stride/4)],Pre)); */
if(mask.lane[i])/*@ assert ci_stride_lane: i==0 || i==1 || i==2 || i==3; */ /*@ assert ci_stride_nonnegative: i*stride>=0; */ /*@ assert ci_stride_no_wrap: i*stride<=SIZE_MAX; */
/*@ assert ci_stride_quotient: i*stride==4*(i*(stride/4)); */
/*@ assert ci_stride_cast: (size_t)(i*stride)==i*stride; */
/*@ assert ci_stride_typed_valid: \valid_read(p+i*(stride/4)); */
/*@ assert ci_stride_pointer: (float*)((char*)p+i*stride)==p+i*(stride/4); */
r.lane[i]=*(const float*)((const char*)p+i*stride);return r; }

/*@ \wp::strategy CiSolve: \prover("cvc5",5), \prover("z3",5);
     \wp::strategy CiFilter: \tactic("Wp.filter",\children(CiSolve)), CiSolve;
     \wp::proof CiMemoryUnfold: __riscv_vreinterpret_v_u32m1_i32m1; \wp::proof CiMemoryUnfold: __riscv_vadd_vx_i32m1; \wp::proof CiMemoryUnfold: __riscv_vsub_vx_i32m1; \wp::proof CiFilter: __riscv_vlse32_v_f32m1; \wp::proof CiFilter: __riscv_vlse32_v_f32m1_m;
*/
