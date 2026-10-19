#include "spec.h"
extern int external_free(int x);
static int helper(int x) { return x+1; }
static int unused_bad(int x) { return x; }
void test_neon(int x,int *o){*o=helper(x);}
void test_rvv(int x,int *o){*o=helper(x);}
int equivalent(int x){int a,b;test_neon(x,&a);test_rvv(x,&b);return a==b;}
