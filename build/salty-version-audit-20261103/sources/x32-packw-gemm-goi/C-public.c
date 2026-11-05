#include <riscv_vector.h>
#include <assert.h>
#include <stdint.h>
#include <stddef.h>

void test_rvv(
  size_t g,
  size_t nc,
  size_t kc,
  size_t nr,
  size_t kr,
  size_t sr,
  const uint32_t* weights,
  const uint32_t* bias,
  const void* scale,
  uint32_t* packed_weights,
  size_t extra_bytes,
  const void* params)
{
  assert(g != 0);
  assert(nc != 0);
  assert(kc != 0);
  assert(nr == 2);
  assert(kr == 1);
  assert(sr == 1);
  assert(weights != NULL);
  assert(packed_weights != NULL);

  // NR=2 stores: clamp vl>=1 so vlen=0/1 cannot zero out the store.
  size_t vl2 = __riscv_vsetvl_e32m1(2);
  if (vl2 < 2) vl2 = 2;

  // Global register-resident zero for padding and bias-null cases.
  // Using LMUL=2 for the k-loop and LMUL=1 for bias.
  size_t vl_max2 = __riscv_vsetvlmax_e32m2();
  vuint32m2_t vzero_m2 = __riscv_vmv_v_x_u32m2(0, vl_max2);
  vuint32m1_t vzero_m1 = __riscv_vmv_v_x_u32m1(0, vl2);

  // Pre-calculate stride between packed channel pairs (in bytes)
  const size_t pair_stride_bytes = (2 + 2 * kc) * sizeof(uint32_t) + extra_bytes;

  // Hoist loop-invariant bias check to avoid branch overhead in inner loops.
  if XNN_LIKELY(bias != NULL) {
    const uint32_t* bias_ptr = bias;
    do {
      const uint32_t* w0 = weights;
      size_t n = nc;

      // NC main loop: Process 4 channels (2 pairs) simultaneously to balance sequencers
      for (; n >= 4; n -= 4) {
        const uint32_t* w1 = w0 + kc;
        const uint32_t* w2 = w1 + kc;
        const uint32_t* w3 = w2 + kc;
        
        uint32_t* p0 = packed_weights;
        uint32_t* p1 = (uint32_t*)((uintptr_t)p0 + pair_stride_bytes);

        vuint32m1_t b01 = __riscv_vle32_v_u32m1(bias_ptr, vl2);
        vuint32m1_t b23 = __riscv_vle32_v_u32m1(bias_ptr + 2, vl2);
        __riscv_vse32_v_u32m1(p0, b01, vl2);
        __riscv_vse32_v_u32m1(p1, b23, vl2);
        bias_ptr += 4;

        uint32_t* p0w = p0 + 2;
        uint32_t* p1w = p1 + 2;
        size_t k = kc;
        while (k > 0) {
          size_t vl = __riscv_vsetvl_e32m2(k);
          
          // Load for first pair and immediately segment store it
          // Interleaving 2 loads : 1 segment store
          vuint32m2_t vw0 = __riscv_vle32_v_u32m2(w0, vl); w0 += vl;
          vuint32m2_t vw1 = __riscv_vle32_v_u32m2(w1, vl); w1 += vl;

          vuint32m2x2_t vws0 = __riscv_vundefined_u32m2x2();
          vws0 = __riscv_vset_v_u32m2_u32m2x2(vws0, 0, vw0);
          vws0 = __riscv_vset_v_u32m2_u32m2x2(vws0, 1, vw1);
          __riscv_vsseg2e32_v_u32m2x2(p0w, vws0, vl);
          p0w += 2 * vl;

          // Load for second pair and immediately segment store it
          vuint32m2_t vw2 = __riscv_vle32_v_u32m2(w2, vl); w2 += vl;
          vuint32m2_t vw3 = __riscv_vle32_v_u32m2(w3, vl); w3 += vl;

          vuint32m2x2_t vws1 = __riscv_vundefined_u32m2x2();
          vws1 = __riscv_vset_v_u32m2_u32m2x2(vws1, 0, vw2);
          vws1 = __riscv_vset_v_u32m2_u32m2x2(vws1, 1, vw3);
          __riscv_vsseg2e32_v_u32m2x2(p1w, vws1, vl);
          p1w += 2 * vl;
          
          k -= vl;
        }
        
        // Advance to the next block of 4 channels
        w0 = w3;
        packed_weights = (uint32_t*)((uintptr_t)p1 + pair_stride_bytes);
      }

      // NC Remainder Loop: Process 2 channels (1 pair)
      for (; n >= 2; n -= 2) {
        const uint32_t* w1 = w0 + kc;
        uint32_t* p0 = packed_weights;
        
        vuint32m1_t b01 = __riscv_vle32_v_u32m1(bias_ptr, vl2);
        __riscv_vse32_v_u32m1(p0, b01, vl2);
        bias_ptr += 2;

        uint32_t* p0w = p0 + 2;
        size_t k = kc;
        while (k > 0) {
          size_t vl = __riscv_vsetvl_e32m2(k);
          
          vuint32m2_t vw0 = __riscv_vle32_v_u32m2(w0, vl); w0 += vl;
          vuint32m2_t vw1 = __riscv_vle32_v_u32m2(w1, vl); w1 += vl;
          
          vuint32m2x2_t vws0 = __riscv_vundefined_u32m2x2();
          vws0 = __riscv_vset_v_u32m2_u32m2x2(vws0, 0, vw0);
          vws0 = __riscv_vset_v_u32m2_u32m2x2(vws0, 1, vw1);
          __riscv_vsseg2e32_v_u32m2x2(p0w, vws0, vl);
          p0w += 2 * vl;
          
          k -= vl;
        }
        
        w0 = w1;
        packed_weights = (uint32_t*)((uintptr_t)p0 + pair_stride_bytes);
      }

      // Handle single channel remainder (NC % 2 != 0)
      if XNN_UNLIKELY(n != 0) {
        uint32_t* p0 = packed_weights;
        
        vuint32m1_t b01 = __riscv_vle32_v_u32m1(bias_ptr, 1);
        __riscv_vse32_v_u32m1(p0, b01, 1);
        bias_ptr += 1;

        uint32_t* p0w = p0 + 2;
        size_t k = kc;
        while (k > 0) {
          size_t vl = __riscv_vsetvl_e32m2(k);
          
          vuint32m2_t vw0 = __riscv_vle32_v_u32m2(w0, vl); w0 += vl;
          
          vuint32m2x2_t vws0 = __riscv_vundefined_u32m2x2();
          vws0 = __riscv_vset_v_u32m2_u32m2x2(vws0, 0, vw0);
          vws0 = __riscv_vset_v_u32m2_u32m2x2(vws0, 1, vzero_m2);
          __riscv_vsseg2e32_v_u32m2x2(p0w, vws0, vl);
          p0w += 2 * vl;
          
          k -= vl;
        }
        packed_weights = (uint32_t*)((uintptr_t)p0 + pair_stride_bytes);
      }
      weights += nc * kc;
    } while (--g != 0);
  } else {
    // Bias is NULL loop variant
    do {
      const uint32_t* w0 = weights;
      size_t n = nc;

      for (; n >= 4; n -= 4) {
        const uint32_t* w1 = w0 + kc;
        const uint32_t* w2 = w1 + kc;
        const uint32_t* w3 = w2 + kc;
        
        uint32_t* p0 = packed_weights;
        uint32_t* p1 = (uint32_t*)((uintptr_t)p0 + pair_stride_bytes);

        __riscv_vse32_v_u32m1(p0, vzero_m1, vl2);
        __riscv_vse32_v_u32m1(p1, vzero_m1, vl2);

        uint32_t* p0w = p0 + 2;
        uint32_t* p1w = p1 + 2;
        size_t k = kc;
        while (k > 0) {
          size_t vl = __riscv_vsetvl_e32m2(k);
          
          // Load for first pair and immediately segment store it
          vuint32m2_t vw0 = __riscv_vle32_v_u32m2(w0, vl); w0 += vl;
          vuint32m2_t vw1 = __riscv_vle32_v_u32m2(w1, vl); w1 += vl;

          vuint32m2x2_t vws0 = __riscv_vundefined_u32m2x2();
          vws0 = __riscv_vset_v_u32m2_u32m2x2(vws0, 0, vw0);
          vws0 = __riscv_vset_v_u32m2_u32m2x2(vws0, 1, vw1);
          __riscv_vsseg2e32_v_u32m2x2(p0w, vws0, vl);
          p0w += 2 * vl;

          // Load for second pair and immediately segment store it
          vuint32m2_t vw2 = __riscv_vle32_v_u32m2(w2, vl); w2 += vl;
          vuint32m2_t vw3 = __riscv_vle32_v_u32m2(w3, vl); w3 += vl;

          vuint32m2x2_t vws1 = __riscv_vundefined_u32m2x2();
          vws1 = __riscv_vset_v_u32m2_u32m2x2(vws1, 0, vw2);
          vws1 = __riscv_vset_v_u32m2_u32m2x2(vws1, 1, vw3);
          __riscv_vsseg2e32_v_u32m2x2(p1w, vws1, vl);
          p1w += 2 * vl;

          k -= vl;
        }
        
        w0 = w3;
        packed_weights = (uint32_t*)((uintptr_t)p1 + pair_stride_bytes);
      }

      for (; n >= 2; n -= 2) {
        const uint32_t* w1 = w0 + kc;
        uint32_t* p0 = packed_weights;
        
        __riscv_vse32_v_u32m1(p0, vzero_m1, vl2);

        uint32_t* p0w = p0 + 2;
        size_t k = kc;
        while (k > 0) {
          size_t vl = __riscv_vsetvl_e32m2(k);
          
          vuint32m2_t vw0 = __riscv_vle32_v_u32m2(w0, vl); w0 += vl;
          vuint32m2_t vw1 = __riscv_vle32_v_u32m2(w1, vl); w1 += vl;
          
          vuint32m2x2_t vws0 = __riscv_vundefined_u32m2x2();
          vws0 = __riscv_vset_v_u32m2_u32m2x2(vws0, 0, vw0);
          vws0 = __riscv_vset_v_u32m2_u32m2x2(vws0, 1, vw1);
          __riscv_vsseg2e32_v_u32m2x2(p0w, vws0, vl);
          p0w += 2 * vl;
          
          k -= vl;
        }
        
        w0 = w1;
        packed_weights = (uint32_t*)((uintptr_t)p0 + pair_stride_bytes);
      }

      if XNN_UNLIKELY(n != 0) {
        uint32_t* p0 = packed_weights;
        
        __riscv_vse32_v_u32m1(p0, vzero_m1, 1);

        uint32_t* p0w = p0 + 2;
        size_t k = kc;
        while (k > 0) {
          size_t vl = __riscv_vsetvl_e32m2(k);
          
          vuint32m2_t vw0 = __riscv_vle32_v_u32m2(w0, vl); w0 += vl;
          
          vuint32m2x2_t vws0 = __riscv_vundefined_u32m2x2();
          vws0 = __riscv_vset_v_u32m2_u32m2x2(vws0, 0, vw0);
          vws0 = __riscv_vset_v_u32m2_u32m2x2(vws0, 1, vzero_m2);
          __riscv_vsseg2e32_v_u32m2x2(p0w, vws0, vl);
          p0w += 2 * vl;
          
          k -= vl;
        }
        packed_weights = (uint32_t*)((uintptr_t)p0 + pair_stride_bytes);
      }
      weights += nc * kc;
    } while (--g != 0);
  }
}
