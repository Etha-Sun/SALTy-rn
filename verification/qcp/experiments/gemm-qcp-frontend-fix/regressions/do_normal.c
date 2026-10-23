void test(int n)
/*@ Require 1<=n && n<=100 Ensure emp */
{
do { n--; } /*@ Inv Assert 0<=n && n<=100 */ while (n!=0);
}
