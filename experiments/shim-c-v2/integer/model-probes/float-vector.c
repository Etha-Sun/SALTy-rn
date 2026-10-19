#include <stdint.h>
/*@ predicate same_value(float a,float b)=\eq_float(a,b)||(\is_NaN(a)&&\is_NaN(b));
    predicate same_float(float a,float b)=same_value(a,b)&&((\is_NaN(a)&&\is_NaN(b))||\sign(a)==\sign(b)); */
/*@ terminates \true; assigns \nothing; ensures same_float(x,x); */
void reflexive(float x) {}
/*@ terminates \true; assigns \nothing; ensures same_float(\result,(float)x); */
float cast32(int32_t x) { return (float)x; }
/*@ terminates \true; assigns \nothing; ensures same_float((float)x,(float)x); */
void cast32_reflexive(int32_t x) {}

#include <stddef.h>
typedef struct {int32_t lane[4];} I4;
typedef struct {float lane[4];} F4;
/*@ terminates \true; assigns \nothing;
 ensures \forall integer j;0<=j<4 ==> same_float(\result.lane[j],(float)a.lane[j]); */
F4 vector_cast(I4 a){ F4 r={0};
/*@ loop invariant 0<=i<=4;
 loop invariant \forall integer j;0<=j<i ==> same_float(r.lane[j],(float)a.lane[j]);
 loop assigns i,r.lane[0..3]; loop variant 4-i; */
for(size_t i=0;i<4;i++)r.lane[i]=(float)a.lane[i];return r;}
