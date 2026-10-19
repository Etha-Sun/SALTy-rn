#include <stdint.h>
/*@ predicate same_value(float a,float b)=\eq_float(a,b)||(\is_NaN(a)&&\is_NaN(b));
    predicate same_float(float a,float b)=same_value(a,b)&&((\is_NaN(a)&&\is_NaN(b))||\sign(a)==\sign(b)); */
/*@ terminates \true; assigns \nothing; ensures same_float(x,x); */
void reflexive(float x) {}
/*@ terminates \true; assigns \nothing; ensures same_float(\result,(float)x); */
float cast32(int32_t x) { return (float)x; }
/*@ terminates \true; assigns \nothing; ensures same_float((float)x,(float)x); */
void cast32_reflexive(int32_t x) {}
