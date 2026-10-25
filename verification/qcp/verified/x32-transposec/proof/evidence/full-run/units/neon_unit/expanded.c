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
/*@ Import Coq Require Import X32Transpose.ArithmeticModel */
/*@ Extern Coq (xt_doz:Z->Z->Z) (xt_round_down:Z->Z->Z) */
size_t doz(size_t a,size_t b)
/*@ Require emp Ensure __return==xt_doz(a,b) && emp */;
size_t round_down_po2(size_t n,size_t q)
/*@ Require q>0 && emp Ensure __return==xt_round_down(n,q) && emp */;
/*@ Extern Coq (XTMap :: *) (XTOutput :: *) */
/*@ Extern Coq (xt_data:XTMap->Assertion) (xt_window:XTMap->Z->Z->Prop) (xt_load_lane:XTMap->Z->Z->Z) (xt_output:list Z->XTOutput->Assertion) (xt_write_window:list Z->Z->Z->Prop) (xt_write_pair:XTOutput->Z->Z->Z->XTOutput) (xt_output_put:XTOutput->Z->Z->XTOutput) */
uint32x2_t vld1_u32(const uint32_t*p)
/*@ With(F:XTMap) Require xt_window(F,p,2) && xt_data(F)
 Ensure xt_data(F) * store(&(__return.s0),unsigned int,xt_load_lane(F,p,0)) * store(&(__return.s1),unsigned int,xt_load_lane(F,p,1)) */;
uint32x2_t vmov_n_u32(uint32_t x)
/*@ Require emp Ensure store(&(__return.s0),unsigned int,x) * store(&(__return.s1),unsigned int,x) */;
uint32x2_t xt_intrinsic_zip1(const uint32x2_t*a,const uint32x2_t*b)
/*@ With(a0:Z)(a1:Z)(b0:Z)(b1:Z)
 Require store(&(a->s0),unsigned int,a0) * store(&(a->s1),unsigned int,a1) * store(&(b->s0),unsigned int,b0) * store(&(b->s1),unsigned int,b1)
 Ensure store(&(a->s0),unsigned int,a0) * store(&(a->s1),unsigned int,a1) * store(&(b->s0),unsigned int,b0) * store(&(b->s1),unsigned int,b1) * store(&(__return.s0),unsigned int,a0) * store(&(__return.s1),unsigned int,b0) */;
uint32x2_t xt_intrinsic_zip2(const uint32x2_t*a,const uint32x2_t*b)
/*@ With(a0:Z)(a1:Z)(b0:Z)(b1:Z)
 Require store(&(a->s0),unsigned int,a0) * store(&(a->s1),unsigned int,a1) * store(&(b->s0),unsigned int,b0) * store(&(b->s1),unsigned int,b1)
 Ensure store(&(a->s0),unsigned int,a0) * store(&(a->s1),unsigned int,a1) * store(&(b->s0),unsigned int,b0) * store(&(b->s1),unsigned int,b1) * store(&(__return.s0),unsigned int,a1) * store(&(__return.s1),unsigned int,b1) */;
void xt_intrinsic_store_lane_0(uint32_t*p,const uint32x2_t*v)
/*@ With(W:list Z)(O:XTOutput)(x0:Z)(x1:Z)
 Require xt_write_window(W,p,1) && xt_output(W,O) * store(&(v->s0),unsigned int,x0) * store(&(v->s1),unsigned int,x1)
 Ensure xt_output(W,xt_output_put(O,p,x0)) * store(&(v->s0),unsigned int,x0) * store(&(v->s1),unsigned int,x1) */;
void xt_intrinsic_store2(uint32_t*p,const uint32x2_t*v)
/*@ With(W:list Z)(O:XTOutput)(x0:Z)(x1:Z)
 Require xt_write_window(W,p,2) && xt_output(W,O) * store(&(v->s0),unsigned int,x0) * store(&(v->s1),unsigned int,x1)
 Ensure xt_output(W,xt_write_pair(O,p,x0,x1)) * store(&(v->s0),unsigned int,x0) * store(&(v->s1),unsigned int,x1) */;
