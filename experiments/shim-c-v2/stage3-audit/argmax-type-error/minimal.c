#include <stdint.h>
typedef struct { uint32_t lane[4]; } vec;
/*@ assigns \nothing; ensures \result.lane[0]==x; ensures \result.lane[1]==x;
    ensures \result.lane[2]==x; ensures \result.lane[3]==x; */
vec broadcast(uint32_t x) {
  vec a;
  /*@ loop invariant 0<=i<=4;
      loop invariant \forall integer j; 0<=j<i ==> a.lane[j]==x;
      loop assigns i,a;
      loop variant 4-i; */
  for(int i=0;i<4;i++) a.lane[i]=x;
  return a;
}
/*@ assigns \nothing; ensures \result==x; */
uint32_t use(uint32_t x) {
  vec a=broadcast(x);
  vec b=a;
  return b.lane[0];
}
/*@ assigns \nothing; ensures \result==x; */
uint32_t direct(uint32_t x) { return x; }
/*@ assigns \nothing; ensures \result!=x; */
uint32_t wrong(uint32_t x) { return x; }
