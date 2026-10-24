/*@ Import Coq Require Import F32F16.Bits */
/*@ Extern Coq (same_bits : fp32 -> fp32 -> Prop)
 (bits_of_fp32 : fp32 -> Z)
 (fp32_of_bits : Z -> fp32)
 (word32 : Z -> Z -> Z -> Z -> Z -> Prop)
 (aligned_4 : Z -> Prop) */
unsigned int qcp_float_bits(float x)
/*@ Require emp
 Ensure __return == bits_of_fp32(x) && emp */;
float qcp_float_from_bits(unsigned int bits)
/*@ Require emp
 Ensure same_bits(__return,fp32_of_bits(bits)) && emp */;
unsigned int qcp_float_bits_at(const float *x)
/*@ With (v:fp32)
 Require store(x,float,v)
 Ensure __return == bits_of_fp32(v) && store(x,float,v) */
{
  /*@ Assert exists (b0 b1 b2 b3:Z),
    x == x@pre && aligned_4(x) && word32(bits_of_fp32(v),b0,b1,b2,b3) &&
    store((unsigned char *)x,unsigned char,b0) *
    store((unsigned char *)x+1,unsigned char,b1) *
    store((unsigned char *)x+2,unsigned char,b2) *
    store((unsigned char *)x+3,unsigned char,b3) */
  const unsigned char *p = (const unsigned char *)x;
  unsigned int c0 = *p;
  unsigned int c1 = *(p+1);
  unsigned int c2 = *(p+2);
  unsigned int c3 = *(p+3);
  unsigned int r = c0 + 256u * c1 + 65536u * c2 + 16777216u * c3;
  /*@ Assert x == x@pre && aligned_4(x) && r == bits_of_fp32(v) && p == x &&
   0 <= c0 && c0 <= 255 && 0 <= c1 && c1 <= 255 &&
   0 <= c2 && c2 <= 255 && 0 <= c3 && c3 <= 255 && store(x,float,v) */
  return r;
}
unsigned int qcp_float_bits(float x)
/*@ Require emp
 Ensure __return == bits_of_fp32(x) && emp */
{
  return qcp_float_bits_at(&x);
}
void qcp_float_from_bits_at(const unsigned int *bits, float *x)
/*@ With (w:Z)
 Require store(bits,unsigned int,w) * undef_data_at(x,float)
 Ensure store(bits,unsigned int,w) * store(x,float,fp32_of_bits(w)) */
{
  /*@ Assert exists (b0 b1 b2 b3:Z),
    bits == bits@pre && x == x@pre && aligned_4(bits) && aligned_4(x) &&
    word32(w,b0,b1,b2,b3) &&
    store((unsigned char *)bits,unsigned char,b0) *
    store((unsigned char *)bits+1,unsigned char,b1) *
    store((unsigned char *)bits+2,unsigned char,b2) *
    store((unsigned char *)bits+3,unsigned char,b3) *
    undef_data_at((unsigned char *)x,unsigned char) *
    undef_data_at((unsigned char *)x+1,unsigned char) *
    undef_data_at((unsigned char *)x+2,unsigned char) *
    undef_data_at((unsigned char *)x+3,unsigned char) */
  const unsigned char *p = (const unsigned char *)bits;
  unsigned char *q = (unsigned char *)x;
  *q = *p;
  *(q+1) = *(p+1);
  *(q+2) = *(p+2);
  *(q+3) = *(p+3);
  /*@ Assert bits == bits@pre && x == x@pre && p == bits && q == x &&
    store(bits,unsigned int,w) * store(x,float,fp32_of_bits(w)) */
}
float qcp_float_from_bits(unsigned int bits)
/*@ Require emp
 Ensure same_bits(__return,fp32_of_bits(bits)) && emp */
{
  float x;
  qcp_float_from_bits_at(&bits,&x);
  return x;
}
