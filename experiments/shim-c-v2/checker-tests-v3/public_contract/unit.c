#include "spec.h"
static int helper(int x) { return x+1; }
void test_neon(int x,int *o){*o=helper(x);}
void test_rvv(int x,int *o){*o=helper(x);}
int equivalent(int x){int a,b;test_neon(x,&a);test_rvv(x,&b);return a==b;}
