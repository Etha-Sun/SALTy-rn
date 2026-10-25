#include "isa_arrays.h"
#include <stdio.h>
#include <stdlib.h>
#include <inttypes.h>
#define PW_ARGS size_t g,size_t nc,size_t kc,size_t nr,size_t kr,size_t sr,const uint32_t*weights,const uint32_t*bias,const void*scale,uint32_t*packed_weights,size_t extra_bytes,const void*params
void test_neon(PW_ARGS);void test_rvv(PW_ARGS);
void original_neon(PW_ARGS);void original_rvv(PW_ARGS);
_Static_assert(sizeof(size_t)==8&&sizeof(uintptr_t)==8&&sizeof(uint32_t)==4,"nativeLP64 rawUInt32");
unsigned pw_vl_mode,pw_tail_mode;
static uint32_t rng=0x73519e23U;
static uint64_t cases,observed_bytes,aliased_bias_cases;
static uint32_t next_word(void){rng^=rng<<13;rng^=rng>>17;rng^=rng<<5;return rng;}
/* Migrated indexed oracle; independent of SIMD loops and tuple constructors. */
static void reference(size_t groups,size_t nc,size_t kc,const uint32_t*w,const uint32_t*bias,unsigned char*out,size_t gap){
 size_t blocks=(nc+1)/2,stride=8*(kc+1)+gap;
 for(size_t group=0;group<groups;group++)for(size_t col=0;col<nc;col++){
  size_t tile=group*blocks+col/2;uint32_t b=bias?bias[group*nc+col]:0;
  memcpy(out+tile*stride+4*(col%2),&b,4);
  for(size_t k=0;k<kc;k++)memcpy(out+tile*stride+8+8*k+4*(col%2),w+(group*nc+col)*kc+k,4);
 }
 if(!bias&&nc%2)for(size_t group=0;group<groups;group++){uint32_t z=0;memcpy(out+(group*blocks+nc/2)*stride+4,&z,4);}
}
static int one(size_t g,size_t nc,size_t kc,size_t gap,int has_bias,unsigned mode,unsigned tail,int wrong){
 size_t nw=g*nc*kc,nb=g*nc,bytes=g*((nc+1)/2)*(8*(kc+1)+gap);
 uint32_t*w=malloc(nw*4),*b=malloc(nb*4),*wold=malloc(nw*4),*bold=malloc(nb*4);
 unsigned char*left=malloc(bytes+32),*right=malloc(bytes+32),*ref=malloc(bytes+32),*old=malloc(bytes+32),*original_left=malloc(bytes+32),*original_right=malloc(bytes+32);
 assert(w&&b&&wold&&bold&&left&&right&&ref&&old&&original_left&&original_right);
 for(size_t i=0;i<nw;i++)w[i]=next_word();
 for(size_t i=0;i<nb;i++)b[i]=next_word();
 for(size_t i=0;i<bytes+32;i++)old[i]=(unsigned char)next_word();
 memcpy(wold,w,nw*4);memcpy(bold,b,nb*4);memcpy(left,old,bytes+32);memcpy(right,old,bytes+32);memcpy(ref,old,bytes+32);memcpy(original_left,old,bytes+32);memcpy(original_right,old,bytes+32);
 const uint32_t*bp=has_bias==2?w+(nw-nb)/2:(has_bias?b:NULL);
 pw_vl_mode=mode;pw_tail_mode=tail;
 test_neon(g,nc,kc,2,1,1,w,bp,NULL,(uint32_t*)(left+16),gap,NULL);
 test_rvv(g,nc,kc,2,1,1,w,bp,NULL,(uint32_t*)(right+16),gap,NULL);
 original_neon(g,nc,kc,2,1,1,w,bp,NULL,(uint32_t*)(original_left+16),gap,NULL);
 original_rvv(g,nc,kc,2,1,1,w,bp,NULL,(uint32_t*)(original_right+16),gap,NULL);
 reference(g,nc,kc,w,bp,ref+16,gap);
 if(wrong){left[16]^=1;if(wrong==2)right[16]=left[16];}
 int same=!memcmp(left,right,bytes+32),good=!memcmp(left,ref,bytes+32)&&!memcmp(right,ref,bytes+32);
 int original_good=!memcmp(original_left,ref,bytes+32)&&!memcmp(original_right,ref,bytes+32);
 int unchanged=!memcmp(w,wold,nw*4)&&!memcmp(b,bold,nb*4);
 free(w);free(b);free(wold);free(bold);free(left);free(right);free(ref);free(old);free(original_left);free(original_right);
 if(wrong){printf("negative compare=%d independent_oracle_rejected=%d\n",same,!good);return !good&&unchanged&&original_good?2:1;}
 if(!good||!unchanged||!original_good){fprintf(stderr,"mismatch g=%zu nc=%zu kc=%zu gap=%zu bias=%d mode=%u tail=%u\n",g,nc,kc,gap,has_bias,mode,tail);return 1;}
 cases++;observed_bytes+=bytes;if(has_bias==2)aliased_bias_cases++;return 0;
}
int main(int argc,char**argv){
 if(argc>1&&strcmp(argv[1],"--wrong-one")==0)return one(3,3,35,12,1,1,1,1);
 if(argc>1&&strcmp(argv[1],"--wrong-both")==0)return one(3,3,35,12,1,1,1,2);
 const size_t groups[]={1,2,3,5},cols[]={1,2,3,4,5,7,8,9,15,16,17},depths[]={1,2,3,4,7,8,15,16,17,31,32,33,65},gaps[]={0,4,12,64};
 for(size_t i=0;i<4;i++)for(size_t j=0;j<11;j++)for(size_t k=0;k<13;k++)for(size_t d=0;d<4;d++)for(int b=0;b<3;b++)for(unsigned m=0;m<3;m++)for(unsigned t=0;t<2;t++)if(one(groups[i],cols[j],depths[k],gaps[d],b,m,t,0))return 1;
 printf("{\"passed\":true,\"cases\":%"PRIu64",\"observed_output_bytes_per_side\":%"PRIu64",\"aliased_bias_cases\":%"PRIu64",\"VL_modes\":3,\"tail_modes\":2,\"all_old_holes_gaps_and_guards\":true,\"inputs_preserved\":true,\"actual_kernels_called\":4,\"original_and_compatible_outputs_checked\":true}\n",cases,observed_bytes,aliased_bias_cases);
 return 0;
}
