/* Actual byte-view and LE stores adapted from worker-u8-tail-memory 9dd92b6b. */
typedef unsigned long long size_t;
typedef signed char int8_t;
typedef unsigned char uint8_t;
typedef int int32_t;
struct qcp_s8_scalar_params { int32_t min; int32_t max; };
struct xnn_s8_minmax_params { struct qcp_s8_scalar_params scalar; };
typedef struct int8x8_t {
  int8_t s0;
  int8_t s1;
  int8_t s2;
  int8_t s3;
  int8_t s4;
  int8_t s5;
  int8_t s6;
  int8_t s7;
} int8x8_t;
typedef struct int8x16_t {
  int8_t s0;
  int8_t s1;
  int8_t s2;
  int8_t s3;
  int8_t s4;
  int8_t s5;
  int8_t s6;
  int8_t s7;
  int8_t s8;
  int8_t s9;
  int8_t s10;
  int8_t s11;
  int8_t s12;
  int8_t s13;
  int8_t s14;
  int8_t s15;
} int8x16_t;
typedef struct vint8m8_t {
  int8_t s0;
  int8_t s1;
  int8_t s2;
  int8_t s3;
  int8_t s4;
  int8_t s5;
  int8_t s6;
  int8_t s7;
  int8_t s8;
  int8_t s9;
  int8_t s10;
  int8_t s11;
  int8_t s12;
  int8_t s13;
  int8_t s14;
  int8_t s15;
  int8_t s16;
  int8_t s17;
  int8_t s18;
  int8_t s19;
  int8_t s20;
  int8_t s21;
  int8_t s22;
  int8_t s23;
  int8_t s24;
  int8_t s25;
  int8_t s26;
  int8_t s27;
  int8_t s28;
  int8_t s29;
  int8_t s30;
  int8_t s31;
  int8_t s32;
  int8_t s33;
  int8_t s34;
  int8_t s35;
  int8_t s36;
  int8_t s37;
  int8_t s38;
  int8_t s39;
  int8_t s40;
  int8_t s41;
  int8_t s42;
  int8_t s43;
  int8_t s44;
  int8_t s45;
  int8_t s46;
  int8_t s47;
  int8_t s48;
  int8_t s49;
  int8_t s50;
  int8_t s51;
  int8_t s52;
  int8_t s53;
  int8_t s54;
  int8_t s55;
  int8_t s56;
  int8_t s57;
  int8_t s58;
  int8_t s59;
  int8_t s60;
  int8_t s61;
  int8_t s62;
  int8_t s63;
  int8_t s64;
  int8_t s65;
  int8_t s66;
  int8_t s67;
  int8_t s68;
  int8_t s69;
  int8_t s70;
  int8_t s71;
  int8_t s72;
  int8_t s73;
  int8_t s74;
  int8_t s75;
  int8_t s76;
  int8_t s77;
  int8_t s78;
  int8_t s79;
  int8_t s80;
  int8_t s81;
  int8_t s82;
  int8_t s83;
  int8_t s84;
  int8_t s85;
  int8_t s86;
  int8_t s87;
  int8_t s88;
  int8_t s89;
  int8_t s90;
  int8_t s91;
  int8_t s92;
  int8_t s93;
  int8_t s94;
  int8_t s95;
  int8_t s96;
  int8_t s97;
  int8_t s98;
  int8_t s99;
  int8_t s100;
  int8_t s101;
  int8_t s102;
  int8_t s103;
  int8_t s104;
  int8_t s105;
  int8_t s106;
  int8_t s107;
  int8_t s108;
  int8_t s109;
  int8_t s110;
  int8_t s111;
  int8_t s112;
  int8_t s113;
  int8_t s114;
  int8_t s115;
  int8_t s116;
  int8_t s117;
  int8_t s118;
  int8_t s119;
  int8_t s120;
  int8_t s121;
  int8_t s122;
  int8_t s123;
  int8_t s124;
  int8_t s125;
  int8_t s126;
  int8_t s127;
} vint8m8_t;
typedef struct uint8x8_t {
  uint8_t s0;
  uint8_t s1;
  uint8_t s2;
  uint8_t s3;
  uint8_t s4;
  uint8_t s5;
  uint8_t s6;
  uint8_t s7;
} uint8x8_t;
/* Byte-backed views preserve all eight bytes, without aligned word loads. */
typedef uint8x8_t uint32x2_t;
typedef uint8x8_t uint16x4_t;
/*@ Import Coq Require Import S8Clamp.Types */
/*@ Extern Coq (UndefStructPredint8x8_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredint8x16_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredvint8m8_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPreduint8x8_t:Z -> Assertion) */
/*@ Import Coq Require Import S8Clamp.ByteBridge */
/*@ Extern Coq (s8_le_byte0:Z -> Z) (s8_le_byte1:Z -> Z)
               (s8_le_byte2:Z -> Z) (s8_le_byte3:Z -> Z) */
