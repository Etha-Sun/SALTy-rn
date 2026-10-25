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
void test_neon(const uint32_t*input,uint32_t*output,size_t input_stride,size_t output_stride,size_t block_width,size_t block_height)
/*@ With(F:XTMap)(W:list Z)(old:XTOutput)(G:XTLayout) Require xt_valid(F,W,G) && input==xt_input(G) && output==xt_output_base(G) && input_stride==xt_input_stride(G) && output_stride==xt_output_stride(G) && block_width==xt_width(G) && block_height==xt_height(G) && xt_data(F) * xt_output(W,old) Ensure exists(R:XTOutput), xt_result(F,G,old,R) && xt_data(F) * xt_output(W,R) */;
void test_rvv(const uint32_t*input,uint32_t*output,size_t input_stride,size_t output_stride,size_t block_width,size_t block_height)
/*@ With(F:XTMap)(W:list Z)(old:XTOutput)(G:XTLayout) Require xt_valid(F,W,G) && input==xt_input(G) && output==xt_output_base(G) && input_stride==xt_input_stride(G) && output_stride==xt_output_stride(G) && block_width==xt_width(G) && block_height==xt_height(G) && xt_data(F) * xt_output(W,old) Ensure exists(R:XTOutput), xt_result(F,G,old,R) && xt_data(F) * xt_output(W,R) */;
/*@ Import Coq Require Import X32Transpose.ObservationModel */
/*@ Extern Coq (XTOutput :: *) */
/*@ Extern Coq (NoDup:list Z->Prop) (In:Z->list Z->Prop) (xt_output_rest:list Z->XTOutput->Z->Assertion) */
/*@ Extern Coq (xt_output:list Z->XTOutput->Assertion) (xt_output_exact:XTOutput->Z->Z->Prop) */
/*@ Extern Coq (xt_observation_address:Z->Z->Z->Z->Z) */
const uint32_t* xt_observe_pointer(const uint32_t*p,size_t stride,size_t row,size_t column)
/*@ Require emp Ensure __return==xt_observation_address(p,stride,row,column) && emp */;
uint32_t xt_read_output(const uint32_t*p)
/*@ With(W:list Z)(O:XTOutput)(x:Z)
 Require NoDup(W) && 0<p && In(p,W) && xt_output_exact(O,p,x) && xt_output(W,O)
 Ensure __return==x && xt_output(W,O) */;
/*@ Extern Coq (xt_cols:XTLayout->Z) (xt_get:XTMap->Z->Z) (xt_input_address:XTLayout->Z->Z->Z) */
/* A single actual observer of the independent all-written-address theorem.
 * Both kernels execute on the same live buffer, with its own current state;
 * the saved first UInt32 value remains a C local through the second call. */
int test_equivalence(const uint32_t*input,uint32_t*output,
 size_t input_stride,size_t output_stride,size_t block_width,size_t block_height,
 size_t row,size_t column)
/*@ With(F:XTMap)(W:list Z)(old:XTOutput)(G:XTLayout)
 Require xt_valid(F,W,G) && input==xt_input(G) && output==xt_output_base(G) && input_stride==xt_input_stride(G) && output_stride==xt_output_stride(G) && block_width==xt_width(G) && block_height==xt_height(G) && 0<=row && row<xt_height(G) && 0<=column && column<xt_cols(G) && xt_data(F) * xt_output(W,old)
 Ensure exists(R:XTOutput), __return==1 && xt_result(F,G,old,R) && xt_data(F) * xt_output(W,R) */
{
 const uint32_t* address=xt_observe_pointer(output,output_stride,row,column);
 test_neon(input,output,input_stride,output_stride,block_width,block_height) /*@ where F=F,W=W,G=G */;
 const uint32_t left=xt_read_output(address) /*@ where W=W,x=xt_get(F,xt_input_address(G,row,column)) */;
 test_rvv(input,output,input_stride,output_stride,block_width,block_height) /*@ where F=F,W=W,G=G */;
 const uint32_t right=xt_read_output(address) /*@ where W=W,x=xt_get(F,xt_input_address(G,row,column)) */;
 return left==right;
}
