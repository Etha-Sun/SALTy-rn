#include "isa_arrays.h"
#include <stdio.h>
#include <stdlib.h>
#include <inttypes.h>
#define XT_ARGS const uint32_t*input,uint32_t*output,size_t input_stride,size_t output_stride,size_t block_width,size_t block_height
void test_neon(XT_ARGS);void test_rvv(XT_ARGS);
void original_neon(XT_ARGS);void original_rvv(XT_ARGS);
unsigned xt_vl_mode,xt_tail_mode;
static uint64_t cases,words,empty_calls;
static uint32_t random_state=0x7354a216u;
static uint32_t random_word(void){random_state^=random_state<<13;random_state^=random_state>>17;random_state^=random_state<<5;return random_state;}
_Static_assert(sizeof(size_t)==8&&sizeof(uintptr_t)==8&&sizeof(uint32_t)==4,"native64/32 widths");
static int one_strides(size_t height,size_t width,size_t istride,size_t ostride,unsigned mode,unsigned tail,int wrong){
 size_t cols=width?width:1;
 size_t ilen=(height-1)*istride+cols+1,olen=(cols-1)*ostride+height;
 uint32_t*input=malloc(ilen*4),*saved=malloc(ilen*4),*left=malloc((olen+8)*4),*right=malloc((olen+8)*4),*oracle=malloc((olen+8)*4);
 assert(input&&saved&&left&&right&&oracle);
 for(size_t i=0;i<ilen;i++)input[i]=random_word();memcpy(saved,input,ilen*4);
 for(size_t i=0;i<olen+8;i++)left[i]=right[i]=oracle[i]=0x95ab271eu;
 for(size_t r=0;r<height;r++)for(size_t c=0;c<cols;c++)oracle[4+c*ostride+r]=input[r*istride+c];
 xt_vl_mode=mode;xt_tail_mode=tail;
 test_neon(input,left+4,istride*4,ostride*4,width,height);
 test_rvv(input,right+4,istride*4,ostride*4,width,height);
 if(wrong){left[4]^=1u;if(wrong==2)right[4]=left[4];}
 int agree=memcmp(left,right,(olen+8)*4)==0;
 int good=memcmp(left,oracle,(olen+8)*4)==0&&memcmp(right,oracle,(olen+8)*4)==0;
 int unchanged=memcmp(input,saved,ilen*4)==0;
 free(input);free(saved);free(left);free(right);free(oracle);
 if(wrong){printf("negative compare=%d independent_oracle_rejected=%d\n",agree,!good);return !good&&unchanged?2:1;}
 if(!good||!unchanged){fprintf(stderr,"mismatch H=%zu W=%zu istride_words=%zu ostride_words=%zu mode=%u tail=%u\n",height,width,istride,ostride,mode,tail);return 1;}
 cases++;words+=height*cols;return 0;
}
static int one(size_t height,size_t width,size_t igap,size_t ogap,unsigned mode,unsigned tail,int wrong){
 return one_strides(height,width,(width?width:1)+igap,height+ogap,mode,tail,wrong);
}
static int original_zero_width(void){
 const uint32_t input[2]={0xa1234567u,0x04abcdefu};uint32_t a=0x55ab21deu,b=a;
 original_neon(input,&a,8,4,0,1);original_rvv(input,&b,8,4,0,1);
 printf("{\"width\":0,\"height\":1,\"input0\":%"PRIu32",\"neon\":%"PRIu32",\"rvv\":%"PRIu32",\"counterexample\":%s}\n",input[0],a,b,a!=b?"true":"false");
 return a==input[0]&&b==0x55ab21deu?0:1;
}
int main(int argc,char**argv){
 if(argc>1&&strcmp(argv[1],"--original-zero-width")==0)return original_zero_width();
 if(argc>1&&strcmp(argv[1],"--wrong-one")==0)return one(3,35,3,5,1,1,1);
 if(argc>1&&strcmp(argv[1],"--wrong-both")==0)return one(3,35,3,5,1,1,2);
 const size_t widths[]={0,1,2,3,4,5,7,8,15,16,17,31,32,33,47,63,64,65};
 for(size_t h=1;h<=9;h++)for(size_t n=0;n<sizeof(widths)/sizeof(widths[0]);n++)for(size_t a=0;a<3;a++)for(size_t b=0;b<3;b++)for(unsigned m=0;m<3;m++)for(unsigned t=0;t<2;t++)if(one(h,widths[n],a,b,m,t,0))return 1;
 for(size_t h=1;h<=9;h++)for(size_t w=0;w<=1;w++)for(unsigned m=0;m<3;m++)for(unsigned t=0;t<2;t++)if((w==0||h==1)&&one_strides(h,w,0,w?0:h,m,t,0))return 1;
 for(size_t w=0;w<=65;w++){
  test_neon(NULL,NULL,w*4,0,w,0);test_rvv(NULL,NULL,w*4,0,w,0);empty_calls++;
 }
 test_neon(NULL,NULL,0,0,(size_t)1<<62,0);test_rvv(NULL,NULL,0,0,(size_t)1<<62,0);empty_calls++;
 printf("{\"passed\":true,\"cases\":%"PRIu64",\"written_words_per_side\":%"PRIu64",\"empty_height_calls_per_side\":%"PRIu64",\"VL_modes\":3,\"tail_modes\":2}\n",cases,words,empty_calls);
 return 0;
}
