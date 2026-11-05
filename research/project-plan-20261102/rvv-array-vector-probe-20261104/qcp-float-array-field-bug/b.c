/*@ Extern Coq (FloatArray::full : Z -> Z -> list Z -> Assertion) */
struct V { float s[64]; };
void probe(void)
/*@ Require emp Ensure emp */
{ struct V v; }
