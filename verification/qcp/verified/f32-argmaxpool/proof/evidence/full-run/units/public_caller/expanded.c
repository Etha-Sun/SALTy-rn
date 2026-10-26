/* Verification caller: return 1 certifies its postcondition in this proof.
 * Runtime differential testing uses the separate independent native oracle. */
typedef unsigned long long size_t;
typedef unsigned long long uintptr_t;
typedef unsigned int uint32_t;
/*@ Import Coq Require Import ArgmaxPool.Model ArgmaxPool.MemoryModel */
/*@ Extern Coq (APMap :: *) */
/*@ Extern Coq (ap_data:APMap->Assertion)
 (ap_get:APMap->Z->fp32) (ap_present:APMap->Z->Prop)
 (ap_window:APMap->Z->Z->Prop) (ap_load_lane:APMap->Z->Z->fp32)
 (ap_gt_mask:fp32->fp32->Z) (ap_bool_mask:Z->Prop)
 (ap_same_bits:fp32->fp32->Prop)
 (ap_u32:Z->Z) (ap_vl:Z->Z) (ap_add_u32:Z->Z->Z)
 (ap_select_f32:Z->fp32->fp32->fp32) (ap_select_u32:Z->Z->Z->Z)
 (PtrArray::full:Z->Z->list Z->Assertion)
 (FloatArray::full:Z->Z->list fp32->Assertion)
 (FloatArray::undef_full:Z->Z->Assertion)
 (UIntArray::full:Z->Z->list Z->Assertion)
 (UIntArray::undef_full:Z->Z->Assertion)
 (Znth:{A}->Z->list A->A->A) */
/*@ Import Coq Require Import ArgmaxPool.Types */
typedef struct float32x4_t{float s0; float s1; float s2; float s3;}float32x4_t;
typedef struct float32x2_t{float s0; float s1;}float32x2_t;
typedef struct uint32x4_t{uint32_t s0; uint32_t s1; uint32_t s2; uint32_t s3;}uint32x4_t;
typedef struct uint32x2_t{uint32_t s0; uint32_t s1;}uint32x2_t;
typedef struct vfloat32m8_t{float s0; float s1; float s2; float s3; float s4; float s5; float s6; float s7; float s8; float s9; float s10; float s11; float s12; float s13; float s14; float s15; float s16; float s17; float s18; float s19; float s20; float s21; float s22; float s23; float s24; float s25; float s26; float s27; float s28; float s29; float s30; float s31;}vfloat32m8_t;
typedef struct vuint32m8_t{uint32_t s0; uint32_t s1; uint32_t s2; uint32_t s3; uint32_t s4; uint32_t s5; uint32_t s6; uint32_t s7; uint32_t s8; uint32_t s9; uint32_t s10; uint32_t s11; uint32_t s12; uint32_t s13; uint32_t s14; uint32_t s15; uint32_t s16; uint32_t s17; uint32_t s18; uint32_t s19; uint32_t s20; uint32_t s21; uint32_t s22; uint32_t s23; uint32_t s24; uint32_t s25; uint32_t s26; uint32_t s27; uint32_t s28; uint32_t s29; uint32_t s30; uint32_t s31;}vuint32m8_t;
typedef struct vbool4_t{uint32_t s0; uint32_t s1; uint32_t s2; uint32_t s3; uint32_t s4; uint32_t s5; uint32_t s6; uint32_t s7; uint32_t s8; uint32_t s9; uint32_t s10; uint32_t s11; uint32_t s12; uint32_t s13; uint32_t s14; uint32_t s15; uint32_t s16; uint32_t s17; uint32_t s18; uint32_t s19; uint32_t s20; uint32_t s21; uint32_t s22; uint32_t s23; uint32_t s24; uint32_t s25; uint32_t s26; uint32_t s27; uint32_t s28; uint32_t s29; uint32_t s30; uint32_t s31;}vbool4_t;
/*@ Import Coq Require Import ArgmaxPool.ProgramModel ArgmaxPool.MemoryFacts */
/*@ Extern Coq (APPtrMap :: *) */
/*@ Extern Coq (ap_ptr_present:APPtrMap->Z->Prop) (ap_ptr_data:APPtrMap->Assertion) (ap_ptr_get:APPtrMap->Z->Z) (ap_ptr_pop:APPtrMap->Z->APPtrMap) */
const float* ap_read_table(const float** p)
/*@ With (P:APPtrMap) Require p!=0 && ap_ptr_present(P,p) && ap_ptr_data(P)
 Ensure __return==ap_ptr_get(P,p) && ap_ptr_data(P) */;
