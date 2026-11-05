unsigned int qcp_fmax_arm_bits(unsigned int a,unsigned int b)
{
 if (qcp_fmax_snan_bits(a) == 1) return a | 4194304U;
 if (qcp_fmax_snan_bits(b) == 1) return b | 4194304U;
 if (qcp_fmax_nan_bits(a) == 1) return a;
 if (qcp_fmax_nan_bits(b) == 1) return b;
 return qcp_fmax_ordered_bits(a,b);
}

unsigned int qcp_fmax_rvv_bits(unsigned int a,unsigned int b)
{
 if (qcp_fmax_nan_bits(a) == 1) {
  if (qcp_fmax_nan_bits(b) == 1) return 2143289344U;
  return b;
 }
 if (qcp_fmax_nan_bits(b) == 1) return a;
 return qcp_fmax_ordered_bits(a,b);
}

