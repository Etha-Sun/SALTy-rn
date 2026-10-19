/* Independent model controls, not kernel specifications. */
#include <stdint.h>
#include <stddef.h>
/*@ predicate same32(float x,float y)=\eq_float(x,y)||(\is_NaN(x)&&\is_NaN(y)); */
/*@ assigns \nothing; ensures same32(\result,choose?x:y); */
float positive_branch(int choose,float x,float y) {float a;if(choose)a=x;else a=y;return a;}
/*@ requires \valid(p); assigns *p; ensures same32(*p,x); */
void positive_store(float *p,float x) {*p=x;}
/*@ requires \valid(p+(0..1)); assigns p[0]; ensures same32(p[1],\old(p[1])); */
void positive_adjacent_frame(float *p,float x) {p[0]=x;}
/* No separation required: either alias or disjoint is legal. */
/*@ requires \valid(p)&&\valid(q); assigns *p,*q; ensures same32(*q,y); */
void positive_alias(float *p,float *q,float x,float y) {*p=x;*q=y;}
/* Deliberately false if p and q alias with different finite x/y. */
/*@ requires \valid(p)&&\valid(q); assigns *p,*q; ensures same32(*p,x); */
void negative_alias(float *p,float *q,float x,float y) {*p=x;*q=y;}
/*@ requires \valid(p+(0..3)); assigns p[0..3]; ensures \forall integer j;0<=j<4 ==> same32(p[j],x); */
void positive_loop(float *p,float x) {
 /*@ loop invariant 0<=i<=4;
     loop invariant \forall integer j;0<=j<i ==> same32(p[j],x);
     loop assigns i,p[0..3]; loop variant 4-i; */
 for(size_t i=0;i<4;i++)p[i]=x;
}
/* Arbitrary IEEE input includes infinities and NaNs. */
/*@ assigns \nothing; ensures \is_finite(\result); */
float negative_finite(float x) {float y=x;return y;}
/*@ assigns \nothing; ensures \false; */
void negative_false(void) {}
