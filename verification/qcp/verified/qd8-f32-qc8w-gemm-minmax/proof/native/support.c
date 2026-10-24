/* Native regression support: bits.c */

unsigned int qcp_float_bits_at(const float *x)

{
  
  const unsigned char *p = (const unsigned char *)x;
  unsigned int c0 = *p;
  unsigned int c1 = *(p+1);
  unsigned int c2 = *(p+2);
  unsigned int c3 = *(p+3);
  unsigned int r = c0 + 256u * c1 + 65536u * c2 + 16777216u * c3;
  
  return r;
}

unsigned int qcp_float_bits(float x)

{
  return qcp_float_bits_at(&x);
}

void qcp_float_from_bits_at(const unsigned int *bits, float *x)

{
  
  const unsigned char *p = (const unsigned char *)bits;
  unsigned char *q = (unsigned char *)x;
  *q = *p;
  *(q+1) = *(p+1);
  *(q+2) = *(p+2);
  *(q+3) = *(p+3);
  
}

float qcp_float_from_bits(unsigned int bits)

{
  float x;
  qcp_float_from_bits_at(&bits,&x);
  return x;
}

/* Native regression support: scalar_nan.c */
float qcp_qd8_identity(float x)

{ return x; }
int qcp_qd8_isnan(float x)

{ float copy=qcp_qd8_identity(x); return x!=copy; }
int bounds_probe(float lo,float hi)

{ return qcp_qd8_isnan(lo) || qcp_qd8_isnan(hi); }

/* Native regression support: neon-basic.c */















int32x4_t vld1q_dup_s32(const int *p)

{
 int32x4_t r;
 r.s0=*p;
 r.s1=*p;
 r.s2=*p;
 r.s3=*p;
 return r;
}
float32x4_t vld1q_dup_f32(const float *p)

{
 float32x4_t r;
 r.s0=*p;
 r.s1=*p;
 r.s2=*p;
 r.s3=*p;
 return r;
}
float32x4_t vdupq_n_f32(float x)

{
 float32x4_t r;
 r.s0=x;
 r.s1=x;
 r.s2=x;
 r.s3=x;
 return r;
}
int16x4_t vget_low_s16(int16x8_t a)

{
 int16x4_t r;
 r.s0=a.s0;
 r.s1=a.s1;
 r.s2=a.s2;
 r.s3=a.s3;
 return r;
}
int16x4_t vget_high_s16(int16x8_t a)

{
 int16x4_t r;
 r.s0=a.s4;
 r.s1=a.s5;
 r.s2=a.s6;
 r.s3=a.s7;
 return r;
}
float32x2_t vget_low_f32(float32x4_t a)

{
 float32x2_t r;
 r.s0=a.s0;
 r.s1=a.s1;
 return r;
}
float32x2_t vget_high_f32(float32x4_t a)

{
 float32x2_t r;
 r.s0=a.s2;
 r.s1=a.s3;
 return r;
}
int16x8_t vmovl_s8(int8x8_t a)

{
 int16x8_t r;
 r.s0=a.s0;
 r.s1=a.s1;
 r.s2=a.s2;
 r.s3=a.s3;
 r.s4=a.s4;
 r.s5=a.s5;
 r.s6=a.s6;
 r.s7=a.s7;
 return r;
}
float32x4_t vcvtq_f32_s32(int32x4_t a)

{
 float32x4_t r;
 r.s0=(float)a.s0;
 r.s1=(float)a.s1;
 r.s2=(float)a.s2;
 r.s3=(float)a.s3;
 return r;
}
float32x4_t vmulq_f32(float32x4_t a,float32x4_t b)

{
 float32x4_t r;
 r.s0=a.s0*b.s0;
 r.s1=a.s1*b.s1;
 r.s2=a.s2*b.s2;
 r.s3=a.s3*b.s3;
 return r;
}
void qcp_assert(int condition)

{ return; }
void xnn_prefetch_to_l1(const void *p)

{ return; }

/* Native regression support: rvv-basic-out.c */
















void qcp_select_float_out(float *out,float x,size_t vl,size_t lane)

