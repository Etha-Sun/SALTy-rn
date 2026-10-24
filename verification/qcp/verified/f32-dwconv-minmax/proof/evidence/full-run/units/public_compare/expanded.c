typedef unsigned long long size_t;
typedef unsigned long long uintptr_t;
typedef long long intptr_t;
struct scalar_bounds {float min;float max;};
struct xnn_f32_minmax_params {struct scalar_bounds scalar;};
typedef struct float32x4_t {float s0; float s1; float s2; float s3;} float32x4_t;
typedef struct float32x2_t {float s0; float s1;} float32x2_t;
typedef struct vfloat32m4_t {float s0; float s1; float s2; float s3; float s4; float s5; float s6; float s7; float s8; float s9; float s10; float s11; float s12; float s13; float s14; float s15;} vfloat32m4_t;
typedef struct vbool8_t {int s0; int s1; int s2; int s3; int s4; int s5; int s6; int s7; int s8; int s9; int s10; int s11; int s12; int s13; int s14; int s15;} vbool8_t;
/*@ Import Coq Require Import Dwconv.MemoryInterface */
/*@ Extern Coq (DwROMap :: *) (DwOutput :: *) */
/*@ Extern Coq (dw_same:fp32->fp32->Prop) (dw_data:DwROMap->Assertion)
 (dw_get:DwROMap->Z->fp32) (dw_present:DwROMap->Z->Prop)
 (dw_pop:DwROMap->Z->DwROMap) (dw_output:list Z->DwOutput->Assertion)
 (dw_distinct:list Z->Prop) (dw_owned:list Z->Z->Prop)
 (dw_removed:list Z->Z->list Z) (dw_at:DwOutput->Z->option fp32)
 (dw_output_cell:Z->option fp32->Assertion)
 (dw_output_put:DwOutput->Z->fp32->DwOutput) */
float dw_read_float(const float* p)
/*@ With (F:DwROMap) Require p!=0 && dw_present(F,p) && dw_data(F)
 Ensure dw_same(__return,dw_get(F,p)) && dw_data(F) */;
void dw_store_float(float* p,float v)
/*@ With (W:list Z) (O:DwOutput)
 Require p!=0 && dw_distinct(W) && dw_owned(W,p) && dw_output(W,O)
 Ensure dw_output(W,dw_output_put(O,p,v)) */;
/*@ Import Coq Require Import Dwconv.OutputReadModel */
/*@ Extern Coq (dw_initialized:DwOutput->Z->fp32->Prop) */
float dw_read_output(const float *p)
/*@ With (W:list Z) (O:DwOutput) (v:fp32)
 Require p!=0 && dw_distinct(W) && dw_owned(W,p) && dw_initialized(O,p,v) && dw_output(W,O)
 Ensure dw_same(__return,v) && dw_output(W,O) */;
/*@ Import Coq Require Import Dwconv.WrittenReadModel */
/*@ Extern Coq (dw_output_ready:DwOutput->Z->Prop) */
float dw_read_written(const float *p)
/*@ With (W:list Z) (O:DwOutput)
 Require p!=0 && dw_distinct(W) && dw_owned(W,p) && dw_output_ready(O,p) && dw_output(W,O)
 Ensure dw_initialized(O,p,__return) && dw_output(W,O) */;
/*@ Import Coq Require Import NanBridge.BridgeLogic */
/*@ Extern Coq (bit_same:fp32->fp32->Prop)
 (same_value:fp32->fp32->Prop) (returned_one:Z->Prop) */
float preserve_float(float x)
/*@ Require emp Ensure bit_same(__return,x) && emp */;
int check_observation(float x,float y)
/*@ Require same_value(x,y) && emp Ensure returned_one(__return) && emp */;
int same_lane(float x,float y)
/*@ Require same_value(x,y) && emp Ensure __return==1 && emp */;
/*@ Import Coq Require Import Dwconv.PublicModel */
/*@ Extern Coq (DwProgram :: *) */
/*@ Extern Coq (dw_channels:DwProgram->Z) (dw_width:DwProgram->Z)
 (dw_out:DwProgram->Z) (dw_out_increment:DwProgram->Z)
 (dw_rebase:DwProgram->Z->DwProgram) (dw_output_at:DwProgram->Z->Z)
 (dw_output_domain:list Z->DwProgram->Prop)
 (dw_observed_pair:DwOutput->DwOutput->Z->Z->Prop)
 (dw_pair_observed:DwProgram->Z->DwOutput->DwOutput->Prop) */
