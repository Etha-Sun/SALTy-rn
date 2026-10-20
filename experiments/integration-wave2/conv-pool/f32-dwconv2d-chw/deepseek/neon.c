/*@ logic integer dw_weight(integer t) = 3*((t-1)%3)+(t<=3?2:(t<=6?1:3));
     logic integer dw_dx(integer t) = t<=3?0:(t<=6?-1:1);
     logic float *dw_row(float *I,float *Z,integer H,integer W,integer y) = y<0 || y>=H?Z:I+y*W;
     logic float dw_sample(float *I,float *Z,integer H,integer W,integer y,integer x) = x<0 || x>=W?0.0f:dw_row(I,Z,H,W,y)[x];
     logic float dw_fold(float *I,float *Z,float *WT,integer H,integer W,integer y,integer x,integer t) = t<=0?WT[0]:
      shim_fma32(dw_sample(I,Z,H,W,y-1+(t-1)%3,x+dw_dx(t)),WT[dw_weight(t)],dw_fold(I,Z,WT,H,W,y,x,t-1));
     logic float dw_clamp(float x,float lo,float hi) = ext_neon_min32(ext_neon_max32(x,lo),hi);
     lemma dw_fma_swap: \forall float x,y,a;ext_same(shim_fma32(x,y,a),shim_fma32(y,x,a));
*/
/*@ lemma dw_fold_zero: \forall float *I,*Z,*WT;\forall integer H,W,y,x;ext_same(dw_fold(I,Z,WT,H,W,y,x,0),WT[0]);
     lemma dw_fold_step: \forall float *I,*Z,*WT;\forall integer H,W,y,x,t;t>=0 ==> ext_same(dw_fold(I,Z,WT,H,W,y,x,t+1),shim_fma32(dw_sample(I,Z,H,W,y-1+t%3,x+dw_dx(t+1)),WT[dw_weight(t+1)],dw_fold(I,Z,WT,H,W,y,x,t)));
*/

/*
struct xnn_f32_minmax_params {
  struct {
    float min;
    float max;
  } scalar;
};
*/

