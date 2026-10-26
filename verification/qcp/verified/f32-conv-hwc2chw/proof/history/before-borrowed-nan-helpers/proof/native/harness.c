#include "runtime.h"
#include "extra.h"
#include <stdlib.h>
#include <stdio.h>
#include <inttypes.h>
#include <fenv.h>
#undef round_down_po2
#define round_down_po2(n,q) hc_round_down4(n)
#define doz hc_doz
#include "../../shim/support.c"
#include "../../shim/copy_float.c"
#include "../../impl/testNEON.c"
#ifdef HWC_ORIGINAL_RVV
#include "../original/testRVV.c"
#else
#include "../../impl/testRVV.c"
#endif
static uint32_t raw(float x){uint32_t u;memcpy(&u,&x,4);return u;}
static float bits(uint32_t u){float x;memcpy(&x,&u,4);return x;}
static int observed(float a,float b){return a==b || (isnan(a)&&isnan(b));}
static float fixture(size_t i,unsigned p){
 static const uint32_t special[]={0,0x80000000u,0x3f800000u,0xbf800000u,0x7f800000u,0xff800000u,0x7fc12345u,0xffc23456u,0x7f812345u,1,0x80000001u,0x7f7fffffu,0x00800000u,0x3f000000u};
 if(p==0)return (float)((int)((i*13+3)%17)-8)*0.25f;
 if(p==1)return (i%19==0)?bits(special[(i/19)%14]):(float)((int)((i*7)%11)-5);
 return bits(special[(i*7+p*5)%14]);
}
/* Independent scalar source-order oracle. The caller supplies the actual
   given zero row (not necessarily mathematical zero). Missing horizontal
   left pixels still evaluate +0 * weight; missing odd right taps skip FMA.
   Every physical store, including clipped row/channel aliases, is retained. */
