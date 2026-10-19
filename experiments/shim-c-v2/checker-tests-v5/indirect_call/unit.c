#include "spec.h"
static int helper(int x) { return x+1; }
static int unused_bad(int x) { return x; }
void test_neon(int x,int *o){int (*f)(int)=helper;*o=f(x);}
void test_rvv(int x,int *o){int (*f)(int)=helper;*o=f(x);}
int equivalent(int x){int a,b;test_neon(x,&a);test_rvv(x,&b);return a==b;}