int compare_outputs(size_t channels,size_t output_width,const float *left,const float *right,size_t output_increment)
/*@ With (D:DwProgram) (out2:Z) (W1:list Z) (W2:list Z) (O1:DwOutput) (O2:DwOutput) Require channels==dw_channels(D) && output_width==dw_width(D) && output_increment==dw_out_increment(D) && 0<channels && 0<output_width && dw_distinct(W1) && dw_distinct(W2) && dw_output_domain(W1,D) && dw_output_domain(W2,dw_rebase(D,out2)) && dw_pair_observed(D,out2,O1,O2) && left==dw_out(D) && right==out2 && dw_output(W1,O1) * dw_output(W2,O2) Ensure __return==1 && dw_output(W1,O1) * dw_output(W2,O2) */;
int compare_outputs(size_t channels,size_t output_width,const float *left,const float *right,size_t output_increment)
/*@ With (D:DwProgram) (out2:Z) (W1:list Z) (W2:list Z) (O1:DwOutput) (O2:DwOutput) Require channels==dw_channels(D) && output_width==dw_width(D) && output_increment==dw_out_increment(D) && 0<channels && 0<output_width && dw_distinct(W1) && dw_distinct(W2) && dw_output_domain(W1,D) && dw_output_domain(W2,dw_rebase(D,out2)) && dw_pair_observed(D,out2,O1,O2) && left==dw_out(D) && right==out2 && dw_output(W1,O1) * dw_output(W2,O2) Ensure __return==1 && dw_output(W1,O1) * dw_output(W2,O2) */
{
  size_t pixels=output_width;
  /*@ Inv Assert channels==dw_channels(D) && output_width==dw_width(D) && output_increment==dw_out_increment(D) && 0<channels && 0<output_width && dw_distinct(W1) && dw_distinct(W2) && dw_output_domain(W1,D) && dw_output_domain(W2,dw_rebase(D,out2)) && dw_pair_observed(D,out2,O1,O2) && 0<=pixels && pixels<=output_width && left==dw_output_at(D,(output_width-pixels)) && right==dw_output_at(dw_rebase(D,out2),(output_width-pixels)) && dw_output(W1,O1) * dw_output(W2,O2) */
  while(pixels!=0){
    size_t remaining=channels;
    /*@ Inv Assert channels==dw_channels(D) && output_width==dw_width(D) && output_increment==dw_out_increment(D) && 0<channels && 0<output_width && dw_distinct(W1) && dw_distinct(W2) && dw_output_domain(W1,D) && dw_output_domain(W2,dw_rebase(D,out2)) && dw_pair_observed(D,out2,O1,O2) && 0<pixels && pixels<=output_width && 0<=remaining && remaining<=channels && left==dw_output_at(D,(output_width-pixels))+4*(channels-remaining) && right==dw_output_at(dw_rebase(D,out2),(output_width-pixels))+4*(channels-remaining) && dw_output(W1,O1) * dw_output(W2,O2) */
    while(remaining!=0){
      /*@ Assert channels==dw_channels(D) && output_width==dw_width(D) && output_increment==dw_out_increment(D) && 0<channels && 0<output_width && dw_distinct(W1) && dw_distinct(W2) && dw_output_domain(W1,D) && dw_output_domain(W2,dw_rebase(D,out2)) && dw_pair_observed(D,out2,O1,O2) && 0<pixels && pixels<=output_width && 0<=remaining && remaining<=channels && left==dw_output_at(D,(output_width-pixels))+4*(channels-remaining) && right==dw_output_at(dw_rebase(D,out2),(output_width-pixels))+4*(channels-remaining) && 0<remaining && left!=0 && right!=0 && dw_owned(W1,left) && dw_owned(W2,right) && dw_output_ready(O1,left) && dw_output_ready(O2,right) && dw_observed_pair(O1,O2,left,right) && dw_output(W1,O1) * dw_output(W2,O2) */
      float x=dw_read_written(left) /*@ where W=W1,O=O1 */;
      float y=dw_read_written(right) /*@ where W=W2,O=O2 */;
      if(!same_lane(x,y)) return 0;
      left++;
      right++;
      --remaining;
    }
    left=(const float*)((uintptr_t)left+output_increment);
    right=(const float*)((uintptr_t)right+output_increment);
    --pixels;
  }
  return 1;
}
