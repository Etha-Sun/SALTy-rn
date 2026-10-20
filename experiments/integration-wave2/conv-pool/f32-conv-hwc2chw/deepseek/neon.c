/*@ logic float *cv_row(float *I,float *Z,integer H,integer W,integer y) = y<0 || y>=H?Z:I+3*y*W;
     logic float cv_sample{L}(float *I,float *Z,integer H,integer W,integer y,integer x,integer ch) =
      x<0 || x>=W ? 0.0f : cv_row(I,Z,H,W,y)[3*x+ch];
     logic float cv_fold{L}(float *I,float *Z,float *WT,integer H,integer W,integer pad,integer y,integer x,integer ch,integer t) =
      t<=0 ? WT[(ch/4)*112+ch%4] :
      shim_fma32(WT[(ch/4)*112+4+4*(t-1)+ch%4],
       cv_sample(I,Z,H,W,2*y-pad+(t-1)%3,2*x-1+(t-1)/9,((t-1)/3)%3),cv_fold(I,Z,WT,H,W,pad,y,x,ch,t-1));
     logic integer cv_effective_ch(integer C,integer ch) = C%4!=0 && ch==C-1 ? (ch/4)*4+3 : ch;
     logic integer cv_neon_steps(integer W,integer x) = W%2!=0 && x==W/2?18:27;
     logic float cv_progress{L}(float *I,float *Z,float *WT,integer H,integer W,integer pad,integer y,integer x,integer ch,integer t) =
 cv_fold(I,Z,WT,H,W,pad,y,x,ch,t<cv_neon_steps(W,x)?t:cv_neon_steps(W,x));
 logic float cv_clamp(float x,float lo,float hi) = ext_neon_min32(ext_neon_max32(x,lo),hi);
*/
/*@ lemma cv_fold_zero{L}: \forall float *I,*Z,*WT;\forall integer H,W,pad,y,x,c;ext_same(cv_fold(I,Z,WT,H,W,pad,y,x,c,0),WT[(c/4)*112+c%4]);
     lemma cv_fold_step{L}: \forall float *I,*Z,*WT;\forall integer H,W,pad,y,x,c,t;t>=0 ==> ext_same(cv_fold(I,Z,WT,H,W,pad,y,x,c,t+1),shim_fma32(WT[(c/4)*112+4+4*t+c%4],cv_sample(I,Z,H,W,2*y-pad+t%3,2*x-1+t/9,(t/3)%3),cv_fold(I,Z,WT,H,W,pad,y,x,c,t)));
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
    size_t output_y_start,
    size_t output_y_end,
    const float* input,
    const float* zero,
    const float* weights,
    float* output,
    size_t input_padding_top,
    size_t output_channels,
    size_t output_height_stride,
    size_t output_channel_stride,
    const struct xnn_f32_minmax_params* restrict params) XNN_OOB_READS
{
#line 25 "./neon.c"
  assert(input_width != 0);
#line 26 "./neon.c"
  assert(output_y_end > output_y_start);
#line 27 "./neon.c"
  assert(input_padding_top <= 1);
#line 28 "./neon.c"
  assert(output_channels != 0);

  //@ ghost CvN: ;
  /*@ ghost const float *cv_I=input; const float *cv_Z=zero; const float *cv_W=weights; float *cv_O=output; */
  const size_t input_height_stride = input_width * 3 /* channels */ * sizeof(float);
  const size_t input_width_increment = round_down_po2(input_width, 4) * 3 /* channels */ * sizeof(float);
  const size_t output_width = (input_width + 1) / 2;
  const size_t output_channel_increment = output_channel_stride * 4 - output_width * sizeof(float);

  // Adjustment for padding processed below
  const float* i0 = (const float*) ((uintptr_t) input + input_height_stride * (output_y_start * 2 - input_padding_top));
  const float* i1 = (const float*) ((uintptr_t) i0 + input_height_stride);
  const float* i2 = (const float*) ((uintptr_t) i1 + input_height_stride);
  const float* i3 = (const float*) ((uintptr_t) i2 + input_height_stride);
  const float* i4 = (const float*) ((uintptr_t) i3 + input_height_stride);
  float* output0 = (float*) ((uintptr_t) output + output_height_stride * output_y_start);
  float* output1 = (float*) ((uintptr_t) output0 + output_height_stride);

  if XNN_UNPREDICTABLE(output_y_start < input_padding_top) {
    i0 = zero;
  }

  const float32x4_t vmin = vld1q_dup_f32(&params->scalar.min);
  const float32x4_t vmax = vld1q_dup_f32(&params->scalar.max);

  /*@ loop invariant cv_y: output_y_start<=output_y<=output_y_end+1;
      loop invariant cv_output_rows: \forall integer yy,xx,cc; output_y_start<=yy<output_y && yy<output_y_end && 0<=xx<output_width && 0<=cc<output_channels ==> ext_same(cv_O[(cc)*(output_channel_stride/4)+(yy)*(output_height_stride/4)+(xx)],cv_clamp(cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,yy,xx,cv_effective_ch(output_channels,cc),cv_neon_steps(input_width,xx)),params->scalar.min,params->scalar.max));
      loop invariant cv_outer_i0: output_y<output_y_end && 0<=2*output_y-input_padding_top+0<input_height ==> i0==cv_I+3*(2*output_y-input_padding_top+0)*input_width;
      loop invariant cv_outer_i1: output_y<output_y_end && 0<=2*output_y-input_padding_top+1<input_height ==> i1==cv_I+3*(2*output_y-input_padding_top+1)*input_width;
      loop invariant cv_outer_i2: output_y<output_y_end && 0<=2*output_y-input_padding_top+2<input_height ==> i2==cv_I+3*(2*output_y-input_padding_top+2)*input_width;
      loop invariant cv_outer_i3: output_y<output_y_end && 0<=2*output_y-input_padding_top+3<input_height ==> i3==cv_I+3*(2*output_y-input_padding_top+3)*input_width;
      loop invariant cv_outer_i4: output_y<output_y_end && 0<=2*output_y-input_padding_top+4<input_height ==> i4==cv_I+3*(2*output_y-input_padding_top+4)*input_width;
      loop invariant cv_outer_o0: output_y<output_y_end ==> output0==cv_O+output_y*(output_height_stride/4);
      loop invariant cv_outer_o1: output_y+1<output_y_end ==> output1==cv_O+(output_y+1)*(output_height_stride/4);
      loop assigns output_y,i0,i1,i2,i3,i4,output0,output1,cv_O[0..output_channels*(output_channel_stride/4)-1],errno;
      loop variant output_y_end-output_y;
  */
  for (size_t output_y = output_y_start; output_y < output_y_end; output_y += 2) {
    const size_t input_y2 = output_y * 2 + 2 - input_padding_top;
    const size_t input_y4 = input_y2 + 2;
    if XNN_UNPREDICTABLE(input_y2 >= input_height) {
      i2 = zero;
    }
    if XNN_UNPREDICTABLE(input_y4 > input_height) {
      i3 = zero;
    }
    if XNN_UNPREDICTABLE(input_y4 >= input_height) {
      i4 = zero;
    }
    if XNN_UNPREDICTABLE(output_y + 2 > output_y_end) {
      output1 = output0;
    }

    const float* w = weights;
    size_t c = output_channels;
    float* o0c0 = output0;
    float* o1c0 = output1;
    float* o0c1 = (float*) ((uintptr_t) o0c0 + output_channel_stride);
    float* o1c1 = (float*) ((uintptr_t) o1c0 + output_channel_stride);
    float* o0c2 = (float*) ((uintptr_t) o0c1 + output_channel_stride);
    float* o1c2 = (float*) ((uintptr_t) o1c1 + output_channel_stride);
    float* o0c3 = (float*) ((uintptr_t) o0c2 + output_channel_stride);
    float* o1c3 = (float*) ((uintptr_t) o1c2 + output_channel_stride);
    /*@ loop invariant cv_channels: 0<c<=output_channels;
        loop invariant cv_channel_block: (output_channels-c)%4==0;
        loop invariant cv_weight_cursor: w==cv_W+((output_channels-c)/4)*112;
        loop invariant cv_output_channels: \forall integer yy,xx,cc;output_y<=yy<output_y+2 && yy<output_y_end && 0<=xx<output_width && 0<=cc<(output_channels-c) ==> ext_same(cv_O[(cc)*(output_channel_stride/4)+(yy)*(output_height_stride/4)+(xx)],cv_clamp(cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,yy,xx,cv_effective_ch(output_channels,cc),cv_neon_steps(input_width,xx)),params->scalar.min,params->scalar.max));
        loop invariant cv_row_i0: i0==cv_row(cv_I,cv_Z,input_height,input_width,2*output_y-input_padding_top+0);
        loop invariant cv_row_i1: i1==cv_row(cv_I,cv_Z,input_height,input_width,2*output_y-input_padding_top+1);
        loop invariant cv_row_i2: i2==cv_row(cv_I,cv_Z,input_height,input_width,2*output_y-input_padding_top+2);
        loop invariant cv_row_i3: i3==cv_row(cv_I,cv_Z,input_height,input_width,2*output_y-input_padding_top+3);
        loop invariant cv_row_i4: i4==cv_row(cv_I,cv_Z,input_height,input_width,2*output_y-input_padding_top+4);
        loop assigns c,w,i0,i1,i2,i3,i4,o0c0,o0c1,o0c2,o0c3,o1c0,o1c1,o1c2,o1c3,cv_O[0..output_channels*(output_channel_stride/4)-1],errno;
        loop variant c;
    */
    do {
      if XNN_UNPREDICTABLE(c < 2) {
        o0c1 = o0c0;
        o1c1 = o1c0;
      }
      if XNN_UNPREDICTABLE(c <= 2) {
        o0c2 = o0c1;
        o1c2 = o1c1;
      }
      if XNN_UNPREDICTABLE(c < 4) {
        o0c3 = o0c2;
        o1c3 = o1c2;
      }

      // viMx0 = ( iM0c2, iM0c1, iM0c0, --- )
      float32x4_t vi0x0 = vmovq_n_f32(0.0f);
      float32x4_t vi1x0 = vmovq_n_f32(0.0f);
      float32x4_t vi2x0 = vmovq_n_f32(0.0f);
      float32x4_t vi3x0 = vmovq_n_f32(0.0f);
      float32x4_t vi4x0 = vmovq_n_f32(0.0f);

      size_t iw = input_width;
      /*@ loop invariant cv_width: 0<=iw<=input_width && (input_width-iw)%4==0;
          loop invariant cv_output_width: \forall integer yy,xx,cc;output_y<=yy<output_y+2 && yy<output_y_end && 0<=xx<((input_width-iw)/2) && (output_channels-c)<=cc<(output_channels-c)+4 && cc<output_channels ==> ext_same(cv_O[(cc)*(output_channel_stride/4)+(yy)*(output_height_stride/4)+(xx)],cv_clamp(cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,yy,xx,cv_effective_ch(output_channels,cc),cv_neon_steps(input_width,xx)),params->scalar.min,params->scalar.max));
          loop invariant cv_i0: i0==cv_row(cv_I,cv_Z,input_height,input_width,2*output_y-input_padding_top+0)+3*(input_width-iw);
          loop invariant cv_i1: i1==cv_row(cv_I,cv_Z,input_height,input_width,2*output_y-input_padding_top+1)+3*(input_width-iw);
          loop invariant cv_i2: i2==cv_row(cv_I,cv_Z,input_height,input_width,2*output_y-input_padding_top+2)+3*(input_width-iw);
          loop invariant cv_i3: i3==cv_row(cv_I,cv_Z,input_height,input_width,2*output_y-input_padding_top+3)+3*(input_width-iw);
          loop invariant cv_i4: i4==cv_row(cv_I,cv_Z,input_height,input_width,2*output_y-input_padding_top+4)+3*(input_width-iw);
          loop invariant cv_output_cursor00: o0c0==cv_O+((output_channels-c)+(0<c?0:c-1))*(output_channel_stride/4)+output_y*(output_height_stride/4)+((input_width-iw)/2);
          loop invariant cv_output_cursor01: o0c1==cv_O+((output_channels-c)+(1<c?1:c-1))*(output_channel_stride/4)+output_y*(output_height_stride/4)+((input_width-iw)/2);
          loop invariant cv_output_cursor02: o0c2==cv_O+((output_channels-c)+(2<c?2:c-1))*(output_channel_stride/4)+output_y*(output_height_stride/4)+((input_width-iw)/2);
          loop invariant cv_output_cursor03: o0c3==cv_O+((output_channels-c)+(3<c?3:c-1))*(output_channel_stride/4)+output_y*(output_height_stride/4)+((input_width-iw)/2);
          loop invariant cv_output_cursor10: o1c0==cv_O+((output_channels-c)+(0<c?0:c-1))*(output_channel_stride/4)+(output_y+1<output_y_end?output_y+1:output_y)*(output_height_stride/4)+((input_width-iw)/2);
          loop invariant cv_output_cursor11: o1c1==cv_O+((output_channels-c)+(1<c?1:c-1))*(output_channel_stride/4)+(output_y+1<output_y_end?output_y+1:output_y)*(output_height_stride/4)+((input_width-iw)/2);
          loop invariant cv_output_cursor12: o1c2==cv_O+((output_channels-c)+(2<c?2:c-1))*(output_channel_stride/4)+(output_y+1<output_y_end?output_y+1:output_y)*(output_height_stride/4)+((input_width-iw)/2);
          loop invariant cv_output_cursor13: o1c3==cv_O+((output_channels-c)+(3<c?3:c-1))*(output_channel_stride/4)+(output_y+1<output_y_end?output_y+1:output_y)*(output_height_stride/4)+((input_width-iw)/2);
          loop assigns iw,vi0x0,vi1x0,vi2x0,vi3x0,vi4x0,i0,i1,i2,i3,i4,o0c0,o0c1,o0c2,o0c3,o1c0,o1c1,o1c2,o1c3,cv_O[0..output_channels*(output_channel_stride/4)-1],errno;
          loop variant iw;
      */
      for (; iw >= 4; iw -= 4) {
        float32x4_t vo0x0 = vld1q_f32(w);
        float32x4_t vo1x0 = vo0x0;
        float32x4_t vo0x1 = vo0x0;
        float32x4_t vo1x1 = vo0x0;

        const float32x4_t vk00c0 = vld1q_f32(w + 4);

        // viMx1 = ( iM2c0, iM1c2, iM1c1, iM1c0 )
        const float32x4_t vi0x1 = vld1q_f32(i0); i0 += 4;
        const float32x4_t vi1x1 = vld1q_f32(i1); i1 += 4;
        const float32x4_t vi2x1 = vld1q_f32(i2); i2 += 4;
        const float32x4_t vi3x1 = vld1q_f32(i3); i3 += 4;
        const float32x4_t vi4x1 = vld1q_f32(i4); i4 += 4;

        vo0x0 = vfmaq_laneq_f32(vo0x0, vk00c0, vi0x0, 1);
        /*@ assert cv_acc_1_vo0x0_1: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo0x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+0),((output_channels-c)+j),1)); */
        vo1x0 = vfmaq_laneq_f32(vo1x0, vk00c0, vi2x0, 1);
        /*@ assert cv_acc_1_vo1x0_1: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo1x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+0),((output_channels-c)+j),1)); */
        vo0x1 = vfmaq_laneq_f32(vo0x1, vk00c0, vi0x1, 3);
        /*@ assert cv_acc_1_vo0x1_1: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo0x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+1),((output_channels-c)+j),1)); */
        vo1x1 = vfmaq_laneq_f32(vo1x1, vk00c0, vi2x1, 3);
        /*@ assert cv_acc_1_vo1x1_1: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo1x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+1),((output_channels-c)+j),1)); */

        const float32x4_t vk10c0 = vld1q_f32(w + 8);

        vo0x0 = vfmaq_laneq_f32(vo0x0, vk10c0, vi1x0, 1);
        /*@ assert cv_acc_1_vo0x0_2: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo0x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+0),((output_channels-c)+j),2)); */
        vo1x0 = vfmaq_laneq_f32(vo1x0, vk10c0, vi3x0, 1);
        /*@ assert cv_acc_1_vo1x0_2: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo1x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+0),((output_channels-c)+j),2)); */
        vo0x1 = vfmaq_laneq_f32(vo0x1, vk10c0, vi1x1, 3);
        /*@ assert cv_acc_1_vo0x1_2: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo0x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+1),((output_channels-c)+j),2)); */
        vo1x1 = vfmaq_laneq_f32(vo1x1, vk10c0, vi3x1, 3);
        /*@ assert cv_acc_1_vo1x1_2: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo1x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+1),((output_channels-c)+j),2)); */

        const float32x4_t vk20c0 = vld1q_f32(w + 12);

        vo0x0 = vfmaq_laneq_f32(vo0x0, vk20c0, vi2x0, 1);
        /*@ assert cv_acc_1_vo0x0_3: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo0x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+0),((output_channels-c)+j),3)); */
        vo1x0 = vfmaq_laneq_f32(vo1x0, vk20c0, vi4x0, 1);
        /*@ assert cv_acc_1_vo1x0_3: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo1x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+0),((output_channels-c)+j),3)); */
        vo0x1 = vfmaq_laneq_f32(vo0x1, vk20c0, vi2x1, 3);
        /*@ assert cv_acc_1_vo0x1_3: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo0x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+1),((output_channels-c)+j),3)); */
        vo1x1 = vfmaq_laneq_f32(vo1x1, vk20c0, vi4x1, 3);
        /*@ assert cv_acc_1_vo1x1_3: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo1x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+1),((output_channels-c)+j),3)); */

        const float32x4_t vk00c1 = vld1q_f32(w + 16);

        // viMx2 = ( iM3c1, iM3c0, iM2c2, iM2c1 )
        const float32x4_t vi0x2 = vld1q_f32(i0); i0 += 4;
        const float32x4_t vi1x2 = vld1q_f32(i1); i1 += 4;
        const float32x4_t vi2x2 = vld1q_f32(i2); i2 += 4;
        const float32x4_t vi3x2 = vld1q_f32(i3); i3 += 4;
        const float32x4_t vi4x2 = vld1q_f32(i4); i4 += 4;

        vo0x0 = vfmaq_laneq_f32(vo0x0, vk00c1, vi0x0, 2);
        /*@ assert cv_acc_1_vo0x0_4: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo0x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+0),((output_channels-c)+j),4)); */
        vo1x0 = vfmaq_laneq_f32(vo1x0, vk00c1, vi2x0, 2);
        /*@ assert cv_acc_1_vo1x0_4: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo1x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+0),((output_channels-c)+j),4)); */
        vo0x1 = vfmaq_laneq_f32(vo0x1, vk00c1, vi0x2, 0);
        /*@ assert cv_acc_1_vo0x1_4: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo0x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+1),((output_channels-c)+j),4)); */
        vo1x1 = vfmaq_laneq_f32(vo1x1, vk00c1, vi2x2, 0);
        /*@ assert cv_acc_1_vo1x1_4: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo1x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+1),((output_channels-c)+j),4)); */

        const float32x4_t vk10c1 = vld1q_f32(w + 20);

        vo0x0 = vfmaq_laneq_f32(vo0x0, vk10c1, vi1x0, 2);
        /*@ assert cv_acc_1_vo0x0_5: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo0x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+0),((output_channels-c)+j),5)); */
        vo1x0 = vfmaq_laneq_f32(vo1x0, vk10c1, vi3x0, 2);
        /*@ assert cv_acc_1_vo1x0_5: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo1x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+0),((output_channels-c)+j),5)); */
        vo0x1 = vfmaq_laneq_f32(vo0x1, vk10c1, vi1x2, 0);
        /*@ assert cv_acc_1_vo0x1_5: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo0x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+1),((output_channels-c)+j),5)); */
        vo1x1 = vfmaq_laneq_f32(vo1x1, vk10c1, vi3x2, 0);
        /*@ assert cv_acc_1_vo1x1_5: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo1x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+1),((output_channels-c)+j),5)); */

        const float32x4_t vk20c1 = vld1q_f32(w + 24);

        vo0x0 = vfmaq_laneq_f32(vo0x0, vk20c1, vi2x0, 2);
        /*@ assert cv_acc_1_vo0x0_6: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo0x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+0),((output_channels-c)+j),6)); */
        vo1x0 = vfmaq_laneq_f32(vo1x0, vk20c1, vi4x0, 2);
        /*@ assert cv_acc_1_vo1x0_6: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo1x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+0),((output_channels-c)+j),6)); */
        vo0x1 = vfmaq_laneq_f32(vo0x1, vk20c1, vi2x2, 0);
        /*@ assert cv_acc_1_vo0x1_6: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo0x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+1),((output_channels-c)+j),6)); */
        vo1x1 = vfmaq_laneq_f32(vo1x1, vk20c1, vi4x2, 0);
        /*@ assert cv_acc_1_vo1x1_6: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo1x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+1),((output_channels-c)+j),6)); */

        const float32x4_t vk00c2 = vld1q_f32(w + 28);

        vo0x0 = vfmaq_laneq_f32(vo0x0, vk00c2, vi0x0, 3);
        /*@ assert cv_acc_1_vo0x0_7: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo0x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+0),((output_channels-c)+j),7)); */
        vo1x0 = vfmaq_laneq_f32(vo1x0, vk00c2, vi2x0, 3);
        /*@ assert cv_acc_1_vo1x0_7: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo1x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+0),((output_channels-c)+j),7)); */
        vo0x1 = vfmaq_laneq_f32(vo0x1, vk00c2, vi0x2, 1);
        /*@ assert cv_acc_1_vo0x1_7: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo0x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+1),((output_channels-c)+j),7)); */
        vo1x1 = vfmaq_laneq_f32(vo1x1, vk00c2, vi2x2, 1);
        /*@ assert cv_acc_1_vo1x1_7: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo1x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+1),((output_channels-c)+j),7)); */

        const float32x4_t vk10c2 = vld1q_f32(w + 32);

        vo0x0 = vfmaq_laneq_f32(vo0x0, vk10c2, vi1x0, 3);
        /*@ assert cv_acc_1_vo0x0_8: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo0x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+0),((output_channels-c)+j),8)); */
        vo1x0 = vfmaq_laneq_f32(vo1x0, vk10c2, vi3x0, 3);
        /*@ assert cv_acc_1_vo1x0_8: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo1x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+0),((output_channels-c)+j),8)); */
        vo0x1 = vfmaq_laneq_f32(vo0x1, vk10c2, vi1x2, 1);
        /*@ assert cv_acc_1_vo0x1_8: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo0x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+1),((output_channels-c)+j),8)); */
        vo1x1 = vfmaq_laneq_f32(vo1x1, vk10c2, vi3x2, 1);
        /*@ assert cv_acc_1_vo1x1_8: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo1x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+1),((output_channels-c)+j),8)); */

        const float32x4_t vk20c2 = vld1q_f32(w + 36);

        vo0x0 = vfmaq_laneq_f32(vo0x0, vk20c2, vi2x0, 3);
        /*@ assert cv_acc_1_vo0x0_9: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo0x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+0),((output_channels-c)+j),9)); */
        vo1x0 = vfmaq_laneq_f32(vo1x0, vk20c2, vi4x0, 3);
        /*@ assert cv_acc_1_vo1x0_9: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo1x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+0),((output_channels-c)+j),9)); */
        vo0x1 = vfmaq_laneq_f32(vo0x1, vk20c2, vi2x2, 1);
        /*@ assert cv_acc_1_vo0x1_9: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo0x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+1),((output_channels-c)+j),9)); */
        vo1x1 = vfmaq_laneq_f32(vo1x1, vk20c2, vi4x2, 1);
        /*@ assert cv_acc_1_vo1x1_9: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo1x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+1),((output_channels-c)+j),9)); */

        const float32x4_t vk01c0 = vld1q_f32(w + 40);

        vo0x0 = vfmaq_laneq_f32(vo0x0, vk01c0, vi0x1, 0);
        /*@ assert cv_acc_1_vo0x0_10: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo0x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+0),((output_channels-c)+j),10)); */
        vo1x0 = vfmaq_laneq_f32(vo1x0, vk01c0, vi2x1, 0);
        /*@ assert cv_acc_1_vo1x0_10: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo1x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+0),((output_channels-c)+j),10)); */
        vo0x1 = vfmaq_laneq_f32(vo0x1, vk01c0, vi0x2, 2);
        /*@ assert cv_acc_1_vo0x1_10: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo0x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+1),((output_channels-c)+j),10)); */
        vo1x1 = vfmaq_laneq_f32(vo1x1, vk01c0, vi2x2, 2);
        /*@ assert cv_acc_1_vo1x1_10: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo1x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+1),((output_channels-c)+j),10)); */

        const float32x4_t vk11c0 = vld1q_f32(w + 44);

        vo0x0 = vfmaq_laneq_f32(vo0x0, vk11c0, vi1x1, 0);
        /*@ assert cv_acc_1_vo0x0_11: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo0x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+0),((output_channels-c)+j),11)); */
        vo1x0 = vfmaq_laneq_f32(vo1x0, vk11c0, vi3x1, 0);
        /*@ assert cv_acc_1_vo1x0_11: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo1x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+0),((output_channels-c)+j),11)); */
        vo0x1 = vfmaq_laneq_f32(vo0x1, vk11c0, vi1x2, 2);
        /*@ assert cv_acc_1_vo0x1_11: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo0x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+1),((output_channels-c)+j),11)); */
        vo1x1 = vfmaq_laneq_f32(vo1x1, vk11c0, vi3x2, 2);
        /*@ assert cv_acc_1_vo1x1_11: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo1x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+1),((output_channels-c)+j),11)); */

        const float32x4_t vk21c0 = vld1q_f32(w + 48);

        vo0x0 = vfmaq_laneq_f32(vo0x0, vk21c0, vi2x1, 0);
        /*@ assert cv_acc_1_vo0x0_12: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo0x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+0),((output_channels-c)+j),12)); */
        vo1x0 = vfmaq_laneq_f32(vo1x0, vk21c0, vi4x1, 0);
        /*@ assert cv_acc_1_vo1x0_12: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo1x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+0),((output_channels-c)+j),12)); */
        vo0x1 = vfmaq_laneq_f32(vo0x1, vk21c0, vi2x2, 2);
        /*@ assert cv_acc_1_vo0x1_12: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo0x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+1),((output_channels-c)+j),12)); */
        vo1x1 = vfmaq_laneq_f32(vo1x1, vk21c0, vi4x2, 2);
        /*@ assert cv_acc_1_vo1x1_12: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo1x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+1),((output_channels-c)+j),12)); */

        const float32x4_t vk01c1 = vld1q_f32(w + 52);

        vo0x0 = vfmaq_laneq_f32(vo0x0, vk01c1, vi0x1, 1);
        /*@ assert cv_acc_1_vo0x0_13: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo0x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+0),((output_channels-c)+j),13)); */
        vo1x0 = vfmaq_laneq_f32(vo1x0, vk01c1, vi2x1, 1);
        /*@ assert cv_acc_1_vo1x0_13: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo1x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+0),((output_channels-c)+j),13)); */
        vo0x1 = vfmaq_laneq_f32(vo0x1, vk01c1, vi0x2, 3);
        /*@ assert cv_acc_1_vo0x1_13: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo0x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+1),((output_channels-c)+j),13)); */
        vo1x1 = vfmaq_laneq_f32(vo1x1, vk01c1, vi2x2, 3);
        /*@ assert cv_acc_1_vo1x1_13: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo1x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+1),((output_channels-c)+j),13)); */

        const float32x4_t vk11c1 = vld1q_f32(w + 56);

        vo0x0 = vfmaq_laneq_f32(vo0x0, vk11c1, vi1x1, 1);
        /*@ assert cv_acc_1_vo0x0_14: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo0x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+0),((output_channels-c)+j),14)); */
        vo1x0 = vfmaq_laneq_f32(vo1x0, vk11c1, vi3x1, 1);
        /*@ assert cv_acc_1_vo1x0_14: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo1x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+0),((output_channels-c)+j),14)); */
        vo0x1 = vfmaq_laneq_f32(vo0x1, vk11c1, vi1x2, 3);
        /*@ assert cv_acc_1_vo0x1_14: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo0x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+1),((output_channels-c)+j),14)); */
        vo1x1 = vfmaq_laneq_f32(vo1x1, vk11c1, vi3x2, 3);
        /*@ assert cv_acc_1_vo1x1_14: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo1x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+1),((output_channels-c)+j),14)); */

        const float32x4_t vk21c1 = vld1q_f32(w + 60);

        vo0x0 = vfmaq_laneq_f32(vo0x0, vk21c1, vi2x1, 1);
        /*@ assert cv_acc_1_vo0x0_15: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo0x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+0),((output_channels-c)+j),15)); */
        vo1x0 = vfmaq_laneq_f32(vo1x0, vk21c1, vi4x1, 1);
        /*@ assert cv_acc_1_vo1x0_15: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo1x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+0),((output_channels-c)+j),15)); */
        vo0x1 = vfmaq_laneq_f32(vo0x1, vk21c1, vi2x2, 3);
        /*@ assert cv_acc_1_vo0x1_15: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo0x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+1),((output_channels-c)+j),15)); */
        vo1x1 = vfmaq_laneq_f32(vo1x1, vk21c1, vi4x2, 3);
        /*@ assert cv_acc_1_vo1x1_15: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo1x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+1),((output_channels-c)+j),15)); */

        const float32x4_t vk01c2 = vld1q_f32(w + 64);

        // viMx3 = ( iM4c2, iM4c1, iM4c0, iM3c2 )
        const float32x4_t vi0x3 = vld1q_f32(i0); i0 += 4;
        const float32x4_t vi1x3 = vld1q_f32(i1); i1 += 4;
        const float32x4_t vi2x3 = vld1q_f32(i2); i2 += 4;
        const float32x4_t vi3x3 = vld1q_f32(i3); i3 += 4;
        const float32x4_t vi4x3 = vld1q_f32(i4); i4 += 4;

        vo0x0 = vfmaq_laneq_f32(vo0x0, vk01c2, vi0x1, 2);
        /*@ assert cv_acc_1_vo0x0_16: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo0x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+0),((output_channels-c)+j),16)); */
        vo1x0 = vfmaq_laneq_f32(vo1x0, vk01c2, vi2x1, 2);
        /*@ assert cv_acc_1_vo1x0_16: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo1x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+0),((output_channels-c)+j),16)); */
        vo0x1 = vfmaq_laneq_f32(vo0x1, vk01c2, vi0x3, 0);
        /*@ assert cv_acc_1_vo0x1_16: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo0x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+1),((output_channels-c)+j),16)); */
        vo1x1 = vfmaq_laneq_f32(vo1x1, vk01c2, vi2x3, 0);
        /*@ assert cv_acc_1_vo1x1_16: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo1x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+1),((output_channels-c)+j),16)); */

        const float32x4_t vk11c2 = vld1q_f32(w + 68);

        vo0x0 = vfmaq_laneq_f32(vo0x0, vk11c2, vi1x1, 2);
        /*@ assert cv_acc_1_vo0x0_17: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo0x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+0),((output_channels-c)+j),17)); */
        vo1x0 = vfmaq_laneq_f32(vo1x0, vk11c2, vi3x1, 2);
        /*@ assert cv_acc_1_vo1x0_17: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo1x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+0),((output_channels-c)+j),17)); */
        vo0x1 = vfmaq_laneq_f32(vo0x1, vk11c2, vi1x3, 0);
        /*@ assert cv_acc_1_vo0x1_17: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo0x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+1),((output_channels-c)+j),17)); */
        vo1x1 = vfmaq_laneq_f32(vo1x1, vk11c2, vi3x3, 0);
        /*@ assert cv_acc_1_vo1x1_17: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo1x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+1),((output_channels-c)+j),17)); */

        const float32x4_t vk21c2 = vld1q_f32(w + 72);

        vo0x0 = vfmaq_laneq_f32(vo0x0, vk21c2, vi2x1, 2);
        /*@ assert cv_acc_1_vo0x0_18: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo0x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+0),((output_channels-c)+j),18)); */
        vo1x0 = vfmaq_laneq_f32(vo1x0, vk21c2, vi4x1, 2);
        /*@ assert cv_acc_1_vo1x0_18: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo1x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+0),((output_channels-c)+j),18)); */
        vo0x1 = vfmaq_laneq_f32(vo0x1, vk21c2, vi2x3, 0);
        /*@ assert cv_acc_1_vo0x1_18: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo0x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+1),((output_channels-c)+j),18)); */
        vo1x1 = vfmaq_laneq_f32(vo1x1, vk21c2, vi4x3, 0);
        /*@ assert cv_acc_1_vo1x1_18: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo1x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+1),((output_channels-c)+j),18)); */

        const float32x4_t vk02c0 = vld1q_f32(w + 76);

        vo0x0 = vfmaq_laneq_f32(vo0x0, vk02c0, vi0x1, 3);
        /*@ assert cv_acc_1_vo0x0_19: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo0x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+0),((output_channels-c)+j),19)); */
        vo1x0 = vfmaq_laneq_f32(vo1x0, vk02c0, vi2x1, 3);
        /*@ assert cv_acc_1_vo1x0_19: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo1x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+0),((output_channels-c)+j),19)); */
        vo0x1 = vfmaq_laneq_f32(vo0x1, vk02c0, vi0x3, 1);
        /*@ assert cv_acc_1_vo0x1_19: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo0x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+1),((output_channels-c)+j),19)); */
        vo1x1 = vfmaq_laneq_f32(vo1x1, vk02c0, vi2x3, 1);
        /*@ assert cv_acc_1_vo1x1_19: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo1x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+1),((output_channels-c)+j),19)); */

        const float32x4_t vk12c0 = vld1q_f32(w + 80);

        vo0x0 = vfmaq_laneq_f32(vo0x0, vk12c0, vi1x1, 3);
        /*@ assert cv_acc_1_vo0x0_20: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo0x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+0),((output_channels-c)+j),20)); */
        vo1x0 = vfmaq_laneq_f32(vo1x0, vk12c0, vi3x1, 3);
        /*@ assert cv_acc_1_vo1x0_20: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo1x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+0),((output_channels-c)+j),20)); */
        vo0x1 = vfmaq_laneq_f32(vo0x1, vk12c0, vi1x3, 1);
        /*@ assert cv_acc_1_vo0x1_20: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo0x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+1),((output_channels-c)+j),20)); */
        vo1x1 = vfmaq_laneq_f32(vo1x1, vk12c0, vi3x3, 1);
        /*@ assert cv_acc_1_vo1x1_20: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo1x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+1),((output_channels-c)+j),20)); */

        const float32x4_t vk22c0 = vld1q_f32(w + 84);

        vo0x0 = vfmaq_laneq_f32(vo0x0, vk22c0, vi2x1, 3);
        /*@ assert cv_acc_1_vo0x0_21: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo0x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+0),((output_channels-c)+j),21)); */
        vo1x0 = vfmaq_laneq_f32(vo1x0, vk22c0, vi4x1, 3);
        /*@ assert cv_acc_1_vo1x0_21: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo1x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+0),((output_channels-c)+j),21)); */
        vo0x1 = vfmaq_laneq_f32(vo0x1, vk22c0, vi2x3, 1);
        /*@ assert cv_acc_1_vo0x1_21: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo0x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+1),((output_channels-c)+j),21)); */
        vo1x1 = vfmaq_laneq_f32(vo1x1, vk22c0, vi4x3, 1);
        /*@ assert cv_acc_1_vo1x1_21: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo1x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+1),((output_channels-c)+j),21)); */

        const float32x4_t vk02c1 = vld1q_f32(w + 88);

        vo0x0 = vfmaq_laneq_f32(vo0x0, vk02c1, vi0x2, 0);
        /*@ assert cv_acc_1_vo0x0_22: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo0x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+0),((output_channels-c)+j),22)); */
        vo1x0 = vfmaq_laneq_f32(vo1x0, vk02c1, vi2x2, 0);
        /*@ assert cv_acc_1_vo1x0_22: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo1x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+0),((output_channels-c)+j),22)); */
        vo0x1 = vfmaq_laneq_f32(vo0x1, vk02c1, vi0x3, 2);
        /*@ assert cv_acc_1_vo0x1_22: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo0x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+1),((output_channels-c)+j),22)); */
        vo1x1 = vfmaq_laneq_f32(vo1x1, vk02c1, vi2x3, 2);
        /*@ assert cv_acc_1_vo1x1_22: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo1x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+1),((output_channels-c)+j),22)); */

        const float32x4_t vk12c1 = vld1q_f32(w + 92);

        vo0x0 = vfmaq_laneq_f32(vo0x0, vk12c1, vi1x2, 0);
        /*@ assert cv_acc_1_vo0x0_23: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo0x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+0),((output_channels-c)+j),23)); */
        vo1x0 = vfmaq_laneq_f32(vo1x0, vk12c1, vi3x2, 0);
        /*@ assert cv_acc_1_vo1x0_23: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo1x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+0),((output_channels-c)+j),23)); */
        vo0x1 = vfmaq_laneq_f32(vo0x1, vk12c1, vi1x3, 2);
        /*@ assert cv_acc_1_vo0x1_23: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo0x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+1),((output_channels-c)+j),23)); */
        vo1x1 = vfmaq_laneq_f32(vo1x1, vk12c1, vi3x3, 2);
        /*@ assert cv_acc_1_vo1x1_23: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo1x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+1),((output_channels-c)+j),23)); */

        const float32x4_t vk22c1 = vld1q_f32(w + 96);

        vo0x0 = vfmaq_laneq_f32(vo0x0, vk22c1, vi2x2, 0);
        /*@ assert cv_acc_1_vo0x0_24: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo0x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+0),((output_channels-c)+j),24)); */
        vo1x0 = vfmaq_laneq_f32(vo1x0, vk22c1, vi4x2, 0);
        /*@ assert cv_acc_1_vo1x0_24: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo1x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+0),((output_channels-c)+j),24)); */
        vo0x1 = vfmaq_laneq_f32(vo0x1, vk22c1, vi2x3, 2);
        /*@ assert cv_acc_1_vo0x1_24: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo0x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+1),((output_channels-c)+j),24)); */
        vo1x1 = vfmaq_laneq_f32(vo1x1, vk22c1, vi4x3, 2);
        /*@ assert cv_acc_1_vo1x1_24: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo1x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+1),((output_channels-c)+j),24)); */

        const float32x4_t vk02c2 = vld1q_f32(w + 100);

        vo0x0 = vfmaq_laneq_f32(vo0x0, vk02c2, vi0x2, 1);
        /*@ assert cv_acc_1_vo0x0_25: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo0x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+0),((output_channels-c)+j),25)); */
        vo1x0 = vfmaq_laneq_f32(vo1x0, vk02c2, vi2x2, 1);
        /*@ assert cv_acc_1_vo1x0_25: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo1x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+0),((output_channels-c)+j),25)); */
        vo0x1 = vfmaq_laneq_f32(vo0x1, vk02c2, vi0x3, 3);
        /*@ assert cv_acc_1_vo0x1_25: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo0x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+1),((output_channels-c)+j),25)); */
        vo1x1 = vfmaq_laneq_f32(vo1x1, vk02c2, vi2x3, 3);
        /*@ assert cv_acc_1_vo1x1_25: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo1x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+1),((output_channels-c)+j),25)); */

        const float32x4_t vk12c2 = vld1q_f32(w + 104);

        vo0x0 = vfmaq_laneq_f32(vo0x0, vk12c2, vi1x2, 1);
        /*@ assert cv_acc_1_vo0x0_26: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo0x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+0),((output_channels-c)+j),26)); */
        vo1x0 = vfmaq_laneq_f32(vo1x0, vk12c2, vi3x2, 1);
        /*@ assert cv_acc_1_vo1x0_26: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo1x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+0),((output_channels-c)+j),26)); */
        vo0x1 = vfmaq_laneq_f32(vo0x1, vk12c2, vi1x3, 3);
        /*@ assert cv_acc_1_vo0x1_26: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo0x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+1),((output_channels-c)+j),26)); */
        vo1x1 = vfmaq_laneq_f32(vo1x1, vk12c2, vi3x3, 3);
        /*@ assert cv_acc_1_vo1x1_26: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo1x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+1),((output_channels-c)+j),26)); */

        const float32x4_t vk22c2 = vld1q_f32(w + 108);

        vo0x0 = vfmaq_laneq_f32(vo0x0, vk22c2, vi2x2, 1);
        /*@ assert cv_acc_1_vo0x0_27: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo0x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+0),((output_channels-c)+j),27)); */
        vo1x0 = vfmaq_laneq_f32(vo1x0, vk22c2, vi4x2, 1);
        /*@ assert cv_acc_1_vo1x0_27: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo1x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+0),((output_channels-c)+j),27)); */
        vo0x1 = vfmaq_laneq_f32(vo0x1, vk22c2, vi2x3, 3);
        /*@ assert cv_acc_1_vo0x1_27: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo0x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+1),((output_channels-c)+j),27)); */
        vo1x1 = vfmaq_laneq_f32(vo1x1, vk22c2, vi4x3, 3);
        /*@ assert cv_acc_1_vo1x1_27: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo1x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+1),((output_channels-c)+j),27)); */

        vi0x0 = vi0x3;
        vi1x0 = vi1x3;
        vi2x0 = vi2x3;
        vi3x0 = vi3x3;
        vi4x0 = vi4x3;

        vo0x0 = vmaxq_f32(vo0x0, vmin);
        vo1x0 = vmaxq_f32(vo1x0, vmin);
        vo0x1 = vmaxq_f32(vo0x1, vmin);
        vo1x1 = vmaxq_f32(vo1x1, vmin);

        vo0x0 = vminq_f32(vo0x0, vmax);
        vo1x0 = vminq_f32(vo1x0, vmax);
        vo0x1 = vminq_f32(vo0x1, vmax);
        vo1x1 = vminq_f32(vo1x1, vmax);

        const float32x4_t vo0c01 = vzip1q_f32(vo0x0, vo0x1);
        const float32x4_t vo0c23 = vzip2q_f32(vo0x0, vo0x1);
        const float32x4_t vo1c01 = vzip1q_f32(vo1x0, vo1x1);
        const float32x4_t vo1c23 = vzip2q_f32(vo1x0, vo1x1);

        // Always 2+ output width elements remaining
        vst1_f32(o1c0, vget_low_f32(vo1c01)); o1c0 += 2;
        vst1_f32(o1c1, vget_high_f32(vo1c01)); o1c1 += 2;
        vst1_f32(o1c2, vget_low_f32(vo1c23)); o1c2 += 2;
        vst1_f32(o1c3, vget_high_f32(vo1c23)); o1c3 += 2;

        vst1_f32(o0c0, vget_low_f32(vo0c01)); o0c0 += 2;
        vst1_f32(o0c1, vget_high_f32(vo0c01)); o0c1 += 2;
        vst1_f32(o0c2, vget_low_f32(vo0c23)); o0c2 += 2;
        vst1_f32(o0c3, vget_high_f32(vo0c23)); o0c3 += 2;
      }
#line 347 "./neon.c"
      assert(iw < 4);
      if XNN_UNLIKELY(iw != 0) {
        float32x4_t vo0x0 = vld1q_f32(w);
        float32x4_t vo1x0 = vo0x0;
        float32x4_t vo0x1 = vo0x0;
        float32x4_t vo1x1 = vo0x0;

        const float32x4_t vk00c0 = vld1q_f32(w + 4);

        // viMx1 = ( iM2c0, iM1c2, iM1c1, iM1c0 )
        float32x4_t vi0x1 = vld1q_f32(i0);
        float32x4_t vi1x1 = vld1q_f32(i1);
        float32x4_t vi2x1 = vld1q_f32(i2);
        float32x4_t vi3x1 = vld1q_f32(i3);
        float32x4_t vi4x1 = vld1q_f32(i4);

        vo0x0 = vfmaq_laneq_f32(vo0x0, vk00c0, vi0x0, 1);
        /*@ assert cv_acc_2_vo0x0_1: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo0x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+0),((output_channels-c)+j),1)); */
        vo1x0 = vfmaq_laneq_f32(vo1x0, vk00c0, vi2x0, 1);
        /*@ assert cv_acc_2_vo1x0_1: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo1x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+0),((output_channels-c)+j),1)); */
        if (iw > 2) {
          vo0x1 = vfmaq_laneq_f32(vo0x1, vk00c0, vi0x1, 3);
          /*@ assert cv_acc_2_vo0x1_1: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo0x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+1),((output_channels-c)+j),1)); */
          vo1x1 = vfmaq_laneq_f32(vo1x1, vk00c0, vi2x1, 3);
          /*@ assert cv_acc_2_vo1x1_1: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo1x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+1),((output_channels-c)+j),1)); */
        }

        const float32x4_t vk10c0 = vld1q_f32(w + 8);

        vo0x0 = vfmaq_laneq_f32(vo0x0, vk10c0, vi1x0, 1);
        /*@ assert cv_acc_2_vo0x0_2: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo0x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+0),((output_channels-c)+j),2)); */
        vo1x0 = vfmaq_laneq_f32(vo1x0, vk10c0, vi3x0, 1);
        /*@ assert cv_acc_2_vo1x0_2: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo1x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+0),((output_channels-c)+j),2)); */
        if (iw > 2) {
          vo0x1 = vfmaq_laneq_f32(vo0x1, vk10c0, vi1x1, 3);
          /*@ assert cv_acc_2_vo0x1_2: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo0x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+1),((output_channels-c)+j),2)); */
          vo1x1 = vfmaq_laneq_f32(vo1x1, vk10c0, vi3x1, 3);
          /*@ assert cv_acc_2_vo1x1_2: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo1x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+1),((output_channels-c)+j),2)); */
        }

        const float32x4_t vk20c0 = vld1q_f32(w + 12);

        vo0x0 = vfmaq_laneq_f32(vo0x0, vk20c0, vi2x0, 1);
        /*@ assert cv_acc_2_vo0x0_3: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo0x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+0),((output_channels-c)+j),3)); */
        vo1x0 = vfmaq_laneq_f32(vo1x0, vk20c0, vi4x0, 1);
        /*@ assert cv_acc_2_vo1x0_3: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo1x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+0),((output_channels-c)+j),3)); */
        if (iw > 2) {
          vo0x1 = vfmaq_laneq_f32(vo0x1, vk20c0, vi2x1, 3);
          /*@ assert cv_acc_2_vo0x1_3: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo0x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+1),((output_channels-c)+j),3)); */
          vo1x1 = vfmaq_laneq_f32(vo1x1, vk20c0, vi4x1, 3);
          /*@ assert cv_acc_2_vo1x1_3: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo1x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+1),((output_channels-c)+j),3)); */
        }

        const float32x4_t vk00c1 = vld1q_f32(w + 16);

        float32x4_t vi0x2 = vmovq_n_f32(0.0f);
        float32x4_t vi1x2 = vmovq_n_f32(0.0f);
        float32x4_t vi2x2 = vmovq_n_f32(0.0f);
        float32x4_t vi3x2 = vmovq_n_f32(0.0f);
        float32x4_t vi4x2 = vmovq_n_f32(0.0f);
        if (iw >= 2) {
          // viMx2 = ( iM3c1, iM3c0, iM2c2, iM2c1 )
          vi0x2 = vld1q_f32(i0 + 4);
          vi1x2 = vld1q_f32(i1 + 4);
          vi2x2 = vld1q_f32(i2 + 4);
          vi3x2 = vld1q_f32(i3 + 4);
          vi4x2 = vld1q_f32(i4 + 4);
        }

        vo0x0 = vfmaq_laneq_f32(vo0x0, vk00c1, vi0x0, 2);
        /*@ assert cv_acc_2_vo0x0_4: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo0x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+0),((output_channels-c)+j),4)); */
        vo1x0 = vfmaq_laneq_f32(vo1x0, vk00c1, vi2x0, 2);
        /*@ assert cv_acc_2_vo1x0_4: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo1x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+0),((output_channels-c)+j),4)); */
        vo0x1 = vfmaq_laneq_f32(vo0x1, vk00c1, vi0x2, 0);
        /*@ assert cv_acc_2_vo0x1_4: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo0x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+1),((output_channels-c)+j),4)); */
        vo1x1 = vfmaq_laneq_f32(vo1x1, vk00c1, vi2x2, 0);
        /*@ assert cv_acc_2_vo1x1_4: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo1x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+1),((output_channels-c)+j),4)); */

        const float32x4_t vk10c1 = vld1q_f32(w + 20);

        vo0x0 = vfmaq_laneq_f32(vo0x0, vk10c1, vi1x0, 2);
        /*@ assert cv_acc_2_vo0x0_5: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo0x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+0),((output_channels-c)+j),5)); */
        vo1x0 = vfmaq_laneq_f32(vo1x0, vk10c1, vi3x0, 2);
        /*@ assert cv_acc_2_vo1x0_5: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo1x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+0),((output_channels-c)+j),5)); */
        vo0x1 = vfmaq_laneq_f32(vo0x1, vk10c1, vi1x2, 0);
        /*@ assert cv_acc_2_vo0x1_5: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo0x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+1),((output_channels-c)+j),5)); */
        vo1x1 = vfmaq_laneq_f32(vo1x1, vk10c1, vi3x2, 0);
        /*@ assert cv_acc_2_vo1x1_5: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo1x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+1),((output_channels-c)+j),5)); */

        const float32x4_t vk20c1 = vld1q_f32(w + 24);

        vo0x0 = vfmaq_laneq_f32(vo0x0, vk20c1, vi2x0, 2);
        /*@ assert cv_acc_2_vo0x0_6: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo0x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+0),((output_channels-c)+j),6)); */
        vo1x0 = vfmaq_laneq_f32(vo1x0, vk20c1, vi4x0, 2);
        /*@ assert cv_acc_2_vo1x0_6: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo1x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+0),((output_channels-c)+j),6)); */
        vo0x1 = vfmaq_laneq_f32(vo0x1, vk20c1, vi2x2, 0);
        /*@ assert cv_acc_2_vo0x1_6: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo0x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+1),((output_channels-c)+j),6)); */
        vo1x1 = vfmaq_laneq_f32(vo1x1, vk20c1, vi4x2, 0);
        /*@ assert cv_acc_2_vo1x1_6: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo1x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+1),((output_channels-c)+j),6)); */

        const float32x4_t vk00c2 = vld1q_f32(w + 28);

        vo0x0 = vfmaq_laneq_f32(vo0x0, vk00c2, vi0x0, 3);
        /*@ assert cv_acc_2_vo0x0_7: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo0x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+0),((output_channels-c)+j),7)); */
        vo1x0 = vfmaq_laneq_f32(vo1x0, vk00c2, vi2x0, 3);
        /*@ assert cv_acc_2_vo1x0_7: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo1x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+0),((output_channels-c)+j),7)); */
        vo0x1 = vfmaq_laneq_f32(vo0x1, vk00c2, vi0x2, 1);
        /*@ assert cv_acc_2_vo0x1_7: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo0x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+1),((output_channels-c)+j),7)); */
        vo1x1 = vfmaq_laneq_f32(vo1x1, vk00c2, vi2x2, 1);
        /*@ assert cv_acc_2_vo1x1_7: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo1x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+1),((output_channels-c)+j),7)); */

        const float32x4_t vk10c2 = vld1q_f32(w + 32);

        vo0x0 = vfmaq_laneq_f32(vo0x0, vk10c2, vi1x0, 3);
        /*@ assert cv_acc_2_vo0x0_8: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo0x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+0),((output_channels-c)+j),8)); */
        vo1x0 = vfmaq_laneq_f32(vo1x0, vk10c2, vi3x0, 3);
        /*@ assert cv_acc_2_vo1x0_8: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo1x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+0),((output_channels-c)+j),8)); */
        vo0x1 = vfmaq_laneq_f32(vo0x1, vk10c2, vi1x2, 1);
        /*@ assert cv_acc_2_vo0x1_8: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo0x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+1),((output_channels-c)+j),8)); */
        vo1x1 = vfmaq_laneq_f32(vo1x1, vk10c2, vi3x2, 1);
        /*@ assert cv_acc_2_vo1x1_8: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo1x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+1),((output_channels-c)+j),8)); */

        const float32x4_t vk20c2 = vld1q_f32(w + 36);

        vo0x0 = vfmaq_laneq_f32(vo0x0, vk20c2, vi2x0, 3);
        /*@ assert cv_acc_2_vo0x0_9: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo0x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+0),((output_channels-c)+j),9)); */
        vo1x0 = vfmaq_laneq_f32(vo1x0, vk20c2, vi4x0, 3);
        /*@ assert cv_acc_2_vo1x0_9: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo1x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+0),((output_channels-c)+j),9)); */
        vo0x1 = vfmaq_laneq_f32(vo0x1, vk20c2, vi2x2, 1);
        /*@ assert cv_acc_2_vo0x1_9: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo0x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+1),((output_channels-c)+j),9)); */
        vo1x1 = vfmaq_laneq_f32(vo1x1, vk20c2, vi4x2, 1);
        /*@ assert cv_acc_2_vo1x1_9: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo1x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+1),((output_channels-c)+j),9)); */

        const float32x4_t vk01c0 = vld1q_f32(w + 40);

        vo0x0 = vfmaq_laneq_f32(vo0x0, vk01c0, vi0x1, 0);
        /*@ assert cv_acc_2_vo0x0_10: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo0x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+0),((output_channels-c)+j),10)); */
        vo1x0 = vfmaq_laneq_f32(vo1x0, vk01c0, vi2x1, 0);
        /*@ assert cv_acc_2_vo1x0_10: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo1x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+0),((output_channels-c)+j),10)); */
        if (iw > 2) {
          vo0x1 = vfmaq_laneq_f32(vo0x1, vk01c0, vi0x2, 2);
          /*@ assert cv_acc_2_vo0x1_10: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo0x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+1),((output_channels-c)+j),10)); */
          vo1x1 = vfmaq_laneq_f32(vo1x1, vk01c0, vi2x2, 2);
          /*@ assert cv_acc_2_vo1x1_10: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo1x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+1),((output_channels-c)+j),10)); */
        }

        const float32x4_t vk11c0 = vld1q_f32(w + 44);

        vo0x0 = vfmaq_laneq_f32(vo0x0, vk11c0, vi1x1, 0);
        /*@ assert cv_acc_2_vo0x0_11: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo0x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+0),((output_channels-c)+j),11)); */
        vo1x0 = vfmaq_laneq_f32(vo1x0, vk11c0, vi3x1, 0);
        /*@ assert cv_acc_2_vo1x0_11: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo1x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+0),((output_channels-c)+j),11)); */
        if (iw > 2) {
          vo0x1 = vfmaq_laneq_f32(vo0x1, vk11c0, vi1x2, 2);
          /*@ assert cv_acc_2_vo0x1_11: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo0x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+1),((output_channels-c)+j),11)); */
          vo1x1 = vfmaq_laneq_f32(vo1x1, vk11c0, vi3x2, 2);
          /*@ assert cv_acc_2_vo1x1_11: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo1x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+1),((output_channels-c)+j),11)); */
        }

        const float32x4_t vk21c0 = vld1q_f32(w + 48);

        vo0x0 = vfmaq_laneq_f32(vo0x0, vk21c0, vi2x1, 0);
        /*@ assert cv_acc_2_vo0x0_12: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo0x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+0),((output_channels-c)+j),12)); */
        vo1x0 = vfmaq_laneq_f32(vo1x0, vk21c0, vi4x1, 0);
        /*@ assert cv_acc_2_vo1x0_12: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo1x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+0),((output_channels-c)+j),12)); */
        if (iw > 2) {
          vo0x1 = vfmaq_laneq_f32(vo0x1, vk21c0, vi2x2, 2);
          /*@ assert cv_acc_2_vo0x1_12: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo0x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+1),((output_channels-c)+j),12)); */
          vo1x1 = vfmaq_laneq_f32(vo1x1, vk21c0, vi4x2, 2);
          /*@ assert cv_acc_2_vo1x1_12: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo1x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+1),((output_channels-c)+j),12)); */
        }

        const float32x4_t vk01c1 = vld1q_f32(w + 52);

        vo0x0 = vfmaq_laneq_f32(vo0x0, vk01c1, vi0x1, 1);
        /*@ assert cv_acc_2_vo0x0_13: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo0x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+0),((output_channels-c)+j),13)); */
        vo1x0 = vfmaq_laneq_f32(vo1x0, vk01c1, vi2x1, 1);
        /*@ assert cv_acc_2_vo1x0_13: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo1x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+0),((output_channels-c)+j),13)); */
        if (iw > 2) {
          vo0x1 = vfmaq_laneq_f32(vo0x1, vk01c1, vi0x2, 3);
          /*@ assert cv_acc_2_vo0x1_13: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo0x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+1),((output_channels-c)+j),13)); */
          vo1x1 = vfmaq_laneq_f32(vo1x1, vk01c1, vi2x2, 3);
          /*@ assert cv_acc_2_vo1x1_13: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo1x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+1),((output_channels-c)+j),13)); */
        }

        const float32x4_t vk11c1 = vld1q_f32(w + 56);

        vo0x0 = vfmaq_laneq_f32(vo0x0, vk11c1, vi1x1, 1);
        /*@ assert cv_acc_2_vo0x0_14: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo0x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+0),((output_channels-c)+j),14)); */
        vo1x0 = vfmaq_laneq_f32(vo1x0, vk11c1, vi3x1, 1);
        /*@ assert cv_acc_2_vo1x0_14: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo1x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+0),((output_channels-c)+j),14)); */
        if (iw > 2) {
          vo0x1 = vfmaq_laneq_f32(vo0x1, vk11c1, vi1x2, 3);
          /*@ assert cv_acc_2_vo0x1_14: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo0x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+1),((output_channels-c)+j),14)); */
          vo1x1 = vfmaq_laneq_f32(vo1x1, vk11c1, vi3x2, 3);
          /*@ assert cv_acc_2_vo1x1_14: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo1x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+1),((output_channels-c)+j),14)); */
        }

        const float32x4_t vk21c1 = vld1q_f32(w + 60);

        vo0x0 = vfmaq_laneq_f32(vo0x0, vk21c1, vi2x1, 1);
        /*@ assert cv_acc_2_vo0x0_15: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo0x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+0),((output_channels-c)+j),15)); */
        vo1x0 = vfmaq_laneq_f32(vo1x0, vk21c1, vi4x1, 1);
        /*@ assert cv_acc_2_vo1x0_15: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo1x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+0),((output_channels-c)+j),15)); */
        if (iw > 2) {
          vo0x1 = vfmaq_laneq_f32(vo0x1, vk21c1, vi2x2, 3);
          /*@ assert cv_acc_2_vo0x1_15: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo0x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+1),((output_channels-c)+j),15)); */
          vo1x1 = vfmaq_laneq_f32(vo1x1, vk21c1, vi4x2, 3);
          /*@ assert cv_acc_2_vo1x1_15: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo1x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+1),((output_channels-c)+j),15)); */
        }

        const float32x4_t vk01c2 = vld1q_f32(w + 64);

        float32x4_t vi0x3 = vmovq_n_f32(0.0f);
        float32x4_t vi1x3 = vmovq_n_f32(0.0f);
        float32x4_t vi2x3 = vmovq_n_f32(0.0f);
        float32x4_t vi3x3 = vmovq_n_f32(0.0f);
        float32x4_t vi4x3 = vmovq_n_f32(0.0f);
        if (iw > 2) {
          // viMx3 = ( 0.0, 0.0, 0.0, iM3c2 )
          vi0x3 = vld1q_lane_f32(i0 + 8, vi0x3, 0);
          vi1x3 = vld1q_lane_f32(i1 + 8, vi1x3, 0);
          vi2x3 = vld1q_lane_f32(i2 + 8, vi2x3, 0);
          vi3x3 = vld1q_lane_f32(i3 + 8, vi3x3, 0);
          vi4x3 = vld1q_lane_f32(i4 + 8, vi4x3, 0);
        }

        vo0x0 = vfmaq_laneq_f32(vo0x0, vk01c2, vi0x1, 2);
        /*@ assert cv_acc_2_vo0x0_16: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo0x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+0),((output_channels-c)+j),16)); */
        vo1x0 = vfmaq_laneq_f32(vo1x0, vk01c2, vi2x1, 2);
        /*@ assert cv_acc_2_vo1x0_16: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo1x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+0),((output_channels-c)+j),16)); */
        vo0x1 = vfmaq_laneq_f32(vo0x1, vk01c2, vi0x3, 0);
        /*@ assert cv_acc_2_vo0x1_16: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo0x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+1),((output_channels-c)+j),16)); */
        vo1x1 = vfmaq_laneq_f32(vo1x1, vk01c2, vi2x3, 0);
        /*@ assert cv_acc_2_vo1x1_16: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo1x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+1),((output_channels-c)+j),16)); */

        const float32x4_t vk11c2 = vld1q_f32(w + 68);

        vo0x0 = vfmaq_laneq_f32(vo0x0, vk11c2, vi1x1, 2);
        /*@ assert cv_acc_2_vo0x0_17: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo0x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+0),((output_channels-c)+j),17)); */
        vo1x0 = vfmaq_laneq_f32(vo1x0, vk11c2, vi3x1, 2);
        /*@ assert cv_acc_2_vo1x0_17: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo1x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+0),((output_channels-c)+j),17)); */
        vo0x1 = vfmaq_laneq_f32(vo0x1, vk11c2, vi1x3, 0);
        /*@ assert cv_acc_2_vo0x1_17: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo0x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+1),((output_channels-c)+j),17)); */
        vo1x1 = vfmaq_laneq_f32(vo1x1, vk11c2, vi3x3, 0);
        /*@ assert cv_acc_2_vo1x1_17: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo1x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+1),((output_channels-c)+j),17)); */

        const float32x4_t vk21c2 = vld1q_f32(w + 72);

        vo0x0 = vfmaq_laneq_f32(vo0x0, vk21c2, vi2x1, 2);
        /*@ assert cv_acc_2_vo0x0_18: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo0x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+0),((output_channels-c)+j),18)); */
        vo1x0 = vfmaq_laneq_f32(vo1x0, vk21c2, vi4x1, 2);
        /*@ assert cv_acc_2_vo1x0_18: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo1x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+0),((output_channels-c)+j),18)); */
        vo0x1 = vfmaq_laneq_f32(vo0x1, vk21c2, vi2x3, 0);
        /*@ assert cv_acc_2_vo0x1_18: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo0x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+1),((output_channels-c)+j),18)); */
        vo1x1 = vfmaq_laneq_f32(vo1x1, vk21c2, vi4x3, 0);
        /*@ assert cv_acc_2_vo1x1_18: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+1)<output_width ==> ext_same(vo1x1.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+1),((output_channels-c)+j),18)); */

        if (iw >= 2) {
          const float32x4_t vk02c0 = vld1q_f32(w + 76);

          vo0x0 = vfmaq_laneq_f32(vo0x0, vk02c0, vi0x1, 3);
          /*@ assert cv_acc_2_vo0x0_19: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo0x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+0),((output_channels-c)+j),19)); */
          vo1x0 = vfmaq_laneq_f32(vo1x0, vk02c0, vi2x1, 3);
          /*@ assert cv_acc_2_vo1x0_19: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo1x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+0),((output_channels-c)+j),19)); */

          const float32x4_t vk12c0 = vld1q_f32(w + 80);

          vo0x0 = vfmaq_laneq_f32(vo0x0, vk12c0, vi1x1, 3);
          /*@ assert cv_acc_2_vo0x0_20: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo0x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+0),((output_channels-c)+j),20)); */
          vo1x0 = vfmaq_laneq_f32(vo1x0, vk12c0, vi3x1, 3);
          /*@ assert cv_acc_2_vo1x0_20: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo1x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+0),((output_channels-c)+j),20)); */

          const float32x4_t vk22c0 = vld1q_f32(w + 84);

          vo0x0 = vfmaq_laneq_f32(vo0x0, vk22c0, vi2x1, 3);
          /*@ assert cv_acc_2_vo0x0_21: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo0x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+0),((output_channels-c)+j),21)); */
          vo1x0 = vfmaq_laneq_f32(vo1x0, vk22c0, vi4x1, 3);
          /*@ assert cv_acc_2_vo1x0_21: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo1x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+0),((output_channels-c)+j),21)); */

          const float32x4_t vk02c1 = vld1q_f32(w + 88);

          vo0x0 = vfmaq_laneq_f32(vo0x0, vk02c1, vi0x2, 0);
          /*@ assert cv_acc_2_vo0x0_22: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo0x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+0),((output_channels-c)+j),22)); */
          vo1x0 = vfmaq_laneq_f32(vo1x0, vk02c1, vi2x2, 0);
          /*@ assert cv_acc_2_vo1x0_22: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo1x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+0),((output_channels-c)+j),22)); */

          const float32x4_t vk12c1 = vld1q_f32(w + 92);

          vo0x0 = vfmaq_laneq_f32(vo0x0, vk12c1, vi1x2, 0);
          /*@ assert cv_acc_2_vo0x0_23: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo0x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+0),((output_channels-c)+j),23)); */
          vo1x0 = vfmaq_laneq_f32(vo1x0, vk12c1, vi3x2, 0);
          /*@ assert cv_acc_2_vo1x0_23: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo1x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+0),((output_channels-c)+j),23)); */

          const float32x4_t vk22c1 = vld1q_f32(w + 96);

          vo0x0 = vfmaq_laneq_f32(vo0x0, vk22c1, vi2x2, 0);
          /*@ assert cv_acc_2_vo0x0_24: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo0x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+0),((output_channels-c)+j),24)); */
          vo1x0 = vfmaq_laneq_f32(vo1x0, vk22c1, vi4x2, 0);
          /*@ assert cv_acc_2_vo1x0_24: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo1x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+0),((output_channels-c)+j),24)); */

          const float32x4_t vk02c2 = vld1q_f32(w + 100);

          vo0x0 = vfmaq_laneq_f32(vo0x0, vk02c2, vi0x2, 1);
          /*@ assert cv_acc_2_vo0x0_25: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo0x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+0),((output_channels-c)+j),25)); */
          vo1x0 = vfmaq_laneq_f32(vo1x0, vk02c2, vi2x2, 1);
          /*@ assert cv_acc_2_vo1x0_25: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo1x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+0),((output_channels-c)+j),25)); */

          const float32x4_t vk12c2 = vld1q_f32(w + 104);

          vo0x0 = vfmaq_laneq_f32(vo0x0, vk12c2, vi1x2, 1);
          /*@ assert cv_acc_2_vo0x0_26: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo0x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+0),((output_channels-c)+j),26)); */
          vo1x0 = vfmaq_laneq_f32(vo1x0, vk12c2, vi3x2, 1);
          /*@ assert cv_acc_2_vo1x0_26: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo1x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+0),((output_channels-c)+j),26)); */

          const float32x4_t vk22c2 = vld1q_f32(w + 108);

          vo0x0 = vfmaq_laneq_f32(vo0x0, vk22c2, vi2x2, 1);
          /*@ assert cv_acc_2_vo0x0_27: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+0)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo0x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+0),(((input_width-iw)/2)+0),((output_channels-c)+j),27)); */
          vo1x0 = vfmaq_laneq_f32(vo1x0, vk22c2, vi4x2, 1);
          /*@ assert cv_acc_2_vo1x0_27: \forall integer j;0<=j<4 && ((output_channels-c)+j)<output_channels && (output_y+1)<output_y_end && (((input_width-iw)/2)+0)<output_width ==> ext_same(vo1x0.lane[j],cv_progress{CvN}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,(output_y+1),(((input_width-iw)/2)+0),((output_channels-c)+j),27)); */
        }

        vo0x0 = vmaxq_f32(vo0x0, vmin);
        vo1x0 = vmaxq_f32(vo1x0, vmin);
        vo0x1 = vmaxq_f32(vo0x1, vmin);
        vo1x1 = vmaxq_f32(vo1x1, vmin);

        vo0x0 = vminq_f32(vo0x0, vmax);
        vo1x0 = vminq_f32(vo1x0, vmax);
        vo0x1 = vminq_f32(vo0x1, vmax);
        vo1x1 = vminq_f32(vo1x1, vmax);

        if (iw == 3) {
          // Exactly 2 output width elements remaining
          const float32x4_t vo0c01 = vzip1q_f32(vo0x0, vo0x1);
          const float32x4_t vo0c23 = vzip2q_f32(vo0x0, vo0x1);
          const float32x4_t vo1c01 = vzip1q_f32(vo1x0, vo1x1);
          const float32x4_t vo1c23 = vzip2q_f32(vo1x0, vo1x1);

          vst1_f32(o1c0, vget_low_f32(vo1c01)); o1c0 += 2;
          vst1_f32(o1c1, vget_high_f32(vo1c01)); o1c1 += 2;
          vst1_f32(o1c2, vget_low_f32(vo1c23)); o1c2 += 2;
          vst1_f32(o1c3, vget_high_f32(vo1c23)); o1c3 += 2;

          vst1_f32(o0c0, vget_low_f32(vo0c01)); o0c0 += 2;
          vst1_f32(o0c1, vget_high_f32(vo0c01)); o0c1 += 2;
          vst1_f32(o0c2, vget_low_f32(vo0c23)); o0c2 += 2;
          vst1_f32(o0c3, vget_high_f32(vo0c23)); o0c3 += 2;
        } else {
          // Exactly 1 output width element remaining

          vst1q_lane_f32(o1c0, vo1x0, 0); o1c0 += 1;
          vst1q_lane_f32(o1c1, vo1x0, 1); o1c1 += 1;
          vst1q_lane_f32(o1c2, vo1x0, 2); o1c2 += 1;
          vst1q_lane_f32(o1c3, vo1x0, 3); o1c3 += 1;

          vst1q_lane_f32(o0c0, vo0x0, 0); o0c0 += 1;
          vst1q_lane_f32(o0c1, vo0x0, 1); o0c1 += 1;
          vst1q_lane_f32(o0c2, vo0x0, 2); o0c2 += 1;
          vst1q_lane_f32(o0c3, vo0x0, 3); o0c3 += 1;
        }
      }
      // Move output pointers back to the position of the first pixel in a row,
      // and forward to the next block of output channels.
      o0c0 = (float*) ((uintptr_t) o0c0 + output_channel_increment);
      o0c1 = (float*) ((uintptr_t) o0c1 + output_channel_increment);
      o0c2 = (float*) ((uintptr_t) o0c2 + output_channel_increment);
      o0c3 = (float*) ((uintptr_t) o0c3 + output_channel_increment);
      o1c0 = (float*) ((uintptr_t) o1c0 + output_channel_increment);
      o1c1 = (float*) ((uintptr_t) o1c1 + output_channel_increment);
      o1c2 = (float*) ((uintptr_t) o1c2 + output_channel_increment);
      o1c3 = (float*) ((uintptr_t) o1c3 + output_channel_increment);
      // Revert input pointers to the position of the first pixel in a row
      i0 = (const float*) ((uintptr_t) i0 - input_width_increment);
      i1 = (const float*) ((uintptr_t) i1 - input_width_increment);
      i2 = (const float*) ((uintptr_t) i2 - input_width_increment);
      i3 = (const float*) ((uintptr_t) i3 - input_width_increment);
      i4 = (const float*) ((uintptr_t) i4 - input_width_increment);
      // Move to the block of weights for the next 4 output channels
      w += 112;
      c = doz(c, 4);
    } while (c != 0);
    // Move output pointers forward to the next two rows
    output0 = (float*) ((uintptr_t) output1 + output_height_stride);
    output1 = (float*) ((uintptr_t) output0 + output_height_stride);
    // Move input pointers forward to the next four rows
    i0 = i4;
    i1 = (const float*) ((uintptr_t) i0 + input_height_stride);
    i2 = (const float*) ((uintptr_t) i1 + input_height_stride);
    i3 = (const float*) ((uintptr_t) i2 + input_height_stride);
    i4 = (const float*) ((uintptr_t) i3 + input_height_stride);
  }
}
