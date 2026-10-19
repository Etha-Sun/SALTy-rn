#include <stddef.h>
/*@ predicate same_value(float a,float b)=\eq_float(a,b)||(\is_NaN(a)&&\is_NaN(b)); */
/*@ requires \valid_read(a+(0..n-1)); requires \valid_read(b+(0..n-1));
 requires \forall integer j;0<=j<n ==> same_value(a[j],b[j]);
 terminates \true; assigns \nothing; ensures \result==1; */
int original(size_t n,const float*a,const float*b){
 /*@ loop invariant 0<=i<=n; loop assigns i; loop variant n-i; */
 for(size_t i=0;i<n;i++)if(!(a[i]==b[i]||(a[i]!=a[i]&&b[i]!=b[i])))return 0;
 return 1;}
/*@ requires \valid_read(a+(0..n-1)); requires \valid_read(b+(0..n-1));
 requires \forall integer j;0<=j<n ==> same_value(a[j],b[j]);
 terminates \true; assigns \nothing; ensures \result==1; */
int pointwise(size_t n,const float*a,const float*b){
 /*@ loop invariant 0<=i<=n;
 loop invariant i<n ==> same_value(a[i],b[i]);
 loop assigns i; loop variant n-i; */
 for(size_t i=0;i<n;i++)if(!(a[i]==b[i]||(a[i]!=a[i]&&b[i]!=b[i])))return 0;
 return 1;}

/*@ \wp::strategy SolveOutput: \prover("cvc5",5), \prover("z3",5);
    \wp::strategy OutputInstance:
      \tactic("Wp.instance",
        \ingoal(P_same_value(M[shift_float32(A,K)],M[shift_float32(B,K)])),
        \incontext(H:(\forall integer J; (0<=J && J<N) ==> P_same_value(M[shift_float32(A,J)],M[shift_float32(B,J)]))),
        \select(H), \param("P1",K), \children(SolveOutput)), SolveOutput;
    \wp::proof OutputInstance: pointwise;
*/