{ if(lane<vl) *out=x; else *out=0.0f; }
short qcp_select_short(short x,size_t vl,size_t lane)

{ if(lane<vl) return x; return 0; }
void qcp_merge_selected_out(float *out,float a,float b,int mask,size_t vl,size_t lane)

{ if(lane<vl) { if(mask==0) *out=a; else *out=b; } else *out=0.0f; }
vint16m1_t __riscv_vsext_vf2_i16m1(vint8mf2_t a,size_t vl)

{
 vint16m1_t r;
 r.s0=qcp_select_short(a.s0,vl,0);
 r.s1=qcp_select_short(a.s1,vl,1);
 r.s2=qcp_select_short(a.s2,vl,2);
 r.s3=qcp_select_short(a.s3,vl,3);
 r.s4=qcp_select_short(a.s4,vl,4);
 r.s5=qcp_select_short(a.s5,vl,5);
 r.s6=qcp_select_short(a.s6,vl,6);
 r.s7=qcp_select_short(a.s7,vl,7);
 return r;
}
vfloat32m2_t __riscv_vfcvt_f_x_v_f32m2(vint32m2_t a,size_t vl)

{
 vfloat32m2_t r;
 qcp_select_float_out(&(r.s0),(float)a.s0,vl,0);
 qcp_select_float_out(&(r.s1),(float)a.s1,vl,1);
 qcp_select_float_out(&(r.s2),(float)a.s2,vl,2);
 qcp_select_float_out(&(r.s3),(float)a.s3,vl,3);
 qcp_select_float_out(&(r.s4),(float)a.s4,vl,4);
 qcp_select_float_out(&(r.s5),(float)a.s5,vl,5);
 qcp_select_float_out(&(r.s6),(float)a.s6,vl,6);
 qcp_select_float_out(&(r.s7),(float)a.s7,vl,7);
 return r;
}
vfloat32m2_t __riscv_vfmul_vf_f32m2(vfloat32m2_t a,float scalar,size_t vl)

{
 vfloat32m2_t r;
 qcp_select_float_out(&(r.s0),a.s0*scalar,vl,0);
 qcp_select_float_out(&(r.s1),a.s1*scalar,vl,1);
 qcp_select_float_out(&(r.s2),a.s2*scalar,vl,2);
 qcp_select_float_out(&(r.s3),a.s3*scalar,vl,3);
 qcp_select_float_out(&(r.s4),a.s4*scalar,vl,4);
 qcp_select_float_out(&(r.s5),a.s5*scalar,vl,5);
 qcp_select_float_out(&(r.s6),a.s6*scalar,vl,6);
 qcp_select_float_out(&(r.s7),a.s7*scalar,vl,7);
 return r;
}
vfloat32m2_t __riscv_vfmv_v_f_f32m2(float scalar,size_t vl)

{
 vfloat32m2_t r;
 qcp_select_float_out(&(r.s0),scalar,vl,0);
 qcp_select_float_out(&(r.s1),scalar,vl,1);
 qcp_select_float_out(&(r.s2),scalar,vl,2);
 qcp_select_float_out(&(r.s3),scalar,vl,3);
 qcp_select_float_out(&(r.s4),scalar,vl,4);
 qcp_select_float_out(&(r.s5),scalar,vl,5);
 qcp_select_float_out(&(r.s6),scalar,vl,6);
 qcp_select_float_out(&(r.s7),scalar,vl,7);
 return r;
}
vfloat32m2_t __riscv_vmerge_vvm_f32m2(vfloat32m2_t a,vfloat32m2_t b,vbool16_t m,size_t vl)

{
 vfloat32m2_t r;
 qcp_merge_selected_out(&(r.s0),a.s0,b.s0,m.s0,vl,0);
 qcp_merge_selected_out(&(r.s1),a.s1,b.s1,m.s1,vl,1);
 qcp_merge_selected_out(&(r.s2),a.s2,b.s2,m.s2,vl,2);
 qcp_merge_selected_out(&(r.s3),a.s3,b.s3,m.s3,vl,3);
 qcp_merge_selected_out(&(r.s4),a.s4,b.s4,m.s4,vl,4);
 qcp_merge_selected_out(&(r.s5),a.s5,b.s5,m.s5,vl,5);
 qcp_merge_selected_out(&(r.s6),a.s6,b.s6,m.s6,vl,6);
 qcp_merge_selected_out(&(r.s7),a.s7,b.s7,m.s7,vl,7);
 return r;
}
size_t __riscv_vsetvl_e32m2(size_t n)

