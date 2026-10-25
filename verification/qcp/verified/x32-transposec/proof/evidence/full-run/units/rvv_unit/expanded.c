typedef unsigned long long size_t;
typedef unsigned long long uintptr_t;
typedef unsigned int uint32_t;
typedef long long int64_t;
/*@ Import Coq Require Import X32Transpose.VectorModel */
typedef struct uint32x2_t { uint32_t s0; uint32_t s1; } uint32x2_t;
typedef struct uint32x2x2_t { uint32x2_t val[2]; } uint32x2x2_t;
typedef struct vuint32m8_t {uint32_t s0; uint32_t s1; uint32_t s2; uint32_t s3; uint32_t s4; uint32_t s5; uint32_t s6; uint32_t s7; uint32_t s8; uint32_t s9; uint32_t s10; uint32_t s11; uint32_t s12; uint32_t s13; uint32_t s14; uint32_t s15; uint32_t s16; uint32_t s17; uint32_t s18; uint32_t s19; uint32_t s20; uint32_t s21; uint32_t s22; uint32_t s23; uint32_t s24; uint32_t s25; uint32_t s26; uint32_t s27; uint32_t s28; uint32_t s29; uint32_t s30; uint32_t s31; } vuint32m8_t;
/*@ Import Coq Require Import X32Transpose.ProgramModel */
/*@ Extern Coq (XTMap :: *) (XTOutput :: *) (XTLayout :: *) */
/*@ Extern Coq (unsigned_last_nbits:Z->Z->Z) */
/*@ Extern Coq (xt_valid:XTMap->list Z->XTLayout->Prop) (xt_data:XTMap->Assertion) (xt_output:list Z->XTOutput->Assertion) (xt_result:XTMap->XTLayout->XTOutput->XTOutput->Prop) (xt_progress:XTMap->XTLayout->XTOutput->XTOutput->Z->Z->Z->Prop) */
/*@ Extern Coq (xt_input:XTLayout->Z) (xt_output_base:XTLayout->Z) (xt_input_stride:XTLayout->Z) (xt_output_stride:XTLayout->Z) (xt_width:XTLayout->Z) (xt_height:XTLayout->Z) (xt_total:XTLayout->Z) (xt_current_input:XTLayout->Z->Z->Z) (xt_current_output:XTLayout->Z->Z->Z) */
void xt_assert(int ok) /*@ Require ok!=0 && emp Ensure emp */;
/*@ Import Coq Require Import X32Transpose.StrideModel */
/*@ Extern Coq (XTOutput :: *) */
/*@ Extern Coq (xt_output:list Z->XTOutput->Assertion) (xt_stride_valid:list Z->Z->Z->Z->Prop) (xt_stride_distinct:Z->Z->Z->Prop) (xt_strided_write:XTOutput->Z->Z->Z->list Z->XTOutput) (xt_vec32:Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->list Z) */
void xt_intrinsic_vsse32(uint32_t*p,size_t stride,const vuint32m8_t*v,size_t vl)
/*@ With (W:list Z) (O:XTOutput) (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z) (a16:Z) (a17:Z) (a18:Z) (a19:Z) (a20:Z) (a21:Z) (a22:Z) (a23:Z) (a24:Z) (a25:Z) (a26:Z) (a27:Z) (a28:Z) (a29:Z) (a30:Z) (a31:Z)
 Require xt_stride_valid(W,p,stride,vl) && xt_stride_distinct(p,stride,vl) && xt_output(W,O) * store(&(v->s0),unsigned int,a0) * store(&(v->s1),unsigned int,a1) * store(&(v->s2),unsigned int,a2) * store(&(v->s3),unsigned int,a3) * store(&(v->s4),unsigned int,a4) * store(&(v->s5),unsigned int,a5) * store(&(v->s6),unsigned int,a6) * store(&(v->s7),unsigned int,a7) * store(&(v->s8),unsigned int,a8) * store(&(v->s9),unsigned int,a9) * store(&(v->s10),unsigned int,a10) * store(&(v->s11),unsigned int,a11) * store(&(v->s12),unsigned int,a12) * store(&(v->s13),unsigned int,a13) * store(&(v->s14),unsigned int,a14) * store(&(v->s15),unsigned int,a15) * store(&(v->s16),unsigned int,a16) * store(&(v->s17),unsigned int,a17) * store(&(v->s18),unsigned int,a18) * store(&(v->s19),unsigned int,a19) * store(&(v->s20),unsigned int,a20) * store(&(v->s21),unsigned int,a21) * store(&(v->s22),unsigned int,a22) * store(&(v->s23),unsigned int,a23) * store(&(v->s24),unsigned int,a24) * store(&(v->s25),unsigned int,a25) * store(&(v->s26),unsigned int,a26) * store(&(v->s27),unsigned int,a27) * store(&(v->s28),unsigned int,a28) * store(&(v->s29),unsigned int,a29) * store(&(v->s30),unsigned int,a30) * store(&(v->s31),unsigned int,a31)
 Ensure xt_output(W,xt_strided_write(O,p,stride,vl,xt_vec32(a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,a16,a17,a18,a19,a20,a21,a22,a23,a24,a25,a26,a27,a28,a29,a30,a31))) * store(&(v->s0),unsigned int,a0) * store(&(v->s1),unsigned int,a1) * store(&(v->s2),unsigned int,a2) * store(&(v->s3),unsigned int,a3) * store(&(v->s4),unsigned int,a4) * store(&(v->s5),unsigned int,a5) * store(&(v->s6),unsigned int,a6) * store(&(v->s7),unsigned int,a7) * store(&(v->s8),unsigned int,a8) * store(&(v->s9),unsigned int,a9) * store(&(v->s10),unsigned int,a10) * store(&(v->s11),unsigned int,a11) * store(&(v->s12),unsigned int,a12) * store(&(v->s13),unsigned int,a13) * store(&(v->s14),unsigned int,a14) * store(&(v->s15),unsigned int,a15) * store(&(v->s16),unsigned int,a16) * store(&(v->s17),unsigned int,a17) * store(&(v->s18),unsigned int,a18) * store(&(v->s19),unsigned int,a19) * store(&(v->s20),unsigned int,a20) * store(&(v->s21),unsigned int,a21) * store(&(v->s22),unsigned int,a22) * store(&(v->s23),unsigned int,a23) * store(&(v->s24),unsigned int,a24) * store(&(v->s25),unsigned int,a25) * store(&(v->s26),unsigned int,a26) * store(&(v->s27),unsigned int,a27) * store(&(v->s28),unsigned int,a28) * store(&(v->s29),unsigned int,a29) * store(&(v->s30),unsigned int,a30) * store(&(v->s31),unsigned int,a31) */;
