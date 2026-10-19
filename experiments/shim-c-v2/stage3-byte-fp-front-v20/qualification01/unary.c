#include <stdint.h>
/*@ assigns \nothing; ensures \result==(p==\null ? 1:0); */
int pointer_not(int *p) { return !p; }
/*@ assigns \nothing; ensures \result==(\eq_float(x,0.0f) ? 1:0); */
int float_not(float x) { return !x; }
/*@ assigns \nothing; ensures \result==1; */
int negative_zero_not(void) { return !-0.0f; }
/*@ assigns \nothing; ensures \result==0; */
int wrong_negative_zero_not(void) { return !-0.0f; }
/*@ requires p==\null; assigns \nothing; ensures \result==0; */
int wrong_pointer_not(int *p) { return !p; }
/*@ assigns \nothing; ensures \result==(\eq_double(x,(double)0) ? 1:0); */
int double_not(double x) { return !x; }
/*@ assigns \nothing; ensures \result==(x==0 ? 1:0); */
int integer_not(unsigned x) { return !x; }
/*@ assigns \nothing; ensures \result==-(integer)x; */
int negate_small(int8_t x) { return -x; }
/*@ assigns \nothing; ensures \result==UINT32_MAX-x; */
uint32_t complement(uint32_t x) { return ~x; }
