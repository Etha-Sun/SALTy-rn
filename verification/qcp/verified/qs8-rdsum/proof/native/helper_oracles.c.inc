/* Independent integer-bit oracle; compiled separately from formal models. */
static void helper_oracles(void) {
 uint32_t seed=0x13579bdfU;unsigned long long cases=0,lanes=0;
 _Static_assert(sizeof(vint8m2_t)==32*sizeof(int8_t),"byte layout");
 _Static_assert(sizeof(vint16m4_t)==32*sizeof(int16_t),"halfword layout");
 _Static_assert(sizeof(vint32m8_t)==32*sizeof(int32_t),"word layout");
 for(unsigned pattern=0;pattern<256;pattern++)for(unsigned long long vl=0;vl<=32;vl++) {
  int8_t b8[32];int16_t a16[32];int32_t a32[32],b32[32],got32[32];int16_t got16[32];
  for(unsigned i=0;i<32;i++) {
   seed=seed*1664525U+1013904223U;uint16_t s=(uint16_t)seed;memcpy(a16+i,&s,2);uint8_t t=(uint8_t)(seed>>24);memcpy(b8+i,&t,1);
   seed=seed*1664525U+1013904223U;memcpy(a32+i,&seed,4);seed=seed*1664525U+1013904223U;memcpy(b32+i,&seed,4);
   if(pattern<4){a16[i]=pattern&1?INT16_MAX:INT16_MIN;b8[i]=pattern&2?INT8_MAX:INT8_MIN;a32[i]=pattern&1?INT32_MAX:INT32_MIN;b32[i]=pattern&2?INT32_MAX:INT32_MIN;}
  }
  vint8m2_t v8;vint16m4_t v16;vint32m8_t v32,w32;memcpy(&v8,b8,sizeof(v8));memcpy(&v16,a16,sizeof(v16));memcpy(&v32,a32,sizeof(v32));memcpy(&w32,b32,sizeof(w32));
  vint16m4_t r16=__riscv_vwadd_wv_i16m4(v16,v8,vl);memcpy(got16,&r16,sizeof(r16));
  for(unsigned i=0;i<32;i++){uint16_t want=i<vl?(uint16_t)((uint32_t)(int32_t)a16[i]+(uint32_t)(int32_t)b8[i]):0;if((uint16_t)got16[i]!=want)abort();}cases++;lanes+=32;
  vint32m8_t r32=__riscv_vwadd_wv_i32m8(v32,v16,vl);memcpy(got32,&r32,sizeof(r32));
  for(unsigned i=0;i<32;i++){uint32_t want=i<vl?(uint32_t)a32[i]+(uint32_t)(int32_t)a16[i]:0;if((uint32_t)got32[i]!=want)abort();}cases++;lanes+=32;
  r32=__riscv_vadd_vv_i32m8(v32,w32,vl);memcpy(got32,&r32,sizeof(r32));
  for(unsigned i=0;i<32;i++){uint32_t want=i<vl?(uint32_t)a32[i]+(uint32_t)b32[i]:0;if((uint32_t)got32[i]!=want)abort();}cases++;lanes+=32;
  r16=__riscv_vmv_v_x_i16m4(a16[0],vl);memcpy(got16,&r16,sizeof(r16));
  for(unsigned i=0;i<32;i++)if(got16[i]!=(i<vl?a16[0]:0))abort();cases++;lanes+=32;
  r32=__riscv_vmv_v_x_i32m8(a32[0],vl);memcpy(got32,&r32,sizeof(r32));
  for(unsigned i=0;i<32;i++)if(got32[i]!=(i<vl?a32[0]:0))abort();cases++;lanes+=32;
  int16x8_t n16;int8x8_t n8;int32x4_t n32,m32;memcpy(&n16,a16,sizeof(n16));memcpy(&n8,b8,sizeof(n8));memcpy(&n32,a32,sizeof(n32));memcpy(&m32,b32,sizeof(m32));
  int16x8_t q16=vaddw_s8(n16,n8);memcpy(got16,&q16,sizeof(q16));for(unsigned i=0;i<8;i++)if((uint16_t)got16[i]!=(uint16_t)((uint32_t)(int32_t)a16[i]+(uint32_t)(int32_t)b8[i]))abort();cases++;lanes+=8;
  int32x4_t q32=rdsum_wadd16_low(n32,n16);memcpy(got32,&q32,sizeof(q32));for(unsigned i=0;i<4;i++)if((uint32_t)got32[i]!=(uint32_t)a32[i]+(uint32_t)(int32_t)a16[i])abort();cases++;lanes+=4;
  q32=rdsum_wadd16_high(n32,n16);memcpy(got32,&q32,sizeof(q32));for(unsigned i=0;i<4;i++)if((uint32_t)got32[i]!=(uint32_t)a32[i]+(uint32_t)(int32_t)a16[i+4])abort();cases++;lanes+=4;
  q32=vaddq_s32(n32,m32);memcpy(got32,&q32,sizeof(q32));for(unsigned i=0;i<4;i++)if((uint32_t)got32[i]!=(uint32_t)a32[i]+(uint32_t)b32[i])abort();cases++;lanes+=4;
  q32=rdsum_selfext2(n32);memcpy(got32,&q32,sizeof(q32));for(unsigned i=0;i<4;i++)if(got32[i]!=a32[(i+2)%4])abort();cases++;lanes+=4;
  int32x2_t n2;memcpy(&n2,a32,sizeof(n2));int32x2_t q2=rdsum_addlow2(n2,m32);memcpy(got32,&q2,sizeof(q2));for(unsigned i=0;i<2;i++)if((uint32_t)got32[i]!=(uint32_t)a32[i]+(uint32_t)b32[i])abort();cases++;lanes+=2;
  if(rdsum_lane0(n32)!=a32[0])abort();cases++;lanes++;
 }
 fprintf(stderr,"primitive_oracle cases=%llu lanes=%llu failures=0\n",cases,lanes);
}
