/*@ ghost
 /@ assigns \nothing;
    ensures next_dw_weight_seed_relation: p==base && c==ch ==> p==base+16*((ch-c+3)/4); @/
 static void next_dw_weight_seed(float *p,float *base,size_t ch,size_t c) {}
*/
/*@ ghost
 /@ assigns \nothing;
    ensures next_dw_weight_step_relation:
      0<vl<=c<=ch && (ch-c)%4==0 && vl==(c<4?c:4) &&
      p==base+16*((ch-c+3)/4)+16 ==> p==base+16*((ch-(c-vl)+3)/4); @/
 static void next_dw_weight_step(float *p,float *base,size_t ch,size_t c,size_t vl) {}
*/
/*@ ghost
 /@ assigns \nothing;
    ensures next_dw_sub_exact: y<=x ==> (size_t)(x-y)==x-y; @/
 static void next_dw_sub(size_t x,size_t y) {}
*/
/*@
 logic float dwv_neon32{L}(float **table,float *weights,integer pixel,integer channel,float lo,float hi) =
   \let wb=(channel/4)*16;
   \let lane=channel%4;
   ext_neon_min32(ext_neon_max32(
     complex_add32(
       shim_fma32(table[3*pixel+2][channel],weights[wb+12+lane],
         shim_fma32(table[3*pixel][channel],weights[wb+4+lane],weights[wb+lane])),
       complex_mul32(table[3*pixel+1][channel],weights[wb+8+lane])),lo),hi);
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
    size_t channels,
    size_t output_width,
    const float** input,
    const float* weights,
    float* output,
    intptr_t input_stride,
    size_t output_increment,
    size_t input_offset,
    size_t input_pixel_stride,
    const float* zero,
    const struct xnn_f32_minmax_params* restrict params) XNN_OOB_READS
{
  /*@ ghost const float **T0=input; */
  /*@ ghost const float *W0=weights; */
  /*@ ghost float *O0=output; */
  /*@ ghost size_t P=output_width,CH=channels; */
#line 23 "./neon.c"
#line 23 "./neon.c"
#line 23 "./neon.c"
#line 23 "./neon.c"
#line 23 "./neon.c"
#line 23 "./neon.c"
#line 23 "./neon.c"
#line 23 "./neon.c"
#line 23 "./neon.c"
#line 23 "./neon.c"
#line 23 "./neon.c"
#line 23 "./neon.c"
#line 23 "./neon.c"
#line 23 "./neon.c"
#line 23 "./neon.c"
#line 23 "./neon.c"
#line 23 "./neon.c"
#line 23 "./neon.c"
#line 23 "./neon.c"
#line 23 "./neon.c"
#line 23 "./neon.c"
#line 23 "./neon.c"
#line 23 "./neon.c"
#line 23 "./neon.c"
#line 23 "./neon.c"
#line 23 "./neon.c"
#line 23 "./neon.c"
#line 23 "./neon.c"
#line 23 "./neon.c"
  assert(channels != 0);
