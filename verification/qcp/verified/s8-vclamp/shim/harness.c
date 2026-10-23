#include "runtime.h"
#include <inttypes.h>
#include <limits.h>
#include <stdio.h>
#include <stdlib.h>
int equivalent(size_t,const int8_t*,int8_t*,int8_t*,const struct xnn_s8_minmax_params*);
static unsigned long cases, lanes, disagreements;
static int8_t narrow(int32_t x) { unsigned y=((uint32_t)x)&255u;return (int8_t)(y<128u?(int)y:(int)y-256); }
static int oracle(int x,int lo,int hi,int bulk) {
  if(bulk) { if(x<lo)x=lo;if(x>hi)x=hi; }
  else { if(x>hi)x=hi;if(x<lo)x=lo; }
  return x;
}
static int one(size_t n,int32_t rawlo,int32_t rawhi,unsigned seed,int original) {
  const size_t frame=13;
  int8_t *allocation=malloc(n+7+frame),*saved=malloc(n+7+frame);
  int8_t *l=malloc(n+2*frame),*r=malloc(n+2*frame);
  if(!allocation||!saved||!l||!r)abort();
  int8_t *input=allocation+frame,*left=l+frame,*right=r+frame;
  memset(allocation,0x39,n+7+frame);memset(l,0x55,n+2*frame);memset(r,0x55,n+2*frame);
  for(size_t i=0;i<n+7;i++)input[i]=narrow((int32_t)(seed+37u*(unsigned)i));
  memcpy(saved,allocation,n+7+frame);
  struct xnn_s8_minmax_params params={{rawlo,rawhi}},before=params;
  int equal=equivalent(n,input,left,right,&params),expected_equal=1;
  int lo=narrow(rawlo),hi=narrow(rawhi);size_t bulk=n-n%64;
  for(size_t i=0;i<n;i++) {
    int want=oracle(input[i],lo,hi,i<bulk),rvvwant=oracle(input[i],lo,hi,original?1:i<bulk);
    if(left[i]!=want||right[i]!=rvvwant) { fprintf(stderr,"oracle mismatch n=%zu i=%zu lo=%d hi=%d got=%d/%d want=%d/%d\n",n,i,lo,hi,left[i],right[i],want,rvvwant);abort(); }
    if(want!=rvvwant)expected_equal=0;
  }
  if(equal!=expected_equal)abort();
  if(memcmp(saved,allocation,n+7+frame)||memcmp(&before,&params,sizeof params))abort();
  for(size_t i=0;i<frame;i++)if(l[i]!=0x55||r[i]!=0x55||left[n+i]!=0x55||right[n+i]!=0x55)abort();
  cases++;lanes+=n;if(!equal)disagreements++;
  free(allocation);free(saved);free(l);free(r);return equal;
}
int main(int argc,char**argv) {
  int original=argc>1&&strcmp(argv[1],"original")==0;
  int8_t minimal_input[8]={0},minimal_left[1]={0},minimal_right[1]={0};
  struct xnn_s8_minmax_params minimal_params={{1,0}};
  int minimal_relation=equivalent(1,minimal_input,minimal_left,minimal_right,&minimal_params);
  if(minimal_left[0]!=1||minimal_right[0]!=(original?0:1)||minimal_relation!=(original?0:1))abort();
  const size_t ns[]={1,2,3,4,5,6,7,8,9,15,16,17,31,32,33,63,64,65,71,72,73,127,128,129,191,192,193,255,256,257,511,512,513,1023,1024,1025};
  const int32_t ps[]={INT32_MIN,INT32_MIN+1,-65537,-65536,-257,-256,-255,-129,-128,-127,-1,0,1,126,127,128,129,255,256,257,65535,65536,INT32_MAX};
  for(size_t j=0;j<sizeof ns/sizeof *ns;j++)for(size_t a=0;a<sizeof ps/sizeof *ps;a++)for(size_t b=0;b<sizeof ps/sizeof *ps;b++)
    one(ns[j],ps[a],ps[b],(unsigned)(13*a+19*b+j),original);
  /* Exhaustive independent scalar/order check over all 2^24 byte triples. */
  unsigned long triples=0;
  for(int lo=-128;lo<128;lo++)for(int hi=-128;hi<128;hi++)for(int x=-128;x<128;x++) {
    int8x8_t a={{0}},l={{0}},h={{0}};a.s[0]=(int8_t)x;l.s[0]=(int8_t)lo;h.s[0]=(int8_t)hi;
    if(vmin_s8(vmax_s8(a,l),h).s[0]!=oracle(x,lo,hi,1)||vmax_s8(vmin_s8(a,h),l).s[0]!=oracle(x,lo,hi,0))abort();
    triples++;
  }
  /* Public comparator rejects an intentional changed output. */
  int8_t a[2]={0,1},b[2]={0,2};extern int compare_outputs(size_t,const int8_t*,const int8_t*);
  if(compare_outputs(2,a,b)!=0)abort();
  printf("{\"cases\":%lu,\"lanes_per_side\":%lu,\"disagreements\":%lu,\"exhaustive_scalar_triples\":%lu,\"wrong_result_rejected\":true,\"frames_checked\":true,\"minimal_n1_lo1_hi0_input0\":{\"neon\":%d,\"rvv\":%d,\"relation\":%d}}\n",cases,lanes,disagreements,triples,minimal_left[0],minimal_right[0],minimal_relation);
  return original?disagreements==0:disagreements!=0;
}
