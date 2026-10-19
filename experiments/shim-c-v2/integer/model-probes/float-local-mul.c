/*@ logic float fp_mul32(float a,float b);
 predicate same_value(float a,float b)=\eq_float(a,b)||(\is_NaN(a)&&\is_NaN(b));
 predicate same_float(float a,float b)=same_value(a,b)&&((\is_NaN(a)&&\is_NaN(b))||\sign(a)==\sign(b)); */
/*@ requires same_float(b,s);
 requires same_value(out,fp_mul32(a,b));
 terminates \true; assigns \nothing;
 ensures \forall float c; same_float(a,c) ==> same_value(out,fp_mul32(c,s)); */
void proof_mul_replace(float out,float a,float b,float s) {}
/*@ requires same_float(s,r);
 terminates \true; assigns \nothing;
 ensures \forall float c; same_value(out,fp_mul32(c,s)) ==> same_value(out,fp_mul32(c,r)); */
void proof_mul_scale_replace(float out,float s,float r) {}
/*@ terminates \true; assigns \nothing; ensures \false; */
void control_false(void) {}
