#include "../shim/record_compute.h"
void test_rvv(
    size_t batch,
    const int8_t* input_a,
    const int8_t* input_b,
    int8_t* output,
    const union xnn_qs8_mul_minmax_params* restrict params) XNN_OOB_READS
{
  assert(batch != 0);
  assert(batch % sizeof(int8_t) == 0);
  assert(input_a != NULL);
  assert(input_b != NULL);
  assert(output != NULL);

  const int8_t a_zero_point = params->scalar.a_zero_point;
  const int8_t b_zero_point = params->scalar.b_zero_point;
  const float scale = params->scalar.scale;
  const int16_t output_zero_point = params->scalar.output_zero_point;
  const int8_t output_min = params->scalar.output_min;
  const int8_t output_max = params->scalar.output_max;

  while (batch > 0) {
    size_t vl = __riscv_vsetvl_e8m2(batch);

    vint8m2_t va;
    qm_record_load_into32(&va, input_a, vl);
    vint8m2_t vb;
    qm_record_load_into32(&vb, input_b, vl);

    vint8m2_t vout = qm_record_compute(&va,&vb,(int16_t)a_zero_point,(int16_t)b_zero_point,scale,output_zero_point,output_min,output_max,vl);

    __riscv_vse8_v_i8m2(output, vout, vl);

    input_a += vl;
    input_b += vl;
    output += vl;
    batch -= vl;
  }
}