static float pixel(const float *in,const float *zr,const float*w,size_t H,size_t W,size_t top,size_t y,size_t x,size_t block,size_t lane,float lo,float hi){
 float acc=w[block*112+lane];
 for(int dx=0;dx<3;dx++)for(int ci=0;ci<3;ci++)for(int ky=0;ky<3;ky++){
  int64_t col=(int64_t)(2*x)+(int64_t)dx-1;
  if(col>=(int64_t)W)continue;
  float val=0.0f;
  if(col>=0){int64_t row=(int64_t)(2*y)-(int64_t)top+ky;const float*r=(row<0||row>=(int64_t)H)?zr:in+(size_t)row*W*3;val=r[(size_t)col*3+(size_t)ci];}
  float k=w[block*112+4+(size_t)(dx*9+ci*3+ky)*4+lane];acc=fmaf(k,val,acc);
 }
 /* Propagating clamp, independently stated rather than runtime min helpers. */
 if(isnan(acc)||isnan(lo))acc=bits(0x7fc00000u);else if(acc<lo)acc=lo;else if(acc==0.0f&&lo==0.0f)acc=(signbit(acc)&&signbit(lo))?-0.0f:0.0f;
 if(isnan(acc)||isnan(hi))acc=bits(0x7fc00000u);else if(acc>hi)acc=hi;else if(acc==0.0f&&hi==0.0f)acc=(signbit(acc)||signbit(hi))?-0.0f:0.0f;
 return acc;
}
static void oracle(const float*in,const float*zr,const float*w,float*out,unsigned char*written,size_t H,size_t W,size_t top,size_t start,size_t end,size_t C,size_t hs,size_t cs,float lo,float hi){
 size_t ow=(W+1)/2;
 for(size_t y=start;y<end;y+=2)for(size_t b=0;b<(C+3)/4;b++)for(size_t x=0;x<ow;x+=2){size_t n=ow-x<2?ow-x:2;size_t rem=C-b*4;
  for(int rr=1;rr>=0;rr--)for(size_t lane=0;lane<4;lane++)for(size_t j=0;j<n;j++){
   size_t ch=b*4+(lane<rem?lane:rem-1);size_t yy=(rr&&y+1<end)?y+1:y;size_t idx=ch*cs+yy*hs+x+j;
   out[idx]=pixel(in,zr,w,H,W,top,y+(size_t)rr,x+j,b,lane,lo,hi);written[idx]=1;
  }
 }
}
static uint64_t cases,lanes,alias_cases,frame_cells;
static int run_case(size_t H,size_t W,size_t top,size_t start,size_t end,size_t C,unsigned p,unsigned alias,unsigned policy){
 size_t ow=(W+1)/2,oh=(H+top)/2,hs=ow+(p%3),cs=(oh+2)*hs+3+(p%2),outn=(C+4)*cs+4*hs+32;
 size_t ro_n=H*W*3+((C+3)/4)*112+W*3+256;
 float *ro=malloc(ro_n*4),*snapshot=malloc(ro_n*4),*left=malloc(outn*4),*right=malloc(outn*4),*gold=malloc(outn*4);unsigned char*written=calloc(outn,1);
 if(!ro||!snapshot||!left||!right||!gold||!written)abort();
 for(size_t i=0;i<ro_n;i++)ro[i]=fixture(i,p);
 const float *in=ro+32,*w=ro+32+H*W*3+16,*zr=w+((C+3)/4)*112+16;
 if(alias==1)zr=in;
 if(alias==2)w=in+3;
 if(alias==3){zr=in+1;w=in;}
 struct xnn_f32_minmax_params param={{p==0?-5.0f:p==1?2.0f:fixture(p*3+1,2),p==0?5.0f:p==1?-2.0f:fixture(p*7+3,2)}};
 const struct xnn_f32_minmax_params *params=&param;
 if(alias==4)params=(const struct xnn_f32_minmax_params*)(const void*)(in+2);
 memcpy(snapshot,ro,ro_n*4);
 for(size_t i=0;i<outn;i++)left[i]=right[i]=gold[i]=fixture(i+173,0);
 oracle(in,zr,w,gold,written,H,W,top,start,end,C,hs,cs,params->scalar.min,params->scalar.max);
 hc_native_vl_policy=policy;hc_native_vl_tick=0;
 test_neon(H,W,start,end,in,zr,w,left,top,C,hs*4,cs*4,params);
 test_rvv(H,W,start,end,in,zr,w,right,top,C,hs*4,cs*4,params);
 const char *neg=getenv("HWC_NEGATIVE");if(neg){size_t k=0;while(k<outn&&!written[k])k++;if(k==outn)abort();left[k]=isnan(gold[k])?0.0f:gold[k]+1.0f;if(observed(left[k],gold[k]))left[k]=bits(raw(gold[k])^0x00800000u);if(atoi(neg)==2)right[k]=left[k];}
 int bad=memcmp(ro,snapshot,ro_n*4)!=0;
 for(size_t i=0;i<outn&&!bad;i++){
  int ok=written[i]?(observed(left[i],right[i])&&observed(left[i],gold[i])&&observed(right[i],gold[i])):(raw(left[i])==raw(gold[i])&&raw(right[i])==raw(gold[i]));
  if(!ok){fprintf(stderr,"mismatch H=%zu W=%zu top=%zu start=%zu end=%zu C=%zu p=%u alias=%u policy=%u cell=%zu written=%u N=%08x R=%08x O=%08x\n",H,W,top,start,end,C,p,alias,policy,i,written[i],raw(left[i]),raw(right[i]),raw(gold[i]));bad=1;}
  if(written[i])lanes++;else frame_cells++;
 }
 cases++;if(alias)alias_cases++;
 free(ro);free(snapshot);free(left);free(right);free(gold);free(written);return bad;
}
int main(void){
 if(fesetround(FE_TONEAREST))return 3;
 const char *quick=getenv("HWC_QUICK");unsigned patterns=quick?2:8;size_t hmax=quick?4:8,wmax=quick?7:13,cmax=quick?5:9;
 for(size_t H=1;H<=hmax;H++)for(size_t W=1;W<=wmax;W++)for(size_t top=0;top<=1;top++){
  size_t end=(H+top)/2;if(!end)continue;
  for(size_t C=1;C<=cmax;C++)for(unsigned p=0;p<patterns;p++)for(unsigned alias=0;alias<5;alias++)for(unsigned policy=0;policy<3;policy++){
   size_t start=(p&1)&&end>1?1:0;size_t stop=(p&2)&&end>start+1?end-1:end;
   if(run_case(H,W,top,start,stop,C,p,alias,policy))return 2;
  }
 }
 printf("{\"cases\":%" PRIu64 ",\"lanes_per_side\":%" PRIu64 ",\"RO_alias_cases\":%" PRIu64 ",\"unwritten_frame_cells\":%" PRIu64 ",\"failures\":0}\n",cases,lanes,alias_cases,frame_cells);return 0;
}
