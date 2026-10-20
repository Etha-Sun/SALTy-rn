#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
static uint32_t rng=UINT32_C(0x71c0ffee);
static uint32_t next32(void){rng^=rng<<13;rng^=rng>>17;rng^=rng<<5;return rng;}
static void array_json(const char*n,const uint32_t*p,size_t z){printf(",\"%s\":[",n);for(size_t j=0;j<z;j++){if(j)putchar(',');printf("%u",p[j]);}putchar(']');}
#include "/zp_vegeta/scratch_sb/ycsun/verus/build/verified-output-equivalence/experiments/integration-wave2/noncomplex/x32-transposec/v04/attempts/0001/.build/verify01/plain/unit.c"
int main(void){size_t tests=0;for(size_t w=1;w<=35;w++)for(size_t h=1;h<=17;h++)for(size_t ip=0;ip<4;ip++)for(size_t op=0;op<4;op++){
 size_t is=w+ip,os=h+op,ni=h*is+1,no=w*os;uint32_t*in=malloc(ni*4),*l=malloc(no*4),*r=malloc(no*4),*init=malloc(no*4);if(!in||!l||!r||!init)return 2;
 for(size_t j=0;j<ni;j++)in[j]=next32();for(size_t j=0;j<no;j++)l[j]=r[j]=init[j]=next32();int eq=equivalent(w,h,is,os,in,l,r);tests++;
 if(!eq){size_t d=0;while(d<no&&l[d]==r[d])d++;printf("{\"counterexample\":true,\"w\":%zu,\"h\":%zu,\"is\":%zu,\"os\":%zu,\"first_difference\":%zu",w,h,is,os,d);array_json("input",in,ni);array_json("initial",init,no);array_json("left",l,no);array_json("right",r,no);puts("}");return 1;}
 free(in);free(l);free(r);free(init);
 }printf("{\"counterexample\":false,\"tests\":%zu,\"seed\":\"0x71c0ffee\"}\n",tests);return 0;}
