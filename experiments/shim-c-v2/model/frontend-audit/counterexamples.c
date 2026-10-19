/*@ assigns \nothing; ensures \sign(\result)==\Negative; */
float literal_negative_zero(void) { return -0.0f; }
/*@ assigns \nothing; ensures \sign(\result)==\Negative; */
float negate_zero(void) { float x=0.0f;return -x; }
/*@ assigns \nothing; ensures \sign(\result)==\Negative; */
float multiply_zero(void) { return 0.0f * -1.0f; }
/*@ requires \is_NaN(x); assigns \nothing; ensures \is_NaN(\result); */
double widen_nan(float x) { return x; }
/*@ requires \eq_float(x,0.0f) && \sign(x)==\Negative; assigns \nothing;
    ensures \sign(\result)==\Negative; */
double widen_minuszero(float x) { return x; }
/*@ requires \eq_double(x,(double)0.0) && \sign(x)==\Negative; assigns \nothing;
    ensures \sign(\result)==\Negative; */
float narrow_minuszero(double x) { return x; }