/*@ Import Coq Require Import X32Transpose.ProgramModel */
/*@ Extern Coq (XTMap :: *) */
/*@ Extern Coq (xt_data:XTMap->Assertion) (xt_window:XTMap->Z->Z->Prop) (xt_legal_vl:Z->Z->Prop) (xt_rvv_lane:XTMap->Z->Z->Z->Z->Prop) */
size_t __riscv_vsetvl_e32m8(size_t avl)
/*@ Require emp Ensure xt_legal_vl(avl,__return) && emp */;
vuint32m8_t __riscv_vle32_v_u32m8(const uint32_t*p,size_t vl)
/*@ With(F:XTMap)
 Require 0<=vl && vl<=32 && xt_window(F,p,vl) && xt_data(F)
 Ensure exists (x0:Z)(x1:Z)(x2:Z)(x3:Z)(x4:Z)(x5:Z)(x6:Z)(x7:Z)(x8:Z)(x9:Z)(x10:Z)(x11:Z)(x12:Z)(x13:Z)(x14:Z)(x15:Z)(x16:Z)(x17:Z)(x18:Z)(x19:Z)(x20:Z)(x21:Z)(x22:Z)(x23:Z)(x24:Z)(x25:Z)(x26:Z)(x27:Z)(x28:Z)(x29:Z)(x30:Z)(x31:Z), xt_rvv_lane(F,p,vl,0,x0) && xt_rvv_lane(F,p,vl,1,x1) && xt_rvv_lane(F,p,vl,2,x2) && xt_rvv_lane(F,p,vl,3,x3) && xt_rvv_lane(F,p,vl,4,x4) && xt_rvv_lane(F,p,vl,5,x5) && xt_rvv_lane(F,p,vl,6,x6) && xt_rvv_lane(F,p,vl,7,x7) && xt_rvv_lane(F,p,vl,8,x8) && xt_rvv_lane(F,p,vl,9,x9) && xt_rvv_lane(F,p,vl,10,x10) && xt_rvv_lane(F,p,vl,11,x11) && xt_rvv_lane(F,p,vl,12,x12) && xt_rvv_lane(F,p,vl,13,x13) && xt_rvv_lane(F,p,vl,14,x14) && xt_rvv_lane(F,p,vl,15,x15) && xt_rvv_lane(F,p,vl,16,x16) && xt_rvv_lane(F,p,vl,17,x17) && xt_rvv_lane(F,p,vl,18,x18) && xt_rvv_lane(F,p,vl,19,x19) && xt_rvv_lane(F,p,vl,20,x20) && xt_rvv_lane(F,p,vl,21,x21) && xt_rvv_lane(F,p,vl,22,x22) && xt_rvv_lane(F,p,vl,23,x23) && xt_rvv_lane(F,p,vl,24,x24) && xt_rvv_lane(F,p,vl,25,x25) && xt_rvv_lane(F,p,vl,26,x26) && xt_rvv_lane(F,p,vl,27,x27) && xt_rvv_lane(F,p,vl,28,x28) && xt_rvv_lane(F,p,vl,29,x29) && xt_rvv_lane(F,p,vl,30,x30) && xt_rvv_lane(F,p,vl,31,x31) && xt_data(F) * store(&(__return.s0),unsigned int,x0) * store(&(__return.s1),unsigned int,x1) * store(&(__return.s2),unsigned int,x2) * store(&(__return.s3),unsigned int,x3) * store(&(__return.s4),unsigned int,x4) * store(&(__return.s5),unsigned int,x5) * store(&(__return.s6),unsigned int,x6) * store(&(__return.s7),unsigned int,x7) * store(&(__return.s8),unsigned int,x8) * store(&(__return.s9),unsigned int,x9) * store(&(__return.s10),unsigned int,x10) * store(&(__return.s11),unsigned int,x11) * store(&(__return.s12),unsigned int,x12) * store(&(__return.s13),unsigned int,x13) * store(&(__return.s14),unsigned int,x14) * store(&(__return.s15),unsigned int,x15) * store(&(__return.s16),unsigned int,x16) * store(&(__return.s17),unsigned int,x17) * store(&(__return.s18),unsigned int,x18) * store(&(__return.s19),unsigned int,x19) * store(&(__return.s20),unsigned int,x20) * store(&(__return.s21),unsigned int,x21) * store(&(__return.s22),unsigned int,x22) * store(&(__return.s23),unsigned int,x23) * store(&(__return.s24),unsigned int,x24) * store(&(__return.s25),unsigned int,x25) * store(&(__return.s26),unsigned int,x26) * store(&(__return.s27),unsigned int,x27) * store(&(__return.s28),unsigned int,x28) * store(&(__return.s29),unsigned int,x29) * store(&(__return.s30),unsigned int,x30) * store(&(__return.s31),unsigned int,x31) */;