/*@ include strategies "signed_tail.strategies" */
void qcp_s8_store_word32(unsigned char *out,unsigned int word)
/*@ Require 0 <= word && word <= 4294967295 &&
    undef_data_at(out+0,unsigned char) *
    undef_data_at(out+1,unsigned char) *
    undef_data_at(out+2,unsigned char) *
    undef_data_at(out+3,unsigned char)
 Ensure data_at(out+0,unsigned char,s8_le_byte0(word)) *
data_at(out+1,unsigned char,s8_le_byte1(word)) *
data_at(out+2,unsigned char,s8_le_byte2(word)) *
data_at(out+3,unsigned char,s8_le_byte3(word)) */
{
 out[0]=(unsigned char)(word);
 out[1]=(unsigned char)(word/256U);
 out[2]=(unsigned char)(word/65536U);
 out[3]=(unsigned char)(word/16777216U);
}
void qcp_s8_store_word16(unsigned char *out,unsigned short word)
/*@ Require 0 <= word && word <= 65535 &&
    undef_data_at(out+0,unsigned char) *
    undef_data_at(out+1,unsigned char)
 Ensure data_at(out+0,unsigned char,s8_le_byte0(word)) *
data_at(out+1,unsigned char,s8_le_byte1(word)) */
{
 out[0]=(unsigned char)(word);
 out[1]=(unsigned char)(word/256U);
}
unsigned short qcp_s8_pack16(unsigned char a,unsigned char b)
/*@ Require 0 <= a && a <= 255 && 0 <= b && b <= 255
    Ensure __return == a + 256*b */
{ return (unsigned short)(a + 256*b); }
unsigned int qcp_s8_pack32(unsigned char a,unsigned char b,unsigned char c,unsigned char d)
/*@ Require 0 <= a && a <= 255 && 0 <= b && b <= 255 &&
            0 <= c && c <= 255 && 0 <= d && d <= 255
    Ensure __return == a + 256*b + 65536*c + 16777216*d */
{ return (unsigned int)a + 256U*b + 65536U*c + 16777216U*d; }
uint32x2_t vreinterpret_u32_s8(int8x8_t a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(a.s0),signed char,x0) * store(&(a.s1),signed char,x1) * store(&(a.s2),signed char,x2) * store(&(a.s3),signed char,x3) * store(&(a.s4),signed char,x4) * store(&(a.s5),signed char,x5) * store(&(a.s6),signed char,x6) * store(&(a.s7),signed char,x7)
 Ensure -128 <= x0 && x0 <= 127 && -128 <= x1 && x1 <= 127 && -128 <= x2 && x2 <= 127 && -128 <= x3 && x3 <= 127 && -128 <= x4 && x4 <= 127 && -128 <= x5 && x5 <= 127 && -128 <= x6 && x6 <= 127 && -128 <= x7 && x7 <= 127 && store(&(__return.s0),unsigned char,unsigned_last_nbits(x0,8)) * store(&(__return.s1),unsigned char,unsigned_last_nbits(x1,8)) * store(&(__return.s2),unsigned char,unsigned_last_nbits(x2,8)) * store(&(__return.s3),unsigned char,unsigned_last_nbits(x3,8)) * store(&(__return.s4),unsigned char,unsigned_last_nbits(x4,8)) * store(&(__return.s5),unsigned char,unsigned_last_nbits(x5,8)) * store(&(__return.s6),unsigned char,unsigned_last_nbits(x6,8)) * store(&(__return.s7),unsigned char,unsigned_last_nbits(x7,8)) */
{
 /*@ Assert -128 <= x0 && x0 <= 127 && -128 <= x1 && x1 <= 127 && -128 <= x2 && x2 <= 127 && -128 <= x3 && x3 <= 127 && -128 <= x4 && x4 <= 127 && -128 <= x5 && x5 <= 127 && -128 <= x6 && x6 <= 127 && -128 <= x7 && x7 <= 127 && store(&a,void*,&a) * store(&(a.s0),signed char,x0) * store(&(a.s1),signed char,x1) * store(&(a.s2),signed char,x2) * store(&(a.s3),signed char,x3) * store(&(a.s4),signed char,x4) * store(&(a.s5),signed char,x5) * store(&(a.s6),signed char,x6) * store(&(a.s7),signed char,x7) */
 uint8x8_t r;
 r.s0=(unsigned char)a.s0;
 r.s1=(unsigned char)a.s1;
 r.s2=(unsigned char)a.s2;
 r.s3=(unsigned char)a.s3;
 r.s4=(unsigned char)a.s4;
 r.s5=(unsigned char)a.s5;
 r.s6=(unsigned char)a.s6;
 r.s7=(unsigned char)a.s7;
 return r;
}
void qcp_s8_store_u32_0(unsigned char*output,const uint32x2_t*a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * undef_data_at(output+0,unsigned char) * undef_data_at(output+1,unsigned char) * undef_data_at(output+2,unsigned char) * undef_data_at(output+3,unsigned char)
 Ensure store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * store(output+0,unsigned char,x0) * store(output+1,unsigned char,x1) * store(output+2,unsigned char,x2) * store(output+3,unsigned char,x3) */
{
 qcp_s8_store_word32(output,qcp_s8_pack32(a->s0, a->s1, a->s2, a->s3));
}
void original_tail_store32(int8_t*output,int8x8_t vacc)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(vacc.s0),signed char,x0) * store(&(vacc.s1),signed char,x1) * store(&(vacc.s2),signed char,x2) * store(&(vacc.s3),signed char,x3) * store(&(vacc.s4),signed char,x4) * store(&(vacc.s5),signed char,x5) * store(&(vacc.s6),signed char,x6) * store(&(vacc.s7),signed char,x7) * undef_data_at(output+0,signed char) * undef_data_at(output+1,signed char) * undef_data_at(output+2,signed char) * undef_data_at(output+3,signed char)
 Ensure store(output+0,signed char,x0) * store(output+1,signed char,x1) * store(output+2,signed char,x2) * store(output+3,signed char,x3) */
{
 { uint32x2_t qcp_store_tmp; qcp_store_tmp=(vreinterpret_u32_s8(vacc) /*@ where a=&vacc */); qcp_s8_store_u32_0(((void*) output),&qcp_store_tmp); };
}
uint16x4_t vreinterpret_u16_s8(int8x8_t a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(a.s0),signed char,x0) * store(&(a.s1),signed char,x1) * store(&(a.s2),signed char,x2) * store(&(a.s3),signed char,x3) * store(&(a.s4),signed char,x4) * store(&(a.s5),signed char,x5) * store(&(a.s6),signed char,x6) * store(&(a.s7),signed char,x7)
 Ensure -128 <= x0 && x0 <= 127 && -128 <= x1 && x1 <= 127 && -128 <= x2 && x2 <= 127 && -128 <= x3 && x3 <= 127 && -128 <= x4 && x4 <= 127 && -128 <= x5 && x5 <= 127 && -128 <= x6 && x6 <= 127 && -128 <= x7 && x7 <= 127 && store(&(__return.s0),unsigned char,unsigned_last_nbits(x0,8)) * store(&(__return.s1),unsigned char,unsigned_last_nbits(x1,8)) * store(&(__return.s2),unsigned char,unsigned_last_nbits(x2,8)) * store(&(__return.s3),unsigned char,unsigned_last_nbits(x3,8)) * store(&(__return.s4),unsigned char,unsigned_last_nbits(x4,8)) * store(&(__return.s5),unsigned char,unsigned_last_nbits(x5,8)) * store(&(__return.s6),unsigned char,unsigned_last_nbits(x6,8)) * store(&(__return.s7),unsigned char,unsigned_last_nbits(x7,8)) */
{
 /*@ Assert -128 <= x0 && x0 <= 127 && -128 <= x1 && x1 <= 127 && -128 <= x2 && x2 <= 127 && -128 <= x3 && x3 <= 127 && -128 <= x4 && x4 <= 127 && -128 <= x5 && x5 <= 127 && -128 <= x6 && x6 <= 127 && -128 <= x7 && x7 <= 127 && store(&a,void*,&a) * store(&(a.s0),signed char,x0) * store(&(a.s1),signed char,x1) * store(&(a.s2),signed char,x2) * store(&(a.s3),signed char,x3) * store(&(a.s4),signed char,x4) * store(&(a.s5),signed char,x5) * store(&(a.s6),signed char,x6) * store(&(a.s7),signed char,x7) */
 uint8x8_t r;
 r.s0=(unsigned char)a.s0;
 r.s1=(unsigned char)a.s1;
 r.s2=(unsigned char)a.s2;
 r.s3=(unsigned char)a.s3;
 r.s4=(unsigned char)a.s4;
 r.s5=(unsigned char)a.s5;
 r.s6=(unsigned char)a.s6;
 r.s7=(unsigned char)a.s7;
 return r;
}
void qcp_s8_store_u16_0(unsigned char*output,const uint16x4_t*a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * undef_data_at(output+0,unsigned char) * undef_data_at(output+1,unsigned char)
 Ensure store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * store(output+0,unsigned char,x0) * store(output+1,unsigned char,x1) */
{
 qcp_s8_store_word16(output,qcp_s8_pack16(a->s0, a->s1));
}
void original_tail_store16(int8_t*output,int8x8_t vacc)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(vacc.s0),signed char,x0) * store(&(vacc.s1),signed char,x1) * store(&(vacc.s2),signed char,x2) * store(&(vacc.s3),signed char,x3) * store(&(vacc.s4),signed char,x4) * store(&(vacc.s5),signed char,x5) * store(&(vacc.s6),signed char,x6) * store(&(vacc.s7),signed char,x7) * undef_data_at(output+0,signed char) * undef_data_at(output+1,signed char)
 Ensure store(output+0,signed char,x0) * store(output+1,signed char,x1) */
{
 { uint16x4_t qcp_store_tmp; qcp_store_tmp=(vreinterpret_u16_s8(vacc) /*@ where a=&vacc */); qcp_s8_store_u16_0(((void*) output),&qcp_store_tmp); };
}
