#include <math.h>
/*@ ensures \is_NaN(\result); assigns \nothing; */
float candidate_nan(void){return NAN;}
/*@ ensures (\sign(x)==\Negative) <==> \result!=0; assigns \nothing; */
int candidate_signbit(float x){return signbit(x);}
/*@ predicate ieee_less(float a,float b) = \lt_float(a,b); */
/*@ assigns \nothing; ensures (\result!=0) <==> ieee_less(a,b); */
int candidate_less(float a,float b){return a<b;}
