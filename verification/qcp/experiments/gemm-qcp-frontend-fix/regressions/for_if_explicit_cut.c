void test(int n)
/*@ Require 1 <= n && n <= 100 Ensure emp */
{
  do {
    int k = n;
    /*@ Inv Assert 0 <= k && k <= 100 && 1 <= n && n <= 100 */
    for (; k >= 8; k -= 8) {}
    /*@ Assert 0 <= k && k < 8 && 1 <= n && n <= 100 */
    if (k != 0) { k = 0; }
    n--;
  } /*@ Inv Assert 0 <= n && n <= 100 */ while (n != 0);
}
