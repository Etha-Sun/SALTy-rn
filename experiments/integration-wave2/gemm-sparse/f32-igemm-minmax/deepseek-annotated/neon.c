/*@
  logic float ig_fold(float **A,float *W,integer K,integer P,integer B,integer lane,integer t) =
       t<=0 || K<=0 ? W[B*(1+P*K)*8+lane] :
       shim_fma32(A[(t-1)/K][(t-1)%K],W[(B*(1+P*K)+t)*8+lane],ig_fold(A,W,K,P,B,lane,t-1));
  logic float ig_acc(float **A,float *W,integer K,integer P,integer B,integer lane,integer pos,integer kind) =
       ig_fold(A,W,K,P,B,lane,pos*K+kind);
  logic float ig_clamp(float x,float lo,float hi) = ext_neon_max32(ext_neon_min32(x,hi),lo);
*/
/*@ lemma ig_acc_zero: \forall float **A;\forall float *W;\forall integer K,P,B,j;
      ig_acc(A,W,K,P,B,j,0,0)==W[B*(1+P*K)*8+j];
    lemma ig_acc_advance: \forall float **A;\forall float *W;\forall integer K,P,B,j,pos,kind;
      K>0 && pos>=0 && 1<=kind<=K ==>
      ig_acc(A,W,K,P,B,j,pos,kind)==shim_fma32(A[pos][kind-1],W[(B*(1+P*K)+pos*K+kind)*8+j],ig_acc(A,W,K,P,B,j,pos,kind-1));
    lemma ig_acc_advance_ext: \forall float **A;\forall float *W;\forall integer K,P,B,j,pos,kind;\forall float x,y,z;
      K>0 && pos>=0 && 1<=kind<=K &&
      x==A[pos][kind-1] &&
      y==W[(B*(1+P*K)+pos*K+kind)*8+j] &&
      ext_same(z,ig_acc(A,W,K,P,B,j,pos,kind-1)) ==>
      ext_same(shim_fma32(x,y,z),ig_acc(A,W,K,P,B,j,pos,kind));
    lemma ig_fma_congruence: \forall float x,X,y,Y,z,Z;
      ext_same(x,X) && ext_same(y,Y) && ext_same(z,Z) ==>
      ext_same(shim_fma32(x,y,z),shim_fma32(X,Y,Z));
    lemma ext_min_congruence: \forall float a,b,c;
      ext_same(a,b) ==> ext_same(ext_neon_min32(a,c),ext_neon_min32(b,c));
    lemma ext_max_congruence: \forall float a,b,c;
      ext_same(a,b) ==> ext_same(ext_neon_max32(a,c),ext_neon_max32(b,c));
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
    size_t mr,
    size_t nc,
    size_t kc,
    size_t ks,
    const float** restrict a,
    const float* restrict w,
    float* restrict c,
    size_t cm_stride,
    size_t cn_stride,
    size_t a_offset,
    const float* zero,
    const struct xnn_f32_minmax_params* restrict params)
{
  assert(mr != 0);
  assert(mr <= 1);
  assert(nc != 0);
  assert(kc != 0);
  assert(kc % sizeof(float) == 0);
  assert(ks != 0);
  assert(ks % (1 * sizeof(void*)) == 0);
  assert(a_offset % sizeof(float) == 0);
  assert(a != NULL);
  assert(w != NULL);
  assert(c != NULL);

  float* c0 = c;

  /*@ loop invariant ig_nc: 0<=nc<=\at(nc,Pre);
      loop invariant ig_blocks: nc>0 ==> (\at(nc,Pre)-nc)%8==0;
      loop invariant ig_output: \forall integer B,lane; 0<=lane<8 && B*8+lane<\at(nc,Pre)-nc ==>
          ext_same(c[B*8+lane],ig_clamp(ig_acc(\at(a,Pre),\at(w,Pre),(kc/4),(ks/sizeof(void*)),B,lane,(ks/sizeof(void*)),0),params->scalar.min,params->scalar.max));
      loop invariant ig_weight_cursor: w==\at(w,Pre)+((\at(nc,Pre)-nc+7)/8)*(1+(ks/sizeof(void*))*(kc/4))*8;
      loop invariant ig_output_cursor: nc>0 ==> c0==c+\at(nc,Pre)-nc;
      loop invariant ig_table_cursor: nc>0 ==> a==\at(a,Pre);
      loop assigns nc,c0,a,w,c[0..\at(nc,Pre)-1],errno;
      loop variant nc;
  */
  do {
    float32x4_t vacc0x0 = vld1q_f32(w); w += 4;
    float32x4_t vacc0x1 = vld1q_f32(w); w += 4;

    size_t p = ks;
    /*@ loop invariant ig_positions: 0<p<=ks && p%sizeof(void*)==0;
        loop invariant ig_a_cursor: a==\at(a,Pre)+((ks-p)/sizeof(void*));
        loop invariant ig_w_position: w==\at(w,Pre)+(((\at(nc,Pre)-nc)/8)*(1+(ks/sizeof(void*))*(kc/4))+1+((ks-p)/sizeof(void*))*(kc/4))*8;
        loop invariant ig_position_acc0: \forall integer j;0<=j<4 ==> ext_same(vacc0x0.lane[j],ig_acc(\at(a,Pre),\at(w,Pre),(kc/4),(ks/sizeof(void*)),((\at(nc,Pre)-nc)/8),j,((ks-p)/sizeof(void*)),0));
        loop invariant ig_position_acc1: \forall integer j;0<=j<4 ==> ext_same(vacc0x1.lane[j],ig_acc(\at(a,Pre),\at(w,Pre),(kc/4),(ks/sizeof(void*)),((\at(nc,Pre)-nc)/8),j+4,((ks-p)/sizeof(void*)),0));
        loop assigns p,a,w,vacc0x0,vacc0x1,errno;
        loop variant p;
    */
    do {
      const float* restrict a0 = a[0];
      assert(a0 != NULL);
      if XNN_UNPREDICTABLE(a0 != zero) {
        a0 = (const float*) ((uintptr_t) a0 + a_offset);
      }
      a += 1;

      size_t k = kc;
      /*@ loop invariant ig_k: 0<=k<=kc && k%4==0;
          loop invariant ig_input_cursor: a0==\at(a,Pre)[((ks-p)/sizeof(void*))]+((kc-k)/4);
          loop invariant ig_w_k: w==\at(w,Pre)+(((\at(nc,Pre)-nc)/8)*(1+(ks/sizeof(void*))*(kc/4))+1+((ks-p)/sizeof(void*))*(kc/4)+((kc-k)/4))*8;
          loop invariant ig_acc0: \forall integer j;0<=j<4 ==> ext_same(vacc0x0.lane[j],ig_acc(\at(a,Pre),\at(w,Pre),(kc/4),(ks/sizeof(void*)),((\at(nc,Pre)-nc)/8),j,((ks-p)/sizeof(void*)),((kc-k)/4)));
          loop invariant ig_acc1: \forall integer j;0<=j<4 ==> ext_same(vacc0x1.lane[j],ig_acc(\at(a,Pre),\at(w,Pre),(kc/4),(ks/sizeof(void*)),((\at(nc,Pre)-nc)/8),j+4,((ks-p)/sizeof(void*)),((kc-k)/4)));
          loop assigns k,a0,w,vacc0x0,vacc0x1,errno;
          loop variant k;
      */
      for (; k >= 2 * sizeof(float); k -= 2 * sizeof(float)) {
        const float32x2_t va0 = vld1_f32(a0); a0 += 2;

        const float32x4_t vb0123c0 = vld1q_f32(w); w += 4;
        const float32x4_t vb4567c0 = vld1q_f32(w); w += 4;

        const float32x4_t va0c0 = vdupq_lane_f32(va0, 0);
      /*@ assert ig_input_value0: \forall integer j;0<=j<4 ==> va0c0.lane[j]==\at(a,Pre)[((ks-p)/sizeof(void*))][((kc-k)/4)]; */
      /*@ assert ig_weight_value0: \forall integer j;0<=j<4 ==> vb0123c0.lane[j]==\at(w,Pre)[((((\at(nc,Pre)-nc)/8)*(1+(ks/sizeof(void*))*(kc/4))+((ks-p)/sizeof(void*))*(kc/4)+((kc-k)/4))+1)*8+j]; */
        vacc0x0 = vfmaq_f32(vacc0x0, va0c0, vb0123c0);
      /*@ assert ig_next_fold0: \forall integer j;0<=j<4 ==> ext_same(vacc0x0.lane[j],ig_acc(\at(a,Pre),\at(w,Pre),(kc/4),(ks/sizeof(void*)),((\at(nc,Pre)-nc)/8),j,((ks-p)/sizeof(void*)),((kc-k)/4)+1)); */
      /*@ assert ig_weight_value0b: \forall integer j;0<=j<4 ==> vb4567c0.lane[j]==\at(w,Pre)[((((\at(nc,Pre)-nc)/8)*(1+(ks/sizeof(void*))*(kc/4))+((ks-p)/sizeof(void*))*(kc/4)+((kc-k)/4))+1)*8+j+4]; */
        vacc0x1 = vfmaq_f32(vacc0x1, va0c0, vb4567c0);
      /*@ assert ig_next_fold0b: \forall integer j;0<=j<4 ==> ext_same(vacc0x1.lane[j],ig_acc(\at(a,Pre),\at(w,Pre),(kc/4),(ks/sizeof(void*)),((\at(nc,Pre)-nc)/8),j+4,((ks-p)/sizeof(void*)),((kc-k)/4)+1)); */
        const float32x4_t vb0123c1 = vld1q_f32(w); w += 4;
        const float32x4_t vb4567c1 = vld1q_f32(w); w += 4;

        const float32x4_t va0c1 = vdupq_lane_f32(va0, 1);
      /*@ assert ig_input_value1: \forall integer j;0<=j<4 ==> va0c1.lane[j]==\at(a,Pre)[((ks-p)/sizeof(void*))][((kc-k)/4)+1]; */
      /*@ assert ig_weight_value1: \forall integer j;0<=j<4 ==> vb0123c1.lane[j]==\at(w,Pre)[((((\at(nc,Pre)-nc)/8)*(1+(ks/sizeof(void*))*(kc/4))+((ks-p)/sizeof(void*))*(kc/4)+((kc-k)/4))+2)*8+j]; */
        vacc0x0 = vfmaq_f32(vacc0x0, va0c1, vb0123c1);
      /*@ assert ig_next_fold1: \forall integer j;0<=j<4 ==> ext_same(vacc0x0.lane[j],ig_acc(\at(a,Pre),\at(w,Pre),(kc/4),(ks/sizeof(void*)),((\at(nc,Pre)-nc)/8),j,((ks-p)/sizeof(void*)),((kc-k)/4)+2)); */
      /*@ assert ig_weight_value1b: \forall integer j;0<=j<4 ==> vb4567c1.lane[j]==\at(w,Pre)[((((\at(nc,Pre)-nc)/8)*(1+(ks/sizeof(void*))*(kc/4))+((ks-p)/sizeof(void*))*(kc/4)+((kc-k)/4))+2)*8+j+4]; */
        vacc0x1 = vfmaq_f32(vacc0x1, va0c1, vb4567c1);

      /*@ assert ig_next_fold1b: \forall integer j;0<=j<4 ==> ext_same(vacc0x1.lane[j],ig_acc(\at(a,Pre),\at(w,Pre),(kc/4),(ks/sizeof(void*)),((\at(nc,Pre)-nc)/8),j+4,((ks-p)/sizeof(void*)),((kc-k)/4)+2)); */
      }
      if XNN_UNLIKELY(k != 0) {
        const float32x4_t va0 = vld1q_dup_f32(a0);

        const float32x4_t vb0123 = vld1q_f32(w); w += 4;
        const float32x4_t vb4567 = vld1q_f32(w); w += 4;

      /*@ assert ig_input_value_t: \forall integer j;0<=j<4 ==> va0.lane[j]==\at(a,Pre)[((ks-p)/sizeof(void*))][((kc-k)/4)]; */
      /*@ assert ig_weight_value_t0: \forall integer j;0<=j<4 ==> vb0123.lane[j]==\at(w,Pre)[((((\at(nc,Pre)-nc)/8)*(1+(ks/sizeof(void*))*(kc/4))+((ks-p)/sizeof(void*))*(kc/4)+((kc-k)/4))+1)*8+j]; */
        vacc0x0 = vfmaq_f32(vacc0x0, va0, vb0123);
      /*@ assert ig_next_fold_t0: \forall integer j;0<=j<4 ==> ext_same(vacc0x0.lane[j],ig_acc(\at(a,Pre),\at(w,Pre),(kc/4),(ks/sizeof(void*)),((\at(nc,Pre)-nc)/8),j,((ks-p)/sizeof(void*)),((kc-k)/4)+1)); */
      /*@ assert ig_weight_value_t1: \forall integer j;0<=j<4 ==> vb4567.lane[j]==\at(w,Pre)[((((\at(nc,Pre)-nc)/8)*(1+(ks/sizeof(void*))*(kc/4))+((ks-p)/sizeof(void*))*(kc/4)+((kc-k)/4))+1)*8+j+4]; */
        vacc0x1 = vfmaq_f32(vacc0x1, va0, vb4567);
      /*@ assert ig_next_fold_t1: \forall integer j;0<=j<4 ==> ext_same(vacc0x1.lane[j],ig_acc(\at(a,Pre),\at(w,Pre),(kc/4),(ks/sizeof(void*)),((\at(nc,Pre)-nc)/8),j+4,((ks-p)/sizeof(void*)),((kc-k)/4)+1)); */
      }
      /*@ assert ig_position_complete0: \forall integer j;0<=j<4 ==> ext_same(vacc0x0.lane[j],ig_acc(\at(a,Pre),\at(w,Pre),(kc/4),(ks/sizeof(void*)),((\at(nc,Pre)-nc)/8),j,((ks-p)/sizeof(void*))+1,0)); */
      /*@ assert ig_position_complete1: \forall integer j;0<=j<4 ==> ext_same(vacc0x1.lane[j],ig_acc(\at(a,Pre),\at(w,Pre),(kc/4),(ks/sizeof(void*)),((\at(nc,Pre)-nc)/8),j+4,((ks-p)/sizeof(void*))+1,0)); */
      p -= 1 * sizeof(void*);
    } while (p != 0);

  /*@ assert ig_full_acc0: \forall integer j;0<=j<4 ==> ext_same(vacc0x0.lane[j],ig_acc(\at(a,Pre),\at(w,Pre),(kc/4),(ks/sizeof(void*)),((\at(nc,Pre)-nc)/8),j,(ks/sizeof(void*)),0)); */
  /*@ assert ig_full_acc1: \forall integer j;0<=j<4 ==> ext_same(vacc0x1.lane[j],ig_acc(\at(a,Pre),\at(w,Pre),(kc/4),(ks/sizeof(void*)),((\at(nc,Pre)-nc)/8),j+4,(ks/sizeof(void*)),0)); */
    const float32x4_t vmax = vdupq_n_f32(params->scalar.max);
    vacc0x0 = vminq_f32(vacc0x0, vmax);
    vacc0x1 = vminq_f32(vacc0x1, vmax);

    const float32x4_t vmin = vdupq_n_f32(params->scalar.min);
    vacc0x0 = vmaxq_f32(vacc0x0, vmin);
    vacc0x1 = vmaxq_f32(vacc0x1, vmin);

  /*@ assert ig_clamped0: \forall integer j;0<=j<4 ==> ext_same(vacc0x0.lane[j],ig_clamp(ig_acc(\at(a,Pre),\at(w,Pre),(kc/4),(ks/sizeof(void*)),((\at(nc,Pre)-nc)/8),j,(ks/sizeof(void*)),0),params->scalar.min,params->scalar.max)); */
  /*@ assert ig_clamped1: \forall integer j;0<=j<4 ==> ext_same(vacc0x1.lane[j],ig_clamp(ig_acc(\at(a,Pre),\at(w,Pre),(kc/4),(ks/sizeof(void*)),((\at(nc,Pre)-nc)/8),j+4,(ks/sizeof(void*)),0),params->scalar.min,params->scalar.max)); */
    if XNN_LIKELY(nc >= 8) {
      vst1q_f32(c0, vacc0x0);
      vst1q_f32(c0 + 4, vacc0x1);
  /*@ assert ig_block_stored: \forall integer lane;0<=lane<8 ==> ext_same(c[((\at(nc,Pre)-nc)/8)*8+lane],ig_clamp(ig_acc(\at(a,Pre),\at(w,Pre),(kc/4),(ks/sizeof(void*)),((\at(nc,Pre)-nc)/8),lane,(ks/sizeof(void*)),0),params->scalar.min,params->scalar.max)); */
      c0 = (float*) ((uintptr_t) c0 + cn_stride);

      a = (const float**restrict) ((uintptr_t) a - ks);
      nc -= 8;
    } else {
      if (nc & 4) {
        vst1q_f32(c0, vacc0x0); c0 += 4;

        vacc0x0 = vacc0x1;
      }
      float32x2_t vacc0 = vget_low_f32(vacc0x0);
      if (nc & 2) {
        vst1_f32(c0, vacc0); c0 += 2;

        vacc0 = vget_high_f32(vacc0x0);
      }
      if (nc & 1) {
        vst1_lane_f32(c0, vacc0, 0);
      }

  /*@ assert ig_block_stored_tail: \forall integer lane;0<=lane<nc ==> ext_same(c[((\at(nc,Pre)-nc)/8)*8+lane],ig_clamp(ig_acc(\at(a,Pre),\at(w,Pre),(kc/4),(ks/sizeof(void*)),((\at(nc,Pre)-nc)/8),lane,(ks/sizeof(void*)),0),params->scalar.min,params->scalar.max)); */
      nc = 0;
    }
  } while (nc != 0);
}
