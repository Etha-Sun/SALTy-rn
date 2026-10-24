/* Independent integer-bit oracle; compiled separately from formal models. */
static void helper_oracles(void) {
 uint32_t seed=0x13579bdfU;unsigned long long cases=0,lanes=0;
 _Static_assert(sizeof(vuint8m2_t)==32*sizeof(uint8_t),"byte layout");
 _Static_assert(sizeof(vuint16m4_t)==32*sizeof(uint16_t),"halfword layout");
 _Static_assert(sizeof(vuint32m8_t)==32*sizeof(uint32_t),"word layout");
 for(unsigned pattern=0;pattern<256;pattern++)for(unsigned long long vl=0;vl<=32;vl++) {
  uint8_t b8[32];uint16_t a16[32];uint32_t a32[32],b32[32],got32[32];uint16_t got16[32];
  for(unsigned i=0;i<32;i++) {
   seed=seed*1664525U+1013904223U;uint16_t s=(uint16_t)seed;memcpy(a16+i,&s,2);uint8_t t=(uint8_t)(seed>>24);memcpy(b8+i,&t,1);
   seed=seed*1664525U+1013904223U;memcpy(a32+i,&seed,4);seed=seed*1664525U+1013904223U;memcpy(b32+i,&seed,4);
   if(pattern<4){a16[i]=pattern&1?UINT16_MAX:0;b8[i]=pattern&2?UINT8_MAX:0;a32[i]=pattern&1?UINT32_MAX:0;b32[i]=pattern&2?UINT32_MAX:0;}
  }
  vuint8m2_t v8;vuint16m4_t v16;vuint32m8_t v32,w32;memcpy(&v8,b8,sizeof(v8));memcpy(&v16,a16,sizeof(v16));memcpy(&v32,a32,sizeof(v32));memcpy(&w32,b32,sizeof(w32));
  vuint16m4_t r16=__riscv_vwaddu_wv_u16m4(v16,v8,vl);memcpy(got16,&r16,sizeof(r16));
  for(unsigned i=0;i<32;i++){uint16_t want=i<vl?(uint16_t)((uint32_t)(uint32_t)a16[i]+(uint32_t)(uint32_t)b8[i]):0;if((uint16_t)got16[i]!=want)abort();}cases++;lanes+=32;
  vuint32m8_t r32=__riscv_vwaddu_wv_u32m8(v32,v16,vl);memcpy(got32,&r32,sizeof(r32));
  for(unsigned i=0;i<32;i++){uint32_t want=i<vl?(uint32_t)a32[i]+(uint32_t)(uint32_t)a16[i]:0;if((uint32_t)got32[i]!=want)abort();}cases++;lanes+=32;
  r32=__riscv_vadd_vv_u32m8(v32,w32,vl);memcpy(got32,&r32,sizeof(r32));
  for(unsigned i=0;i<32;i++){uint32_t want=i<vl?(uint32_t)a32[i]+(uint32_t)b32[i]:0;if((uint32_t)got32[i]!=want)abort();}cases++;lanes+=32;
  r16=__riscv_vmv_v_x_u16m4(a16[0],vl);memcpy(got16,&r16,sizeof(r16));
  for(unsigned i=0;i<32;i++)if(got16[i]!=(i<vl?a16[0]:0))abort();cases++;lanes+=32;
  r32=__riscv_vmv_v_x_u32m8(a32[0],vl);memcpy(got32,&r32,sizeof(r32));
  for(unsigned i=0;i<32;i++)if(got32[i]!=(i<vl?a32[0]:0))abort();cases++;lanes+=32;
  uint16x8_t n16;uint8x8_t n8;uint32x4_t n32,m32;memcpy(&n16,a16,sizeof(n16));memcpy(&n8,b8,sizeof(n8));memcpy(&n32,a32,sizeof(n32));memcpy(&m32,b32,sizeof(m32));
  uint16x8_t q16=vaddw_u8(n16,n8);memcpy(got16,&q16,sizeof(q16));for(unsigned i=0;i<8;i++)if((uint16_t)got16[i]!=(uint16_t)((uint32_t)(uint32_t)a16[i]+(uint32_t)(uint32_t)b8[i]))abort();cases++;lanes+=8;
  uint8x16_t n8wide;memcpy(&n8wide,b8,sizeof(n8wide));q16=rdsum_wadd8_low16(n16,n8wide);memcpy(got16,&q16,sizeof(q16));for(unsigned i=0;i<8;i++)if(got16[i]!=(uint16_t)((uint32_t)a16[i]+(uint32_t)b8[i]))abort();cases++;lanes+=8;
  uint32x4_t q32=rdsum_wadd16_low(n32,n16);memcpy(got32,&q32,sizeof(q32));for(unsigned i=0;i<4;i++)if((uint32_t)got32[i]!=(uint32_t)a32[i]+(uint32_t)(uint32_t)a16[i])abort();cases++;lanes+=4;
  q32=rdsum_wadd16_high(n32,n16);memcpy(got32,&q32,sizeof(q32));for(unsigned i=0;i<4;i++)if((uint32_t)got32[i]!=(uint32_t)a32[i]+(uint32_t)(uint32_t)a16[i+4])abort();cases++;lanes+=4;
  q32=vaddq_u32(n32,m32);memcpy(got32,&q32,sizeof(q32));for(unsigned i=0;i<4;i++)if((uint32_t)got32[i]!=(uint32_t)a32[i]+(uint32_t)b32[i])abort();cases++;lanes+=4;
  q32=rdsum_selfext2(n32);memcpy(got32,&q32,sizeof(q32));for(unsigned i=0;i<4;i++)if(got32[i]!=a32[(i+2)%4])abort();cases++;lanes+=4;
  uint32x2_t n2;memcpy(&n2,a32,sizeof(n2));uint32x2_t q2=rdsum_addlow2(n2,m32);memcpy(got32,&q2,sizeof(q2));for(unsigned i=0;i<2;i++)if((uint32_t)got32[i]!=(uint32_t)a32[i]+(uint32_t)b32[i])abort();cases++;lanes+=2;
  if(rdsum_lane0(n32)!=a32[0])abort();cases++;lanes++;
 }
 fprintf(stderr,"primitive_oracle cases=%llu lanes=%llu failures=0\n",cases,lanes);
}
