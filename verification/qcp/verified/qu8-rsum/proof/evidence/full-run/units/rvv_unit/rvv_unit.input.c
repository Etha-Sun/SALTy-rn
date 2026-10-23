#include "/srv/home/yuechunsun/tools/qcp-simple-kernels/verification/qcp/candidates/qu8-rsum/shim/rvv_frontend.h"
void test_rvv(
    size_t batch,
    const uint8_t* input,
    uint32_t* output,
    const struct xnn_qs8_rsum_params* restrict params) XNN_OOB_READS
/*@ With (A:list Z) (Init:Z) (Tag:Z) Require 0<batch && batch<=18446744073709551600 && input!=0 && output!=0 && params!=0 && 0<=Init && Init<=4294967295 && UCharArray::full(input,batch+15,A) * store(output,unsigned int,Init) * store(&(params->_),char,Tag) Ensure UCharArray::full(input@pre,batch@pre+15,A) * store(output@pre,unsigned int,rs_u32(Init+rs_prefix(A,batch@pre))) * store(&(params@pre->_),char,Tag) */
{
  assert(batch != 0);
  assert(input != NULL);
  assert(output != NULL);
  assert(params != NULL);

  // vlmax is the same for e8m2 and e32m8 (VLEN/4)
  size_t vlmax = __riscv_vsetvlmax_e32m8();
  
  // Initialize the vector accumulator to 0
  vuint32m8_t vacc = __riscv_vmv_v_x_u32m8(0, vlmax);

/*@ Inv Assert exists (c0:Z) (c1:Z) (c2:Z) (c3:Z) (c4:Z) (c5:Z) (c6:Z) (c7:Z) (c8:Z) (c9:Z) (c10:Z) (c11:Z) (c12:Z) (c13:Z) (c14:Z) (c15:Z) (c16:Z) (c17:Z) (c18:Z) (c19:Z) (c20:Z) (c21:Z) (c22:Z) (c23:Z) (c24:Z) (c25:Z) (c26:Z) (c27:Z) (c28:Z) (c29:Z) (c30:Z) (c31:Z), 0<batch@pre && batch@pre<=18446744073709551600 && input@pre!=0 && output==output@pre && output!=0 && params==params@pre && params!=0 && vlmax==32 && 0<=batch && batch<=batch@pre && input==input@pre+(batch@pre-batch) && 0<=c0 && c0<=4294967295 && 0<=c1 && c1<=4294967295 && 0<=c2 && c2<=4294967295 && 0<=c3 && c3<=4294967295 && 0<=c4 && c4<=4294967295 && 0<=c5 && c5<=4294967295 && 0<=c6 && c6<=4294967295 && 0<=c7 && c7<=4294967295 && 0<=c8 && c8<=4294967295 && 0<=c9 && c9<=4294967295 && 0<=c10 && c10<=4294967295 && 0<=c11 && c11<=4294967295 && 0<=c12 && c12<=4294967295 && 0<=c13 && c13<=4294967295 && 0<=c14 && c14<=4294967295 && 0<=c15 && c15<=4294967295 && 0<=c16 && c16<=4294967295 && 0<=c17 && c17<=4294967295 && 0<=c18 && c18<=4294967295 && 0<=c19 && c19<=4294967295 && 0<=c20 && c20<=4294967295 && 0<=c21 && c21<=4294967295 && 0<=c22 && c22<=4294967295 && 0<=c23 && c23<=4294967295 && 0<=c24 && c24<=4294967295 && 0<=c25 && c25<=4294967295 && 0<=c26 && c26<=4294967295 && 0<=c27 && c27<=4294967295 && 0<=c28 && c28<=4294967295 && 0<=c29 && c29<=4294967295 && 0<=c30 && c30<=4294967295 && 0<=c31 && c31<=4294967295 && rs_acc_total(c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18,c19,c20,c21,c22,c23,c24,c25,c26,c27,c28,c29,c30,c31)==rs_u32(rs_prefix(A,batch@pre-batch)) && UCharArray::full(input@pre,batch@pre+15,A) * store(output,unsigned int,Init) * store(&(params->_),char,Tag) * store(&(vacc.s0),unsigned int,c0) * store(&(vacc.s1),unsigned int,c1) * store(&(vacc.s2),unsigned int,c2) * store(&(vacc.s3),unsigned int,c3) * store(&(vacc.s4),unsigned int,c4) * store(&(vacc.s5),unsigned int,c5) * store(&(vacc.s6),unsigned int,c6) * store(&(vacc.s7),unsigned int,c7) * store(&(vacc.s8),unsigned int,c8) * store(&(vacc.s9),unsigned int,c9) * store(&(vacc.s10),unsigned int,c10) * store(&(vacc.s11),unsigned int,c11) * store(&(vacc.s12),unsigned int,c12) * store(&(vacc.s13),unsigned int,c13) * store(&(vacc.s14),unsigned int,c14) * store(&(vacc.s15),unsigned int,c15) * store(&(vacc.s16),unsigned int,c16) * store(&(vacc.s17),unsigned int,c17) * store(&(vacc.s18),unsigned int,c18) * store(&(vacc.s19),unsigned int,c19) * store(&(vacc.s20),unsigned int,c20) * store(&(vacc.s21),unsigned int,c21) * store(&(vacc.s22),unsigned int,c22) * store(&(vacc.s23),unsigned int,c23) * store(&(vacc.s24),unsigned int,c24) * store(&(vacc.s25),unsigned int,c25) * store(&(vacc.s26),unsigned int,c26) * store(&(vacc.s27),unsigned int,c27) * store(&(vacc.s28),unsigned int,c28) * store(&(vacc.s29),unsigned int,c29) * store(&(vacc.s30),unsigned int,c30) * store(&(vacc.s31),unsigned int,c31) */
  for (; batch > 0; ) {
    size_t vl = __riscv_vsetvl_e8m2(batch);
    vuint8m2_t vt = __riscv_vle8_v_u8m2(input, vl) /*@ where base=input@pre,count=batch@pre+15,idx=batch@pre-batch,L=A */;
    input += vl;
    batch -= vl;

    // Zero-extend uint8 to uint32
    vuint32m8_t vt32 = __riscv_vzext_vf4_u32m8(vt, vl) /*@ where a=&vt */;
    
    // Accumulate using tail-undisturbed policy to preserve the sums in the tail
    // elements when vl < vlmax, ensuring the final reduction is correct.
    vacc = __riscv_vadd_vv_u32m8_tu(vacc, vacc, vt32, vl) /*@ where a=&vacc,b=&vt32 */;
  }

  // Reduce the vector accumulator into a scalar
  vuint32m1_t red = __riscv_vmv_v_x_u32m1(0, __riscv_vsetvlmax_e32m1());
  red = __riscv_vredsum_vs_u32m8_u32m1(vacc, red, vlmax) /*@ where a=&vacc,seed=&red */;
  
  *output += __riscv_vmv_x_s_u32m1_u32(red) /*@ where a=&red */;
}