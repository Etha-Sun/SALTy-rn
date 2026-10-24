#define SIGN(x) ((#x)[6])
int hi(void) /*@ Require emp Ensure __return == 43 && emp */ { return SIGN(0x1.0p+112f); }
int lo(void) /*@ Require emp Ensure __return == 45 && emp */ { return SIGN(0x1.0p-110f); }
