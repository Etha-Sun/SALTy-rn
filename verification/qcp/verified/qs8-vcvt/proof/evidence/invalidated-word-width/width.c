#include "/srv/home/yuechunsun/tools/qcp-simple-kernels/verification/qcp/verified/qs8-vcvt/shim/scalar.h"
int width_probe(void)
/*@ Require emp Ensure __return==8 && emp */
{return sizeof(size_t);}
#ifdef NATIVE_PROBE
int main(void){return width_probe()==8?0:1;}
#endif