void xt_store_strided(uint32_t*p,size_t stride,const vuint32m8_t*v,size_t vl)
/*@ With (W:list Z) (O:XTOutput) (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z) (a16:Z) (a17:Z) (a18:Z) (a19:Z) (a20:Z) (a21:Z) (a22:Z) (a23:Z) (a24:Z) (a25:Z) (a26:Z) (a27:Z) (a28:Z) (a29:Z) (a30:Z) (a31:Z)
 Require xt_stride_valid(W,p,stride,vl) && xt_stride_distinct(p,stride,vl) && xt_output(W,O) * store(&(v->s0),unsigned int,a0) * store(&(v->s1),unsigned int,a1) * store(&(v->s2),unsigned int,a2) * store(&(v->s3),unsigned int,a3) * store(&(v->s4),unsigned int,a4) * store(&(v->s5),unsigned int,a5) * store(&(v->s6),unsigned int,a6) * store(&(v->s7),unsigned int,a7) * store(&(v->s8),unsigned int,a8) * store(&(v->s9),unsigned int,a9) * store(&(v->s10),unsigned int,a10) * store(&(v->s11),unsigned int,a11) * store(&(v->s12),unsigned int,a12) * store(&(v->s13),unsigned int,a13) * store(&(v->s14),unsigned int,a14) * store(&(v->s15),unsigned int,a15) * store(&(v->s16),unsigned int,a16) * store(&(v->s17),unsigned int,a17) * store(&(v->s18),unsigned int,a18) * store(&(v->s19),unsigned int,a19) * store(&(v->s20),unsigned int,a20) * store(&(v->s21),unsigned int,a21) * store(&(v->s22),unsigned int,a22) * store(&(v->s23),unsigned int,a23) * store(&(v->s24),unsigned int,a24) * store(&(v->s25),unsigned int,a25) * store(&(v->s26),unsigned int,a26) * store(&(v->s27),unsigned int,a27) * store(&(v->s28),unsigned int,a28) * store(&(v->s29),unsigned int,a29) * store(&(v->s30),unsigned int,a30) * store(&(v->s31),unsigned int,a31)
 Ensure xt_output(W,xt_strided_write(O,p,stride,vl,xt_vec32(a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,a16,a17,a18,a19,a20,a21,a22,a23,a24,a25,a26,a27,a28,a29,a30,a31))) * store(&(v->s0),unsigned int,a0) * store(&(v->s1),unsigned int,a1) * store(&(v->s2),unsigned int,a2) * store(&(v->s3),unsigned int,a3) * store(&(v->s4),unsigned int,a4) * store(&(v->s5),unsigned int,a5) * store(&(v->s6),unsigned int,a6) * store(&(v->s7),unsigned int,a7) * store(&(v->s8),unsigned int,a8) * store(&(v->s9),unsigned int,a9) * store(&(v->s10),unsigned int,a10) * store(&(v->s11),unsigned int,a11) * store(&(v->s12),unsigned int,a12) * store(&(v->s13),unsigned int,a13) * store(&(v->s14),unsigned int,a14) * store(&(v->s15),unsigned int,a15) * store(&(v->s16),unsigned int,a16) * store(&(v->s17),unsigned int,a17) * store(&(v->s18),unsigned int,a18) * store(&(v->s19),unsigned int,a19) * store(&(v->s20),unsigned int,a20) * store(&(v->s21),unsigned int,a21) * store(&(v->s22),unsigned int,a22) * store(&(v->s23),unsigned int,a23) * store(&(v->s24),unsigned int,a24) * store(&(v->s25),unsigned int,a25) * store(&(v->s26),unsigned int,a26) * store(&(v->s27),unsigned int,a27) * store(&(v->s28),unsigned int,a28) * store(&(v->s29),unsigned int,a29) * store(&(v->s30),unsigned int,a30) * store(&(v->s31),unsigned int,a31) */;
