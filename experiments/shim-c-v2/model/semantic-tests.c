/* Positive and deliberately wrong contracts are separate functions.
   No user axioms; no finite-input restriction on arithmetic tests. */
/*@ predicate same_value(float x,float y) =
      \eq_float(x,y) || (\is_NaN(x) && \is_NaN(y));
    predicate same_float(float x,float y) =
      (\is_NaN(x) && \is_NaN(y)) ||
      (same_value(x,y) && \sign(x)==\sign(y));
    lemma value_from_same: \forall float x,y;
      same_float(x,y) ==> same_value(x,y);
*/
/*@ assigns \nothing; ensures \true; */
void true_control(void) {}
/*@ assigns \nothing; ensures \false; */
void false_control(void) {}
/*@ requires \is_NaN(x); assigns \nothing;
    ensures \is_NaN(\result); */
float nan_add(float x) { return x+x; }
/*@ requires \is_NaN(x); assigns \nothing;
    ensures \is_finite(\result); */
float wrong_nan_add(float x) { return x+x; }
/*@ requires \eq_float(x,0.0f) && \sign(x)==\Negative;
    assigns \nothing; ensures \sign(\result)==\Negative;
    ensures \eq_float(\result,0.0f); */
float minus_zero(float x) { return x+x; }
/*@ requires \eq_float(x,0.0f) && \sign(x)==\Negative;
    assigns \nothing; ensures \sign(\result)==\Positive; */
float wrong_minus_zero(float x) { return x+x; }
/*@ assigns \nothing; ensures \sign(\result)==\Negative; */
float known_gap_literal_minuszero(void) { return -0.0f; }
/*@ assigns \nothing; ensures \sign(\result)==\Positive; */
float known_gap_wrong_literal_minuszero(void) { return -0.0f; }
/*@ requires \is_plus_infinity(x); assigns \nothing;
    ensures \is_NaN(\result); */
float infinite_sub(float x) { return x-x; }
/*@ requires \is_minus_infinity(x); assigns \nothing;
    ensures \is_plus_infinity(\result); */
float infinite_mul(float x) { return x * -1.0f; }
/*@ requires \is_finite(x) && \eq_float(x,0x1p-149f); assigns \nothing;
    ensures \eq_float(\result,0.0f); */
float subnormal_half(float x) { return x * 0.5f; }
/*@ assigns \nothing;
    ensures \eq_float(\round_float(\NearestEven,16777217.0),16777216.0f); */
void rounding_tie(void) {}
/*@ assigns \nothing;
    ensures \eq_float(\round_float(\NearestEven,16777217.0),16777218.0f); */
void wrong_rounding_tie(void) {}
/*@ assigns \nothing;
    ensures \eq_float(\round_float(\Up,16777217.0),16777218.0f); */
void rounding_up(void) {}
/*@ assigns \nothing;
    ensures \eq_float(\round_float(\Down,-16777217.0), (float)(-16777218.0)); */
void rounding_down(void) {}
/*@ requires \eq_float(x,1.5f); assigns \nothing;
    ensures \eq_double(\result,(double)1.5); */
double cast_finite(float x) { return (double)x; }
/*@ requires \is_NaN(x); assigns \nothing;
    ensures \is_NaN(\result); */
double known_gap_cast_nan(float x) { return (double)x; }
/*@ requires \eq_float(x,0.0f) && \sign(x)==\Negative; assigns \nothing;
    ensures \sign(\result)==\Negative; */
double known_gap_cast_minuszero(float x) { return (double)x; }
