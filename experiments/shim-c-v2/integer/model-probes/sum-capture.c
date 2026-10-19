#include <stdint.h>
#include <stddef.h>
/*@ requires 0<n<100;
 requires \valid_read(p+(0..n-1));
 requires -2147483648<=\sum(0,n-1,\lambda integer j;(integer)p[j])<=2147483647;
 terminates \true; assigns \nothing;
 ensures \result==2; */
int probe_public_sum(size_t n,const int8_t *p) {return 1;}
/*@ logic integer row_sum{L}(int8_t *p,integer n)=\sum(0,n-1,\lambda integer j;(integer)p[j]); */
/*@ requires 0<n<100;
 requires \valid_read(p+(0..n-1));
 requires -2147483648<=row_sum(p,n)<=2147483647;
 terminates \true; assigns \nothing;
 ensures \result==2; */
int probe_logic_sum(size_t n,const int8_t *p) {return 1;}
/*@ logic integer row_rec{L}(int8_t *p,integer n)=n<=0?0:row_rec(p,n-1)+p[n-1]; */
/*@ requires 0<n<100;
 requires \valid_read(p+(0..n-1));
 requires -2147483648<=row_rec(p,n)<=2147483647;
 terminates \true; assigns \nothing;
 ensures \result==2; */
int probe_logic_rec(size_t n,const int8_t *p) {return 1;}
