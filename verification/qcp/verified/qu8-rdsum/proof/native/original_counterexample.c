#include "isa_arrays.c"
#include "../original/testNEON.c"
#include "../original/testRVV.c"
int main(int argc,char**argv) {
  static uint8_t input[64];static uint8_t zero[64];static uint32_t left[64],right[64];struct xnn_qs8_rsum_params params={0};
  for(size_t i=0;i<64;i++)input[i]=1;
  if(argc>1 && !strcmp(argv[1],"scalar-ub")){left[0]=INT32_MAX;test_neon(1,1,input,0,zero,left,&params);puts("original_scalar_no_ubsan_rejection");return 3;}
  size_t rows=((size_t)1<<31);size_t channels=32;
  test_neon(rows,channels,input,0,zero,left,&params);test_rvv(rows,channels,input,0,zero,right,&params);
  uint32_t expected=(uint32_t)rows;int allbad=1,equal=1;
  for(size_t c=0;c<channels;c++){if((uint32_t)left[c]==expected||(uint32_t)right[c]==expected)allbad=0;if(left[c]!=right[c])equal=0;}
  printf("{\"rows\":%llu,\"channels\":%llu,\"stride\":0,\"int_r\":%d,\"expected_bits\":%llu,\"neon_bits\":%llu,\"rvv_bits\":%llu,\"both_equal_but_wrong\":%s}\n",(unsigned long long)rows,(unsigned long long)channels,(int)rows,(unsigned long long)expected,(unsigned long long)(uint32_t)left[0],(unsigned long long)(uint32_t)right[0],(allbad&&equal)?"true":"false");
  return allbad&&equal?0:2;
}