{ if(n<8) return n; return 8; }

/* Native regression support: integer.c */

















int qcp_mul_s32(int x,int y)

{ return (int)((unsigned int)x*(unsigned int)y); }
int qcp_mac_s16(int acc,short a,short b)

{ return (int)((unsigned int)acc+(unsigned int)((int)a*(int)b)); }
void qcp_select_int_out(int *out,int x,size_t vl,size_t lane)

{ if(lane<vl) *out=x; else *out=0; }
short qcp_s16_lane(int16x4_t a,int lane)

{ if(lane==0) return a.s0; if(lane==1) return a.s1; if(lane==2) return a.s2; return a.s3; }
int32x4_t vmulq_s32(int32x4_t a,int32x4_t b)

{
 
 int32x4_t r;
 r.s0=qcp_mul_s32(a.s0,b.s0);
 r.s1=qcp_mul_s32(a.s1,b.s1);
 r.s2=qcp_mul_s32(a.s2,b.s2);
 r.s3=qcp_mul_s32(a.s3,b.s3);
 return r;
}
int32x4_t vmlal_lane_s16(int32x4_t acc,int16x4_t b,int16x4_t a,int lane)

{
 short value=qcp_s16_lane(a,lane) ;
 int32x4_t r;
 r.s0=qcp_mac_s16(acc.s0,b.s0,value);
 r.s1=qcp_mac_s16(acc.s1,b.s1,value);
 r.s2=qcp_mac_s16(acc.s2,b.s2,value);
 r.s3=qcp_mac_s16(acc.s3,b.s3,value);
 return r;
}
vint32m2_t __riscv_vmul_vx_i32m2(vint32m2_t a,int scalar,size_t vl)

{ vint32m2_t r;
 qcp_select_int_out(&(r.s0),qcp_mul_s32(a.s0,scalar),vl,0);
 qcp_select_int_out(&(r.s1),qcp_mul_s32(a.s1,scalar),vl,1);
 qcp_select_int_out(&(r.s2),qcp_mul_s32(a.s2,scalar),vl,2);
 qcp_select_int_out(&(r.s3),qcp_mul_s32(a.s3,scalar),vl,3);
 qcp_select_int_out(&(r.s4),qcp_mul_s32(a.s4,scalar),vl,4);
 qcp_select_int_out(&(r.s5),qcp_mul_s32(a.s5,scalar),vl,5);
 qcp_select_int_out(&(r.s6),qcp_mul_s32(a.s6,scalar),vl,6);
 qcp_select_int_out(&(r.s7),qcp_mul_s32(a.s7,scalar),vl,7);
 return r;
}
vint32m2_t __riscv_vwmacc_vx_i32m2(vint32m2_t acc,short scalar,vint16m1_t b,size_t vl)

{ vint32m2_t r;
 qcp_select_int_out(&(r.s0),qcp_mac_s16(acc.s0,scalar,b.s0),vl,0);
 qcp_select_int_out(&(r.s1),qcp_mac_s16(acc.s1,scalar,b.s1),vl,1);
 qcp_select_int_out(&(r.s2),qcp_mac_s16(acc.s2,scalar,b.s2),vl,2);
 qcp_select_int_out(&(r.s3),qcp_mac_s16(acc.s3,scalar,b.s3),vl,3);
 qcp_select_int_out(&(r.s4),qcp_mac_s16(acc.s4,scalar,b.s4),vl,4);
 qcp_select_int_out(&(r.s5),qcp_mac_s16(acc.s5,scalar,b.s5),vl,5);
 qcp_select_int_out(&(r.s6),qcp_mac_s16(acc.s6,scalar,b.s6),vl,6);
 qcp_select_int_out(&(r.s7),qcp_mac_s16(acc.s7,scalar,b.s7),vl,7);
 return r;
}

/* Native regression support: minmax.c */

















