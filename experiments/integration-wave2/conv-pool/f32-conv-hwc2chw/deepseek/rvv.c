/* Preserve NEON propagating NaNs using real RVV masks and merges. */
/*@ requires vl<=4; assigns \nothing;
 ensures \forall integer j;0<=j<vl ==> ext_same(\result.lane[j],ext_neon_min32(a.lane[j],b)); */
static inline vfloat32m1_t salty_min_vf_m1(vfloat32m1_t a,float b,size_t vl) {
  if (b!=b) return __riscv_vfmv_v_f_f32m1(__builtin_nanf(""),vl);
  vbool32_t nan=__riscv_vmfne_vv_f32m1_b32(a,a,vl);
  vfloat32m1_t r=__riscv_vfmin_vf_f32m1(a,b,vl);
  return __riscv_vfmerge_vfm_f32m1(r,__builtin_nanf(""),nan,vl);
}
/*@ requires vl<=4; assigns \nothing;
 ensures \forall integer j;0<=j<vl ==> ext_same(\result.lane[j],ext_neon_max32(a.lane[j],b)); */
static inline vfloat32m1_t salty_max_vf_m1(vfloat32m1_t a,float b,size_t vl) {
  if (b!=b) return __riscv_vfmv_v_f_f32m1(__builtin_nanf(""),vl);
  vbool32_t nan=__riscv_vmfne_vv_f32m1_b32(a,a,vl);
  vfloat32m1_t r=__riscv_vfmax_vf_f32m1(a,b,vl);
  return __riscv_vfmerge_vfm_f32m1(r,__builtin_nanf(""),nan,vl);
}
void test_rvv(
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
#line 29 "./rvv.c"
  assert(input_width != 0);
#line 30 "./rvv.c"
  assert(output_y_end > output_y_start);
#line 31 "./rvv.c"
  assert(input_padding_top <= 1);
#line 32 "./rvv.c"
  assert(output_channels != 0);

  //@ ghost CvR: ;
  /*@ ghost const float *cv_I=input; const float *cv_Z=zero; const float *cv_W=weights; float *cv_O=output; */
  const size_t input_height_stride = input_width * 3 /* channels */ * sizeof(float);
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

  /*@ loop invariant cv_y: output_y_start<=output_y<=output_y_end+1;
      loop invariant cv_output_rows: \forall integer yy,xx,cc; output_y_start<=yy<output_y && yy<output_y_end && 0<=xx<output_width && 0<=cc<output_channels ==> ext_same(cv_O[(cc)*(output_channel_stride/4)+(yy)*(output_height_stride/4)+(xx)],cv_clamp(cv_progress{CvR}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,yy,xx,cv_effective_ch(output_channels,cc),27),params->scalar.min,params->scalar.max));
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
        loop invariant cv_output_channels: \forall integer yy,xx,cc;output_y<=yy<output_y+2 && yy<output_y_end && 0<=xx<output_width && 0<=cc<(output_channels-c) ==> ext_same(cv_O[(cc)*(output_channel_stride/4)+(yy)*(output_height_stride/4)+(xx)],cv_clamp(cv_progress{CvR}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,yy,xx,cv_effective_ch(output_channels,cc),27),params->scalar.min,params->scalar.max));
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

      size_t ow = output_width;
      size_t ow_done = 0;
      
      // Base pointers shifted back by 1 pixel (3 channels) to ensure all indexed offsets are non-negative
      const float* i0_base = (const float*)((uintptr_t)i0 - 3 * sizeof(float));
      const float* i1_base = (const float*)((uintptr_t)i1 - 3 * sizeof(float));
      const float* i2_base = (const float*)((uintptr_t)i2 - 3 * sizeof(float));
      const float* i3_base = (const float*)((uintptr_t)i3 - 3 * sizeof(float));
      const float* i4_base = (const float*)((uintptr_t)i4 - 3 * sizeof(float));

      float* current_o0c0 = o0c0;
      float* current_o0c1 = o0c1;
      float* current_o0c2 = o0c2;
      float* current_o0c3 = o0c3;
      float* current_o1c0 = o1c0;
      float* current_o1c1 = o1c1;
      float* current_o1c2 = o1c2;
      float* current_o1c3 = o1c3;

      /*@ loop invariant cv_width: 0<=ow<=output_width && ow_done+ow==output_width;
          loop invariant cv_output_width: \forall integer yy,xx,cc;output_y<=yy<output_y+2 && yy<output_y_end && 0<=xx<ow_done && (output_channels-c)<=cc<(output_channels-c)+4 && cc<output_channels ==> ext_same(cv_O[(cc)*(output_channel_stride/4)+(yy)*(output_height_stride/4)+(xx)],cv_clamp(cv_progress{CvR}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,yy,xx,cv_effective_ch(output_channels,cc),27),params->scalar.min,params->scalar.max));
          loop invariant cv_o0c0: current_o0c0==o0c0+ow_done;
          loop invariant cv_o0c1: current_o0c1==o0c1+ow_done;
          loop invariant cv_o0c2: current_o0c2==o0c2+ow_done;
          loop invariant cv_o0c3: current_o0c3==o0c3+ow_done;
          loop invariant cv_o1c0: current_o1c0==o1c0+ow_done;
          loop invariant cv_o1c1: current_o1c1==o1c1+ow_done;
          loop invariant cv_o1c2: current_o1c2==o1c2+ow_done;
          loop invariant cv_o1c3: current_o1c3==o1c3+ow_done;
          loop assigns ow,ow_done,current_o0c0,current_o0c1,current_o0c2,current_o0c3,current_o1c0,current_o1c1,current_o1c2,current_o1c3,cv_O[0..output_channels*(output_channel_stride/4)-1],errno;
          loop variant ow;
      */
      while (ow > 0) {
        size_t vl = __riscv_vsetvl_e32m1(ow);
        /*@ assert cv_active_vl: 0<vl<=4 && vl<=ow; */
        vfloat32m1_t v_zero = __riscv_vfmv_v_f_f32m1(0.0f, vl);

        vuint32m1_t vj = __riscv_vid_v_u32m1(vl);
        vuint32m1_t v_j_plus_done = __riscv_vadd_vx_u32m1(vj, ow_done, vl);
        
        // v_idx_base_pos = 2 * (j + ow_done)
        vuint32m1_t v_idx_base_pos = __riscv_vmul_vx_u32m1(v_j_plus_done, 2, vl);
        // v_offset_base_pos = v_idx_base_pos * 3 channels * sizeof(float)
        vuint32m1_t v_offset_base_pos = __riscv_vmul_vx_u32m1(v_idx_base_pos, 12, vl);

        // True signed index for bounds checking: 2 * (j + ow_done) - 1
        vint32m1_t v_idx_base = __riscv_vsub_vx_i32m1(__riscv_vreinterpret_v_u32m1_i32m1(v_idx_base_pos), 1, vl);

        vfloat32m1_t v_o0c0 = __riscv_vfmv_v_f_f32m1(w[0], vl);
        vfloat32m1_t v_o0c1 = __riscv_vfmv_v_f_f32m1(w[1], vl);
        vfloat32m1_t v_o0c2 = __riscv_vfmv_v_f_f32m1(w[2], vl);
        vfloat32m1_t v_o0c3 = __riscv_vfmv_v_f_f32m1(w[3], vl);

        vfloat32m1_t v_o1c0 = __riscv_vfmv_v_f_f32m1(w[0], vl);
        vfloat32m1_t v_o1c1 = __riscv_vfmv_v_f_f32m1(w[1], vl);
        vfloat32m1_t v_o1c2 = __riscv_vfmv_v_f_f32m1(w[2], vl);
        vfloat32m1_t v_o1c3 = __riscv_vfmv_v_f_f32m1(w[3], vl);

                /*@ loop invariant cv_dx: 0<=dx<=3;
            loop invariant cv_acc_dx00: \forall integer j;0<=j<vl ==> ext_same(v_o0c0.lane[j],cv_progress{CvR}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,output_y+0,ow_done+j,(output_channels-c)+0,dx*9));
            loop invariant cv_acc_dx01: \forall integer j;0<=j<vl ==> ext_same(v_o0c1.lane[j],cv_progress{CvR}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,output_y+0,ow_done+j,(output_channels-c)+1,dx*9));
            loop invariant cv_acc_dx02: \forall integer j;0<=j<vl ==> ext_same(v_o0c2.lane[j],cv_progress{CvR}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,output_y+0,ow_done+j,(output_channels-c)+2,dx*9));
            loop invariant cv_acc_dx03: \forall integer j;0<=j<vl ==> ext_same(v_o0c3.lane[j],cv_progress{CvR}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,output_y+0,ow_done+j,(output_channels-c)+3,dx*9));
            loop invariant cv_acc_dx10: \forall integer j;0<=j<vl ==> ext_same(v_o1c0.lane[j],cv_progress{CvR}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,output_y+1,ow_done+j,(output_channels-c)+0,dx*9));
            loop invariant cv_acc_dx11: \forall integer j;0<=j<vl ==> ext_same(v_o1c1.lane[j],cv_progress{CvR}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,output_y+1,ow_done+j,(output_channels-c)+1,dx*9));
            loop invariant cv_acc_dx12: \forall integer j;0<=j<vl ==> ext_same(v_o1c2.lane[j],cv_progress{CvR}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,output_y+1,ow_done+j,(output_channels-c)+2,dx*9));
            loop invariant cv_acc_dx13: \forall integer j;0<=j<vl ==> ext_same(v_o1c3.lane[j],cv_progress{CvR}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,output_y+1,ow_done+j,(output_channels-c)+3,dx*9));
            loop assigns v_o0c0,v_o0c1,v_o0c2,v_o0c3,v_o1c0,v_o1c1,v_o1c2,v_o1c3,errno;
            loop variant 3-dx;
        */
for (int dx = 0; dx < 3; dx++) {
          vint32m1_t v_idx = __riscv_vadd_vx_i32m1(v_idx_base, dx, vl);
          vbool32_t mask = __riscv_vmand_mm_b32(
              __riscv_vmsge_vx_i32m1_b32(v_idx, 0, vl),
              __riscv_vmslt_vx_i32m1_b32(v_idx, input_width, vl),
              vl
          );

                            /*@ assert cv_right_mask: dx==2 ==> (\forall integer j;0<=j<vl ==> ((mask.lane[j]!=0) <==> ow_done+j<input_width/2)); */
/*@ loop invariant cv_c_in: 0<=c_in<=3;
            loop invariant cv_acc_c_in00: \forall integer j;0<=j<vl ==> ext_same(v_o0c0.lane[j],cv_progress{CvR}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,output_y+0,ow_done+j,(output_channels-c)+0,dx*9+c_in*3));
            loop invariant cv_acc_c_in01: \forall integer j;0<=j<vl ==> ext_same(v_o0c1.lane[j],cv_progress{CvR}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,output_y+0,ow_done+j,(output_channels-c)+1,dx*9+c_in*3));
            loop invariant cv_acc_c_in02: \forall integer j;0<=j<vl ==> ext_same(v_o0c2.lane[j],cv_progress{CvR}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,output_y+0,ow_done+j,(output_channels-c)+2,dx*9+c_in*3));
            loop invariant cv_acc_c_in03: \forall integer j;0<=j<vl ==> ext_same(v_o0c3.lane[j],cv_progress{CvR}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,output_y+0,ow_done+j,(output_channels-c)+3,dx*9+c_in*3));
            loop invariant cv_acc_c_in10: \forall integer j;0<=j<vl ==> ext_same(v_o1c0.lane[j],cv_progress{CvR}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,output_y+1,ow_done+j,(output_channels-c)+0,dx*9+c_in*3));
            loop invariant cv_acc_c_in11: \forall integer j;0<=j<vl ==> ext_same(v_o1c1.lane[j],cv_progress{CvR}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,output_y+1,ow_done+j,(output_channels-c)+1,dx*9+c_in*3));
            loop invariant cv_acc_c_in12: \forall integer j;0<=j<vl ==> ext_same(v_o1c2.lane[j],cv_progress{CvR}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,output_y+1,ow_done+j,(output_channels-c)+2,dx*9+c_in*3));
            loop invariant cv_acc_c_in13: \forall integer j;0<=j<vl ==> ext_same(v_o1c3.lane[j],cv_progress{CvR}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,output_y+1,ow_done+j,(output_channels-c)+3,dx*9+c_in*3));
            loop assigns v_o0c0,v_o0c1,v_o0c2,v_o0c3,v_o1c0,v_o1c1,v_o1c2,v_o1c3,errno;
            loop variant 3-c_in;
        */
for (int c_in = 0; c_in < 3; c_in++) {
            int32_t scalar_offset = (dx * 3 + c_in) * 4;
            // Per-lane offset is (lane+ow_done)*24 + scalar_offset: a fixed 24-byte stride,
            // so a strided load + mask-merge replaces the indexed gather (same values).
            const ptrdiff_t v_off = (ptrdiff_t)ow_done * 24 + scalar_offset;
            const ptrdiff_t v_str = 24;
            vfloat32m1_t v_in0 = __riscv_vmerge_vvm_f32m1(v_zero, __riscv_vlse32_v_f32m1_m(mask, (const float*)((uintptr_t)i0_base + v_off), v_str, vl), mask, vl);
            vfloat32m1_t v_in1 = __riscv_vmerge_vvm_f32m1(v_zero, __riscv_vlse32_v_f32m1_m(mask, (const float*)((uintptr_t)i1_base + v_off), v_str, vl), mask, vl);
            vfloat32m1_t v_in2 = __riscv_vmerge_vvm_f32m1(v_zero, __riscv_vlse32_v_f32m1_m(mask, (const float*)((uintptr_t)i2_base + v_off), v_str, vl), mask, vl);
            vfloat32m1_t v_in3 = __riscv_vmerge_vvm_f32m1(v_zero, __riscv_vlse32_v_f32m1_m(mask, (const float*)((uintptr_t)i3_base + v_off), v_str, vl), mask, vl);
            vfloat32m1_t v_in4 = __riscv_vmerge_vvm_f32m1(v_zero, __riscv_vlse32_v_f32m1_m(mask, (const float*)((uintptr_t)i4_base + v_off), v_str, vl), mask, vl);

                    /*@ loop invariant cv_ky: 0<=ky<=3;
            loop invariant cv_acc_ky00: \forall integer j;0<=j<vl ==> ext_same(v_o0c0.lane[j],cv_progress{CvR}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,output_y+0,ow_done+j,(output_channels-c)+0,dx*9+c_in*3+ky));
            loop invariant cv_acc_ky01: \forall integer j;0<=j<vl ==> ext_same(v_o0c1.lane[j],cv_progress{CvR}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,output_y+0,ow_done+j,(output_channels-c)+1,dx*9+c_in*3+ky));
            loop invariant cv_acc_ky02: \forall integer j;0<=j<vl ==> ext_same(v_o0c2.lane[j],cv_progress{CvR}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,output_y+0,ow_done+j,(output_channels-c)+2,dx*9+c_in*3+ky));
            loop invariant cv_acc_ky03: \forall integer j;0<=j<vl ==> ext_same(v_o0c3.lane[j],cv_progress{CvR}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,output_y+0,ow_done+j,(output_channels-c)+3,dx*9+c_in*3+ky));
            loop invariant cv_acc_ky10: \forall integer j;0<=j<vl ==> ext_same(v_o1c0.lane[j],cv_progress{CvR}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,output_y+1,ow_done+j,(output_channels-c)+0,dx*9+c_in*3+ky));
            loop invariant cv_acc_ky11: \forall integer j;0<=j<vl ==> ext_same(v_o1c1.lane[j],cv_progress{CvR}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,output_y+1,ow_done+j,(output_channels-c)+1,dx*9+c_in*3+ky));
            loop invariant cv_acc_ky12: \forall integer j;0<=j<vl ==> ext_same(v_o1c2.lane[j],cv_progress{CvR}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,output_y+1,ow_done+j,(output_channels-c)+2,dx*9+c_in*3+ky));
            loop invariant cv_acc_ky13: \forall integer j;0<=j<vl ==> ext_same(v_o1c3.lane[j],cv_progress{CvR}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,output_y+1,ow_done+j,(output_channels-c)+3,dx*9+c_in*3+ky));
            loop assigns v_o0c0,v_o0c1,v_o0c2,v_o0c3,v_o1c0,v_o1c1,v_o1c2,v_o1c3,errno;
            loop variant 3-ky;
        */
for (int ky = 0; ky < 3; ky++) {
              vfloat32m1_t v_in_row0 = (ky == 0) ? v_in0 : (ky == 1) ? v_in1 : v_in2;
              vfloat32m1_t v_in_row1 = (ky == 0) ? v_in2 : (ky == 1) ? v_in3 : v_in4;

              // NEON c3x4 plane order = kc*9 + ch*3 + kr (= dx*9 + c_in*3 + ky); aligns weight
              // reads with the gold so the shared symbolic weight buffer matches on both sides.
              int w_idx = (dx * 9 + c_in * 3 + ky) * 4;
              float w0 = w[4 + w_idx + 0];
              float w1 = w[4 + w_idx + 1];
              float w2 = w[4 + w_idx + 2];
              float w3 = w[4 + w_idx + 3];

              //@ ghost CvUpdate00: ;
              v_o0c0 = (dx == 2)
                ? __riscv_vmerge_vvm_f32m1(v_o0c0, __riscv_vfmacc_vf_f32m1(v_o0c0, w0, v_in_row0, vl), mask, vl)
                : __riscv_vfmacc_vf_f32m1(v_o0c0, w0, v_in_row0, vl);
              /*@ assert cv_actual_update00: \forall integer j;0<=j<vl ==> ext_same(v_o0c0.lane[j],(dx==2 && mask.lane[j]==0)?\at(v_o0c0.lane[j],CvUpdate00):shim_fma32(w0,v_in_row0.lane[j],\at(v_o0c0.lane[j],CvUpdate00))); */
              /*@ assert cv_actual_skip00: \forall integer j;0<=j<vl ==> ((dx==2 && mask.lane[j]==0) ==> ext_same(v_o0c0.lane[j],\at(v_o0c0.lane[j],CvUpdate00))); */
              //@ ghost CvUpdate01: ;
              v_o0c1 = (dx == 2)
                ? __riscv_vmerge_vvm_f32m1(v_o0c1, __riscv_vfmacc_vf_f32m1(v_o0c1, w1, v_in_row0, vl), mask, vl)
                : __riscv_vfmacc_vf_f32m1(v_o0c1, w1, v_in_row0, vl);
              /*@ assert cv_actual_update01: \forall integer j;0<=j<vl ==> ext_same(v_o0c1.lane[j],(dx==2 && mask.lane[j]==0)?\at(v_o0c1.lane[j],CvUpdate01):shim_fma32(w1,v_in_row0.lane[j],\at(v_o0c1.lane[j],CvUpdate01))); */
              /*@ assert cv_actual_skip01: \forall integer j;0<=j<vl ==> ((dx==2 && mask.lane[j]==0) ==> ext_same(v_o0c1.lane[j],\at(v_o0c1.lane[j],CvUpdate01))); */
              //@ ghost CvUpdate02: ;
              v_o0c2 = (dx == 2)
                ? __riscv_vmerge_vvm_f32m1(v_o0c2, __riscv_vfmacc_vf_f32m1(v_o0c2, w2, v_in_row0, vl), mask, vl)
                : __riscv_vfmacc_vf_f32m1(v_o0c2, w2, v_in_row0, vl);
              /*@ assert cv_actual_update02: \forall integer j;0<=j<vl ==> ext_same(v_o0c2.lane[j],(dx==2 && mask.lane[j]==0)?\at(v_o0c2.lane[j],CvUpdate02):shim_fma32(w2,v_in_row0.lane[j],\at(v_o0c2.lane[j],CvUpdate02))); */
              /*@ assert cv_actual_skip02: \forall integer j;0<=j<vl ==> ((dx==2 && mask.lane[j]==0) ==> ext_same(v_o0c2.lane[j],\at(v_o0c2.lane[j],CvUpdate02))); */
              //@ ghost CvUpdate03: ;
              v_o0c3 = (dx == 2)
                ? __riscv_vmerge_vvm_f32m1(v_o0c3, __riscv_vfmacc_vf_f32m1(v_o0c3, w3, v_in_row0, vl), mask, vl)
                : __riscv_vfmacc_vf_f32m1(v_o0c3, w3, v_in_row0, vl);
              /*@ assert cv_actual_update03: \forall integer j;0<=j<vl ==> ext_same(v_o0c3.lane[j],(dx==2 && mask.lane[j]==0)?\at(v_o0c3.lane[j],CvUpdate03):shim_fma32(w3,v_in_row0.lane[j],\at(v_o0c3.lane[j],CvUpdate03))); */
              /*@ assert cv_actual_skip03: \forall integer j;0<=j<vl ==> ((dx==2 && mask.lane[j]==0) ==> ext_same(v_o0c3.lane[j],\at(v_o0c3.lane[j],CvUpdate03))); */

              //@ ghost CvUpdate10: ;
              v_o1c0 = (dx == 2)
                ? __riscv_vmerge_vvm_f32m1(v_o1c0, __riscv_vfmacc_vf_f32m1(v_o1c0, w0, v_in_row1, vl), mask, vl)
                : __riscv_vfmacc_vf_f32m1(v_o1c0, w0, v_in_row1, vl);
              /*@ assert cv_actual_update10: \forall integer j;0<=j<vl ==> ext_same(v_o1c0.lane[j],(dx==2 && mask.lane[j]==0)?\at(v_o1c0.lane[j],CvUpdate10):shim_fma32(w0,v_in_row1.lane[j],\at(v_o1c0.lane[j],CvUpdate10))); */
              /*@ assert cv_actual_skip10: \forall integer j;0<=j<vl ==> ((dx==2 && mask.lane[j]==0) ==> ext_same(v_o1c0.lane[j],\at(v_o1c0.lane[j],CvUpdate10))); */
              //@ ghost CvUpdate11: ;
              v_o1c1 = (dx == 2)
                ? __riscv_vmerge_vvm_f32m1(v_o1c1, __riscv_vfmacc_vf_f32m1(v_o1c1, w1, v_in_row1, vl), mask, vl)
                : __riscv_vfmacc_vf_f32m1(v_o1c1, w1, v_in_row1, vl);
              /*@ assert cv_actual_update11: \forall integer j;0<=j<vl ==> ext_same(v_o1c1.lane[j],(dx==2 && mask.lane[j]==0)?\at(v_o1c1.lane[j],CvUpdate11):shim_fma32(w1,v_in_row1.lane[j],\at(v_o1c1.lane[j],CvUpdate11))); */
              /*@ assert cv_actual_skip11: \forall integer j;0<=j<vl ==> ((dx==2 && mask.lane[j]==0) ==> ext_same(v_o1c1.lane[j],\at(v_o1c1.lane[j],CvUpdate11))); */
              //@ ghost CvUpdate12: ;
              v_o1c2 = (dx == 2)
                ? __riscv_vmerge_vvm_f32m1(v_o1c2, __riscv_vfmacc_vf_f32m1(v_o1c2, w2, v_in_row1, vl), mask, vl)
                : __riscv_vfmacc_vf_f32m1(v_o1c2, w2, v_in_row1, vl);
              /*@ assert cv_actual_update12: \forall integer j;0<=j<vl ==> ext_same(v_o1c2.lane[j],(dx==2 && mask.lane[j]==0)?\at(v_o1c2.lane[j],CvUpdate12):shim_fma32(w2,v_in_row1.lane[j],\at(v_o1c2.lane[j],CvUpdate12))); */
              /*@ assert cv_actual_skip12: \forall integer j;0<=j<vl ==> ((dx==2 && mask.lane[j]==0) ==> ext_same(v_o1c2.lane[j],\at(v_o1c2.lane[j],CvUpdate12))); */
              //@ ghost CvUpdate13: ;
              v_o1c3 = (dx == 2)
                ? __riscv_vmerge_vvm_f32m1(v_o1c3, __riscv_vfmacc_vf_f32m1(v_o1c3, w3, v_in_row1, vl), mask, vl)
                : __riscv_vfmacc_vf_f32m1(v_o1c3, w3, v_in_row1, vl);
              /*@ assert cv_actual_update13: \forall integer j;0<=j<vl ==> ext_same(v_o1c3.lane[j],(dx==2 && mask.lane[j]==0)?\at(v_o1c3.lane[j],CvUpdate13):shim_fma32(w3,v_in_row1.lane[j],\at(v_o1c3.lane[j],CvUpdate13))); */
              /*@ assert cv_actual_skip13: \forall integer j;0<=j<vl ==> ((dx==2 && mask.lane[j]==0) ==> ext_same(v_o1c3.lane[j],\at(v_o1c3.lane[j],CvUpdate13))); */
            }
          }
        }

        /*@ assert cv_full_acc00: \forall integer j;0<=j<vl ==> ext_same(v_o0c0.lane[j],cv_progress{CvR}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,output_y+0,ow_done+j,(output_channels-c)+0,27)); */
        /*@ assert cv_full_acc01: \forall integer j;0<=j<vl ==> ext_same(v_o0c1.lane[j],cv_progress{CvR}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,output_y+0,ow_done+j,(output_channels-c)+1,27)); */
        /*@ assert cv_full_acc02: \forall integer j;0<=j<vl ==> ext_same(v_o0c2.lane[j],cv_progress{CvR}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,output_y+0,ow_done+j,(output_channels-c)+2,27)); */
        /*@ assert cv_full_acc03: \forall integer j;0<=j<vl ==> ext_same(v_o0c3.lane[j],cv_progress{CvR}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,output_y+0,ow_done+j,(output_channels-c)+3,27)); */
        /*@ assert cv_full_acc10: \forall integer j;0<=j<vl ==> ext_same(v_o1c0.lane[j],cv_progress{CvR}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,output_y+1,ow_done+j,(output_channels-c)+0,27)); */
        /*@ assert cv_full_acc11: \forall integer j;0<=j<vl ==> ext_same(v_o1c1.lane[j],cv_progress{CvR}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,output_y+1,ow_done+j,(output_channels-c)+1,27)); */
        /*@ assert cv_full_acc12: \forall integer j;0<=j<vl ==> ext_same(v_o1c2.lane[j],cv_progress{CvR}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,output_y+1,ow_done+j,(output_channels-c)+2,27)); */
        /*@ assert cv_full_acc13: \forall integer j;0<=j<vl ==> ext_same(v_o1c3.lane[j],cv_progress{CvR}(cv_I,cv_Z,cv_W,input_height,input_width,input_padding_top,output_y+1,ow_done+j,(output_channels-c)+3,27)); */
        v_o0c0 = salty_max_vf_m1(v_o0c0, params->scalar.min, vl);
        v_o0c1 = salty_max_vf_m1(v_o0c1, params->scalar.min, vl);
        v_o0c2 = salty_max_vf_m1(v_o0c2, params->scalar.min, vl);
        v_o0c3 = salty_max_vf_m1(v_o0c3, params->scalar.min, vl);

        v_o1c0 = salty_max_vf_m1(v_o1c0, params->scalar.min, vl);
        v_o1c1 = salty_max_vf_m1(v_o1c1, params->scalar.min, vl);
        v_o1c2 = salty_max_vf_m1(v_o1c2, params->scalar.min, vl);
        v_o1c3 = salty_max_vf_m1(v_o1c3, params->scalar.min, vl);

        v_o0c0 = salty_min_vf_m1(v_o0c0, params->scalar.max, vl);
        v_o0c1 = salty_min_vf_m1(v_o0c1, params->scalar.max, vl);
        v_o0c2 = salty_min_vf_m1(v_o0c2, params->scalar.max, vl);
        v_o0c3 = salty_min_vf_m1(v_o0c3, params->scalar.max, vl);
        v_o1c0 = salty_min_vf_m1(v_o1c0, params->scalar.max, vl);
        v_o1c1 = salty_min_vf_m1(v_o1c1, params->scalar.max, vl);
        v_o1c2 = salty_min_vf_m1(v_o1c2, params->scalar.max, vl);
        v_o1c3 = salty_min_vf_m1(v_o1c3, params->scalar.max, vl);

        // Store row 1 BEFORE row 0: when there is a single output row the caller
        // aliases output1==output0, so the LAST store must be the valid row 0
        // (matches the NEON gold; storing o0 last fixes the row-1-overwrites-row-0 bug).
        __riscv_vse32_v_f32m1(current_o1c0, v_o1c0, vl); current_o1c0 += vl;
        __riscv_vse32_v_f32m1(current_o1c1, v_o1c1, vl); current_o1c1 += vl;
        __riscv_vse32_v_f32m1(current_o1c2, v_o1c2, vl); current_o1c2 += vl;
        __riscv_vse32_v_f32m1(current_o1c3, v_o1c3, vl); current_o1c3 += vl;

        __riscv_vse32_v_f32m1(current_o0c0, v_o0c0, vl); current_o0c0 += vl;
        __riscv_vse32_v_f32m1(current_o0c1, v_o0c1, vl); current_o0c1 += vl;
        __riscv_vse32_v_f32m1(current_o0c2, v_o0c2, vl); current_o0c2 += vl;
        __riscv_vse32_v_f32m1(current_o0c3, v_o0c3, vl); current_o0c3 += vl;

        ow -= vl;
        ow_done += vl;
      }

      o0c0 = (float*) ((uintptr_t) current_o0c0 + output_channel_increment);
      o0c1 = (float*) ((uintptr_t) current_o0c1 + output_channel_increment);
      o0c2 = (float*) ((uintptr_t) current_o0c2 + output_channel_increment);
      o0c3 = (float*) ((uintptr_t) current_o0c3 + output_channel_increment);
      o1c0 = (float*) ((uintptr_t) current_o1c0 + output_channel_increment);
      o1c1 = (float*) ((uintptr_t) current_o1c1 + output_channel_increment);
      o1c2 = (float*) ((uintptr_t) current_o1c2 + output_channel_increment);
      o1c3 = (float*) ((uintptr_t) current_o1c3 + output_channel_increment);

      w += 112;
      c = (c > 4) ? c - 4 : 0;
    } while (c != 0);

    output0 = (float*) ((uintptr_t) output1 + output_height_stride);
    output1 = (float*) ((uintptr_t) output0 + output_height_stride);

    i0 = i4;
    i1 = (const float*) ((uintptr_t) i0 + input_height_stride);
    i2 = (const float*) ((uintptr_t) i1 + input_height_stride);
    i3 = (const float*) ((uintptr_t) i2 + input_height_stride);
    i4 = (const float*) ((uintptr_t) i3 + input_height_stride);
  }
}
