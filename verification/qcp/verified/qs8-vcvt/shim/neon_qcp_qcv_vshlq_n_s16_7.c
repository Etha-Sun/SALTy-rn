#include "neon_arithmetic.h"
int16x8_t qcp_qcv_vshlq_n_s16_7(int16x8_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z)
 Require -32768<=a0 && a0<=32767 && -32768<=a1 && a1<=32767 && -32768<=a2 && a2<=32767 && -32768<=a3 && a3<=32767 && -32768<=a4 && a4<=32767 && -32768<=a5 && a5<=32767 && -32768<=a6 && a6<=32767 && -32768<=a7 && a7<=32767 && store(&(a.s0),short,a0) * store(&(a.s1),short,a1) * store(&(a.s2),short,a2) * store(&(a.s3),short,a3) * store(&(a.s4),short,a4) * store(&(a.s5),short,a5) * store(&(a.s6),short,a6) * store(&(a.s7),short,a7)
 Ensure store(&(__return.s0),short,qcv_shl7(a0)) * store(&(__return.s1),short,qcv_shl7(a1)) * store(&(__return.s2),short,qcv_shl7(a2)) * store(&(__return.s3),short,qcv_shl7(a3)) * store(&(__return.s4),short,qcv_shl7(a4)) * store(&(__return.s5),short,qcv_shl7(a5)) * store(&(__return.s6),short,qcv_shl7(a6)) * store(&(__return.s7),short,qcv_shl7(a7)) */
{
 int16x8_t r;
 r.s0=qcp_qcv_shl7(a.s0);
 r.s1=qcp_qcv_shl7(a.s1);
 r.s2=qcp_qcv_shl7(a.s2);
 r.s3=qcp_qcv_shl7(a.s3);
 r.s4=qcp_qcv_shl7(a.s4);
 r.s5=qcp_qcv_shl7(a.s5);
 r.s6=qcp_qcv_shl7(a.s6);
 r.s7=qcp_qcv_shl7(a.s7);
 return r;
}