int qcp_qd8_isnan(float x)
;
void qcp_select_float_out(float *out,float x,size_t vl,size_t lane)
;
float qcp_qd8_nanf(void)

{ return qcp_float_from_bits(2143289344U); }
int qcp_zero_pair(unsigned int u,unsigned int v)

{ return (u==0U || u==2147483648U) && (v==0U || v==2147483648U); }
void qcp_number_minmax_out(float *out,float a,float b,int kind)

{
 int na=qcp_qd8_isnan(a);
 int nb=qcp_qd8_isnan(b);
 if(na) { if(nb) *out=qcp_qd8_nanf(); else *out=b; return; }
 if(nb) { *out=a; return; }
 unsigned int ua=qcp_float_bits(a),ub=qcp_float_bits(b);
 if(qcp_zero_pair(ua,ub)) {
  if(kind==0) *out=qcp_float_from_bits(ua | ub);
  else *out=qcp_float_from_bits(ua & ub);
  return;
 }
 if(kind==0) { if(a<b) *out=a; else *out=b; }
 else { if(a>b) *out=a; else *out=b; }
}
void qcp_neon_minmax_out(float *out,float a,float b,int kind)

{
 int na=qcp_qd8_isnan(a);
 int nb=qcp_qd8_isnan(b);
 if(na || nb) { *out=qcp_qd8_nanf(); return; }
 qcp_number_minmax_out(out,a,b,kind);
}
float32x4_t vminq_f32(float32x4_t a,float32x4_t b)

{ float32x4_t r;
 qcp_neon_minmax_out(&(r.s0),a.s0,b.s0,0);
 qcp_neon_minmax_out(&(r.s1),a.s1,b.s1,0);
 qcp_neon_minmax_out(&(r.s2),a.s2,b.s2,0);
 qcp_neon_minmax_out(&(r.s3),a.s3,b.s3,0);
 return r;
}
float32x4_t vmaxq_f32(float32x4_t a,float32x4_t b)

{ float32x4_t r;
 qcp_neon_minmax_out(&(r.s0),a.s0,b.s0,1);
 qcp_neon_minmax_out(&(r.s1),a.s1,b.s1,1);
 qcp_neon_minmax_out(&(r.s2),a.s2,b.s2,1);
 qcp_neon_minmax_out(&(r.s3),a.s3,b.s3,1);
 return r;
}
vfloat32m2_t __riscv_vfmin_vf_f32m2(vfloat32m2_t a,float scalar,size_t vl)

{ vfloat32m2_t r; float value;
 qcp_number_minmax_out(&value,a.s0,scalar,0);
 qcp_select_float_out(&(r.s0),value,vl,0);
 qcp_number_minmax_out(&value,a.s1,scalar,0);
 qcp_select_float_out(&(r.s1),value,vl,1);
 qcp_number_minmax_out(&value,a.s2,scalar,0);
 qcp_select_float_out(&(r.s2),value,vl,2);
 qcp_number_minmax_out(&value,a.s3,scalar,0);
 qcp_select_float_out(&(r.s3),value,vl,3);
 qcp_number_minmax_out(&value,a.s4,scalar,0);
 qcp_select_float_out(&(r.s4),value,vl,4);
 qcp_number_minmax_out(&value,a.s5,scalar,0);
 qcp_select_float_out(&(r.s5),value,vl,5);
 qcp_number_minmax_out(&value,a.s6,scalar,0);
 qcp_select_float_out(&(r.s6),value,vl,6);
 qcp_number_minmax_out(&value,a.s7,scalar,0);
 qcp_select_float_out(&(r.s7),value,vl,7);
 return r;
}
vfloat32m2_t __riscv_vfmax_vf_f32m2(vfloat32m2_t a,float scalar,size_t vl)

