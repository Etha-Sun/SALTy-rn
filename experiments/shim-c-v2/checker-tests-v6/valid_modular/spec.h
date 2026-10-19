/*@ requires -100<x<100; assigns *o; */
void test_neon(int x,int *o);
/*@ requires -100<x<100; assigns *o; */
void test_rvv(int x,int *o);
/*@ requires -100<x<100; assigns \nothing; ensures \result==1; */
int equivalent(int x);
