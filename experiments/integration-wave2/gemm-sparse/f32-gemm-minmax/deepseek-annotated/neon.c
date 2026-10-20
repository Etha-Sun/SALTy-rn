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
    const float* restrict a,
    size_t a_stride,
    const float* restrict w,
    float* restrict c,
    size_t cm_stride,
    size_t cn_stride,
    const struct xnn_f32_minmax_params* restrict params)
{
  /*@ ghost size_t NC=nc,KC=kc; */
  /*@ ghost const float *A0=a,*W0=w; */
  /*@ ghost float *C0=c; */
  assert(mr != 0);
  assert(mr <= 4);
  assert(nc != 0);
  assert(kc != 0);
  assert(kc % sizeof(float) == 0);
  assert(a != NULL);
  assert(w != NULL);
  assert(c != NULL);

  const float* a0 = a;
  float* c0 = c;
  const float* a1 = (const float*) ((uintptr_t) a0 + a_stride);
  float* c1 = (float*) ((uintptr_t) c0 + cm_stride);
  if XNN_UNPREDICTABLE(mr < 2) {
    a1 = a0;
    c1 = c0;
  }
  const float* a2 = (const float*) ((uintptr_t) a1 + a_stride);
  float* c2 = (float*) ((uintptr_t) c1 + cm_stride);
  if XNN_UNPREDICTABLE(mr <= 2) {
    a2 = a1;
    c2 = c1;
  }
  const float* a3 = (const float*) ((uintptr_t) a2 + a_stride);
  float* c3 = (float*) ((uintptr_t) c2 + cm_stride);
  if XNN_UNPREDICTABLE(mr != 4) {
    a3 = a2;
    c3 = c2;
  }

  /*@ loop invariant 0<=nc<=NC;
      loop invariant (nc>0 ==> (NC-nc)%8==0);
      loop invariant (nc>0 ==> a0==A0);
      loop invariant (nc>0 ==> a1==A0+off(mr,1)*(KC/4));
      loop invariant (nc>0 ==> a2==A0+off(mr,2)*(KC/4));
      loop invariant (nc>0 ==> a3==A0+off(mr,3)*(KC/4));
      loop invariant (nc>0 ==> c0==C0+(NC-nc));
      loop invariant (nc>0 ==> c1==C0+off(mr,1)*NC+(NC-nc));
      loop invariant (nc>0 ==> c2==C0+off(mr,2)*NC+(NC-nc));
      loop invariant (nc>0 ==> c3==C0+off(mr,3)*NC+(NC-nc));
      loop invariant (nc>0 ==> w==W0+((NC-nc)/8)*(8+8*(KC/4)));
      loop invariant \forall integer s,t; 0<=s<mr && 0<=t<NC-nc ==>
          ext_same(C0[s*NC+t],ext_neon_clamp32(acc_fold(A0,W0,KC/4,t/8,off(mr,s)*(KC/4),t%8,KC/4),params->scalar.min,params->scalar.max));
      loop assigns nc,a0,a1,a2,a3,c0,c1,c2,c3,w,C0[0..mr*NC-1],errno;
      loop variant nc;
  */
  do {
    float32x4_t vacc0x0 = vld1q_f32(w); w += 4;
    float32x4_t vacc0x1 = vld1q_f32(w); w += 4;
    float32x4_t vacc1x0 = vacc0x0;
    float32x4_t vacc1x1 = vacc0x1;
    float32x4_t vacc2x0 = vacc0x0;
    float32x4_t vacc2x1 = vacc0x1;
    float32x4_t vacc3x0 = vacc0x0;
    float32x4_t vacc3x1 = vacc0x1;

    size_t k = kc;
    /*@ loop invariant 0<=k<=KC && k%4==0;
        loop invariant a0==A0+(KC-k)/4;
        loop invariant a1==A0+off(mr,1)*(KC/4)+(KC-k)/4;
        loop invariant a2==A0+off(mr,2)*(KC/4)+(KC-k)/4;
        loop invariant a3==A0+off(mr,3)*(KC/4)+(KC-k)/4;
        loop invariant w==W0+((NC-nc)/8)*(8+8*(KC/4))+8+8*((KC-k)/4);
        loop invariant \forall integer j; 0<=j<4 ==> ext_same(vacc0x0.lane[j],acc_fold(A0,W0,KC/4,(NC-nc)/8,0,j,(KC-k)/4));
        loop invariant \forall integer j; 0<=j<4 ==> ext_same(vacc0x1.lane[j],acc_fold(A0,W0,KC/4,(NC-nc)/8,0,4+j,(KC-k)/4));
        loop invariant \forall integer j; 0<=j<4 ==> ext_same(vacc1x0.lane[j],acc_fold(A0,W0,KC/4,(NC-nc)/8,off(mr,1)*(KC/4),j,(KC-k)/4));
        loop invariant \forall integer j; 0<=j<4 ==> ext_same(vacc1x1.lane[j],acc_fold(A0,W0,KC/4,(NC-nc)/8,off(mr,1)*(KC/4),4+j,(KC-k)/4));
        loop invariant \forall integer j; 0<=j<4 ==> ext_same(vacc2x0.lane[j],acc_fold(A0,W0,KC/4,(NC-nc)/8,off(mr,2)*(KC/4),j,(KC-k)/4));
        loop invariant \forall integer j; 0<=j<4 ==> ext_same(vacc2x1.lane[j],acc_fold(A0,W0,KC/4,(NC-nc)/8,off(mr,2)*(KC/4),4+j,(KC-k)/4));
        loop invariant \forall integer j; 0<=j<4 ==> ext_same(vacc3x0.lane[j],acc_fold(A0,W0,KC/4,(NC-nc)/8,off(mr,3)*(KC/4),j,(KC-k)/4));
        loop invariant \forall integer j; 0<=j<4 ==> ext_same(vacc3x1.lane[j],acc_fold(A0,W0,KC/4,(NC-nc)/8,off(mr,3)*(KC/4),4+j,(KC-k)/4));
        loop assigns k,a0,a1,a2,a3,w,vacc0x0,vacc0x1,vacc1x0,vacc1x1,vacc2x0,vacc2x1,vacc3x0,vacc3x1,errno;
        loop variant k;
    */
    for (; k >= 2 * sizeof(float); k -= 2 * sizeof(float)) {
      const float32x2_t va0 = vld1_f32(a0); a0 += 2;
      const float32x2_t va1 = vld1_f32(a1); a1 += 2;
      const float32x2_t va2 = vld1_f32(a2); a2 += 2;
      const float32x2_t va3 = vld1_f32(a3); a3 += 2;

      const float32x4_t vb0123c0 = vld1q_f32(w); w += 4;
      const float32x4_t vb4567c0 = vld1q_f32(w); w += 4;
      const float32x4_t vb0123c1 = vld1q_f32(w); w += 4;
      const float32x4_t vb4567c1 = vld1q_f32(w); w += 4;

      const float32x4_t va0c0 = vdupq_lane_f32(va0, 0);
      const float32x4_t va1c0 = vdupq_lane_f32(va1, 0);
      const float32x4_t va2c0 = vdupq_lane_f32(va2, 0);
      const float32x4_t va3c0 = vdupq_lane_f32(va3, 0);
      vacc0x0 = vfmaq_f32(vacc0x0, va0c0, vb0123c0);
      vacc1x0 = vfmaq_f32(vacc1x0, va1c0, vb0123c0);
      vacc2x0 = vfmaq_f32(vacc2x0, va2c0, vb0123c0);
      vacc3x0 = vfmaq_f32(vacc3x0, va3c0, vb0123c0);
      vacc0x1 = vfmaq_f32(vacc0x1, va0c0, vb4567c0);
      vacc1x1 = vfmaq_f32(vacc1x1, va1c0, vb4567c0);
      vacc2x1 = vfmaq_f32(vacc2x1, va2c0, vb4567c0);
      vacc3x1 = vfmaq_f32(vacc3x1, va3c0, vb4567c0);
      const float32x4_t va0c1 = vdupq_lane_f32(va0, 1);
      const float32x4_t va1c1 = vdupq_lane_f32(va1, 1);
      const float32x4_t va2c1 = vdupq_lane_f32(va2, 1);
      const float32x4_t va3c1 = vdupq_lane_f32(va3, 1);
      vacc0x0 = vfmaq_f32(vacc0x0, va0c1, vb0123c1);
      /*@ assert \forall integer j; 0<=j<4 ==> ext_same(vacc0x0.lane[j],acc_fold(A0,W0,KC/4,(NC-nc)/8,0,j,(KC-k)/4+2)); */
      vacc1x0 = vfmaq_f32(vacc1x0, va1c1, vb0123c1);
      /*@ assert \forall integer j; 0<=j<4 ==> ext_same(vacc1x0.lane[j],acc_fold(A0,W0,KC/4,(NC-nc)/8,off(mr,1)*(KC/4),j,(KC-k)/4+2)); */
      vacc2x0 = vfmaq_f32(vacc2x0, va2c1, vb0123c1);
      /*@ assert \forall integer j; 0<=j<4 ==> ext_same(vacc2x0.lane[j],acc_fold(A0,W0,KC/4,(NC-nc)/8,off(mr,2)*(KC/4),j,(KC-k)/4+2)); */
      vacc3x0 = vfmaq_f32(vacc3x0, va3c1, vb0123c1);
      /*@ assert \forall integer j; 0<=j<4 ==> ext_same(vacc3x0.lane[j],acc_fold(A0,W0,KC/4,(NC-nc)/8,off(mr,3)*(KC/4),j,(KC-k)/4+2)); */
      vacc0x1 = vfmaq_f32(vacc0x1, va0c1, vb4567c1);
      /*@ assert \forall integer j; 0<=j<4 ==> ext_same(vacc0x1.lane[j],acc_fold(A0,W0,KC/4,(NC-nc)/8,0,4+j,(KC-k)/4+2)); */
      vacc1x1 = vfmaq_f32(vacc1x1, va1c1, vb4567c1);
      /*@ assert \forall integer j; 0<=j<4 ==> ext_same(vacc1x1.lane[j],acc_fold(A0,W0,KC/4,(NC-nc)/8,off(mr,1)*(KC/4),4+j,(KC-k)/4+2)); */
      vacc2x1 = vfmaq_f32(vacc2x1, va2c1, vb4567c1);
      /*@ assert \forall integer j; 0<=j<4 ==> ext_same(vacc2x1.lane[j],acc_fold(A0,W0,KC/4,(NC-nc)/8,off(mr,2)*(KC/4),4+j,(KC-k)/4+2)); */
      vacc3x1 = vfmaq_f32(vacc3x1, va3c1, vb4567c1);
      /*@ assert \forall integer j; 0<=j<4 ==> ext_same(vacc3x1.lane[j],acc_fold(A0,W0,KC/4,(NC-nc)/8,off(mr,3)*(KC/4),4+j,(KC-k)/4+2)); */
    }
    if XNN_UNLIKELY(k != 0) {
      const float32x4_t va0 = vld1q_dup_f32(a0); a0 += 1;
      const float32x4_t va1 = vld1q_dup_f32(a1); a1 += 1;
      const float32x4_t va2 = vld1q_dup_f32(a2); a2 += 1;
      const float32x4_t va3 = vld1q_dup_f32(a3); a3 += 1;

      const float32x4_t vb0123 = vld1q_f32(w); w += 4;
      const float32x4_t vb4567 = vld1q_f32(w); w += 4;

      vacc0x0 = vfmaq_f32(vacc0x0, va0, vb0123);
      vacc1x0 = vfmaq_f32(vacc1x0, va1, vb0123);
      vacc2x0 = vfmaq_f32(vacc2x0, va2, vb0123);
      vacc3x0 = vfmaq_f32(vacc3x0, va3, vb0123);
      vacc0x1 = vfmaq_f32(vacc0x1, va0, vb4567);
      vacc1x1 = vfmaq_f32(vacc1x1, va1, vb4567);
      vacc2x1 = vfmaq_f32(vacc2x1, va2, vb4567);
      vacc3x1 = vfmaq_f32(vacc3x1, va3, vb4567);
      /*@ assert \forall integer j; 0<=j<4 ==> ext_same(vacc0x0.lane[j],acc_fold(A0,W0,KC/4,(NC-nc)/8,0,j,KC/4)); */
      /*@ assert \forall integer j; 0<=j<4 ==> ext_same(vacc1x0.lane[j],acc_fold(A0,W0,KC/4,(NC-nc)/8,off(mr,1)*(KC/4),j,KC/4)); */
      /*@ assert \forall integer j; 0<=j<4 ==> ext_same(vacc2x0.lane[j],acc_fold(A0,W0,KC/4,(NC-nc)/8,off(mr,2)*(KC/4),j,KC/4)); */
      /*@ assert \forall integer j; 0<=j<4 ==> ext_same(vacc3x0.lane[j],acc_fold(A0,W0,KC/4,(NC-nc)/8,off(mr,3)*(KC/4),j,KC/4)); */
      /*@ assert \forall integer j; 0<=j<4 ==> ext_same(vacc0x1.lane[j],acc_fold(A0,W0,KC/4,(NC-nc)/8,0,4+j,KC/4)); */
      /*@ assert \forall integer j; 0<=j<4 ==> ext_same(vacc1x1.lane[j],acc_fold(A0,W0,KC/4,(NC-nc)/8,off(mr,1)*(KC/4),4+j,KC/4)); */
      /*@ assert \forall integer j; 0<=j<4 ==> ext_same(vacc2x1.lane[j],acc_fold(A0,W0,KC/4,(NC-nc)/8,off(mr,2)*(KC/4),4+j,KC/4)); */
      /*@ assert \forall integer j; 0<=j<4 ==> ext_same(vacc3x1.lane[j],acc_fold(A0,W0,KC/4,(NC-nc)/8,off(mr,3)*(KC/4),4+j,KC/4)); */
    }
    /*@ ghost float32x4_t p0x0=vacc0x0,p0x1=vacc0x1,p1x0=vacc1x0,p1x1=vacc1x1,p2x0=vacc2x0,p2x1=vacc2x1,p3x0=vacc3x0,p3x1=vacc3x1; */
    const float32x4_t vmax = vdupq_n_f32(params->scalar.max);
    vacc0x0 = vminq_f32(vacc0x0, vmax);
    vacc1x0 = vminq_f32(vacc1x0, vmax);
    vacc2x0 = vminq_f32(vacc2x0, vmax);
    vacc3x0 = vminq_f32(vacc3x0, vmax);
    vacc0x1 = vminq_f32(vacc0x1, vmax);
    vacc1x1 = vminq_f32(vacc1x1, vmax);
    vacc2x1 = vminq_f32(vacc2x1, vmax);
    vacc3x1 = vminq_f32(vacc3x1, vmax);

    const float32x4_t vmin = vdupq_n_f32(params->scalar.min);
    vacc0x0 = vmaxq_f32(vacc0x0, vmin);
    vacc1x0 = vmaxq_f32(vacc1x0, vmin);
    vacc2x0 = vmaxq_f32(vacc2x0, vmin);
    vacc3x0 = vmaxq_f32(vacc3x0, vmin);
    vacc0x1 = vmaxq_f32(vacc0x1, vmin);
    vacc1x1 = vmaxq_f32(vacc1x1, vmin);
    vacc2x1 = vmaxq_f32(vacc2x1, vmin);
    vacc3x1 = vmaxq_f32(vacc3x1, vmin);
    /*@ assert \forall integer j; 0<=j<4 ==> ext_same(vacc0x0.lane[j],ext_neon_clamp32(p0x0.lane[j],params->scalar.min,params->scalar.max)); */
    /*@ assert \forall integer j; 0<=j<4 ==> ext_same(vacc0x1.lane[j],ext_neon_clamp32(p0x1.lane[j],params->scalar.min,params->scalar.max)); */
    /*@ assert \forall integer j; 0<=j<4 ==> ext_same(vacc1x0.lane[j],ext_neon_clamp32(p1x0.lane[j],params->scalar.min,params->scalar.max)); */
    /*@ assert \forall integer j; 0<=j<4 ==> ext_same(vacc1x1.lane[j],ext_neon_clamp32(p1x1.lane[j],params->scalar.min,params->scalar.max)); */
    /*@ assert \forall integer j; 0<=j<4 ==> ext_same(vacc2x0.lane[j],ext_neon_clamp32(p2x0.lane[j],params->scalar.min,params->scalar.max)); */
    /*@ assert \forall integer j; 0<=j<4 ==> ext_same(vacc2x1.lane[j],ext_neon_clamp32(p2x1.lane[j],params->scalar.min,params->scalar.max)); */
    /*@ assert \forall integer j; 0<=j<4 ==> ext_same(vacc3x0.lane[j],ext_neon_clamp32(p3x0.lane[j],params->scalar.min,params->scalar.max)); */
    /*@ assert \forall integer j; 0<=j<4 ==> ext_same(vacc3x1.lane[j],ext_neon_clamp32(p3x1.lane[j],params->scalar.min,params->scalar.max)); */
    /*@ assert \forall integer j; 0<=j<4 ==> ext_same(vacc0x0.lane[j],ext_neon_clamp32(acc_fold(A0,W0,KC/4,(NC-nc)/8,0,j,KC/4),params->scalar.min,params->scalar.max)); */
    /*@ assert \forall integer j; 0<=j<4 ==> ext_same(vacc0x1.lane[j],ext_neon_clamp32(acc_fold(A0,W0,KC/4,(NC-nc)/8,0,4+j,KC/4),params->scalar.min,params->scalar.max)); */
    /*@ assert \forall integer j; 0<=j<4 ==> ext_same(vacc1x0.lane[j],ext_neon_clamp32(acc_fold(A0,W0,KC/4,(NC-nc)/8,off(mr,1)*(KC/4),j,KC/4),params->scalar.min,params->scalar.max)); */
    /*@ assert \forall integer j; 0<=j<4 ==> ext_same(vacc1x1.lane[j],ext_neon_clamp32(acc_fold(A0,W0,KC/4,(NC-nc)/8,off(mr,1)*(KC/4),4+j,KC/4),params->scalar.min,params->scalar.max)); */
    /*@ assert \forall integer j; 0<=j<4 ==> ext_same(vacc2x0.lane[j],ext_neon_clamp32(acc_fold(A0,W0,KC/4,(NC-nc)/8,off(mr,2)*(KC/4),j,KC/4),params->scalar.min,params->scalar.max)); */
    /*@ assert \forall integer j; 0<=j<4 ==> ext_same(vacc2x1.lane[j],ext_neon_clamp32(acc_fold(A0,W0,KC/4,(NC-nc)/8,off(mr,2)*(KC/4),4+j,KC/4),params->scalar.min,params->scalar.max)); */
    /*@ assert \forall integer j; 0<=j<4 ==> ext_same(vacc3x0.lane[j],ext_neon_clamp32(acc_fold(A0,W0,KC/4,(NC-nc)/8,off(mr,3)*(KC/4),j,KC/4),params->scalar.min,params->scalar.max)); */
    /*@ assert \forall integer j; 0<=j<4 ==> ext_same(vacc3x1.lane[j],ext_neon_clamp32(acc_fold(A0,W0,KC/4,(NC-nc)/8,off(mr,3)*(KC/4),4+j,KC/4),params->scalar.min,params->scalar.max)); */

    if XNN_LIKELY(nc >= 8) {
      vst1q_f32(c0, vacc0x0);
      vst1q_f32(c0 + 4, vacc0x1);
      c0 = (float*) ((uintptr_t) c0 + cn_stride);
      vst1q_f32(c1, vacc1x0);
      vst1q_f32(c1 + 4, vacc1x1);
      c1 = (float*) ((uintptr_t) c1 + cn_stride);
      vst1q_f32(c2, vacc2x0);
      vst1q_f32(c2 + 4, vacc2x1);
      c2 = (float*) ((uintptr_t) c2 + cn_stride);
      vst1q_f32(c3, vacc3x0);
      vst1q_f32(c3 + 4, vacc3x1);
      c3 = (float*) ((uintptr_t) c3 + cn_stride);

      /*@ assert \forall integer s,q; 0<=s<mr && 0<=q<8 ==> ext_same(C0[s*NC+(NC-nc)+q],ext_neon_clamp32(acc_fold(A0,W0,KC/4,(NC-nc)/8,s*(KC/4),q,KC/4),params->scalar.min,params->scalar.max)); */

      a0 = (const float*) ((uintptr_t) a0 - kc);
      a1 = (const float*) ((uintptr_t) a1 - kc);
      a2 = (const float*) ((uintptr_t) a2 - kc);
      a3 = (const float*) ((uintptr_t) a3 - kc);

      nc -= 8;

    } else {
      if (nc & 4) {
        vst1q_f32(c0, vacc0x0); c0 += 4;
        vst1q_f32(c1, vacc1x0); c1 += 4;
        vst1q_f32(c2, vacc2x0); c2 += 4;
        vst1q_f32(c3, vacc3x0); c3 += 4;

        vacc0x0 = vacc0x1;
        vacc1x0 = vacc1x1;
        vacc2x0 = vacc2x1;
        vacc3x0 = vacc3x1;
      }
      float32x2_t vacc0 = vget_low_f32(vacc0x0);
      float32x2_t vacc1 = vget_low_f32(vacc1x0);
      float32x2_t vacc2 = vget_low_f32(vacc2x0);
      float32x2_t vacc3 = vget_low_f32(vacc3x0);
      if (nc & 2) {
        vst1_f32(c0, vacc0); c0 += 2;
        vst1_f32(c1, vacc1); c1 += 2;
        vst1_f32(c2, vacc2); c2 += 2;
        vst1_f32(c3, vacc3); c3 += 2;

        vacc0 = vget_high_f32(vacc0x0);
        vacc1 = vget_high_f32(vacc1x0);
        vacc2 = vget_high_f32(vacc2x0);
        vacc3 = vget_high_f32(vacc3x0);
      }
      if (nc & 1) {
        vst1_lane_f32(c0, vacc0, 0);
        vst1_lane_f32(c1, vacc1, 0);
        vst1_lane_f32(c2, vacc2, 0);
        vst1_lane_f32(c3, vacc3, 0);
      }

      /*@ assert \forall integer s,q; 0<=s<mr && 0<=q<nc ==> ext_same(C0[s*NC+(NC-nc)+q],ext_neon_clamp32(acc_fold(A0,W0,KC/4,(NC-nc)/8,s*(KC/4),q,KC/4),params->scalar.min,params->scalar.max)); */

      nc = 0;
    }
  } while (nc != 0);
}
