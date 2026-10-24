int hi(void) /*@ Require emp Ensure __return == 43 && emp */ { return (("0x1.0p+112f")[6]); }
int lo(void) /*@ Require emp Ensure __return == 45 && emp */ { return (("0x1.0p-110f")[6]); }
