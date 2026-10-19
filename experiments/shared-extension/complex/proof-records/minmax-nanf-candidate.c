#include <math.h>
/*@
 predicate sv(float a,float b) = \eq_float(a,b) || (\is_NaN(a) && \is_NaN(b));
 predicate mn(float a,float b,float r) =
   (\is_NaN(a) && \is_NaN(b) ==> \is_NaN(r)) &&
   (\is_NaN(a) && !\is_NaN(b) ==> sv(r,b)) &&
   (!\is_NaN(a) && \is_NaN(b) ==> sv(r,a)) &&
   (!\is_NaN(a) && !\is_NaN(b) ==> sv(r,\lt_float(a,b) ? a : b));
 predicate mx(float a,float b,float r) =
   (\is_NaN(a) && \is_NaN(b) ==> \is_NaN(r)) &&
   (\is_NaN(a) && !\is_NaN(b) ==> sv(r,b)) &&
   (!\is_NaN(a) && \is_NaN(b) ==> sv(r,a)) &&
   (!\is_NaN(a) && !\is_NaN(b) ==> sv(r,\lt_float(b,a) ? a : b));
 predicate nm(float a,float b,float r) = (\is_NaN(a) || \is_NaN(b)) ? \is_NaN(r) : sv(r,\lt_float(a,b) ? a : b);
 predicate nx(float a,float b,float r) = (\is_NaN(a) || \is_NaN(b)) ? \is_NaN(r) : sv(r,\lt_float(b,a) ? a : b);
*/
/*@ assigns \nothing; ensures (\result!=0) <==> \is_NaN(x); */
int fp_nan(float x) { return x != x; }

/*@ assigns \nothing; ensures \is_NaN(\result); */
float canonical_nan(void) { return nanf(""); }

/*@ assigns \nothing; ensures mn(a,b,\result); */
float min_number(float a,float b) {
  if(fp_nan(a)) return fp_nan(b) ? canonical_nan() : b;
  if(fp_nan(b)) return a;
  if(a==0.0f && b==0.0f) return signbit(a) || signbit(b) ? -0.0f : 0.0f;
  return a < b ? a : b;
}

/*@ assigns \nothing; ensures mx(a,b,\result); */
float max_number(float a,float b) {
  if(fp_nan(a)) return fp_nan(b) ? canonical_nan() : b;
  if(fp_nan(b)) return a;
  if(a==0.0f && b==0.0f) return signbit(a) && signbit(b) ? -0.0f : 0.0f;
  return a > b ? a : b;
}

/*@ assigns \nothing; ensures nm(a,b,\result); */
float neon_min(float a,float b) {
#ifdef NEON_MINNUM_MODEL
  return min_number(a,b);
#else
  return fp_nan(a) || fp_nan(b) ? canonical_nan() : min_number(a,b);
#endif
}

/*@ assigns \nothing; ensures nx(a,b,\result); */
float neon_max(float a,float b) {
#ifdef NEON_MINNUM_MODEL
  return max_number(a,b);
#else
  return fp_nan(a) || fp_nan(b) ? canonical_nan() : max_number(a,b);
#endif
}

