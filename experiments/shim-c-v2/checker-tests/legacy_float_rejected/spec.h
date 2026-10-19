/*@
  predicate same_value(float a,float b) =
    \eq_float(a,b) || (\is_NaN(a) && \is_NaN(b));
  predicate same_float(float a,float b) =
    (\is_NaN(a) && \is_NaN(b)) ||
    (same_value(a,b) && \sign(a)==\sign(b));
  lemma same_float_value: \forall float a,b;
    same_float(a,b) ==> same_value(a,b);
*/
/*@ requires -100<x<100; assigns \nothing; ensures \result==1; */
int equivalent(int x);
