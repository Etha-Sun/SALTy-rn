#define XNN_OOB_READS
#include "spec.h"
void test_neon(int x,int *o) XNN_OOB_READS {*o=x+1;}
void test_rvv(int x,int *o) XNN_OOB_READS {*o=x+1;}
int equivalent(int x){int a,b;test_neon(x,&a);test_rvv(x,&b);return a==b;}