{ vfloat32m2_t r; float value;
 qcp_number_minmax_out(&value,a.s0,scalar,1);
 qcp_select_float_out(&(r.s0),value,vl,0);
 qcp_number_minmax_out(&value,a.s1,scalar,1);
 qcp_select_float_out(&(r.s1),value,vl,1);
 qcp_number_minmax_out(&value,a.s2,scalar,1);
 qcp_select_float_out(&(r.s2),value,vl,2);
 qcp_number_minmax_out(&value,a.s3,scalar,1);
 qcp_select_float_out(&(r.s3),value,vl,3);
 qcp_number_minmax_out(&value,a.s4,scalar,1);
 qcp_select_float_out(&(r.s4),value,vl,4);
 qcp_number_minmax_out(&value,a.s5,scalar,1);
 qcp_select_float_out(&(r.s5),value,vl,5);
 qcp_number_minmax_out(&value,a.s6,scalar,1);
 qcp_select_float_out(&(r.s6),value,vl,6);
 qcp_number_minmax_out(&value,a.s7,scalar,1);
 qcp_select_float_out(&(r.s7),value,vl,7);
 return r;
}

/* Native regression support: selfnan.c */

















int qcp_qd8_isnan(float x)
;
void qcp_select_int_out(int *out,int x,size_t vl,size_t lane)
;
vbool16_t qcp_qd8_self_nan(const vfloat32m2_t *a,const vfloat32m2_t *b,size_t vl)

{ vbool16_t r;
 qcp_select_int_out(&(r.s0),qcp_qd8_isnan(a->s0),vl,0);
 qcp_select_int_out(&(r.s1),qcp_qd8_isnan(a->s1),vl,1);
 qcp_select_int_out(&(r.s2),qcp_qd8_isnan(a->s2),vl,2);
 qcp_select_int_out(&(r.s3),qcp_qd8_isnan(a->s3),vl,3);
 qcp_select_int_out(&(r.s4),qcp_qd8_isnan(a->s4),vl,4);
 qcp_select_int_out(&(r.s5),qcp_qd8_isnan(a->s5),vl,5);
 qcp_select_int_out(&(r.s6),qcp_qd8_isnan(a->s6),vl,6);
 qcp_select_int_out(&(r.s7),qcp_qd8_isnan(a->s7),vl,7);
 return r;
}

/* Native regression support: stores.c */
















void qcp_write_f32(float *p,float value)

{
 
 *p=value;
 
}
void qcp_vst1q_f32(float *p,const float32x4_t *a)

{
 qcp_write_f32(p+0,a->s0);
 qcp_write_f32(p+1,a->s1);
 qcp_write_f32(p+2,a->s2);
 qcp_write_f32(p+3,a->s3);
}
void qcp_vst1_f32(float *p,const float32x2_t *a)

{
 qcp_write_f32(p+0,a->s0);
 qcp_write_f32(p+1,a->s1);
}
void qcp_vst1_lane_f32(float *p,const float32x2_t *a,int lane)

{
 qcp_write_f32(p+0,a->s0);
}
void qcp_qd8_store(float *p,const vfloat32m2_t *a,size_t vl)

{
 if(vl>0) qcp_write_f32(p+0,a->s0);
 if(vl>1) qcp_write_f32(p+1,a->s1);
 if(vl>2) qcp_write_f32(p+2,a->s2);
 if(vl>3) qcp_write_f32(p+3,a->s3);
 if(vl>4) qcp_write_f32(p+4,a->s4);
 if(vl>5) qcp_write_f32(p+5,a->s5);
 if(vl>6) qcp_write_f32(p+6,a->s6);
 if(vl>7) qcp_write_f32(p+7,a->s7);
}

/* Native regression support: intloads.c */

















int qcp_read_packed_int(const int *p)

{
 
 int value=*p;
 
 return value;
}
int qcp_selected_packed_int(const int *p,size_t vl,size_t lane)

{ if(lane<vl) return qcp_read_packed_int(p+lane) ; return 0; }
int32x4_t vld1q_s32(const void *p)

{ int32x4_t r;
 r.s0=qcp_selected_packed_int((const int*)p,4,0) ;
 r.s1=qcp_selected_packed_int((const int*)p,4,1) ;
 r.s2=qcp_selected_packed_int((const int*)p,4,2) ;
 r.s3=qcp_selected_packed_int((const int*)p,4,3) ;
 return r;
}
vint32m2_t __riscv_vle32_v_i32m2(const int *p,size_t vl)

