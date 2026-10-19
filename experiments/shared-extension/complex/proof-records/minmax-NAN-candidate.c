#include <math.h>
/*@
 predicate sv(float a,float b) = \eq_float(a,b) || (\is_NaN(a) && \is_NaN(b));
 logic float mn(float a,float b) = \is_NaN(a) ? (\is_NaN(b) ? \NaN : b) : \is_NaN(b) ? a : \lt_float(a,b) ? a : b;
 logic float mx(float a,float b) = \is_NaN(a) ? (\is_NaN(b) ? \NaN : b) : \is_NaN(b) ? a : \lt_float(b,a) ? a : b;
 logic float nm(float a,float b) = \is_NaN(a) || \is_NaN(b) ? \NaN : mn(a,b);
 logic float nx(float a,float b) = \is_NaN(a) || \is_NaN(b) ? \NaN : mx(a,b);
*/
/*@ assigns \nothing; ensures (\result!=0) <==> \is_NaN(x); */
int fp_nan(float x) { return x != x; }

/*@ assigns \nothing; ensures \is_NaN(\result); */
float canonical_nan(void) { return NAN; }

/*@ assigns \nothing; ensures sv(\result,mn(a,b)); */
float min_number(float a,float b) {
  if(fp_nan(a)) return fp_nan(b) ? canonical_nan() : b;
  if(fp_nan(b)) return a;
  if(a==0.0f && b==0.0f) return signbit(a) || signbit(b) ? -0.0f : 0.0f;
  return a < b ? a : b;
}

/*@ assigns \nothing; ensures sv(\result,mx(a,b)); */
float max_number(float a,float b) {
  if(fp_nan(a)) return fp_nan(b) ? canonical_nan() : b;
  if(fp_nan(b)) return a;
  if(a==0.0f && b==0.0f) return signbit(a) && signbit(b) ? -0.0f : 0.0f;
  return a > b ? a : b;
}

/*@ assigns \nothing; ensures sv(\result,nm(a,b)); */
float neon_min(float a,float b) {
#ifdef NEON_MINNUM_MODEL
  return min_number(a,b);
#else
  return fp_nan(a) || fp_nan(b) ? canonical_nan() : min_number(a,b);
#endif
}

/*@ assigns \nothing; ensures sv(\result,nx(a,b)); */
float neon_max(float a,float b) {
#ifdef NEON_MINNUM_MODEL
  return max_number(a,b);
#else
  return fp_nan(a) || fp_nan(b) ? canonical_nan() : max_number(a,b);
#endif
}

