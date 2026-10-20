#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
static uint32_t rng=UINT32_C(0x71c0ffee);
static uint32_t next32(void){rng^=rng<<13;rng^=rng>>17;rng^=rng<<5;return rng;}
static void array_json(const char*n,const uint32_t*p,size_t z){printf(",\"%s\":[",n);for(size_t j=0;j<z;j++){if(j)putchar(',');printf("%u",p[j]);}putchar(']');}
#include "/zp_vegeta/scratch_sb/ycsun/verus/build/verified-output-equivalence/experiments/integration-wave2/noncomplex/x32-packw-gemm-goi/v04/attempts/0001/.build/verify01/plain/unit.c"
int main(void){size_t tests=0;for(size_t g=1;g<=3;g++)for(size_t nc=1;nc<=9;nc++)for(size_t kc=1;kc<=35;kc++)for(size_t extra=0;extra<=3;extra++)for(int has_bias=0;has_bias<2;has_bias++){
 size_t nw=g*nc*kc,nb=g*nc,no=g*((nc+1)/2)*(2+2*kc+extra);uint32_t*w=malloc(nw*4),*b=malloc(nb*4),*l=malloc(no*4),*r=malloc(no*4),*init=malloc(no*4);if(!w||!b||!l||!r||!init)return 2;
 for(size_t j=0;j<nw;j++)w[j]=next32();for(size_t j=0;j<nb;j++)b[j]=next32();for(size_t j=0;j<no;j++)l[j]=r[j]=init[j]=next32();
 int eq=equivalent(g,nc,kc,extra,w,has_bias?b:NULL,l,r);tests++;
 if(!eq){size_t d=0;while(d<no&&l[d]==r[d])d++;printf("{\"counterexample\":true,\"g\":%zu,\"nc\":%zu,\"kc\":%zu,\"extra\":%zu,\"has_bias\":%d,\"first_difference\":%zu",g,nc,kc,extra,has_bias,d);array_json("weights",w,nw);array_json("bias",b,nb);array_json("initial",init,no);array_json("left",l,no);array_json("right",r,no);puts("}");return 1;}
 free(w);free(b);free(l);free(r);free(init);
 }printf("{\"counterexample\":false,\"tests\":%zu,\"seed\":\"0x71c0ffee\"}\n",tests);return 0;}