/*@ Import Coq Require Import ArgmaxPool.APKernelModel */
/*@ Extern Coq (APProgram :: *) (APOutput :: *) (APIndex :: *) */
/*@ Extern Coq
 (app_arguments:APProgram->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Prop)
 (app_valid:APMap->APPtrMap->list Z->list Z->APProgram->Prop)
 (ap_output:list Z->APOutput->Assertion) (ap_index:list Z->APIndex->Assertion)
 (app_neon_output:APMap->APPtrMap->APProgram->APOutput->APIndex->APOutput)
 (app_neon_index:APMap->APPtrMap->APProgram->APOutput->APIndex->APIndex)
 (app_rvv_output:APMap->APPtrMap->APProgram->APOutput->APIndex->APOutput)
 (app_rvv_index:APMap->APPtrMap->APProgram->APOutput->APIndex->APIndex)
 */
void test_neon(size_t output_pixels,size_t pooling_elements,size_t channels,const float**input,size_t input_offset,size_t input_pixel_stride,float*output,uint32_t*index,size_t input_increment,size_t output_increment,size_t index_increment)
/*@ With(D:APProgram)(F:APMap)(P:APPtrMap)(W:list Z)(WI:list Z)(O:APOutput)(I:APIndex)
Require app_arguments(D,output_pixels,pooling_elements,channels,input,input_offset,input_pixel_stride,output,index,input_increment,output_increment,index_increment) && app_valid(F,P,W,WI,D) && ap_data(F) * ap_ptr_data(P) * ap_output(W,O) * ap_index(WI,I)
Ensure ap_data(F) * ap_ptr_data(P) * ap_output(W,app_neon_output(F,P,D,O,I)) * ap_index(WI,app_neon_index(F,P,D,O,I)) */;
void test_rvv(size_t output_pixels,size_t pooling_elements,size_t channels,const float**input,size_t input_offset,size_t input_pixel_stride,float*output,uint32_t*index,size_t input_increment,size_t output_increment,size_t index_increment)
/*@ With(D:APProgram)(F:APMap)(P:APPtrMap)(W:list Z)(WI:list Z)(O:APOutput)(I:APIndex)
Require app_arguments(D,output_pixels,pooling_elements,channels,input,input_offset,input_pixel_stride,output,index,input_increment,output_increment,index_increment) && app_valid(F,P,W,WI,D) && ap_data(F) * ap_ptr_data(P) * ap_output(W,O) * ap_index(WI,I)
Ensure ap_data(F) * ap_ptr_data(P) * ap_output(W,app_rvv_output(F,P,D,O,I)) * ap_index(WI,app_rvv_index(F,P,D,O,I)) */;
/*@ Import Coq Require Import ArgmaxPool.APPublicModel */
/*@ Extern Coq (APPublicLayout :: *) */
/*@ Extern Coq
 (app_public_layout:APProgram->APProgram->APPublicLayout->Prop)
 (app_public_equal:APMap->APPtrMap->APProgram->APProgram->APPublicLayout->APOutput->APIndex->APOutput->APIndex->Prop) */
int argmax_public_pair(size_t pixels,size_t rows,size_t channels,const float**input,
 size_t offset,size_t stride,float*outN,uint32_t*idxN,float*outR,uint32_t*idxR,
 size_t input_inc,size_t output_inc,size_t index_inc)
/*@ With(DN:APProgram)(DR:APProgram)(L:APPublicLayout)(F:APMap)(P:APPtrMap)
 (WN:list Z)(WIN:list Z)(WR:list Z)(WIR:list Z)
 (ON:APOutput)(IN:APIndex)(OR:APOutput)(IR:APIndex)
Require app_arguments(DN,pixels,rows,channels,input,offset,stride,outN,idxN,input_inc,output_inc,index_inc) && app_arguments(DR,pixels,rows,channels,input,offset,stride,outR,idxR,input_inc,output_inc,index_inc) && app_valid(F,P,WN,WIN,DN) && app_valid(F,P,WR,WIR,DR) && app_public_layout(DN,DR,L) && ap_data(F) * ap_ptr_data(P) * ap_output(WN,ON) * ap_index(WIN,IN) * ap_output(WR,OR) * ap_index(WIR,IR)
Ensure __return==1 && app_public_equal(F,P,DN,DR,L,app_neon_output(F,P,DN,ON,IN),app_neon_index(F,P,DN,ON,IN),app_rvv_output(F,P,DR,OR,IR),app_rvv_index(F,P,DR,OR,IR)) && ap_data(F) * ap_ptr_data(P) * ap_output(WN,app_neon_output(F,P,DN,ON,IN)) * ap_index(WIN,app_neon_index(F,P,DN,ON,IN)) * ap_output(WR,app_rvv_output(F,P,DR,OR,IR)) * ap_index(WIR,app_rvv_index(F,P,DR,OR,IR)) */
{
 test_neon(pixels,rows,channels,input,offset,stride,outN,idxN,input_inc,output_inc,index_inc) /*@ where D=DN,F=F,P=P,W=WN,WI=WIN,O=ON,I=IN */;
 test_rvv(pixels,rows,channels,input,offset,stride,outR,idxR,input_inc,output_inc,index_inc) /*@ where D=DR,F=F,P=P,W=WR,WI=WIR,O=OR,I=IR */;
 return 1;
}
