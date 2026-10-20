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

  //@ ghost size_t NC=nc,KC=kc,KS=ks;
  //@ ghost const float **A=a;
  //@ ghost const float *W=w;
  //@ ghost float *C=c;
  float* c0 = c;

  /*@ loop invariant stage3_nc: 0<nc<=NC && (NC-nc)%8==0;
      loop invariant a==A;
      loop invariant c0==C+(NC-nc);
      loop invariant w==W+((NC-nc)/8)*(8+8*(KC/4)*(KS/sizeof(void*)));
      loop assigns nc,a,w,c0,C[0..NC-1],errno; loop variant nc; */
  do {
    //@ ghost Stage3Block: ;
    float32x4_t vacc0x0 = vld1q_f32(w); w += 4;
    float32x4_t vacc0x1 = vld1q_f32(w); w += 4;

    size_t p = ks;
    /*@ loop invariant stage3_positions: 0<p<=KS && p%sizeof(void*)==0;
        loop invariant a==A+(KS-p)/sizeof(void*);
        loop invariant w==W+((NC-nc)/8)*(8+8*(KC/4)*(KS/sizeof(void*)))+8+8*((KS-p)/sizeof(void*))*(KC/4);
        loop invariant stage3_position_acc_neon_0: \forall integer j;0<=j<4 ==> ext_same(vacc0x0.lane[j],stage3_iacc{Stage3Block}(A,W,(NC-nc)/8,0+j,((KS-p)/sizeof(void*))*(KC/4),KC/4,KS/sizeof(void*)));
        loop invariant stage3_position_acc_neon_1: \forall integer j;0<=j<4 ==> ext_same(vacc0x1.lane[j],stage3_iacc{Stage3Block}(A,W,(NC-nc)/8,4+j,((KS-p)/sizeof(void*))*(KC/4),KC/4,KS/sizeof(void*)));
        loop invariant stage3_read_table: \forall integer q;0<=q<KS/sizeof(void*) ==> A[q]==\at(A[q],Stage3Block);
        loop invariant stage3_read_rows: \forall integer q,t;0<=q<KS/sizeof(void*) && 0<=t<KC/4 ==> ext_same(A[q][t],\at(A[q][t],Stage3Block));
        loop invariant stage3_read_w: \forall integer q;0<=q<((NC+7)/8)*(8+8*(KC/4)*(KS/sizeof(void*))) ==> ext_same(W[q],\at(W[q],Stage3Block));
        loop assigns p,a,w,vacc0x0,vacc0x1,errno; loop variant p; */
    do {
      const float* restrict a0 = a[0];
      assert(a0 != NULL);
      if XNN_UNPREDICTABLE(a0 != zero) {
        a0 = (const float*) ((uintptr_t) a0 + a_offset);
      }
      a += 1;

      size_t k = kc;
      //@ ghost const float *stage3_row=a0;
      //@ ghost const float *stage3_weights=w;
      /*@ loop invariant stage3_k: 0<=k<=KC && k%4==0;
          loop invariant a0==stage3_row+(KC-k)/4;
          loop invariant w==stage3_weights+8*((KC-k)/4);
          loop invariant stage3_inner_acc_neon_0: \forall integer j;0<=j<4 ==> ext_same(vacc0x0.lane[j],stage3_iacc{Stage3Block}(A,W,(NC-nc)/8,0+j,((KS-p)/sizeof(void*))*(KC/4)+(KC-k)/4,KC/4,KS/sizeof(void*)));
          loop invariant stage3_inner_acc_neon_1: \forall integer j;0<=j<4 ==> ext_same(vacc0x1.lane[j],stage3_iacc{Stage3Block}(A,W,(NC-nc)/8,4+j,((KS-p)/sizeof(void*))*(KC/4)+(KC-k)/4,KC/4,KS/sizeof(void*)));
        loop invariant stage3_read_table: \forall integer q;0<=q<KS/sizeof(void*) ==> A[q]==\at(A[q],Stage3Block);
        loop invariant stage3_read_rows: \forall integer q,t;0<=q<KS/sizeof(void*) && 0<=t<KC/4 ==> ext_same(A[q][t],\at(A[q][t],Stage3Block));
        loop invariant stage3_read_w: \forall integer q;0<=q<((NC+7)/8)*(8+8*(KC/4)*(KS/sizeof(void*))) ==> ext_same(W[q],\at(W[q],Stage3Block));
          loop assigns k,a0,w,vacc0x0,vacc0x1,errno; loop variant k; */
      for (; k >= 2 * sizeof(float); k -= 2 * sizeof(float)) {
        const float32x2_t va0 = vld1_f32(a0); a0 += 2;

        const float32x4_t vb0123c0 = vld1q_f32(w); w += 4;
        const float32x4_t vb4567c0 = vld1q_f32(w); w += 4;

        const float32x4_t va0c0 = vdupq_lane_f32(va0, 0);
        vacc0x0 = vfmaq_f32(vacc0x0, va0c0, vb0123c0);
        vacc0x1 = vfmaq_f32(vacc0x1, va0c0, vb4567c0);
        const float32x4_t vb0123c1 = vld1q_f32(w); w += 4;
        const float32x4_t vb4567c1 = vld1q_f32(w); w += 4;

        const float32x4_t va0c1 = vdupq_lane_f32(va0, 1);
        vacc0x0 = vfmaq_f32(vacc0x0, va0c1, vb0123c1);
        vacc0x1 = vfmaq_f32(vacc0x1, va0c1, vb4567c1);

      }
      if XNN_UNLIKELY(k != 0) {
        const float32x4_t va0 = vld1q_dup_f32(a0);

        const float32x4_t vb0123 = vld1q_f32(w); w += 4;
        const float32x4_t vb4567 = vld1q_f32(w); w += 4;

        vacc0x0 = vfmaq_f32(vacc0x0, va0, vb0123);
        vacc0x1 = vfmaq_f32(vacc0x1, va0, vb4567);
      }
      p -= 1 * sizeof(void*);
    } while (p != 0);

    const float32x4_t vmax = vdupq_n_f32(params->scalar.max);
    vacc0x0 = vminq_f32(vacc0x0, vmax);
    vacc0x1 = vminq_f32(vacc0x1, vmax);

    const float32x4_t vmin = vdupq_n_f32(params->scalar.min);
    vacc0x0 = vmaxq_f32(vacc0x0, vmin);
    vacc0x1 = vmaxq_f32(vacc0x1, vmin);

    if XNN_LIKELY(nc >= 8) {
      vst1q_f32(c0, vacc0x0);
      vst1q_f32(c0 + 4, vacc0x1);
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

      nc = 0;
    }
  } while (nc != 0);
}
