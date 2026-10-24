#include "program_model.h"
int rdsum_equal_i32(size_t n,const int32_t *left,const int32_t *right)
/*@ With (L:list Z)
 Require 0<=n && n<=4611686018427387903 && IntArray::full(left,n,L) * IntArray::full(right,n,L)
 Ensure __return==1 && IntArray::full(left,n,L) * IntArray::full(right,n,L) */
{
 size_t i=0;
 /*@ Inv Assert n==n@pre && left==left@pre && right==right@pre && 0<=i && i<=n && n<=4611686018427387903 && IntArray::full(left,n,L) * IntArray::full(right,n,L) */
 while(i<n){
  int32_t a=rdsum_get_i32(left,i) /*@ where base=left,count=n,idx=0,L=L */;
  int32_t b=rdsum_get_i32(right,i) /*@ where base=right,count=n,idx=0,L=L */;
  if(a!=b)return 0;
  i++;
 }
 return 1;
}