/*@ Import Coq Require Import X32Transpose.NeonProgramModel */
/*@ Extern Coq (xt_neon_next:XTLayout->Z->Z->Z->Prop) */
/*@ Extern Coq (xt_cols:XTLayout->Z) (xt_neon_batch:Z->Z) (xt_neon_second:Z->Z->Z) (xt_neon_input_reset:XTLayout->Z) (xt_neon_input_offset:XTLayout->Z) (xt_neon_output_reset:XTLayout->Z) */
void test_neon(
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
  /* Empty height touches no memory; retain both original entry assertions. */
  if (block_height == 0) return;
  /* Normalize only the unobserved byvalue loop counter after both assertions.
   * Width0 and width1 both execute one aliased-output tile and then become0. */
  if (block_width == 0) block_width = 1;
  const size_t tile_height = 2;
  const size_t tile_width = 2;
  const size_t tile_hbytes = tile_height * sizeof(uint32_t);
  const size_t tile_wbytes = tile_width * sizeof(uint32_t);
  const size_t input_reset = tile_wbytes - round_down_po2(block_height, tile_height) * input_stride;
  const size_t input_offset = tile_height * input_stride;
  const size_t output_reset = tile_width * output_stride - round_down_po2(block_height, 2) * sizeof(uint32_t);
  const uint32_t* i0 = input;
  const uint32_t* i1 = (const uint32_t*) ((uintptr_t) i0 + input_stride);
  uint32_t* o0 = (uint32_t*) output;
  uint32_t* o1 = (uint32_t*) ((uintptr_t) o0 + output_stride);
  /* Entry is positive after the disclosed effective-width normalization. */
/*@ Inv Assert exists(k:Z)(R:XTOutput), xt_valid(F,W,G) && input==xt_input(G) && output==xt_output_base(G) && input_stride==xt_input_stride(G) && output_stride==xt_output_stride(G) && block_height==xt_height(G) && 0<block_height && sizeof(uint32_t)==4 && sizeof(size_t)==8 && sizeof(uintptr_t)==8 && tile_height==2 && tile_width==2 && tile_hbytes==8 && tile_wbytes==8 && input_reset==xt_neon_input_reset(G) && input_offset==xt_neon_input_offset(G) && output_reset==xt_neon_output_reset(G) && 0<=k && k<=xt_cols(G)+1 && k%2==0 && block_width==xt_doz(xt_cols(G),k) && i0==xt_current_input(G,k,0) && i1==xt_current_input(G,k,1) && o0==xt_current_output(G,k,0) && xt_neon_next(G,k,block_width,o1) && xt_progress(F,G,old,R,k,0,0) && xt_data(F) * xt_output(W,R) */
  while (block_width != 0) {
    if (block_width < 2) {
      o1 = o0;
    }
    size_t bh = block_height;
/*@ Inv Assert exists(k:Z)(R:XTOutput), xt_valid(F,W,G) && input==xt_input(G) && output==xt_output_base(G) && input_stride==xt_input_stride(G) && output_stride==xt_output_stride(G) && block_height==xt_height(G) && 0<block_height && sizeof(uint32_t)==4 && sizeof(size_t)==8 && sizeof(uintptr_t)==8 && tile_height==2 && tile_width==2 && tile_hbytes==8 && tile_wbytes==8 && input_reset==xt_neon_input_reset(G) && input_offset==xt_neon_input_offset(G) && output_reset==xt_neon_output_reset(G) && 0<=k && k<=xt_cols(G)+1 && k%2==0 && block_width==xt_doz(xt_cols(G),k) && 0<block_width && k<xt_cols(G) && 0<=bh && bh<=block_height && (block_height-bh)%2==0 && i0==xt_current_input(G,k,(block_height-bh)) && i1==xt_current_input(G,k,(block_height-bh)+1) && o0==xt_current_output(G,k,(block_height-bh)) && o1==xt_current_output(G,xt_neon_second(k,block_width),(block_height-bh)) && xt_progress(F,G,old,R,k,xt_neon_batch(block_width),(block_height-bh)) && xt_data(F) * xt_output(W,R) */
    for (; bh >= 2; bh -= 2) {
      const uint32x2_t v1_0 = vld1_u32(i0) /*@ where F=F */; i0 = (uint32_t*) ((uintptr_t) i0 + input_offset);
      const uint32x2_t v1_1 = vld1_u32(i1) /*@ where F=F */; i1 = (uint32_t*) ((uintptr_t) i1 + input_offset);
      const uint32x2_t v0_0_low = xt_intrinsic_zip1(&(v1_0),&(v1_1)) /*@ where a=&v1_0,b=&v1_1 */;
      const uint32x2_t v0_0_high = xt_intrinsic_zip2(&(v1_0),&(v1_1)) /*@ where a=&v1_0,b=&v1_1 */;
      xt_intrinsic_store2(o1,&(v0_0_high)) /*@ where W=W */; o1 = (uint32_t*) ((uintptr_t) o1 + tile_hbytes);
      xt_intrinsic_store2(o0,&(v0_0_low)) /*@ where W=W */; o0 = (uint32_t*) ((uintptr_t) o0 + tile_hbytes);
    }
    if (bh != 0) {
      const uint32x2_t v1_0 = vld1_u32(i0) /*@ where F=F */;
      const uint32x2_t v1_1 = vmov_n_u32(0);
      const uint32x2_t v0_low = xt_intrinsic_zip1(&(v1_0),&(v1_1)) /*@ where a=&v1_0,b=&v1_1 */;
      const uint32x2_t v1_low = xt_intrinsic_zip2(&(v1_0),&(v1_1)) /*@ where a=&v1_0,b=&v1_1 */;
      if (bh & 1) {
        xt_intrinsic_store_lane_0(o1,&(v1_low)) /*@ where W=W */;
        xt_intrinsic_store_lane_0(o0,&(v0_low)) /*@ where W=W */;
      }
    }
/*@ Assert exists(k:Z)(R:XTOutput), xt_valid(F,W,G) && input==xt_input(G) && output==xt_output_base(G) && input_stride==xt_input_stride(G) && output_stride==xt_output_stride(G) && block_height==xt_height(G) && 0<block_height && sizeof(uint32_t)==4 && sizeof(size_t)==8 && sizeof(uintptr_t)==8 && tile_height==2 && tile_width==2 && tile_hbytes==8 && tile_wbytes==8 && input_reset==xt_neon_input_reset(G) && input_offset==xt_neon_input_offset(G) && output_reset==xt_neon_output_reset(G) && 0<=k && k<=xt_cols(G)+1 && k%2==0 && block_width==xt_doz(xt_cols(G),k) && 0<block_width && k<xt_cols(G) && 0<=bh && bh<=1 && (block_height-bh)%2==0 && i0==xt_current_input(G,k,(block_height-bh)) && i1==xt_current_input(G,k,(block_height-bh)+1) && o0==xt_current_output(G,k,(block_height-bh)) && o1==xt_current_output(G,xt_neon_second(k,block_width),(block_height-bh)) && xt_progress(F,G,old,R,k,xt_neon_batch(block_width),block_height) && xt_data(F) * xt_output(W,R) */
    i0 = (const uint32_t*) ((uintptr_t) i0 + input_reset);
    i1 = (const uint32_t*) ((uintptr_t) i0 + input_stride);
    o0 = (uint32_t*) ((uintptr_t) o0 + output_reset);
    o1 = (uint32_t*) ((uintptr_t) o1 + output_reset);
    block_width = doz(block_width, tile_width);
  }
}
