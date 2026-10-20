/*@ logic integer sp_strip_for(integer M,integer row) = row<4*(M/4)?row/4:M/4+(row%4>=2?1:0);
     logic float sp_fold{L}(float *A,float *W,int32_t *D,uint32_t *N,integer M,integer NC,integer row,integer strip,integer col,integer t) =
      t<=0 ? W[col+prefix_nnz(N,col)] :
      shim_fma32(A[row+strip*(prefix_diff(D,prefix_nnz(N,NC))/4)+prefix_diff(D,prefix_nnz(N,col)+t-1)/4],
       W[col+prefix_nnz(N,col)+t],sp_fold(A,W,D,N,M,NC,row,strip,col,t-1));
     logic float sp_clamp(float x,float lo,float hi) = ext_neon_max32(ext_neon_min32(x,hi),lo);
     lemma sp_fma_swap: \forall float x,y,a;ext_same(shim_fma32(x,y,a),shim_fma32(y,x,a));
*/
/*@ lemma sp_fold_zero{L}: \forall float *A,*W;\forall int32_t *D;\forall uint32_t *N;\forall integer M,NC,r,s,c;ext_same(sp_fold(A,W,D,N,M,NC,r,s,c,0),W[c+prefix_nnz(N,c)]);
     lemma sp_fold_step{L}: \forall float *A,*W;\forall int32_t *D;\forall uint32_t *N;\forall integer M,NC,r,s,c,t;t>=0 ==> ext_same(sp_fold(A,W,D,N,M,NC,r,s,c,t+1),shim_fma32(A[r+s*(prefix_diff(D,prefix_nnz(N,NC))/4)+prefix_diff(D,prefix_nnz(N,c)+t)/4],W[c+prefix_nnz(N,c)+t+1],sp_fold(A,W,D,N,M,NC,r,s,c,t)));
     lemma sp_prefix_nnz_step{L}: \forall uint32_t *N;\forall integer j;j>=0 ==> prefix_nnz(N,j+1)==prefix_nnz(N,j)+N[j];
     lemma sp_prefix_diff_step{L}: \forall int32_t *D;\forall integer j;j>=0 ==> prefix_diff(D,j+1)==prefix_diff(D,j)+D[j];
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
    size_t mc,
    size_t nc,
    const float* input,
    const float* weights,
    const int32_t* widx_dmap,
    const uint32_t* nidx_nnzmap,
    float* output,
    size_t output_stride,
    const struct xnn_f32_minmax_params* restrict params)
{
  assert(mc != 0);
  assert(mc % sizeof(float) == 0);
  assert(nc != 0);

  #if XNN_ARCH_ARM64
    const float32x4x2_t vminmax = vld2q_dup_f32(&params->scalar.min);
    const float32x4_t vmin = vminmax.val[0];
    const float32x4_t vmax = vminmax.val[1];
  #else
    const float32x2x2_t vminmax = vld2_dup_f32(&params->scalar.min);
    const float32x4_t vmin = vcombine_f32(vminmax.val[0], vminmax.val[0]);
    const float32x4_t vmax = vcombine_f32(vminmax.val[1], vminmax.val[1]);
  #endif

  //@ ghost SpN: ;
  /*@ ghost const float *sp_A=input; const float *sp_W=weights; const int32_t *sp_D=widx_dmap; const uint32_t *sp_N=nidx_nnzmap; float *sp_O=output; size_t sp_M=mc/4; size_t sp_rows=0; size_t sp_strip=0; */
  size_t output_decrement = output_stride * nc - 4 * sizeof(float);
  /*@ loop invariant sp_rows: 0<=sp_rows<=sp_M;
      loop invariant sp_input_strip: input==sp_A+sp_rows+sp_strip*(prefix_diff(sp_D,prefix_nnz(sp_N,nc))/4);
      loop invariant sp_output_strip: output==sp_O+sp_rows;
      loop invariant sp_output_prefix: \forall integer rr,cc;0<=rr<sp_rows && 0<=cc<nc ==> ext_same(sp_O[cc*(output_stride/4)+rr],sp_clamp(sp_fold{SpN}(sp_A,sp_W,sp_D,sp_N,sp_M,nc,rr,sp_strip_for(sp_M,rr),cc,prefix_nnz(sp_N,cc+1)-prefix_nnz(sp_N,cc)),params->scalar.min,params->scalar.max));
      loop invariant sp_strip_schedule: sp_rows<sp_M ==> sp_strip==sp_strip_for(sp_M,sp_rows);
      loop invariant sp_strip_bound: 0<=sp_strip<=sp_M;
      loop invariant sp_remaining: mc==4*(sp_M-sp_rows);
      loop assigns mc,output_decrement,input,output,sp_rows,sp_strip,sp_O[0..nc*(sp_M+4)-1],errno;
      loop variant mc;
  */
  while XNN_LIKELY(mc >= 4 * sizeof(float)) {
    const float* w = weights;
    const int32_t* dmap = widx_dmap;
    const uint32_t* nnzmap = nidx_nnzmap;
    size_t n = nc;
        /*@ loop invariant sp_columns0: 0<n<=nc;
        loop invariant sp_nnz_cursor0: nnzmap==sp_N+(nc-n);
        loop invariant sp_delta_cursor0: dmap==sp_D+prefix_nnz(sp_N,(nc-n));
        loop invariant sp_weight_col0: w==sp_W+(nc-n)+prefix_nnz(sp_N,(nc-n));
        loop invariant sp_input_col0: input==sp_A+sp_rows+sp_strip*(prefix_diff(sp_D,prefix_nnz(sp_N,nc))/4)+prefix_diff(sp_D,prefix_nnz(sp_N,(nc-n)))/4;
        loop invariant sp_column_output0: \forall integer cc,j;0<=cc<(nc-n) && 0<=j<4 ==> ext_same(sp_O[cc*(output_stride/4)+sp_rows+j],sp_clamp(sp_fold{SpN}(sp_A,sp_W,sp_D,sp_N,sp_M,nc,sp_rows+j,sp_strip_for(sp_M,sp_rows+j),cc,prefix_nnz(sp_N,cc+1)-prefix_nnz(sp_N,cc)),params->scalar.min,params->scalar.max));
        loop assigns n,w,dmap,nnzmap,input,output,sp_O[0..nc*(sp_M+4)-1],errno;
        loop variant n;
    */
do {
      uint32_t nnz = *nnzmap++;
      //@ ghost uint32_t sp_count=nnz;
      float32x4_t vacc0123 = vld1q_dup_f32(w); w += 1;
      if XNN_LIKELY(nnz != 0) {
                /*@ loop invariant sp_nnz0: 0<nnz<=sp_count;
            loop invariant sp_count0: sp_count==(prefix_nnz(sp_N,(nc-n)+1)-prefix_nnz(sp_N,(nc-n)));
            loop invariant sp_delta_entry0: dmap==sp_D+prefix_nnz(sp_N,(nc-n))+(sp_count-nnz);
            loop invariant sp_weight_entry0: w==sp_W+(nc-n)+prefix_nnz(sp_N,(nc-n))+1+(sp_count-nnz);
            loop invariant sp_input_entry0: input==sp_A+sp_rows+sp_strip*(prefix_diff(sp_D,prefix_nnz(sp_N,nc))/4)+prefix_diff(sp_D,prefix_nnz(sp_N,(nc-n))+(sp_count-nnz))/4;
            loop invariant sp_acc0: \forall integer j;0<=j<4 ==> ext_same(vacc0123.lane[j],sp_fold{SpN}(sp_A,sp_W,sp_D,sp_N,sp_M,nc,sp_rows+j,sp_strip,(nc-n),(sp_count-nnz)));
            loop assigns nnz,dmap,w,input,vacc0123,errno;
            loop variant nnz;
        */
do {
          const intptr_t diff = *dmap++;
          const float32x4_t vi0123 = vld1q_f32(input);
          input = (const float*) ((uintptr_t) input + (uintptr_t) diff);
          xnn_prefetch_to_l1(input + 16);
          const float32x4_t vw = vld1q_dup_f32(w); w += 1;
          xnn_prefetch_to_l1(w + 32);
          vacc0123 = vfmaq_f32(vacc0123, vi0123, vw);
        } while (--nnz != 0);
      }      /*@ assert sp_full_acc0: \forall integer j;0<=j<4 ==> ext_same(vacc0123.lane[j],sp_fold{SpN}(sp_A,sp_W,sp_D,sp_N,sp_M,nc,sp_rows+j,sp_strip,(nc-n),(prefix_nnz(sp_N,(nc-n)+1)-prefix_nnz(sp_N,(nc-n))))); */

      float32x4_t vout0123 = vminq_f32(vacc0123, vmax);
      vout0123 = vmaxq_f32(vout0123, vmin);
      vst1q_f32(output, vout0123);
      output = (float*) ((uintptr_t) output + output_stride);
    } while (--n != 0);
    output = (float*) ((uintptr_t) output - output_decrement);
    input += 4;
    mc -= 4 * sizeof(float);
    //@ ghost sp_rows+=4; sp_strip++;
  }
  if XNN_UNLIKELY(mc != 0) {
    output_decrement += 2 * sizeof(float);
    if (mc & (2 * sizeof(float))) {
      const float* w = weights;
      const int32_t* dmap = widx_dmap;
      const uint32_t* nnzmap = nidx_nnzmap;
      size_t n = nc;
            /*@ loop invariant sp_columns1: 0<n<=nc;
          loop invariant sp_nnz_cursor1: nnzmap==sp_N+(nc-n);
          loop invariant sp_delta_cursor1: dmap==sp_D+prefix_nnz(sp_N,(nc-n));
          loop invariant sp_weight_col1: w==sp_W+(nc-n)+prefix_nnz(sp_N,(nc-n));
          loop invariant sp_input_col1: input==sp_A+sp_rows+sp_strip*(prefix_diff(sp_D,prefix_nnz(sp_N,nc))/4)+prefix_diff(sp_D,prefix_nnz(sp_N,(nc-n)))/4;
          loop invariant sp_column_output1: \forall integer cc,j;0<=cc<(nc-n) && 0<=j<2 ==> ext_same(sp_O[cc*(output_stride/4)+sp_rows+j],sp_clamp(sp_fold{SpN}(sp_A,sp_W,sp_D,sp_N,sp_M,nc,sp_rows+j,sp_strip_for(sp_M,sp_rows+j),cc,prefix_nnz(sp_N,cc+1)-prefix_nnz(sp_N,cc)),params->scalar.min,params->scalar.max));
          loop assigns n,w,dmap,nnzmap,input,output,sp_O[0..nc*(sp_M+4)-1],errno;
          loop variant n;
      */
do {
        uint32_t nnz = *nnzmap++;
        //@ ghost uint32_t sp_count=nnz;
        float32x2_t vacc01 = vld1_dup_f32(w); w += 1;
        if XNN_LIKELY(nnz != 0) {
                    /*@ loop invariant sp_nnz1: 0<nnz<=sp_count;
              loop invariant sp_count1: sp_count==(prefix_nnz(sp_N,(nc-n)+1)-prefix_nnz(sp_N,(nc-n)));
              loop invariant sp_delta_entry1: dmap==sp_D+prefix_nnz(sp_N,(nc-n))+(sp_count-nnz);
              loop invariant sp_weight_entry1: w==sp_W+(nc-n)+prefix_nnz(sp_N,(nc-n))+1+(sp_count-nnz);
              loop invariant sp_input_entry1: input==sp_A+sp_rows+sp_strip*(prefix_diff(sp_D,prefix_nnz(sp_N,nc))/4)+prefix_diff(sp_D,prefix_nnz(sp_N,(nc-n))+(sp_count-nnz))/4;
              loop invariant sp_acc1: \forall integer j;0<=j<2 ==> ext_same(vacc01.lane[j],sp_fold{SpN}(sp_A,sp_W,sp_D,sp_N,sp_M,nc,sp_rows+j,sp_strip,(nc-n),(sp_count-nnz)));
              loop assigns nnz,dmap,w,input,vacc01,errno;
              loop variant nnz;
          */
do {
            const intptr_t diff = *dmap++;
            const float32x2_t vi01 = vld1_f32(input);
            input = (const float*) ((uintptr_t) input + (uintptr_t) diff);
            const float32x2_t vw = vld1_dup_f32(w); w += 1;
            vacc01 = vfma_f32(vacc01, vi01, vw);
          } while (--nnz != 0);
        }        /*@ assert sp_full_acc1: \forall integer j;0<=j<2 ==> ext_same(vacc01.lane[j],sp_fold{SpN}(sp_A,sp_W,sp_D,sp_N,sp_M,nc,sp_rows+j,sp_strip,(nc-n),(prefix_nnz(sp_N,(nc-n)+1)-prefix_nnz(sp_N,(nc-n))))); */

        float32x2_t vout01 = vmin_f32(vacc01, vget_low_f32(vmax));
        vout01 = vmax_f32(vout01, vget_low_f32(vmin));
        vst1_f32(output, vout01);
        output = (float*) ((uintptr_t) output + output_stride);
      } while (--n != 0);
      output = (float*) ((uintptr_t) output - output_decrement);
      input += 2;
      //@ ghost sp_rows+=2; sp_strip++;
    }
    output_decrement += 1 * sizeof(float);
    if (mc & (1 * sizeof(float))) {
      const float* w = weights;
      const int32_t* dmap = widx_dmap;
      const uint32_t* nnzmap = nidx_nnzmap;
      size_t n = nc;
            /*@ loop invariant sp_columns2: 0<n<=nc;
          loop invariant sp_nnz_cursor2: nnzmap==sp_N+(nc-n);
          loop invariant sp_delta_cursor2: dmap==sp_D+prefix_nnz(sp_N,(nc-n));
          loop invariant sp_weight_col2: w==sp_W+(nc-n)+prefix_nnz(sp_N,(nc-n));
          loop invariant sp_input_col2: input==sp_A+sp_rows+sp_strip*(prefix_diff(sp_D,prefix_nnz(sp_N,nc))/4)+prefix_diff(sp_D,prefix_nnz(sp_N,(nc-n)))/4;
          loop invariant sp_column_output2: \forall integer cc,j;0<=cc<(nc-n) && 0<=j<1 ==> ext_same(sp_O[cc*(output_stride/4)+sp_rows+j],sp_clamp(sp_fold{SpN}(sp_A,sp_W,sp_D,sp_N,sp_M,nc,sp_rows+j,sp_strip_for(sp_M,sp_rows+j),cc,prefix_nnz(sp_N,cc+1)-prefix_nnz(sp_N,cc)),params->scalar.min,params->scalar.max));
          loop assigns n,w,dmap,nnzmap,input,output,sp_O[0..nc*(sp_M+4)-1],errno;
          loop variant n;
      */
do {
        uint32_t nnz = *nnzmap++;
        //@ ghost uint32_t sp_count=nnz;
        float32x2_t vacc0 = vld1_dup_f32(w); w += 1;
        if XNN_LIKELY(nnz != 0) {
                    /*@ loop invariant sp_nnz2: 0<nnz<=sp_count;
              loop invariant sp_count2: sp_count==(prefix_nnz(sp_N,(nc-n)+1)-prefix_nnz(sp_N,(nc-n)));
              loop invariant sp_delta_entry2: dmap==sp_D+prefix_nnz(sp_N,(nc-n))+(sp_count-nnz);
              loop invariant sp_weight_entry2: w==sp_W+(nc-n)+prefix_nnz(sp_N,(nc-n))+1+(sp_count-nnz);
              loop invariant sp_input_entry2: input==sp_A+sp_rows+sp_strip*(prefix_diff(sp_D,prefix_nnz(sp_N,nc))/4)+prefix_diff(sp_D,prefix_nnz(sp_N,(nc-n))+(sp_count-nnz))/4;
              loop invariant sp_acc2: \forall integer j;0<=j<1 ==> ext_same(vacc0.lane[j],sp_fold{SpN}(sp_A,sp_W,sp_D,sp_N,sp_M,nc,sp_rows+j,sp_strip,(nc-n),(sp_count-nnz)));
              loop assigns nnz,dmap,w,input,vacc0,errno;
              loop variant nnz;
          */
do {
            const intptr_t diff = *dmap++;
            const float32x2_t vi0 = vld1_dup_f32(input);
            input = (const float*) ((uintptr_t) input + (uintptr_t) diff);
            const float32x2_t vw = vld1_dup_f32(w); w += 1;
            vacc0 = vfma_f32(vacc0, vi0, vw);
          } while (--nnz != 0);
        }        /*@ assert sp_full_acc2: \forall integer j;0<=j<1 ==> ext_same(vacc0.lane[j],sp_fold{SpN}(sp_A,sp_W,sp_D,sp_N,sp_M,nc,sp_rows+j,sp_strip,(nc-n),(prefix_nnz(sp_N,(nc-n)+1)-prefix_nnz(sp_N,(nc-n))))); */

        float32x2_t vout0 = vmin_f32(vacc0, vget_low_f32(vmax));
        vout0 = vmax_f32(vout0, vget_low_f32(vmin));
        vst1_lane_f32(output, vout0, 0);
        output = (float*) ((uintptr_t) output + output_stride);
      } while (--n != 0);
      output = (float*) ((uintptr_t) output - output_decrement);
      input += 1;
      //@ ghost sp_rows+=1; sp_strip++;
    }
  }
  /*@ assert sp_complete_rows: sp_rows==sp_M; */
  /*@ assert sp_complete_output: \forall integer rr,cc;0<=rr<sp_rows && 0<=cc<nc ==> ext_same(sp_O[cc*(output_stride/4)+rr],sp_clamp(sp_fold{SpN}(sp_A,sp_W,sp_D,sp_N,sp_M,nc,rr,sp_strip_for(sp_M,rr),cc,prefix_nnz(sp_N,cc+1)-prefix_nnz(sp_N,cc)),params->scalar.min,params->scalar.max)); */
}
