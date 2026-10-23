#include "../../../shim/rvv_frontend.c"
void test_rvv(
    size_t batch,
    const int8_t* input,
    int8_t* output,
    const struct xnn_s8_minmax_params* restrict params) XNN_OOB_READS
/*@ With (A:list Z) (RawLo:Z) (RawHi:Z)
 Require 0<batch && batch<=18446744073709551608 && input!=0 && output!=0 && params!=0 &&
 CharArray::full(input,batch+7,A) * CharArray::undef_full(output,batch) *
 store(&(params->scalar.min),int,RawLo) * store(&(params->scalar.max),int,RawHi)
 Ensure CharArray::full(input,batch+7,A) *
 CharArray::full(output,batch,s8_values(batch,s8_narrow(RawLo),s8_narrow(RawHi),A)) *
 store(&(params->scalar.min),int,RawLo) * store(&(params->scalar.max),int,RawHi) */
{
/*@ Assert 0<batch && batch<=18446744073709551608 && batch==batch@pre && input==input@pre && output==output@pre && params==params@pre && input!=0 && output!=0 && params!=0 && sizeof(int8_t)==1 && batch%sizeof(int8_t)==0 && Zlength(A)==batch+7 && CharArray::full(input@pre,batch@pre+7,A) * store(&(params->scalar.min),int,RawLo) * store(&(params->scalar.max),int,RawHi) * CharArray::undef_full(output,batch) */
  assert(batch != 0);
  assert(batch % sizeof(int8_t) == 0);
  assert(input != NULL);
  assert(output != NULL);

  const int8_t voutput_min = (int8_t) params->scalar.min;
  const int8_t voutput_max = (int8_t) params->scalar.max;

  size_t batch64 = batch & ~((size_t)63);
/*@ Assert 0<batch@pre && batch@pre<=18446744073709551608 && sizeof(int8_t)==1 && params==params@pre && Zlength(A)==batch@pre+7 && batch==batch@pre && input==input@pre && output==output@pre && voutput_min==s8_narrow(RawLo) && voutput_max==s8_narrow(RawHi) && -128<=voutput_min && voutput_min<=127 && -128<=voutput_max && voutput_max<=127 && batch64==s8_bulk_count(batch@pre) && 0<=batch64 && batch64<=batch && CharArray::full(input@pre,batch@pre+7,A) * store(&(params->scalar.min),int,RawLo) * store(&(params->scalar.max),int,RawHi) * CharArray::undef_full(output,batch) */
/*@ Inv Assert 0<batch@pre && batch@pre<=18446744073709551608 && sizeof(int8_t)==1 && params==params@pre && Zlength(A)==batch@pre+7 && 0<=batch && batch<=batch@pre && input==input@pre+(batch@pre-batch) && ((batch>0 && output==output@pre+(batch@pre-batch)) || batch==0) && voutput_min==s8_narrow(RawLo) && voutput_max==s8_narrow(RawHi) && -128<=voutput_min && voutput_min<=127 && -128<=voutput_max && voutput_max<=127 && 0<=s8_bulk_count(batch@pre) && s8_bulk_count(batch@pre)<=batch@pre && 0<=batch64 && batch64==s8_bulk_count(batch@pre)-(batch@pre-batch) && (batch@pre-batch)<=s8_bulk_count(batch@pre) && CharArray::full(input@pre,batch@pre+7,A) * store(&(params->scalar.min),int,RawLo) * store(&(params->scalar.max),int,RawHi) * CharArray::full(output@pre,batch@pre-batch,s8_rvv_progress(batch@pre-batch,batch@pre,s8_narrow(RawLo),s8_narrow(RawHi),A)) * CharArray::undef_full(output,batch) */
  while (batch64 > 0) {
    size_t vl = __riscv_vsetvl_e8m8(batch64);
/*@ Assert 0<vl && vl<=128 && vl<=batch && vl<=batch64 && 0<batch@pre && batch@pre<=18446744073709551608 && sizeof(int8_t)==1 && params==params@pre && Zlength(A)==batch@pre+7 && 0<=batch && batch<=batch@pre && input==input@pre+(batch@pre-batch) && batch>0 && output==output@pre+(batch@pre-batch) && voutput_min==s8_narrow(RawLo) && voutput_max==s8_narrow(RawHi) && -128<=voutput_min && voutput_min<=127 && -128<=voutput_max && voutput_max<=127 && 0<=s8_bulk_count(batch@pre) && s8_bulk_count(batch@pre)<=batch@pre && 0<=batch64 && batch64==s8_bulk_count(batch@pre)-(batch@pre-batch) && (batch@pre-batch)<=s8_bulk_count(batch@pre) && CharArray::full(input@pre,batch@pre+7,A) * store(&(params->scalar.min),int,RawLo) * store(&(params->scalar.max),int,RawHi) * CharArray::full(output@pre,batch@pre-batch,s8_rvv_progress(batch@pre-batch,batch@pre,s8_narrow(RawLo),s8_narrow(RawHi),A)) * CharArray::undef_full(output,batch) */
    
    vint8m8_t vacc = __riscv_vle8_v_i8m8(input, vl) /*@ where base=input@pre,count=batch@pre+7,idx=batch@pre-batch,L=A */;
    
    vacc = __riscv_vmax_vx_i8m8(vacc, voutput_min, vl);
    vacc = __riscv_vmin_vx_i8m8(vacc, voutput_max, vl);
    
    __riscv_vse8_v_i8m8(output, vacc, vl);
    
    input += vl;
    output += vl;
    batch -= vl;
    batch64 -= vl;
  }

/*@ Inv Assert batch64==0 && 0<batch@pre && batch@pre<=18446744073709551608 && sizeof(int8_t)==1 && params==params@pre && Zlength(A)==batch@pre+7 && 0<=batch && batch<=batch@pre && input==input@pre+(batch@pre-batch) && ((batch>0 && output==output@pre+(batch@pre-batch)) || batch==0) && voutput_min==s8_narrow(RawLo) && voutput_max==s8_narrow(RawHi) && -128<=voutput_min && voutput_min<=127 && -128<=voutput_max && voutput_max<=127 && s8_bulk_count(batch@pre)<=(batch@pre-batch) && CharArray::full(input@pre,batch@pre+7,A) * store(&(params->scalar.min),int,RawLo) * store(&(params->scalar.max),int,RawHi) * CharArray::full(output@pre,batch@pre-batch,s8_rvv_progress(batch@pre-batch,batch@pre,s8_narrow(RawLo),s8_narrow(RawHi),A)) * CharArray::undef_full(output,batch) */
  while (batch > 0) {
    size_t vl = __riscv_vsetvl_e8m8(batch);
/*@ Assert batch64==0 && 0<vl && vl<=128 && vl<=batch && 0<batch@pre && batch@pre<=18446744073709551608 && sizeof(int8_t)==1 && params==params@pre && Zlength(A)==batch@pre+7 && 0<=batch && batch<=batch@pre && input==input@pre+(batch@pre-batch) && batch>0 && output==output@pre+(batch@pre-batch) && voutput_min==s8_narrow(RawLo) && voutput_max==s8_narrow(RawHi) && -128<=voutput_min && voutput_min<=127 && -128<=voutput_max && voutput_max<=127 && s8_bulk_count(batch@pre)<=(batch@pre-batch) && CharArray::full(input@pre,batch@pre+7,A) * store(&(params->scalar.min),int,RawLo) * store(&(params->scalar.max),int,RawHi) * CharArray::full(output@pre,batch@pre-batch,s8_rvv_progress(batch@pre-batch,batch@pre,s8_narrow(RawLo),s8_narrow(RawHi),A)) * CharArray::undef_full(output,batch) */
    
    vint8m8_t vacc = __riscv_vle8_v_i8m8(input, vl) /*@ where base=input@pre,count=batch@pre+7,idx=batch@pre-batch,L=A */;
    
    vacc = __riscv_vmin_vx_i8m8(vacc, voutput_max, vl);
    vacc = __riscv_vmax_vx_i8m8(vacc, voutput_min, vl);
    
    __riscv_vse8_v_i8m8(output, vacc, vl);
    
    input += vl;
    output += vl;
    batch -= vl;
  }
}