struct V { signed char s[64]; };
void probe(void)
/*@ Require emp Ensure emp */
{ struct V v; }
