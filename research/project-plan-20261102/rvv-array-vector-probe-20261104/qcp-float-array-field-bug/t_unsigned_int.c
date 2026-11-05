struct V { unsigned int s[64]; };
void probe(void)
/*@ Require emp Ensure emp */
{ struct V v; }
