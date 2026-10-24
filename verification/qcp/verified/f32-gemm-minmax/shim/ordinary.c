/* Checked ordinary helper. The kernel proves condition!=0 at every call.
 * Abort behavior outside that contract is not part of this verification. */
void qcp_assert(int condition)
/*@ Require condition != 0 && emp Ensure emp */
{ }
