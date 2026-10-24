#ifndef DWCONV_CONTROL_H
#define DWCONV_CONTROL_H
void dw_assert(int condition) /*@ Require condition!=0 && emp Ensure emp */;
#define assert(x) dw_assert((x))
#endif