void test_rvv(
    const uint32_t* input,
    uint32_t* output,
    size_t input_stride,
    size_t output_stride,
    size_t block_width,
    size_t block_height)
/*@ With(F:XTMap)(W:list Z)(old:XTOutput)(G:XTLayout) Require xt_valid(F,W,G) && input==xt_input(G) && output==xt_output_base(G) && input_stride==xt_input_stride(G) && output_stride==xt_output_stride(G) && block_width==xt_width(G) && block_height==xt_height(G) && xt_data(F) * xt_output(W,old) Ensure exists(R:XTOutput), xt_result(F,G,old,R) && xt_data(F) * xt_output(W,R) */
{
/*@ Assert xt_valid(F,W,G) && input==xt_input(G) && output==xt_output_base(G) && input_stride==xt_input_stride(G) && output_stride==xt_output_stride(G) && block_width==xt_width(G) && block_height==xt_height(G) && xt_data(F) * xt_output(W,old) && sizeof(uint32_t)==4 && sizeof(size_t)==8 && sizeof(uintptr_t)==8 && (block_width==1 || output_stride>=unsigned_last_nbits(block_height*4,64)) && (block_height==1 || input_stride>=unsigned_last_nbits(block_width*4,64)) */
  xt_assert(block_width == 1 || output_stride >= block_height * sizeof(uint32_t));
  xt_assert(block_height == 1 || input_stride >= block_width * sizeof(uint32_t));
  size_t bw = block_width;
  /* The NEON do-loop executes one tile even when block_width is zero.
   * Its o1=o0 alias leaves column zero as the final output. */
  if (bw == 0) {
    bw = 1;
  }
  /* Empty-height source calls touch no memory and may use null pointers. */
  if (block_height == 0) {
    bw = 0;
  }
/*@ Inv Assert exists(R:XTOutput), xt_valid(F,W,G) && input_stride==xt_input_stride(G) && output_stride==xt_output_stride(G) && block_width==xt_width(G) && block_height==xt_height(G) && sizeof(uint32_t)==4 && sizeof(size_t)==8 && sizeof(uintptr_t)==8 && 0<=bw && bw<=xt_total(G) && input==xt_current_input(G,(xt_total(G)-bw),0) && output==xt_current_output(G,(xt_total(G)-bw),0) && xt_progress(F,G,old,R,(xt_total(G)-bw),0,0) && xt_data(F) * xt_output(W,R) */
  while (bw > 0) {
    size_t vl = __riscv_vsetvl_e32m8(bw);
/*@ Assert exists(R:XTOutput), xt_valid(F,W,G) && input_stride==xt_input_stride(G) && output_stride==xt_output_stride(G) && block_width==xt_width(G) && block_height==xt_height(G) && sizeof(uint32_t)==4 && sizeof(size_t)==8 && sizeof(uintptr_t)==8 && 0<=bw && bw<=xt_total(G) && input==xt_current_input(G,(xt_total(G)-bw),0) && output==xt_current_output(G,(xt_total(G)-bw),0) && xt_progress(F,G,old,R,(xt_total(G)-bw),0,0) && xt_data(F) * xt_output(W,R) && 0<bw && xt_legal_vl(bw,vl) && 0<vl && vl<=32 && vl<=bw */
    const uint32_t* i = input;
    uint32_t* o = output;
    size_t bh = block_height;
/*@ Inv Assert exists(R:XTOutput), xt_valid(F,W,G) && input_stride==xt_input_stride(G) && output_stride==xt_output_stride(G) && block_width==xt_width(G) && block_height==xt_height(G) && sizeof(uint32_t)==4 && sizeof(size_t)==8 && sizeof(uintptr_t)==8 && 0<bw && bw<=xt_total(G) && xt_legal_vl(bw,vl) && 0<vl && vl<=32 && vl<=bw && 0<=bh && bh<=block_height && input==xt_current_input(G,(xt_total(G)-bw),0) && output==xt_current_output(G,(xt_total(G)-bw),0) && i==xt_current_input(G,(xt_total(G)-bw),(block_height-bh)) && o==xt_current_output(G,(xt_total(G)-bw),(block_height-bh)) && xt_progress(F,G,old,R,(xt_total(G)-bw),vl,(block_height-bh)) && xt_data(F) * xt_output(W,R) */
    while (bh > 0) {
      vuint32m8_t v = __riscv_vle32_v_u32m8(i, vl) /*@ where F=F */;
      xt_store_strided(o, output_stride, &v, vl) /*@ where W=W */;
      i = (const uint32_t*) ((uintptr_t) i + input_stride);
      o += 1;
      bh -= 1;
    }
    input += vl;
    output = (uint32_t*) ((uintptr_t) output + vl * output_stride);
    bw -= vl;
  }
}