void test_neon(
    size_t input_height,
    size_t input_width,
    const float* input,
    const float* weights,
    const float* zero,
    float* output,
    uint32_t padding_top,
    const struct xnn_f32_minmax_params* restrict params) XNN_OOB_READS
{
  assert(input_height != 0);
  assert(input_width != 0);
  assert(input_width % sizeof(float) == 0);
  assert(padding_top == 1);

  /*@ ghost const float *dw_I=input; const float *dw_Z=zero; const float *dw_W=weights; float *dw_O=output; */
  const float32x4_t vmax = vdupq_n_f32(params->scalar.max);
  const float32x4_t vmin = vdupq_n_f32(params->scalar.min);

  static const int32_t mask_table[7] = {-1, -1, -1, -1, 0, 0, 0};
  const uint32x4_t vmask = vld1q_u32((const uint32_t*) &mask_table[3 - (((input_width >> 2) - 1) & 3)]);

  const float32x4_t vw0123 = vld1q_f32(weights);
  const float32x4_t vw4567 = vld1q_f32(weights + 4);
  const float32x2_t vw89 = vld1_f32(weights + 8);

  const size_t input_decrement = round_up_po2(input_width, 4 * sizeof(float));

  const float* i0 = zero;
  const float* i1 = input;
  const float* i2 = (const float*) ((uintptr_t) i1 + input_width);
  const float* i3 = (const float*) ((uintptr_t) i2 + input_width);
  const float* i4 = (const float*) ((uintptr_t) i3 + input_width);

  float* o0 = output;
  float* o1 = (float*) ((uintptr_t) o0 + input_width);
  float* o2 = (float*) ((uintptr_t) o1 + input_width);

  size_t output_height = input_height;
  /*@ loop invariant dw_height: 0<=output_height<=input_height;
      loop invariant dw_rows: output_height>0 ==> (input_height-output_height)%3==0;
      loop invariant dw_output_rows: \forall integer yy,xx;0<=yy<(input_height-output_height) && 0<=xx<(input_width/4) ==> ext_same(dw_O[yy*(input_width/4)+xx],dw_clamp(dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),yy,xx,9),params->scalar.min,params->scalar.max));
      loop invariant dw_o0: output_height>0 ==> o0==dw_O+(input_height-output_height)*(input_width/4);
      loop invariant dw_outer_i0: output_height>0 && 0<=(input_height-output_height)-1+0<input_height ==> i0==dw_I+((input_height-output_height)-1+0)*(input_width/4);
      loop invariant dw_outer_i1: output_height>0 && 0<=(input_height-output_height)-1+1<input_height ==> i1==dw_I+((input_height-output_height)-1+1)*(input_width/4);
      loop invariant dw_outer_i2: output_height>0 && 0<=(input_height-output_height)-1+2<input_height ==> i2==dw_I+((input_height-output_height)-1+2)*(input_width/4);
      loop invariant dw_outer_i3: output_height>0 && 0<=(input_height-output_height)-1+3<input_height ==> i3==dw_I+((input_height-output_height)-1+3)*(input_width/4);
      loop invariant dw_outer_i4: output_height>0 && 0<=(input_height-output_height)-1+4<input_height ==> i4==dw_I+((input_height-output_height)-1+4)*(input_width/4);
      loop invariant dw_top_zero: (input_height-output_height)==0 ==> i0==dw_Z;
      loop assigns output_height,i0,i1,i2,i3,i4,o0,o1,o2,dw_O[0..input_height*(input_width/4)-1],errno;
      loop variant output_height;
  */
  do {
    if XNN_UNPREDICTABLE(output_height < 2) {
      i2 = zero;
      o1 = o0;
    }
    if XNN_UNPREDICTABLE(output_height < 3) {
      i3 = zero;
      o2 = o1;
    }
    if XNN_UNPREDICTABLE(output_height < 4) {
      i4 = zero;
    }

    float32x4_t vi0x0123 = vmovq_n_f32(0.0f);
    float32x4_t vi1x0123 = vmovq_n_f32(0.0f);
    float32x4_t vi2x0123 = vmovq_n_f32(0.0f);
    float32x4_t vi3x0123 = vmovq_n_f32(0.0f);
    float32x4_t vi4x0123 = vmovq_n_f32(0.0f);

    float32x4_t vi0x4567 = vld1q_f32(i0); i0 += 4;
    float32x4_t vi1x4567 = vld1q_f32(i1); i1 += 4;
    float32x4_t vi2x4567 = vld1q_f32(i2); i2 += 4;
    float32x4_t vi3x4567 = vld1q_f32(i3); i3 += 4;
    float32x4_t vi4x4567 = vld1q_f32(i4); i4 += 4;

    size_t w = input_width;
    /*@ loop invariant dw_width: 0<w<=input_width && w%4==0 && (input_width-w)%16==0;
        loop invariant dw_output_width: \forall integer rr,xx;0<=rr<3 && (input_height-output_height)+rr<input_height && 0<=xx<((input_width-w)/4) ==> ext_same(dw_O[((input_height-output_height)+rr)*(input_width/4)+xx],dw_clamp(dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+rr,xx,9),params->scalar.min,params->scalar.max));
        loop invariant dw_i0: i0==dw_row(dw_I,dw_Z,input_height,(input_width/4),(input_height-output_height)-1+0)+((input_width-w)/4)+4;
        loop invariant dw_i1: i1==dw_row(dw_I,dw_Z,input_height,(input_width/4),(input_height-output_height)-1+1)+((input_width-w)/4)+4;
        loop invariant dw_i2: i2==dw_row(dw_I,dw_Z,input_height,(input_width/4),(input_height-output_height)-1+2)+((input_width-w)/4)+4;
        loop invariant dw_i3: i3==dw_row(dw_I,dw_Z,input_height,(input_width/4),(input_height-output_height)-1+3)+((input_width-w)/4)+4;
        loop invariant dw_i4: i4==dw_row(dw_I,dw_Z,input_height,(input_width/4),(input_height-output_height)-1+4)+((input_width-w)/4)+4;
        loop invariant dw_window0: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) ==> ext_same(vi0x4567.lane[j],dw_sample(dw_I,dw_Z,input_height,(input_width/4),(input_height-output_height)-1+0,((input_width-w)/4)+j));
        loop invariant dw_left_window0: \forall integer j;0<=j<4 ==> ext_same(vi0x0123.lane[j],dw_sample(dw_I,dw_Z,input_height,(input_width/4),(input_height-output_height)-1+0,((input_width-w)/4)-4+j));
        loop invariant dw_window1: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) ==> ext_same(vi1x4567.lane[j],dw_sample(dw_I,dw_Z,input_height,(input_width/4),(input_height-output_height)-1+1,((input_width-w)/4)+j));
        loop invariant dw_left_window1: \forall integer j;0<=j<4 ==> ext_same(vi1x0123.lane[j],dw_sample(dw_I,dw_Z,input_height,(input_width/4),(input_height-output_height)-1+1,((input_width-w)/4)-4+j));
        loop invariant dw_window2: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) ==> ext_same(vi2x4567.lane[j],dw_sample(dw_I,dw_Z,input_height,(input_width/4),(input_height-output_height)-1+2,((input_width-w)/4)+j));
        loop invariant dw_left_window2: \forall integer j;0<=j<4 ==> ext_same(vi2x0123.lane[j],dw_sample(dw_I,dw_Z,input_height,(input_width/4),(input_height-output_height)-1+2,((input_width-w)/4)-4+j));
        loop invariant dw_window3: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) ==> ext_same(vi3x4567.lane[j],dw_sample(dw_I,dw_Z,input_height,(input_width/4),(input_height-output_height)-1+3,((input_width-w)/4)+j));
        loop invariant dw_left_window3: \forall integer j;0<=j<4 ==> ext_same(vi3x0123.lane[j],dw_sample(dw_I,dw_Z,input_height,(input_width/4),(input_height-output_height)-1+3,((input_width-w)/4)-4+j));
        loop invariant dw_window4: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) ==> ext_same(vi4x4567.lane[j],dw_sample(dw_I,dw_Z,input_height,(input_width/4),(input_height-output_height)-1+4,((input_width-w)/4)+j));
        loop invariant dw_left_window4: \forall integer j;0<=j<4 ==> ext_same(vi4x0123.lane[j],dw_sample(dw_I,dw_Z,input_height,(input_width/4),(input_height-output_height)-1+4,((input_width-w)/4)-4+j));
        loop invariant dw_output_cursor0: o0==dw_O+((input_height-output_height)+(0<output_height?0:output_height-1))*(input_width/4)+((input_width-w)/4);
        loop invariant dw_output_cursor1: o1==dw_O+((input_height-output_height)+(1<output_height?1:output_height-1))*(input_width/4)+((input_width-w)/4);
        loop invariant dw_output_cursor2: o2==dw_O+((input_height-output_height)+(2<output_height?2:output_height-1))*(input_width/4)+((input_width-w)/4);
        loop assigns w,vi0x0123,vi0x4567,vi1x0123,vi1x4567,vi2x0123,vi2x4567,vi3x0123,vi3x4567,vi4x0123,vi4x4567,i0,i1,i2,i3,i4,o0,o1,o2,dw_O[0..input_height*(input_width/4)-1],errno;
        loop variant w;
    */
    for (; w > 4 * sizeof(float); w -= 4 * sizeof(float)) {
      float32x4_t vo0p0 = vdupq_lane_f32(vget_low_f32(vw0123), 0);
      float32x4_t vo1p0 = vdupq_lane_f32(vget_low_f32(vw0123), 0);
      float32x4_t vo2p0 = vdupq_lane_f32(vget_low_f32(vw0123), 0);

      const float32x4_t vi0x89AB = vld1q_f32(i0); i0 += 4;
      const float32x4_t vi1x89AB = vld1q_f32(i1); i1 += 4;
      const float32x4_t vi2x89AB = vld1q_f32(i2); i2 += 4;
      const float32x4_t vi3x89AB = vld1q_f32(i3); i3 += 4;
      const float32x4_t vi4x89AB = vld1q_f32(i4); i4 += 4;

      vo0p0 = vfmaq_lane_f32(vo0p0, vi0x4567, vget_high_f32(vw0123), 0);
      /*@ assert dw_acc_1_0_1: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) && (input_height-output_height)+0<input_height ==> ext_same(vo0p0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+0,((input_width-w)/4)+j,1)); */
      vo1p0 = vfmaq_lane_f32(vo1p0, vi1x4567, vget_high_f32(vw0123), 0);
      /*@ assert dw_acc_1_1_1: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) && (input_height-output_height)+1<input_height ==> ext_same(vo1p0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+1,((input_width-w)/4)+j,1)); */
      vo2p0 = vfmaq_lane_f32(vo2p0, vi2x4567, vget_high_f32(vw0123), 0);
      /*@ assert dw_acc_1_2_1: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) && (input_height-output_height)+2<input_height ==> ext_same(vo2p0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+2,((input_width-w)/4)+j,1)); */

      vo0p0 = vfmaq_lane_f32(vo0p0, vi1x4567, vget_low_f32(vw4567), 1);
      /*@ assert dw_acc_1_0_2: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) && (input_height-output_height)+0<input_height ==> ext_same(vo0p0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+0,((input_width-w)/4)+j,2)); */
      vo1p0 = vfmaq_lane_f32(vo1p0, vi2x4567, vget_low_f32(vw4567), 1);
      /*@ assert dw_acc_1_1_2: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) && (input_height-output_height)+1<input_height ==> ext_same(vo1p0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+1,((input_width-w)/4)+j,2)); */
      vo2p0 = vfmaq_lane_f32(vo2p0, vi3x4567, vget_low_f32(vw4567), 1);
      /*@ assert dw_acc_1_2_2: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) && (input_height-output_height)+2<input_height ==> ext_same(vo2p0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+2,((input_width-w)/4)+j,2)); */

      vo0p0 = vfmaq_lane_f32(vo0p0, vi2x4567, vw89, 0);
      /*@ assert dw_acc_1_0_3: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) && (input_height-output_height)+0<input_height ==> ext_same(vo0p0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+0,((input_width-w)/4)+j,3)); */
      vo1p0 = vfmaq_lane_f32(vo1p0, vi3x4567, vw89, 0);
      /*@ assert dw_acc_1_1_3: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) && (input_height-output_height)+1<input_height ==> ext_same(vo1p0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+1,((input_width-w)/4)+j,3)); */
      vo2p0 = vfmaq_lane_f32(vo2p0, vi4x4567, vw89, 0);
      /*@ assert dw_acc_1_2_3: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) && (input_height-output_height)+2<input_height ==> ext_same(vo2p0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+2,((input_width-w)/4)+j,3)); */

      const float32x4_t vi0x3456 = vextq_f32(vi0x0123, vi0x4567, 3);
      const float32x4_t vi1x3456 = vextq_f32(vi1x0123, vi1x4567, 3);
      const float32x4_t vi2x3456 = vextq_f32(vi2x0123, vi2x4567, 3);
      const float32x4_t vi3x3456 = vextq_f32(vi3x0123, vi3x4567, 3);
      const float32x4_t vi4x3456 = vextq_f32(vi4x0123, vi4x4567, 3);

      vo0p0 = vfmaq_lane_f32(vo0p0, vi0x3456, vget_low_f32(vw0123), 1);
      /*@ assert dw_acc_1_0_4: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) && (input_height-output_height)+0<input_height ==> ext_same(vo0p0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+0,((input_width-w)/4)+j,4)); */
      vo1p0 = vfmaq_lane_f32(vo1p0, vi1x3456, vget_low_f32(vw0123), 1);
      /*@ assert dw_acc_1_1_4: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) && (input_height-output_height)+1<input_height ==> ext_same(vo1p0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+1,((input_width-w)/4)+j,4)); */
      vo2p0 = vfmaq_lane_f32(vo2p0, vi2x3456, vget_low_f32(vw0123), 1);
      /*@ assert dw_acc_1_2_4: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) && (input_height-output_height)+2<input_height ==> ext_same(vo2p0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+2,((input_width-w)/4)+j,4)); */

      vo0p0 = vfmaq_lane_f32(vo0p0, vi1x3456, vget_low_f32(vw4567), 0);
      /*@ assert dw_acc_1_0_5: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) && (input_height-output_height)+0<input_height ==> ext_same(vo0p0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+0,((input_width-w)/4)+j,5)); */
      vo1p0 = vfmaq_lane_f32(vo1p0, vi2x3456, vget_low_f32(vw4567), 0);
      /*@ assert dw_acc_1_1_5: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) && (input_height-output_height)+1<input_height ==> ext_same(vo1p0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+1,((input_width-w)/4)+j,5)); */
      vo2p0 = vfmaq_lane_f32(vo2p0, vi3x3456, vget_low_f32(vw4567), 0);
      /*@ assert dw_acc_1_2_5: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) && (input_height-output_height)+2<input_height ==> ext_same(vo2p0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+2,((input_width-w)/4)+j,5)); */

      vo0p0 = vfmaq_lane_f32(vo0p0, vi2x3456, vget_high_f32(vw4567), 1);
      /*@ assert dw_acc_1_0_6: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) && (input_height-output_height)+0<input_height ==> ext_same(vo0p0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+0,((input_width-w)/4)+j,6)); */
      vo1p0 = vfmaq_lane_f32(vo1p0, vi3x3456, vget_high_f32(vw4567), 1);
      /*@ assert dw_acc_1_1_6: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) && (input_height-output_height)+1<input_height ==> ext_same(vo1p0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+1,((input_width-w)/4)+j,6)); */
      vo2p0 = vfmaq_lane_f32(vo2p0, vi4x3456, vget_high_f32(vw4567), 1);
      /*@ assert dw_acc_1_2_6: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) && (input_height-output_height)+2<input_height ==> ext_same(vo2p0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+2,((input_width-w)/4)+j,6)); */

      vi0x0123 = vi0x4567;
      vi1x0123 = vi1x4567;
      vi2x0123 = vi2x4567;
      vi3x0123 = vi3x4567;
      vi4x0123 = vi4x4567;

      const float32x4_t vi0x5678 = vextq_f32(vi0x4567, vi0x89AB, 1);
      const float32x4_t vi1x5678 = vextq_f32(vi1x4567, vi1x89AB, 1);
      const float32x4_t vi2x5678 = vextq_f32(vi2x4567, vi2x89AB, 1);
      const float32x4_t vi3x5678 = vextq_f32(vi3x4567, vi3x89AB, 1);
      const float32x4_t vi4x5678 = vextq_f32(vi4x4567, vi4x89AB, 1);

      vo0p0 = vfmaq_lane_f32(vo0p0, vi0x5678, vget_high_f32(vw0123), 1);
      /*@ assert dw_acc_1_0_7: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) && (input_height-output_height)+0<input_height ==> ext_same(vo0p0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+0,((input_width-w)/4)+j,7)); */
      vo1p0 = vfmaq_lane_f32(vo1p0, vi1x5678, vget_high_f32(vw0123), 1);
      /*@ assert dw_acc_1_1_7: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) && (input_height-output_height)+1<input_height ==> ext_same(vo1p0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+1,((input_width-w)/4)+j,7)); */
      vo2p0 = vfmaq_lane_f32(vo2p0, vi2x5678, vget_high_f32(vw0123), 1);
      /*@ assert dw_acc_1_2_7: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) && (input_height-output_height)+2<input_height ==> ext_same(vo2p0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+2,((input_width-w)/4)+j,7)); */

      vo0p0 = vfmaq_lane_f32(vo0p0, vi1x5678, vget_high_f32(vw4567), 0);
      /*@ assert dw_acc_1_0_8: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) && (input_height-output_height)+0<input_height ==> ext_same(vo0p0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+0,((input_width-w)/4)+j,8)); */
      vo1p0 = vfmaq_lane_f32(vo1p0, vi2x5678, vget_high_f32(vw4567), 0);
      /*@ assert dw_acc_1_1_8: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) && (input_height-output_height)+1<input_height ==> ext_same(vo1p0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+1,((input_width-w)/4)+j,8)); */
      vo2p0 = vfmaq_lane_f32(vo2p0, vi3x5678, vget_high_f32(vw4567), 0);
      /*@ assert dw_acc_1_2_8: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) && (input_height-output_height)+2<input_height ==> ext_same(vo2p0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+2,((input_width-w)/4)+j,8)); */

      vo0p0 = vfmaq_lane_f32(vo0p0, vi2x5678, vw89, 1);
      /*@ assert dw_acc_1_0_9: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) && (input_height-output_height)+0<input_height ==> ext_same(vo0p0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+0,((input_width-w)/4)+j,9)); */
      vo1p0 = vfmaq_lane_f32(vo1p0, vi3x5678, vw89, 1);
      /*@ assert dw_acc_1_1_9: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) && (input_height-output_height)+1<input_height ==> ext_same(vo1p0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+1,((input_width-w)/4)+j,9)); */
      vo2p0 = vfmaq_lane_f32(vo2p0, vi4x5678, vw89, 1);
      /*@ assert dw_acc_1_2_9: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) && (input_height-output_height)+2<input_height ==> ext_same(vo2p0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+2,((input_width-w)/4)+j,9)); */

      vi0x4567 = vi0x89AB;
      vi1x4567 = vi1x89AB;
      vi2x4567 = vi2x89AB;
      vi3x4567 = vi3x89AB;
      vi4x4567 = vi4x89AB;


      float32x4_t vo0 = vmaxq_f32(vo0p0, vmin);
      float32x4_t vo1 = vmaxq_f32(vo1p0, vmin);
      float32x4_t vo2 = vmaxq_f32(vo2p0, vmin);

      vo0 = vminq_f32(vo0, vmax);
      vo1 = vminq_f32(vo1, vmax);
      vo2 = vminq_f32(vo2, vmax);

      vst1q_f32(o2, vo2); o2 += 4;
      vst1q_f32(o1, vo1); o1 += 4;
      vst1q_f32(o0, vo0); o0 += 4;
    }
    // Always process the last block of 1..4 pixels.
    assert(w >= 1 * sizeof(float));
    assert(w <= 4 * sizeof(float));
    {
      float32x4_t vo0p0 = vdupq_lane_f32(vget_low_f32(vw0123), 0);
      float32x4_t vo1p0 = vdupq_lane_f32(vget_low_f32(vw0123), 0);
      float32x4_t vo2p0 = vdupq_lane_f32(vget_low_f32(vw0123), 0);

      vi0x4567 = vreinterpretq_f32_u32(vandq_u32(vmask, vreinterpretq_u32_f32(vi0x4567)));
      vi1x4567 = vreinterpretq_f32_u32(vandq_u32(vmask, vreinterpretq_u32_f32(vi1x4567)));
      vi2x4567 = vreinterpretq_f32_u32(vandq_u32(vmask, vreinterpretq_u32_f32(vi2x4567)));
      vi3x4567 = vreinterpretq_f32_u32(vandq_u32(vmask, vreinterpretq_u32_f32(vi3x4567)));
      vi4x4567 = vreinterpretq_f32_u32(vandq_u32(vmask, vreinterpretq_u32_f32(vi4x4567)));

      vo0p0 = vfmaq_lane_f32(vo0p0, vi0x4567, vget_high_f32(vw0123), 0);
      /*@ assert dw_acc_2_0_1: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) && (input_height-output_height)+0<input_height ==> ext_same(vo0p0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+0,((input_width-w)/4)+j,1)); */
      vo1p0 = vfmaq_lane_f32(vo1p0, vi1x4567, vget_high_f32(vw0123), 0);
      /*@ assert dw_acc_2_1_1: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) && (input_height-output_height)+1<input_height ==> ext_same(vo1p0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+1,((input_width-w)/4)+j,1)); */
      vo2p0 = vfmaq_lane_f32(vo2p0, vi2x4567, vget_high_f32(vw0123), 0);
      /*@ assert dw_acc_2_2_1: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) && (input_height-output_height)+2<input_height ==> ext_same(vo2p0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+2,((input_width-w)/4)+j,1)); */

      vo0p0 = vfmaq_lane_f32(vo0p0, vi1x4567, vget_low_f32(vw4567), 1);
      /*@ assert dw_acc_2_0_2: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) && (input_height-output_height)+0<input_height ==> ext_same(vo0p0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+0,((input_width-w)/4)+j,2)); */
      vo1p0 = vfmaq_lane_f32(vo1p0, vi2x4567, vget_low_f32(vw4567), 1);
      /*@ assert dw_acc_2_1_2: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) && (input_height-output_height)+1<input_height ==> ext_same(vo1p0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+1,((input_width-w)/4)+j,2)); */
      vo2p0 = vfmaq_lane_f32(vo2p0, vi3x4567, vget_low_f32(vw4567), 1);
      /*@ assert dw_acc_2_2_2: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) && (input_height-output_height)+2<input_height ==> ext_same(vo2p0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+2,((input_width-w)/4)+j,2)); */

      vo0p0 = vfmaq_lane_f32(vo0p0, vi2x4567, vw89, 0);
      /*@ assert dw_acc_2_0_3: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) && (input_height-output_height)+0<input_height ==> ext_same(vo0p0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+0,((input_width-w)/4)+j,3)); */
      vo1p0 = vfmaq_lane_f32(vo1p0, vi3x4567, vw89, 0);
      /*@ assert dw_acc_2_1_3: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) && (input_height-output_height)+1<input_height ==> ext_same(vo1p0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+1,((input_width-w)/4)+j,3)); */
      vo2p0 = vfmaq_lane_f32(vo2p0, vi4x4567, vw89, 0);
      /*@ assert dw_acc_2_2_3: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) && (input_height-output_height)+2<input_height ==> ext_same(vo2p0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+2,((input_width-w)/4)+j,3)); */

      const float32x4_t vi0x3456 = vextq_f32(vi0x0123, vi0x4567, 3);
      const float32x4_t vi1x3456 = vextq_f32(vi1x0123, vi1x4567, 3);
      const float32x4_t vi2x3456 = vextq_f32(vi2x0123, vi2x4567, 3);
      const float32x4_t vi3x3456 = vextq_f32(vi3x0123, vi3x4567, 3);
      const float32x4_t vi4x3456 = vextq_f32(vi4x0123, vi4x4567, 3);

      vo0p0 = vfmaq_lane_f32(vo0p0, vi0x3456, vget_low_f32(vw0123), 1);
      /*@ assert dw_acc_2_0_4: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) && (input_height-output_height)+0<input_height ==> ext_same(vo0p0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+0,((input_width-w)/4)+j,4)); */
      vo1p0 = vfmaq_lane_f32(vo1p0, vi1x3456, vget_low_f32(vw0123), 1);
      /*@ assert dw_acc_2_1_4: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) && (input_height-output_height)+1<input_height ==> ext_same(vo1p0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+1,((input_width-w)/4)+j,4)); */
      vo2p0 = vfmaq_lane_f32(vo2p0, vi2x3456, vget_low_f32(vw0123), 1);
      /*@ assert dw_acc_2_2_4: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) && (input_height-output_height)+2<input_height ==> ext_same(vo2p0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+2,((input_width-w)/4)+j,4)); */

      vo0p0 = vfmaq_lane_f32(vo0p0, vi1x3456, vget_low_f32(vw4567), 0);
      /*@ assert dw_acc_2_0_5: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) && (input_height-output_height)+0<input_height ==> ext_same(vo0p0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+0,((input_width-w)/4)+j,5)); */
      vo1p0 = vfmaq_lane_f32(vo1p0, vi2x3456, vget_low_f32(vw4567), 0);
      /*@ assert dw_acc_2_1_5: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) && (input_height-output_height)+1<input_height ==> ext_same(vo1p0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+1,((input_width-w)/4)+j,5)); */
      vo2p0 = vfmaq_lane_f32(vo2p0, vi3x3456, vget_low_f32(vw4567), 0);
      /*@ assert dw_acc_2_2_5: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) && (input_height-output_height)+2<input_height ==> ext_same(vo2p0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+2,((input_width-w)/4)+j,5)); */

      vo0p0 = vfmaq_lane_f32(vo0p0, vi2x3456, vget_high_f32(vw4567), 1);
      /*@ assert dw_acc_2_0_6: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) && (input_height-output_height)+0<input_height ==> ext_same(vo0p0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+0,((input_width-w)/4)+j,6)); */
      vo1p0 = vfmaq_lane_f32(vo1p0, vi3x3456, vget_high_f32(vw4567), 1);
      /*@ assert dw_acc_2_1_6: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) && (input_height-output_height)+1<input_height ==> ext_same(vo1p0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+1,((input_width-w)/4)+j,6)); */
      vo2p0 = vfmaq_lane_f32(vo2p0, vi4x3456, vget_high_f32(vw4567), 1);
      /*@ assert dw_acc_2_2_6: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) && (input_height-output_height)+2<input_height ==> ext_same(vo2p0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+2,((input_width-w)/4)+j,6)); */

      const float32x4_t vzero = vmovq_n_f32(0.0f);
      const float32x4_t vi0x5678 = vextq_f32(vi0x4567, vzero, 1);
      const float32x4_t vi1x5678 = vextq_f32(vi1x4567, vzero, 1);
      const float32x4_t vi2x5678 = vextq_f32(vi2x4567, vzero, 1);
      const float32x4_t vi3x5678 = vextq_f32(vi3x4567, vzero, 1);
      const float32x4_t vi4x5678 = vextq_f32(vi4x4567, vzero, 1);

      vo0p0 = vfmaq_lane_f32(vo0p0, vi0x5678, vget_high_f32(vw0123), 1);
      /*@ assert dw_acc_2_0_7: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) && (input_height-output_height)+0<input_height ==> ext_same(vo0p0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+0,((input_width-w)/4)+j,7)); */
      vo1p0 = vfmaq_lane_f32(vo1p0, vi1x5678, vget_high_f32(vw0123), 1);
      /*@ assert dw_acc_2_1_7: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) && (input_height-output_height)+1<input_height ==> ext_same(vo1p0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+1,((input_width-w)/4)+j,7)); */
      vo2p0 = vfmaq_lane_f32(vo2p0, vi2x5678, vget_high_f32(vw0123), 1);
      /*@ assert dw_acc_2_2_7: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) && (input_height-output_height)+2<input_height ==> ext_same(vo2p0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+2,((input_width-w)/4)+j,7)); */

      vo0p0 = vfmaq_lane_f32(vo0p0, vi1x5678, vget_high_f32(vw4567), 0);
      /*@ assert dw_acc_2_0_8: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) && (input_height-output_height)+0<input_height ==> ext_same(vo0p0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+0,((input_width-w)/4)+j,8)); */
      vo1p0 = vfmaq_lane_f32(vo1p0, vi2x5678, vget_high_f32(vw4567), 0);
      /*@ assert dw_acc_2_1_8: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) && (input_height-output_height)+1<input_height ==> ext_same(vo1p0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+1,((input_width-w)/4)+j,8)); */
      vo2p0 = vfmaq_lane_f32(vo2p0, vi3x5678, vget_high_f32(vw4567), 0);
      /*@ assert dw_acc_2_2_8: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) && (input_height-output_height)+2<input_height ==> ext_same(vo2p0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+2,((input_width-w)/4)+j,8)); */

      vo0p0 = vfmaq_lane_f32(vo0p0, vi2x5678, vw89, 1);
      /*@ assert dw_acc_2_0_9: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) && (input_height-output_height)+0<input_height ==> ext_same(vo0p0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+0,((input_width-w)/4)+j,9)); */
      vo1p0 = vfmaq_lane_f32(vo1p0, vi3x5678, vw89, 1);
      /*@ assert dw_acc_2_1_9: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) && (input_height-output_height)+1<input_height ==> ext_same(vo1p0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+1,((input_width-w)/4)+j,9)); */
      vo2p0 = vfmaq_lane_f32(vo2p0, vi4x5678, vw89, 1);
      /*@ assert dw_acc_2_2_9: \forall integer j;0<=j<4 && ((input_width-w)/4)+j<(input_width/4) && (input_height-output_height)+2<input_height ==> ext_same(vo2p0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+2,((input_width-w)/4)+j,9)); */


      float32x4_t vo0 = vmaxq_f32(vo0p0, vmin);
      float32x4_t vo1 = vmaxq_f32(vo1p0, vmin);
      float32x4_t vo2 = vmaxq_f32(vo2p0, vmin);

      vo0 = vminq_f32(vo0, vmax);
      vo1 = vminq_f32(vo1, vmax);
      vo2 = vminq_f32(vo2, vmax);

      if XNN_LIKELY(w == 4 * sizeof(float)) {
        vst1q_f32(o2, vo2); o2 += 4;
        vst1q_f32(o1, vo1); o1 += 4;
        vst1q_f32(o0, vo0); o0 += 4;
      } else {
        float32x2_t vo0_lo = vget_low_f32(vo0);
        float32x2_t vo1_lo = vget_low_f32(vo1);
        float32x2_t vo2_lo = vget_low_f32(vo2);
        if (w & (2 * sizeof(float))) {
          vst1_f32(o2, vo2_lo); o2 += 2;
          vst1_f32(o1, vo1_lo); o1 += 2;
          vst1_f32(o0, vo0_lo); o0 += 2;

          vo0_lo = vget_high_f32(vo0);
          vo1_lo = vget_high_f32(vo1);
          vo2_lo = vget_high_f32(vo2);
        }
        if (w & (1 * sizeof(float))) {
          vst1_lane_f32(o2, vo2_lo, 0); o2 += 1;
          vst1_lane_f32(o1, vo1_lo, 0); o1 += 1;
          vst1_lane_f32(o0, vo0_lo, 0); o0 += 1;
        }
      }
    }

    i0 = (const float*) ((uintptr_t) i3 - input_decrement);
    i1 = (const float*) ((uintptr_t) i4 - input_decrement);
    i2 = (const float*) ((uintptr_t) i1 + input_width);
    i3 = (const float*) ((uintptr_t) i2 + input_width);
    i4 = (const float*) ((uintptr_t) i3 + input_width);

    o0 = o2;
    o1 = (float*) ((uintptr_t) o0 + input_width);
    o2 = (float*) ((uintptr_t) o1 + input_width);

    output_height = doz(output_height, 3);
  } while (output_height != 0);
}
