struct V { unsigned short s[64]; };
void probe(void)
/*@ Require emp Ensure emp */
{ struct V v; }
