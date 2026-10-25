#include "../../shim/tuple_types.h"
extern int printf(const char*,...);
uint32_t pw_tuple_first(const uint32x2x2_t*p);
uint32x2x2_t pw_record_copy(const uint32x2x2_t*p);
_Static_assert(sizeof(uint32_t)==4&&sizeof(void*)==8&&sizeof(uint32x2x2_t)==16,"native tuple32 LP64");
static uint32_t rng=0x3157ab29u;
static uint32_t next_word(void){rng^=rng<<13;rng^=rng>>17;rng^=rng<<5;return rng;}
int main(void){
 const uint32_t edges[]={0,1,0x80000000u,0xffffffffu,0x7fc12345u,0x7f800001u};
 for(unsigned i=0;i<65536;i++){
  uint32_t a=i<6?edges[i]:next_word(),b=next_word(),c=next_word(),d=next_word();
  uint32x2x2_t input={{{a,b},{c,d}}};
  uint32_t first=pw_tuple_first(&input);
  uint32x2x2_t out=pw_record_copy(&input);
  if(first!=a||out.val[0].s0!=a||out.val[0].s1!=b||out.val[1].s0!=c||out.val[1].s1!=d||input.val[0].s0!=a||input.val[0].s1!=b||input.val[1].s0!=c||input.val[1].s1!=d)return 1;
 }
 printf("{\"passed\":true,\"cases\":65536,\"actual_ordinary_bodies_called\":2,\"raw_uint32_and_input_frame\":true}\n");
 return 0;
}
