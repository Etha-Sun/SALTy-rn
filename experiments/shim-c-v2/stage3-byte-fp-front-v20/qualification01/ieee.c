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

/*@ assigns \nothing; ensures \sign(\result)==\Positive; */
float wrong_literal_sign(void) { return -0.0f; }
/*@ requires \is_NaN(x); assigns \nothing; ensures !\is_NaN(\result); */
double wrong_nan_cast(float x) { return x; }
/*@ requires \is_NaN(x); assigns \nothing; ensures \is_NaN((double)x); */
void logic_cast_nan(float x) {}
/*@ requires \is_NaN(x); assigns \nothing; ensures \is_NaN(\result); */
float narrow_nan(double x) { return x; }
/*@ requires \is_plus_infinity(x); assigns \nothing; ensures \is_plus_infinity(\result); */
double widen_infinity(float x) { return x; }
/*@ requires \is_minus_infinity(x); assigns \nothing; ensures \is_minus_infinity(\result); */
float narrow_infinity(double x) { return x; }
/*@ assigns \nothing; ensures \false; */
void impossible(void) {}
