/*@
  predicate same_value(float a,float b) =
    \eq_float(a,b) || (\is_NaN(a) && \is_NaN(b));
  predicate same_float(float a,float b) =
    (\is_NaN(a) && \is_NaN(b)) ||
    (same_value(a,b) && \sign(a)==\sign(b));
  lemma same_float_value: \forall float a,b;
    same_float(a,b) ==> same_value(a,b);
*/
/*@ assigns \nothing; ensures \false; */
void inconsistent_control(void) {}
