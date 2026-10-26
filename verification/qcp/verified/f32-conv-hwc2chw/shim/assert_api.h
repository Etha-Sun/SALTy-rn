#ifndef HWC_ASSERT_API_H
#define HWC_ASSERT_API_H
void hc_assert(int c)
/*@ Require c!=0 && emp Ensure emp */;
#define assert(c) hc_assert(c)
#endif
