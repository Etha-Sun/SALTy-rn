void test_rvv(
    size_t output_pixels,
    size_t pooling_elements,
    size_t channels,
    const float** input,
    size_t input_offset,
    size_t input_pixel_stride,
    float* output,
    uint32_t* index,
    size_t input_increment,
    size_t output_increment,
    size_t index_increment) XNN_OOB_READS
{
  assert(output_pixels != 0);
  assert(pooling_elements != 0);
  assert(channels != 0);

  do {
    // Accumulators start out null, after each pass the accumulator is set to
    // the output.
    const float* ab = NULL;
    const uint32_t* ib = NULL;
    const float** id = input;

    uint32_t idx0 = 0;

    size_t k = pooling_elements;
    for (; k > 0; k = k > 9 ? k - 9 : 0) {
      const float* i0 = ap_read_table(id);
      id += 1;
      const float* i1 = i0;
      if (1 < k) {
        i1 = ap_read_table(id);
        id += 1;
      }
      const float* i2 = i0;
      if (2 < k) {
        i2 = ap_read_table(id);
        id += 1;
      }
      const float* i3 = i0;
      if (3 < k) {
        i3 = ap_read_table(id);
        id += 1;
      }
      const float* i4 = i0;
      if (4 < k) {
        i4 = ap_read_table(id);
        id += 1;
      }
      const float* i5 = i0;
      if (5 < k) {
        i5 = ap_read_table(id);
        id += 1;
      }
      const float* i6 = i0;
      if (6 < k) {
        i6 = ap_read_table(id);
        id += 1;
      }
      const float* i7 = i0;
      if (7 < k) {
        i7 = ap_read_table(id);
        id += 1;
      }
      const float* i8 = i0;
      if (8 < k) {
        i8 = ap_read_table(id);
        id += 1;
      }
      i0 = (const float*) ((uintptr_t) i0 + input_offset);
      i1 = (const float*) ((uintptr_t) i1 + input_offset);
      i2 = (const float*) ((uintptr_t) i2 + input_offset);
      i3 = (const float*) ((uintptr_t) i3 + input_offset);
      i4 = (const float*) ((uintptr_t) i4 + input_offset);
      i5 = (const float*) ((uintptr_t) i5 + input_offset);
      i6 = (const float*) ((uintptr_t) i6 + input_offset);
      i7 = (const float*) ((uintptr_t) i7 + input_offset);
      i8 = (const float*) ((uintptr_t) i8 + input_offset);

      float* o = output;
      uint32_t* i = index;
      const float* current_ab = ab;
      const uint32_t* current_ib = ib;
      size_t c = channels;

      while (c > 0) {
        size_t vl = __riscv_vsetvl_e32m8(c);

        ap_rvv_block32(i0,i1,i2,i3,i4,i5,i6,i7,i8,current_ab,current_ib,o,i,idx0,vl);
        if(current_ab){current_ab+=vl;current_ib+=vl;}
        i0+=vl;
        i1+=vl;
        i2+=vl;
        i3+=vl;
        i4+=vl;
        i5+=vl;
        i6+=vl;
        i7+=vl;
        i8+=vl;
        o+=vl;i+=vl;

        c -= vl;
      }
      idx0 += 9;
      ab = output;
      ib = index;
    }

    input = (const float**) ((uintptr_t) input + input_increment);
    input_offset += input_pixel_stride;
    output = (float*) ((uintptr_t) output + output_increment);
    index = (uint32_t*) ((uintptr_t) index + index_increment);
    output_pixels -= 1;
  } while (output_pixels != 0);
}