{ vint32m2_t r;
 r.s0=qcp_selected_packed_int((const int*)p,vl,0) ;
 r.s1=qcp_selected_packed_int((const int*)p,vl,1) ;
 r.s2=qcp_selected_packed_int((const int*)p,vl,2) ;
 r.s3=qcp_selected_packed_int((const int*)p,vl,3) ;
 r.s4=qcp_selected_packed_int((const int*)p,vl,4) ;
 r.s5=qcp_selected_packed_int((const int*)p,vl,5) ;
 r.s6=qcp_selected_packed_int((const int*)p,vl,6) ;
 r.s7=qcp_selected_packed_int((const int*)p,vl,7) ;
 return r;
}

/* Native regression support: floatloads.c */

















void qcp_read_packed_float_out(float *out,const float *p)

{
 
 *out=*p;
 
}
void qcp_selected_packed_float_out(float *out,const float *p,size_t vl,size_t lane)

{ if(lane<vl) qcp_read_packed_float_out(out,p+lane) ; else *out=0.0f; }
float32x4_t vld1q_f32(const void *p)

{ float32x4_t r;
 qcp_selected_packed_float_out(&(r.s0),(const float*)p,4,0) ;
 qcp_selected_packed_float_out(&(r.s1),(const float*)p,4,1) ;
 qcp_selected_packed_float_out(&(r.s2),(const float*)p,4,2) ;
 qcp_selected_packed_float_out(&(r.s3),(const float*)p,4,3) ;
 return r;
}
vfloat32m2_t __riscv_vle32_v_f32m2(const float *p,size_t vl)

{ vfloat32m2_t r;
 qcp_selected_packed_float_out(&(r.s0),(const float*)p,vl,0) ;
 qcp_selected_packed_float_out(&(r.s1),(const float*)p,vl,1) ;
 qcp_selected_packed_float_out(&(r.s2),(const float*)p,vl,2) ;
 qcp_selected_packed_float_out(&(r.s3),(const float*)p,vl,3) ;
 qcp_selected_packed_float_out(&(r.s4),(const float*)p,vl,4) ;
 qcp_selected_packed_float_out(&(r.s5),(const float*)p,vl,5) ;
 qcp_selected_packed_float_out(&(r.s6),(const float*)p,vl,6) ;
 qcp_selected_packed_float_out(&(r.s7),(const float*)p,vl,7) ;
 return r;
}

/* Native regression support: charloads.c */

















char qcp_read_packed_char(const char *p)

{
 
 char value=*p;
 
 return value;
}
char qcp_selected_packed_char(const char *p,size_t vl,size_t lane)

{ if(lane<vl) return qcp_read_packed_char(p+lane) ; return 0; }
char qcp_read_neon_char(const char *p,size_t lane)

{
 
 char value=p[lane];
 
 return value;
}
int8x8_t vld1_s8(const void *p)

{ int8x8_t r;
 r.s0=qcp_read_neon_char((const char*)p,0) ;
 r.s1=qcp_read_neon_char((const char*)p,1) ;
 r.s2=qcp_read_neon_char((const char*)p,2) ;
 r.s3=qcp_read_neon_char((const char*)p,3) ;
 r.s4=qcp_read_neon_char((const char*)p,4) ;
 r.s5=qcp_read_neon_char((const char*)p,5) ;
 r.s6=qcp_read_neon_char((const char*)p,6) ;
 r.s7=qcp_read_neon_char((const char*)p,7) ;
 return r;
}
vint8mf2_t __riscv_vle8_v_i8mf2(const char *p,size_t vl)

{ vint8mf2_t r;
 r.s0=qcp_selected_packed_char(p,vl,0) ;
 r.s1=qcp_selected_packed_char(p,vl,1) ;
 r.s2=qcp_selected_packed_char(p,vl,2) ;
 r.s3=qcp_selected_packed_char(p,vl,3) ;
 r.s4=qcp_selected_packed_char(p,vl,4) ;
 r.s5=qcp_selected_packed_char(p,vl,5) ;
 r.s6=qcp_selected_packed_char(p,vl,6) ;
 r.s7=qcp_selected_packed_char(p,vl,7) ;
 return r;
}