#line 24 "./neon.c"
#line 24 "./neon.c"
#line 24 "./neon.c"
#line 24 "./neon.c"
#line 24 "./neon.c"
#line 24 "./neon.c"
#line 24 "./neon.c"
#line 24 "./neon.c"
#line 24 "./neon.c"
#line 24 "./neon.c"
#line 24 "./neon.c"
#line 24 "./neon.c"
#line 24 "./neon.c"
#line 24 "./neon.c"
#line 24 "./neon.c"
#line 24 "./neon.c"
#line 24 "./neon.c"
#line 24 "./neon.c"
#line 24 "./neon.c"
#line 24 "./neon.c"
#line 24 "./neon.c"
#line 24 "./neon.c"
#line 24 "./neon.c"
#line 24 "./neon.c"
#line 24 "./neon.c"
#line 24 "./neon.c"
#line 24 "./neon.c"
#line 24 "./neon.c"
#line 24 "./neon.c"
  assert(output_width != 0);

  const float32x4_t vmax = vdupq_n_f32(params->scalar.max);
  const float32x4_t vmin = vdupq_n_f32(params->scalar.min);
  /*@ loop invariant 0<output_width<=P;
      loop invariant next_outer_channels: CH==channels;
      loop invariant next_outer_weights: W0==weights;
      loop invariant input==T0+3*(P-output_width);
      loop invariant output==O0+(P-output_width)*CH;
      loop invariant input_offset==0;
      loop invariant \forall integer t;0<=t<(P-output_width)*CH ==> ext_same(O0[t],dwv_neon32{Pre}(T0,W0,t/CH,t%CH,params->scalar.min,params->scalar.max));
      loop assigns output_width,input,input_offset,output,O0[0..P*CH-1],errno;
      loop variant output_width;
  */
  do {
    const float* i0 = input[0];
#line 30 "./neon.c"
#line 30 "./neon.c"
#line 30 "./neon.c"
#line 30 "./neon.c"
#line 30 "./neon.c"
#line 30 "./neon.c"
#line 30 "./neon.c"
#line 30 "./neon.c"
#line 30 "./neon.c"
#line 30 "./neon.c"
#line 30 "./neon.c"
#line 30 "./neon.c"
#line 30 "./neon.c"
#line 30 "./neon.c"
#line 30 "./neon.c"
#line 30 "./neon.c"
#line 30 "./neon.c"
#line 30 "./neon.c"
#line 30 "./neon.c"
#line 30 "./neon.c"
#line 30 "./neon.c"
#line 30 "./neon.c"
#line 30 "./neon.c"
#line 30 "./neon.c"
#line 30 "./neon.c"
#line 30 "./neon.c"
#line 30 "./neon.c"
#line 30 "./neon.c"
#line 30 "./neon.c"
    assert(i0 != NULL);
    if XNN_UNPREDICTABLE(i0 != zero) {
      i0 = (const float*) ((uintptr_t) i0 + input_offset);
    }
    const float* i1 = input[1];
#line 35 "./neon.c"
#line 35 "./neon.c"
#line 35 "./neon.c"
#line 35 "./neon.c"
#line 35 "./neon.c"
#line 35 "./neon.c"
#line 35 "./neon.c"
#line 35 "./neon.c"
#line 35 "./neon.c"
#line 35 "./neon.c"
#line 35 "./neon.c"
#line 35 "./neon.c"
#line 35 "./neon.c"
#line 35 "./neon.c"
#line 35 "./neon.c"
#line 35 "./neon.c"
#line 35 "./neon.c"
#line 35 "./neon.c"
#line 35 "./neon.c"
#line 35 "./neon.c"
#line 35 "./neon.c"
#line 35 "./neon.c"
#line 35 "./neon.c"
#line 35 "./neon.c"
#line 35 "./neon.c"
#line 35 "./neon.c"
#line 35 "./neon.c"
#line 35 "./neon.c"
#line 35 "./neon.c"
    assert(i1 != NULL);
    if XNN_UNPREDICTABLE(i1 != zero) {
      i1 = (const float*) ((uintptr_t) i1 + input_offset);
    }
    const float* i2 = input[2];
#line 40 "./neon.c"
#line 40 "./neon.c"
#line 40 "./neon.c"
#line 40 "./neon.c"
#line 40 "./neon.c"
#line 40 "./neon.c"
#line 40 "./neon.c"
#line 40 "./neon.c"
#line 40 "./neon.c"
#line 40 "./neon.c"
#line 40 "./neon.c"
#line 40 "./neon.c"
#line 40 "./neon.c"
#line 40 "./neon.c"
#line 40 "./neon.c"
#line 40 "./neon.c"
#line 40 "./neon.c"
#line 40 "./neon.c"
#line 40 "./neon.c"
#line 40 "./neon.c"
#line 40 "./neon.c"
#line 40 "./neon.c"
#line 40 "./neon.c"
#line 40 "./neon.c"
#line 40 "./neon.c"
#line 40 "./neon.c"
#line 40 "./neon.c"
#line 40 "./neon.c"
#line 40 "./neon.c"
    assert(i2 != NULL);
    if XNN_UNPREDICTABLE(i2 != zero) {
      i2 = (const float*) ((uintptr_t) i2 + input_offset);
    }

    input = (const float**) ((uintptr_t) input + input_stride);

    size_t c = channels;
    const float* w = weights;
    /*@ ghost const float *Row0=i0,*Row1=i1,*Row2=i2; */
    /*@ assert next_channel_seed: CH==c; */
    /*@ assert next_weight_seed: W0==w; */
    /*@ ghost next_dw_weight_seed((float*)w,(float*)W0,CH,c); */
    /*@ loop invariant 0<=c<=CH;
        loop invariant stage3_i0_valid: \valid_read(i0+(0..c+2));
        loop invariant stage3_i1_valid: \valid_read(i1+(0..c+2));
        loop invariant stage3_i2_valid: \valid_read(i2+(0..c+2));
        loop invariant stage3_weights_valid: \valid_read(w+(0..16*((c+3)/4)-1));
        
        loop invariant (CH-c)%4==0;
        loop invariant output==O0+(P-output_width)*CH+(CH-c);
        loop invariant i0==T0[3*(P-output_width)]+(CH-c);
        loop invariant i1==T0[3*(P-output_width)+1]+(CH-c);
        loop invariant i2==T0[3*(P-output_width)+2]+(CH-c);
        loop invariant next_weight_cursor: w==W0+16*((CH-c+3)/4);
        loop invariant next_row0_cursor: i0==Row0+(CH-c);
        loop invariant next_row1_cursor: i1==Row1+(CH-c);
        loop invariant next_row2_cursor: i2==Row2+(CH-c);
        loop invariant \forall integer t;0<=t<(P-output_width)*CH+(CH-c) ==> ext_same(O0[t],dwv_neon32{Pre}(T0,W0,t/CH,t%CH,params->scalar.min,params->scalar.max));
        loop assigns c,w,i0,i1,i2,output,O0[(P-output_width)*CH..(P-output_width+1)*CH-1],errno;
        loop variant c;
    */
    for (; c >= 4; c -= 4) {
      /*@ assert stage3_weight_block: (CH-c)%4==0; */
      /*@ assert next_weight_index: (CH-c+3)/4==(CH-c)/4; */
      /*@ assert stage3_store_range: 0<=CH-c && CH-c+4<=CH;
      */
      float32x4_t vacc0123p0 = vld1q_f32(w); w += 4;


      const float32x4_t vi0x0123 = vld1q_f32(i0); i0 += 4;
      const float32x4_t vk0x0123 = vld1q_f32(w); w += 4;
      vacc0123p0 = vfmaq_f32(vacc0123p0, vi0x0123, vk0x0123);

      const float32x4_t vi1x0123 = vld1q_f32(i1); i1 += 4;
      const float32x4_t vk1x0123 = vld1q_f32(w); w += 4;
      float32x4_t vacc0123p1 = vmulq_f32(vi1x0123, vk1x0123);

      const float32x4_t vi2x0123 = vld1q_f32(i2); i2 += 4;
      const float32x4_t vk2x0123 = vld1q_f32(w); w += 4;
      vacc0123p0 = vfmaq_f32(vacc0123p0, vi2x0123, vk2x0123);

      // Add up all accumulators to vacc0123p0
      vacc0123p0 = vaddq_f32(vacc0123p0, vacc0123p1);

      float32x4_t vacc0123 = vmaxq_f32(vacc0123p0, vmin);
      vacc0123 = vminq_f32(vacc0123, vmax);

      vst1q_f32(output, vacc0123); output += 4;
      /*@ assert next_weight_advanced: w==W0+16*((CH-c+3)/4)+16; */
      /*@ ghost next_dw_weight_step((float*)w,(float*)W0,CH,c,4); */
      /*@ ghost next_dw_sub(c,4); */
      /*@ assert next_weight_future: w==W0+16*((CH-(c-4)+3)/4); */
    }
    if XNN_UNLIKELY(c != 0) {
      float32x4_t vacc0123p0 = vld1q_f32(w); w += 4;


      const float32x4_t vi0x0123 = vld1q_f32(i0);
      const float32x4_t vk0x0123 = vld1q_f32(w); w += 4;
      vacc0123p0 = vfmaq_f32(vacc0123p0, vi0x0123, vk0x0123);

      const float32x4_t vi1x0123 = vld1q_f32(i1);
      const float32x4_t vk1x0123 = vld1q_f32(w); w += 4;
      float32x4_t vacc0123p1 = vmulq_f32(vi1x0123, vk1x0123);

      const float32x4_t vi2x0123 = vld1q_f32(i2);
      const float32x4_t vk2x0123 = vld1q_f32(w); w += 4;
      vacc0123p0 = vfmaq_f32(vacc0123p0, vi2x0123, vk2x0123);

      // Add up all accumulators to vacc0123p0
      vacc0123p0 = vaddq_f32(vacc0123p0, vacc0123p1);

      float32x4_t vacc0123 = vmaxq_f32(vacc0123p0, vmin);
      vacc0123 = vminq_f32(vacc0123, vmax);

      float32x2_t vacc01 = vget_low_f32(vacc0123);
      if (c & 2) {
        vst1_f32(output, vacc01); output += 2;
        vacc01 = vget_high_f32(vacc0123);
      }
      if (c & 1) {
        vst1_lane_f32(output, vacc01, 0); output += 1;
      }
    }

    input_offset += input_pixel_stride;
    output = (float*) ((uintptr_t) output + output_increment);
  } while (--output_width != 0);
}
