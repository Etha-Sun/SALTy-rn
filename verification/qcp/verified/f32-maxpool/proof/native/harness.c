#include "isa_arrays.h"
#include "../../shim/propagate.h"
#include "../../shim/compare.h"
#include <stdio.h>
#include <stdlib.h>
#include <inttypes.h>
unsigned mp_schedule=0;
uint32_t mp_tail_poison=0xdeadbeef;
#define DECL(name) void name(size_t,size_t,size_t,const float**,size_t,size_t,float*,size_t,size_t,const struct xnn_f32_minmax_params*)
DECL(test_neon);DECL(test_rvv);DECL(original_neon);DECL(original_rvv);DECL(linear_rvv);
int compare_maxpool_written(size_t,size_t,size_t,const float**,size_t,size_t,float*,size_t,size_t,const struct xnn_f32_minmax_params*,float*);
static uint64_t rng=UINT64_C(0x92fe437b6a097b3d);
static uint32_t rnd(void){rng^=rng<<13;rng^=rng>>7;rng^=rng<<17;return(uint32_t)(rng>>11);}
/* Independent oracle: exponent/fraction classification and host comparisons only
   for non-NaNs. It does not call the runtime's ordered/min/max/NaN helpers. */
static uint32_t oracle_extreme(uint32_t x,uint32_t y,int ismin){
 unsigned ex=(x>>23)&255,ey=(y>>23)&255;
 uint32_t fx=x&0x7fffff,fy=y&0x7fffff;
 int nx=ex==255&&fx!=0,ny=ey==255&&fy!=0;
 int sx=nx&&(fx&0x400000)==0,sy=ny&&(fy&0x400000)==0;
 if(sx)return x|0x400000;if(sy)return y|0x400000;
 if(nx)return x;if(ny)return y;
 if((x<<1)==0&&(y<<1)==0)return ismin?(x|y):(x&y);
 float a,b;memcpy(&a,&x,4);memcpy(&b,&y,4);
 return ismin?(a<b?x:y):(a>b?x:y);
}
static uint32_t oracle_tree(const uint32_t *v){
 uint32_t a=oracle_extreme(v[0],v[1],0);
 uint32_t b=oracle_extreme(a,v[8],0);
 uint32_t c=oracle_extreme(v[2],v[3],0);
 uint32_t d=oracle_extreme(v[4],v[5],0);
 uint32_t e=oracle_extreme(v[6],v[7],0);
 return oracle_extreme(oracle_extreme(c,d,0),oracle_extreme(b,e,0),0);
}
static uint32_t readword(const float*p){uint32_t v;memcpy(&v,p,4);return v;}
static void oracle(size_t pixels,size_t k,size_t c,const float**table,size_t off,size_t stride,float*out,size_t ti,size_t oi,uint32_t lo,uint32_t hi){
 for(size_t p=0;p<pixels;p++){
  const float**base=(const float**)((uintptr_t)table+p*ti);
  float*o=(float*)((uintptr_t)out+p*oi);
  size_t offset=off+p*stride;
  for(size_t j=0;j<c;j++){
   uint32_t v[9];
   for(size_t t=0;t<9;t++){size_t ix=t<k?t:0;v[t]=readword((const float*)((uintptr_t)base[ix]+offset)+j);}
   uint32_t z=oracle_extreme(oracle_extreme(oracle_tree(v),lo,0),hi,1);
   size_t done=9;
   while(done<k){size_t remain=k-done;for(size_t t=0;t<9;t++){size_t ix=done+(t<remain?t:0);v[t]=readword((const float*)((uintptr_t)base[ix]+offset)+j);}z=oracle_extreme(oracle_extreme(z,oracle_tree(v),0),hi,1);done+=remain>9?9:remain;}
   memcpy(o+j,&z,4);
  }
 }
}
static const uint32_t edge[]={0,0x80000000,1,0x80000001,0x007fffff,0x807fffff,0x00800000,0x80800000,0x3f800000,0xbf800000,0x7f7fffff,0xff7fffff,0x7f800000,0xff800000,0x7fc00000,0xffc00000,0x7fc12345,0xffc23456,0x7f800001,0xff800001,0x7fa22222,0xffb33333};
static unsigned long long helper_pairs,full_cases,observed_lanes,caller_cases;
static void test_helpers(void){
 for(unsigned t=0;t<30000;t++){
  uint32_t a=t<484?edge[t/22]:rnd(),b=t<484?edge[t%22]:rnd();
  size_t vl=t%32+1;vfloat32m8_t va,vb;
  for(unsigned j=0;j<32;j++){va.lane[j]=a;vb.lane[j]=b;}
  vfloat32m8_t x=mp_max_vv(va,vb,vl),y=mp_min_vv(va,vb,vl);
  for(size_t j=0;j<vl;j++)if(x.lane[j]!=oracle_extreme(a,b,0)||y.lane[j]!=oracle_extreme(a,b,1)){fprintf(stderr,"helper mismatch %08x %08x\n",a,b);exit(2);}
  float wa[4],wb[4];for(unsigned j=0;j<4;j++){uint32_t u=j?a^mp_tail_poison:a,v=j?b^mp_tail_poison:b;memcpy(wa+j,&u,4);memcpy(wb+j,&v,4);}
  if(mp_output_bits_at(wa)!=a||mp_output_bits_at(wb)!=b||mp_same_output_at(wa,wb)!=(a==b)){fprintf(stderr,"actual bit observer mismatch\n");exit(6);}
  helper_pairs++;
 }
}
static void regression(size_t pixels,size_t k,size_t c,unsigned serial){
 size_t nk=k?k:1,tablecount=pixels*nk, rowcount=tablecount+3;
 size_t rowwords=c+3+pixels+4,outwords=pixels*(c+8)+8;
 float*rows=malloc(rowcount*rowwords*4);float*before=malloc(rowcount*rowwords*4);
 const float**table=malloc(tablecount*sizeof(float*));const float**saved=malloc(tablecount*sizeof(float*));
 float*a=malloc(outwords*4),*b=malloc(outwords*4),*want=malloc(outwords*4);
 if(!rows||!before||!table||!saved||!a||!b||!want)abort();
 for(size_t i=0;i<rowcount*rowwords;i++){uint32_t u=(i+serial)%3?edge[rnd()%22]:rnd();memcpy(rows+i,&u,4);}
 for(size_t i=0;i<tablecount;i++)table[i]=rows+(serial%3==0?i%3:((i*7+serial)%rowcount))*rowwords;
 memcpy(before,rows,rowcount*rowwords*4);memcpy(saved,table,tablecount*sizeof(float*));
 size_t offset=(serial%3)*4,stride=(serial%2)*4;
 size_t oi=(serial%13==0?0:serial%13==1?c-1:c+3)*4;
 uint32_t lo=serial%5?edge[rnd()%22]:rnd(),hi=serial%7?edge[rnd()%22]:rnd();
 struct xnn_f32_minmax_params params;memcpy(&params.scalar.min,&lo,4);memcpy(&params.scalar.max,&hi,4);
 for(unsigned sched=0;sched<4;sched++){
  mp_schedule=(unsigned[]){0,1,2,7}[sched];mp_tail_poison=rnd();
  for(size_t i=0;i<outwords;i++){uint32_t u=UINT32_C(0xa563c719)^(uint32_t)i;memcpy(a+i,&u,4);memcpy(b+i,&u,4);memcpy(want+i,&u,4);}
  oracle(pixels,k,c,table,offset,stride,want,nk*sizeof(float*),oi,lo,hi);
  test_neon(pixels,k,c,table,offset,stride,a,nk*sizeof(float*),oi,&params);
  test_rvv(pixels,k,c,table,offset,stride,b,nk*sizeof(float*),oi,&params);
  if(memcmp(a,want,outwords*4)||memcmp(b,want,outwords*4)||memcmp(rows,before,rowcount*rowwords*4)||memcmp(table,saved,tablecount*sizeof(float*))){
   for(size_t i=0;i<outwords;i++)if(readword(a+i)!=readword(want+i)||readword(b+i)!=readword(want+i)){fprintf(stderr,"case=%u P=%zu K=%zu C=%zu sched=%u idx=%zu neon=%08x rvv=%08x oracle=%08x\n",serial,pixels,k,c,mp_schedule,i,readword(a+i),readword(b+i),readword(want+i));break;}
   exit(3);
  }
  for(size_t pixel=0;pixel<pixels;pixel++)for(size_t lane=0;lane<c;lane++){
   size_t ix=pixel*(oi/4)+lane;
   if(mp_same_output_at(a+ix,b+ix)!=1||mp_output_bits_at(a+ix)!=readword(want+ix)){fprintf(stderr,"actual output comparator mismatch\n");exit(7);}
  }
  /* The public C caller executes both kernels on the same output map. Check
     independent initial bits, three written probes, the entire final map and
     its unwritten frame against the oracle, including overlapping pixels. */
  for(unsigned pick=0;pick<3;pick++){
   size_t pixel=pick==0?0:pick==1?pixels/2:pixels-1;
   size_t lane=pick==0?0:pick==1?c/2:c-1;
   size_t ix=pixel*(oi/4)+lane;
   for(size_t t=0;t<outwords;t++){uint32_t u=rnd();memcpy(b+t,&u,4);memcpy(want+t,&u,4);}
   oracle(pixels,k,c,table,offset,stride,want,nk*sizeof(float*),oi,lo,hi);
   if(compare_maxpool_written(pixels,k,c,table,offset,stride,b,nk*sizeof(float*),oi,&params,b+ix)!=1||memcmp(b,want,outwords*4)||memcmp(rows,before,rowcount*rowwords*4)||memcmp(table,saved,tablecount*sizeof(float*))){fprintf(stderr,"public written caller or final map/frame mismatch\n");exit(8);}
   caller_cases++;
  }
  full_cases++;observed_lanes+=pixels*c;
 }
 free(rows);free(before);free(table);free(saved);free(a);free(b);free(want);
}
static void counterexamples(void){
 float rows[9][4]={{0}},a[4]={0},b[4]={0},w[4]={0};const float*table[9];for(unsigned j=0;j<9;j++)table[j]=rows[j];
 struct xnn_f32_minmax_params p;uint32_t lo=0xff800000,hi=0x7f800000;memcpy(&p.scalar.min,&lo,4);memcpy(&p.scalar.max,&hi,4);
 uint32_t q=0x7fc12345,one=0x3f800000;memcpy(&rows[0][0],&q,4);memcpy(&rows[1][0],&one,4);
 original_neon(1,2,1,table,0,0,a,0,0,&p);original_rvv(1,2,1,table,0,0,b,0,0,&p);oracle(1,2,1,table,0,0,w,0,0,lo,hi);
 if(readword(a)!=q||readword(b)!=one||readword(w)!=q)abort();
 printf("{\"original_nan\":{\"K\":2,\"C\":1,\"inputs\":[\"7fc12345\",\"3f800000\"],\"neon\":\"%08x\",\"rvv\":\"%08x\",\"oracle\":\"%08x\"},",readword(a),readword(b),readword(w));
 memset(rows,0,sizeof rows);uint32_t qa=0x7fc11111,qb=0x7fc22222;memcpy(rows[0],&qa,4);memcpy(rows[2],&qb,4);
 test_neon(1,9,1,table,0,0,a,0,0,&p);linear_rvv(1,9,1,table,0,0,b,0,0,&p);oracle(1,9,1,table,0,0,w,0,0,lo,hi);
 if(readword(a)!=qb||readword(b)!=qa||readword(w)!=qb)abort();
 printf("\"linear_tree_mutant\":{\"K\":9,\"C\":1,\"inputs\":[\"7fc11111\",\"00000000\",\"7fc22222\",\"00000000\",\"00000000\",\"00000000\",\"00000000\",\"00000000\",\"00000000\"],\"neon\":\"%08x\",\"mutant\":\"%08x\",\"oracle\":\"%08x\"}}\n",readword(a),readword(b),readword(w));
}
static int shared_wrong(void){
 float rows[2][4]={{0}},a[4]={0},b[4]={0},w[4]={0};const float*t[]={rows[0],rows[1]};uint32_t q=0x7fc12345,one=0x3f800000;memcpy(rows[0],&q,4);memcpy(rows[1],&one,4);
 struct xnn_f32_minmax_params p;p.scalar.min=mp_float(0xff800000);p.scalar.max=mp_float(0x7f800000);
 test_neon(1,2,1,t,0,0,a,0,0,&p);test_rvv(1,2,1,t,0,0,b,0,0,&p);oracle(1,2,1,t,0,0,w,0,0,0xff800000,0x7f800000);
 printf("{\"programs_agree\":%s,\"oracle_rejects\":%s,\"neon\":\"%08x\",\"rvv\":\"%08x\",\"oracle\":\"%08x\"}\n",readword(a)==readword(b)?"true":"false",readword(a)!=readword(w)?"true":"false",readword(a),readword(b),readword(w));
 return readword(a)==readword(b)&&readword(a)!=readword(w)?0:5;
}
int main(int argc,char**argv){
 if(argc>1&&strcmp(argv[1],"shared-wrong")==0)return shared_wrong();
 if(argc>1&&strcmp(argv[1],"counterexamples")==0){counterexamples();return 0;}
 test_helpers();unsigned serial=0;
 size_t ks[]={0,1,2,3,8,9,10,17,18,19,26,27,28},cs[]={1,2,3,4,5,7,8,15,16,31,32,33,47,63,64,65,97};
 for(size_t ki=0;ki<13;ki++)for(size_t ci=0;ci<17;ci++)for(size_t p=1;p<=3;p++)regression(p,ks[ki],cs[ci],serial++);
 for(unsigned t=0;t<1300;t++)regression(rnd()%3+1,rnd()%29,rnd()%99+1,serial++);
 printf("{\"passed\":true,\"full_kernel_calls_per_side\":%llu,\"output_lanes_per_side\":%llu,\"helper_pairs\":%llu,\"public_written_caller_calls\":%llu,\"public_caller_final_map_and_unwritten_frame_checked\":true,\"legal_vl_schedules\":[0,1,2,7],\"inactive_lanes\":\"adversarial unobserved poison\",\"scope\":\"finite executable ISA-value diagnostics, no QCP or hardware refinement credit\"}\n",full_cases,observed_lanes,helper_pairs,caller_cases);return 0;
}
