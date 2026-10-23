typedef unsigned char uint8_t;
typedef struct uint8x8_t {unsigned char s0;unsigned char s1;unsigned char s2;unsigned char s3;unsigned char s4;unsigned char s5;unsigned char s6;unsigned char s7;} uint8x8_t;
typedef struct uint8x16_t {unsigned char s0;unsigned char s1;unsigned char s2;unsigned char s3;unsigned char s4;unsigned char s5;unsigned char s6;unsigned char s7;unsigned char s8;unsigned char s9;unsigned char s10;unsigned char s11;unsigned char s12;unsigned char s13;unsigned char s14;unsigned char s15;} uint8x16_t;
typedef uint8x8_t uint32x2_t;
typedef uint8x8_t uint16x4_t;
/*@ Import Coq Require Import TailAdapter.Layout */
/*@ Extern Coq (UndefStructPreduint8x8_t:Z -> Assertion) (UndefStructPreduint8x16_t:Z -> Assertion) */
/*@ include strategies "u8_copy.strategies" */
/*@ Import Coq Require Import U8Tail.LEModel */
/*@ Extern Coq (le_byte0 : Z -> Z) (le_byte1 : Z -> Z)
               (le_byte2 : Z -> Z) (le_byte3 : Z -> Z) */
void qcp_u8_store_word32(unsigned char *out,unsigned int word)
/*@ Require 0 <= word && word <= 4294967295 &&
    undef_data_at(out+0,unsigned char) *
    undef_data_at(out+1,unsigned char) *
    undef_data_at(out+2,unsigned char) *
    undef_data_at(out+3,unsigned char)
 Ensure data_at(out+0,unsigned char,le_byte0(word)) *
data_at(out+1,unsigned char,le_byte1(word)) *
data_at(out+2,unsigned char,le_byte2(word)) *
data_at(out+3,unsigned char,le_byte3(word)) */
{
 out[0]=(unsigned char)(word);
 out[1]=(unsigned char)(word/256U);
 out[2]=(unsigned char)(word/65536U);
 out[3]=(unsigned char)(word/16777216U);
}
void qcp_u8_store_word16(unsigned char *out,unsigned short word)
/*@ Require 0 <= word && word <= 65535 &&
    undef_data_at(out+0,unsigned char) *
    undef_data_at(out+1,unsigned char)
 Ensure data_at(out+0,unsigned char,le_byte0(word)) *
data_at(out+1,unsigned char,le_byte1(word)) */
{
 out[0]=(unsigned char)(word);
 out[1]=(unsigned char)(word/256U);
}
void qcp_u8_store_byte(unsigned char *out,unsigned char value)
/*@ Require 0 <= value && value <= 255 &&
    undef_data_at(out+0,unsigned char)
 Ensure data_at(out+0,unsigned char,value) */
{
 out[0]=(unsigned char)(value);
}
unsigned short qcp_u8_pack16(unsigned char a,unsigned char b)
/*@ Require 0 <= a && a <= 255 && 0 <= b && b <= 255
    Ensure __return == a + 256*b */
{ return (unsigned short)(a + 256*b); }
unsigned int qcp_u8_pack32(unsigned char a,unsigned char b,unsigned char c,unsigned char d)
/*@ Require 0 <= a && a <= 255 && 0 <= b && b <= 255 &&
            0 <= c && c <= 255 && 0 <= d && d <= 255
    Ensure __return == a + 256*b + 65536*c + 16777216*d */
{ return (unsigned int)a + 256U*b + 65536U*c + 16777216U*d; }
uint32x2_t vreinterpret_u32_u8(uint8x8_t a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(a.s0),unsigned char,x0) * store(&(a.s1),unsigned char,x1) * store(&(a.s2),unsigned char,x2) * store(&(a.s3),unsigned char,x3) * store(&(a.s4),unsigned char,x4) * store(&(a.s5),unsigned char,x5) * store(&(a.s6),unsigned char,x6) * store(&(a.s7),unsigned char,x7)
 Ensure store(&(__return.s0),unsigned char,x0) * store(&(__return.s1),unsigned char,x1) * store(&(__return.s2),unsigned char,x2) * store(&(__return.s3),unsigned char,x3) * store(&(__return.s4),unsigned char,x4) * store(&(__return.s5),unsigned char,x5) * store(&(__return.s6),unsigned char,x6) * store(&(__return.s7),unsigned char,x7) */
{
 uint8x8_t r;
 r.s0=a.s0;
 r.s1=a.s1;
 r.s2=a.s2;
 r.s3=a.s3;
 r.s4=a.s4;
 r.s5=a.s5;
 r.s6=a.s6;
 r.s7=a.s7;
 return r;
}
void qcp_store_u32_0(unsigned char*output,const uint32x2_t*a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * undef_data_at(output+0,unsigned char) * undef_data_at(output+1,unsigned char) * undef_data_at(output+2,unsigned char) * undef_data_at(output+3,unsigned char)
 Ensure store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * store(output+0,unsigned char,x0) * store(output+1,unsigned char,x1) * store(output+2,unsigned char,x2) * store(output+3,unsigned char,x3) */
{
 qcp_u8_store_word32(output,qcp_u8_pack32(a->s0, a->s1, a->s2, a->s3));
}
void original_tail_store32(unsigned char*output,uint8x8_t vacc)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(vacc.s0),unsigned char,x0) * store(&(vacc.s1),unsigned char,x1) * store(&(vacc.s2),unsigned char,x2) * store(&(vacc.s3),unsigned char,x3) * store(&(vacc.s4),unsigned char,x4) * store(&(vacc.s5),unsigned char,x5) * store(&(vacc.s6),unsigned char,x6) * store(&(vacc.s7),unsigned char,x7) * undef_data_at(output+0,unsigned char) * undef_data_at(output+1,unsigned char) * undef_data_at(output+2,unsigned char) * undef_data_at(output+3,unsigned char)
 Ensure store(output+0,unsigned char,x0) * store(output+1,unsigned char,x1) * store(output+2,unsigned char,x2) * store(output+3,unsigned char,x3) */
{
 { uint32x2_t qcp_store_tmp; qcp_store_tmp=(vreinterpret_u32_u8(vacc) /*@ where a=&vacc */); qcp_store_u32_0(((void*) output),&qcp_store_tmp); };
}
uint16x4_t vreinterpret_u16_u8(uint8x8_t a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(a.s0),unsigned char,x0) * store(&(a.s1),unsigned char,x1) * store(&(a.s2),unsigned char,x2) * store(&(a.s3),unsigned char,x3) * store(&(a.s4),unsigned char,x4) * store(&(a.s5),unsigned char,x5) * store(&(a.s6),unsigned char,x6) * store(&(a.s7),unsigned char,x7)
 Ensure store(&(__return.s0),unsigned char,x0) * store(&(__return.s1),unsigned char,x1) * store(&(__return.s2),unsigned char,x2) * store(&(__return.s3),unsigned char,x3) * store(&(__return.s4),unsigned char,x4) * store(&(__return.s5),unsigned char,x5) * store(&(__return.s6),unsigned char,x6) * store(&(__return.s7),unsigned char,x7) */
{
 uint8x8_t r;
 r.s0=a.s0;
 r.s1=a.s1;
 r.s2=a.s2;
 r.s3=a.s3;
 r.s4=a.s4;
 r.s5=a.s5;
 r.s6=a.s6;
 r.s7=a.s7;
 return r;
}
void qcp_store_u16_0(unsigned char*output,const uint16x4_t*a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * undef_data_at(output+0,unsigned char) * undef_data_at(output+1,unsigned char)
 Ensure store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * store(output+0,unsigned char,x0) * store(output+1,unsigned char,x1) */
{
 qcp_u8_store_word16(output,qcp_u8_pack16(a->s0, a->s1));
}
void original_tail_store16(unsigned char*output,uint8x8_t vacc)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(vacc.s0),unsigned char,x0) * store(&(vacc.s1),unsigned char,x1) * store(&(vacc.s2),unsigned char,x2) * store(&(vacc.s3),unsigned char,x3) * store(&(vacc.s4),unsigned char,x4) * store(&(vacc.s5),unsigned char,x5) * store(&(vacc.s6),unsigned char,x6) * store(&(vacc.s7),unsigned char,x7) * undef_data_at(output+0,unsigned char) * undef_data_at(output+1,unsigned char)
 Ensure store(output+0,unsigned char,x0) * store(output+1,unsigned char,x1) */
{
 { uint16x4_t qcp_store_tmp; qcp_store_tmp=(vreinterpret_u16_u8(vacc) /*@ where a=&vacc */); qcp_store_u16_0(((void*) output),&qcp_store_tmp); };
}
