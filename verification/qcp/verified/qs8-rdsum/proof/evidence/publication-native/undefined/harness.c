#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <limits.h>
#include "formal_api.h"
#include "/srv/home/yuechunsun/tools/qcp-simple-integration/verification/qcp/verified/qs8-rdsum/.build/publication-te3xgz_6/finite-replay/qs8-rdsum/proof/native/helper_oracles.c.inc"
static uint64_t cases, lanes;
static unsigned negative;
static void check(size_t rows,size_t channels,size_t stride,unsigned pattern,uint32_t init,unsigned alias) {
 size_t len=(rows-1)*stride+channels+96;
 int8_t *in=malloc(len),*copy=malloc(len),*z=calloc(channels+96,1);
 int32_t *left=malloc((channels+2)*sizeof(int32_t)),*right=malloc((channels+2)*sizeof(int32_t));
 uint32_t *want=malloc(channels*sizeof(uint32_t));
 if(!in||!copy||!z||!left||!right||!want)abort();
 for(size_t i=0;i<len;i++)in[i]=pattern==0?0:pattern==1?-128:pattern==2?127:(int8_t)((i*157+31)%256-128);
 const int8_t *zero=z;
 if(alias==1){memset(in,0,len);zero=in;}
 if(alias==2){memset(in,0,len);for(size_t i=0;i<8&&i<channels;i++)in[i]=(int8_t)(i+1);zero=in+64;}
 memcpy(copy,in,len);
 for(size_t c=0;c<channels;c++) {want[c]=init;for(size_t r=0;r<rows;r++)want[c]+=(uint32_t)(int32_t)in[r*stride+c];memcpy(left+c,&init,4);memcpy(right+c,&init,4);}
 left[channels]=right[channels]=1234567;left[channels+1]=right[channels+1]=-7654321;
 struct xnn_qs8_rsum_params params={42};
 const struct xnn_qs8_rsum_params *arg=pattern==1?NULL:pattern==2?(const struct xnn_qs8_rsum_params*)in:&params;
 test_neon(rows,channels,in,stride,zero,left,arg);test_rvv(rows,channels,in,stride,zero,right,arg);
 if(negative){uint32_t b=(uint32_t)left[0]^1;memcpy(left,&b,4);if(negative==2){b=(uint32_t)right[0]^1;memcpy(right,&b,4);}}
 for(size_t c=0;c<channels;c++)if((uint32_t)left[c]!=want[c]||(uint32_t)right[c]!=want[c]){if(negative)fprintf(stderr,"negative comparator=%d\n",rdsum_equal_i32(channels,left,right));fprintf(stderr,"bad rows=%zu channels=%zu stride=%zu pattern=%u alias=%u init=%u lane=%zu expected=%u left=%u right=%u\n",rows,channels,stride,pattern,alias,init,c,want[c],(uint32_t)left[c],(uint32_t)right[c]);exit(2);}
 if(!negative){for(size_t c=0;c<channels;c++){memcpy(left+c,&init,4);memcpy(right+c,&init,4);}if(equivalent(rows,channels,in,stride,zero,left,right,NULL)!=1)abort();for(size_t c=0;c<channels;c++)if((uint32_t)left[c]!=want[c]||(uint32_t)right[c]!=want[c])abort();}
 if(memcmp(copy,in,len)||params._!=42||left[channels]!=1234567||right[channels]!=1234567||left[channels+1]!=-7654321||right[channels+1]!=-7654321)abort();

 cases++;lanes+=channels;free(in);free(copy);free(z);free(left);free(right);free(want);
}
int main(int argc,char **argv){
 if(argc>1){negative=!strcmp(argv[1],"--negative-both")?2:1;check(1,1,0,2,0x7fffffffU,0);return 3;}
 helper_oracles();
 const size_t rows[]={1,2,6,7,8,251,252,253,503,504,505};
 const size_t channels[]={1,2,3,4,7,8,9,15,16,17,31,32,33,63,64,65};
 const uint32_t init[]={0,0x7fffffffU,0x80000000U,0xffffffffU};
 for(size_t a=0;a<sizeof(rows)/sizeof(*rows);a++)for(size_t b=0;b<sizeof(channels)/sizeof(*channels);b++)for(unsigned s=0;s<4;s++)for(unsigned p=0;p<4;p++)for(unsigned t=0;t<4;t++)check(rows[a],channels[b],s==0?0:s==1?1:s==2?channels[b]:channels[b]+15,p,init[t],0);
 for(size_t a=0;a<sizeof(rows)/sizeof(*rows);a++)for(size_t b=0;b<sizeof(channels)/sizeof(*channels);b++){check(rows[a],channels[b],0,0,0xffffffffU,1);check(rows[a],channels[b],0,0,0x7fffffffU,2);}
 for(size_t b=0;b<sizeof(channels)/sizeof(*channels);b++){check(1,channels[b],SIZE_MAX,3,0x7fffffffU,0);check(1,channels[b],SIZE_MAX,0,0xffffffffU,1);check(1,channels[b],SIZE_MAX,0,0x80000000U,2);}
 printf("{\"cases\":%llu,\"lanes_per_side\":%llu,\"failures\":0,\"scope\":\"finite actual scalar-field helper+kernel+public wrapper oracle\"}\n",(unsigned long long)cases,(unsigned long long)lanes);return 0;
}
