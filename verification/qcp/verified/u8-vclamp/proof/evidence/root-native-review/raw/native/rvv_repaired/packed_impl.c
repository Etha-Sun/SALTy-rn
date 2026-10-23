typedef unsigned long long size_t;
typedef unsigned char uint8_t;
typedef unsigned int uint32_t;
typedef struct vuint8m8_t {uint32_t w0;uint32_t w1;uint32_t w2;uint32_t w3;uint32_t w4;uint32_t w5;uint32_t w6;uint32_t w7;uint32_t w8;uint32_t w9;uint32_t w10;uint32_t w11;uint32_t w12;uint32_t w13;uint32_t w14;uint32_t w15;uint32_t w16;uint32_t w17;uint32_t w18;uint32_t w19;uint32_t w20;uint32_t w21;uint32_t w22;uint32_t w23;uint32_t w24;uint32_t w25;uint32_t w26;uint32_t w27;uint32_t w28;uint32_t w29;uint32_t w30;uint32_t w31;} vuint8m8_t;
#include "packed_copy.h"
#include "arrays.h"
/*@ Import Coq Require Import FullU8.Packed32Model */
/*@ Extern Coq (pack4:Z->Z->Z->Z->Z) (word_byte:Z->Z->Z) (lane_load:list Z->Z->Z->Z)
 (active_min:Z->Z->Z->Z->Z) (active_max:Z->Z->Z->Z->Z)
 (word_load:list Z->Z->Z->Z) (word_min:Z->Z->Z->Z->Z) (word_max:Z->Z->Z->Z->Z)
 (vec_byte:list Z->Z->Z) (vec_bytes:list Z->list Z) (u8_min:Z->Z->Z) (u8_max:Z->Z->Z) (u8_vl:Z->Z) */
unsigned char qcp_u8_min(unsigned char x,unsigned char y)
/*@ Require emp Ensure __return==u8_min(x,y) */
{if(x<y)return x;return y;}
unsigned char qcp_active_min(unsigned char x,unsigned char y,size_t vl,size_t i)
/*@ Require 0<=x && x<=255 && 0<=y && y<=255 && 0<vl && vl<=128 && 0<=i && i<128 Ensure __return==active_min(x,y,vl,i) && 0<=__return && __return<=255 */
{if(i<vl)return qcp_u8_min(x,y);return x;}
unsigned char qcp_u8_max(unsigned char x,unsigned char y)
/*@ Require emp Ensure __return==u8_max(x,y) */
{if(x<y)return y;return x;}
unsigned char qcp_active_max(unsigned char x,unsigned char y,size_t vl,size_t i)
/*@ Require 0<=x && x<=255 && 0<=y && y<=255 && 0<vl && vl<=128 && 0<=i && i<128 Ensure __return==active_max(x,y,vl,i) && 0<=__return && __return<=255 */
{if(i<vl)return qcp_u8_max(x,y);return x;}
uint32_t qcp_pack4(unsigned char a,unsigned char b,unsigned char c,unsigned char d)
/*@ Require 0<=a && a<=255 && 0<=b && b<=255 && 0<=c && c<=255 && 0<=d && d<=255 Ensure __return==pack4(a,b,c,d) && 0<=__return && __return<=4294967295 */
{return (unsigned int)a+256U*b+65536U*c+16777216U*d;}
unsigned char qcp_word_byte(uint32_t w,uint32_t lane)
/*@ Require 0<=lane && lane<4 Ensure __return==word_byte(w,lane) && 0<=__return && __return<=255 */
{return(unsigned char)(w>>(8U*lane));}
size_t __riscv_vsetvl_e8m8(size_t n)
/*@ Require 0<n && n<=18446744073709551615 Ensure __return==u8_vl(n) && 0<__return && __return<=128 && __return<=n */
{if(n<128)return n;return 128;}
unsigned char qcp_load_lane(const unsigned char*p,size_t vl,size_t i)
/*@ With (A:list Z) (n:Z) Require 0<vl && vl<=128 && vl<=n && n<=18446744073709551615 && 0<=i && i<128 && UCharArray::full(p,n,A)
 Ensure UCharArray::full(p,n,A) * (__return==lane_load(A,vl,i) && 0<=__return && __return<=255) */
{if(i<vl)return p[i];return 0;}
uint32_t qcp_load_word(const unsigned char*p,size_t vl,size_t wi)
/*@ With (A:list Z) (n:Z) Require 0<vl && vl<=128 && vl<=n && n<=18446744073709551615 && 0<=wi && wi<32 && UCharArray::full(p,n,A)
 Ensure UCharArray::full(p,n,A) * (__return==word_load(A,vl,wi) && 0<=__return && __return<=4294967295) */
{return qcp_pack4(qcp_load_lane(p,vl,4*wi),qcp_load_lane(p,vl,4*wi+1),qcp_load_lane(p,vl,4*wi+2),qcp_load_lane(p,vl,4*wi+3));}
uint32_t qcp_word_min(uint32_t w,unsigned char y,size_t vl,size_t wi)
/*@ Require 0<=y && y<=255 && 0<vl && vl<=128 && 0<=wi && wi<32 Ensure __return==word_min(w,y,vl,wi) && 0<=__return && __return<=4294967295 */
{return qcp_pack4(qcp_active_min(qcp_word_byte(w,0),y,vl,4*wi+0),qcp_active_min(qcp_word_byte(w,1),y,vl,4*wi+1),qcp_active_min(qcp_word_byte(w,2),y,vl,4*wi+2),qcp_active_min(qcp_word_byte(w,3),y,vl,4*wi+3));}
uint32_t qcp_word_max(uint32_t w,unsigned char y,size_t vl,size_t wi)
/*@ Require 0<=y && y<=255 && 0<vl && vl<=128 && 0<=wi && wi<32 Ensure __return==word_max(w,y,vl,wi) && 0<=__return && __return<=4294967295 */
{return qcp_pack4(qcp_active_max(qcp_word_byte(w,0),y,vl,4*wi+0),qcp_active_max(qcp_word_byte(w,1),y,vl,4*wi+1),qcp_active_max(qcp_word_byte(w,2),y,vl,4*wi+2),qcp_active_max(qcp_word_byte(w,3),y,vl,4*wi+3));}
vuint8m8_t __riscv_vle8_v_u8m8(const unsigned char*p,size_t vl)
/*@ With (A:list Z) (n:Z) Require 0<vl && vl<=128 && vl<=n && n<=18446744073709551615 && UCharArray::full(p,n,A) Ensure UCharArray::seg(p,0,vl,sublist(0,vl,A)) * UCharArray::full(p+vl,n-vl,sublist(vl,n,A)) * store(&(__return.w0),unsigned int,word_load(A,vl,0)) * store(&(__return.w1),unsigned int,word_load(A,vl,1)) * store(&(__return.w2),unsigned int,word_load(A,vl,2)) * store(&(__return.w3),unsigned int,word_load(A,vl,3)) * store(&(__return.w4),unsigned int,word_load(A,vl,4)) * store(&(__return.w5),unsigned int,word_load(A,vl,5)) * store(&(__return.w6),unsigned int,word_load(A,vl,6)) * store(&(__return.w7),unsigned int,word_load(A,vl,7)) * store(&(__return.w8),unsigned int,word_load(A,vl,8)) * store(&(__return.w9),unsigned int,word_load(A,vl,9)) * store(&(__return.w10),unsigned int,word_load(A,vl,10)) * store(&(__return.w11),unsigned int,word_load(A,vl,11)) * store(&(__return.w12),unsigned int,word_load(A,vl,12)) * store(&(__return.w13),unsigned int,word_load(A,vl,13)) * store(&(__return.w14),unsigned int,word_load(A,vl,14)) * store(&(__return.w15),unsigned int,word_load(A,vl,15)) * store(&(__return.w16),unsigned int,word_load(A,vl,16)) * store(&(__return.w17),unsigned int,word_load(A,vl,17)) * store(&(__return.w18),unsigned int,word_load(A,vl,18)) * store(&(__return.w19),unsigned int,word_load(A,vl,19)) * store(&(__return.w20),unsigned int,word_load(A,vl,20)) * store(&(__return.w21),unsigned int,word_load(A,vl,21)) * store(&(__return.w22),unsigned int,word_load(A,vl,22)) * store(&(__return.w23),unsigned int,word_load(A,vl,23)) * store(&(__return.w24),unsigned int,word_load(A,vl,24)) * store(&(__return.w25),unsigned int,word_load(A,vl,25)) * store(&(__return.w26),unsigned int,word_load(A,vl,26)) * store(&(__return.w27),unsigned int,word_load(A,vl,27)) * store(&(__return.w28),unsigned int,word_load(A,vl,28)) * store(&(__return.w29),unsigned int,word_load(A,vl,29)) * store(&(__return.w30),unsigned int,word_load(A,vl,30)) * store(&(__return.w31),unsigned int,word_load(A,vl,31)) */
{vuint8m8_t r;r.w0=qcp_load_word(p,vl,0);
r.w1=qcp_load_word(p,vl,1);
r.w2=qcp_load_word(p,vl,2);
r.w3=qcp_load_word(p,vl,3);
r.w4=qcp_load_word(p,vl,4);
r.w5=qcp_load_word(p,vl,5);
r.w6=qcp_load_word(p,vl,6);
r.w7=qcp_load_word(p,vl,7);
r.w8=qcp_load_word(p,vl,8);
r.w9=qcp_load_word(p,vl,9);
r.w10=qcp_load_word(p,vl,10);
r.w11=qcp_load_word(p,vl,11);
r.w12=qcp_load_word(p,vl,12);
r.w13=qcp_load_word(p,vl,13);
r.w14=qcp_load_word(p,vl,14);
r.w15=qcp_load_word(p,vl,15);
r.w16=qcp_load_word(p,vl,16);
r.w17=qcp_load_word(p,vl,17);
r.w18=qcp_load_word(p,vl,18);
r.w19=qcp_load_word(p,vl,19);
r.w20=qcp_load_word(p,vl,20);
r.w21=qcp_load_word(p,vl,21);
r.w22=qcp_load_word(p,vl,22);
r.w23=qcp_load_word(p,vl,23);
r.w24=qcp_load_word(p,vl,24);
r.w25=qcp_load_word(p,vl,25);
r.w26=qcp_load_word(p,vl,26);
r.w27=qcp_load_word(p,vl,27);
r.w28=qcp_load_word(p,vl,28);
r.w29=qcp_load_word(p,vl,29);
r.w30=qcp_load_word(p,vl,30);
r.w31=qcp_load_word(p,vl,31);
return r;}
vuint8m8_t __riscv_vminu_vx_u8m8(vuint8m8_t a,unsigned char x,size_t vl)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (x8:Z) (x9:Z) (x10:Z) (x11:Z) (x12:Z) (x13:Z) (x14:Z) (x15:Z) (x16:Z) (x17:Z) (x18:Z) (x19:Z) (x20:Z) (x21:Z) (x22:Z) (x23:Z) (x24:Z) (x25:Z) (x26:Z) (x27:Z) (x28:Z) (x29:Z) (x30:Z) (x31:Z) Require 0<vl && vl<=128 && 0<=x && x<=255 && store(&(a.w0),unsigned int,x0) * store(&(a.w1),unsigned int,x1) * store(&(a.w2),unsigned int,x2) * store(&(a.w3),unsigned int,x3) * store(&(a.w4),unsigned int,x4) * store(&(a.w5),unsigned int,x5) * store(&(a.w6),unsigned int,x6) * store(&(a.w7),unsigned int,x7) * store(&(a.w8),unsigned int,x8) * store(&(a.w9),unsigned int,x9) * store(&(a.w10),unsigned int,x10) * store(&(a.w11),unsigned int,x11) * store(&(a.w12),unsigned int,x12) * store(&(a.w13),unsigned int,x13) * store(&(a.w14),unsigned int,x14) * store(&(a.w15),unsigned int,x15) * store(&(a.w16),unsigned int,x16) * store(&(a.w17),unsigned int,x17) * store(&(a.w18),unsigned int,x18) * store(&(a.w19),unsigned int,x19) * store(&(a.w20),unsigned int,x20) * store(&(a.w21),unsigned int,x21) * store(&(a.w22),unsigned int,x22) * store(&(a.w23),unsigned int,x23) * store(&(a.w24),unsigned int,x24) * store(&(a.w25),unsigned int,x25) * store(&(a.w26),unsigned int,x26) * store(&(a.w27),unsigned int,x27) * store(&(a.w28),unsigned int,x28) * store(&(a.w29),unsigned int,x29) * store(&(a.w30),unsigned int,x30) * store(&(a.w31),unsigned int,x31) Ensure store(&(__return.w0),unsigned int,word_min(x0,x,vl,0)) * store(&(__return.w1),unsigned int,word_min(x1,x,vl,1)) * store(&(__return.w2),unsigned int,word_min(x2,x,vl,2)) * store(&(__return.w3),unsigned int,word_min(x3,x,vl,3)) * store(&(__return.w4),unsigned int,word_min(x4,x,vl,4)) * store(&(__return.w5),unsigned int,word_min(x5,x,vl,5)) * store(&(__return.w6),unsigned int,word_min(x6,x,vl,6)) * store(&(__return.w7),unsigned int,word_min(x7,x,vl,7)) * store(&(__return.w8),unsigned int,word_min(x8,x,vl,8)) * store(&(__return.w9),unsigned int,word_min(x9,x,vl,9)) * store(&(__return.w10),unsigned int,word_min(x10,x,vl,10)) * store(&(__return.w11),unsigned int,word_min(x11,x,vl,11)) * store(&(__return.w12),unsigned int,word_min(x12,x,vl,12)) * store(&(__return.w13),unsigned int,word_min(x13,x,vl,13)) * store(&(__return.w14),unsigned int,word_min(x14,x,vl,14)) * store(&(__return.w15),unsigned int,word_min(x15,x,vl,15)) * store(&(__return.w16),unsigned int,word_min(x16,x,vl,16)) * store(&(__return.w17),unsigned int,word_min(x17,x,vl,17)) * store(&(__return.w18),unsigned int,word_min(x18,x,vl,18)) * store(&(__return.w19),unsigned int,word_min(x19,x,vl,19)) * store(&(__return.w20),unsigned int,word_min(x20,x,vl,20)) * store(&(__return.w21),unsigned int,word_min(x21,x,vl,21)) * store(&(__return.w22),unsigned int,word_min(x22,x,vl,22)) * store(&(__return.w23),unsigned int,word_min(x23,x,vl,23)) * store(&(__return.w24),unsigned int,word_min(x24,x,vl,24)) * store(&(__return.w25),unsigned int,word_min(x25,x,vl,25)) * store(&(__return.w26),unsigned int,word_min(x26,x,vl,26)) * store(&(__return.w27),unsigned int,word_min(x27,x,vl,27)) * store(&(__return.w28),unsigned int,word_min(x28,x,vl,28)) * store(&(__return.w29),unsigned int,word_min(x29,x,vl,29)) * store(&(__return.w30),unsigned int,word_min(x30,x,vl,30)) * store(&(__return.w31),unsigned int,word_min(x31,x,vl,31)) */
{vuint8m8_t r;r.w0=qcp_word_min(a.w0,x,vl,0);
r.w1=qcp_word_min(a.w1,x,vl,1);
r.w2=qcp_word_min(a.w2,x,vl,2);
r.w3=qcp_word_min(a.w3,x,vl,3);
r.w4=qcp_word_min(a.w4,x,vl,4);
r.w5=qcp_word_min(a.w5,x,vl,5);
r.w6=qcp_word_min(a.w6,x,vl,6);
r.w7=qcp_word_min(a.w7,x,vl,7);
r.w8=qcp_word_min(a.w8,x,vl,8);
r.w9=qcp_word_min(a.w9,x,vl,9);
r.w10=qcp_word_min(a.w10,x,vl,10);
r.w11=qcp_word_min(a.w11,x,vl,11);
r.w12=qcp_word_min(a.w12,x,vl,12);
r.w13=qcp_word_min(a.w13,x,vl,13);
r.w14=qcp_word_min(a.w14,x,vl,14);
r.w15=qcp_word_min(a.w15,x,vl,15);
r.w16=qcp_word_min(a.w16,x,vl,16);
r.w17=qcp_word_min(a.w17,x,vl,17);
r.w18=qcp_word_min(a.w18,x,vl,18);
r.w19=qcp_word_min(a.w19,x,vl,19);
r.w20=qcp_word_min(a.w20,x,vl,20);
r.w21=qcp_word_min(a.w21,x,vl,21);
r.w22=qcp_word_min(a.w22,x,vl,22);
r.w23=qcp_word_min(a.w23,x,vl,23);
r.w24=qcp_word_min(a.w24,x,vl,24);
r.w25=qcp_word_min(a.w25,x,vl,25);
r.w26=qcp_word_min(a.w26,x,vl,26);
r.w27=qcp_word_min(a.w27,x,vl,27);
r.w28=qcp_word_min(a.w28,x,vl,28);
r.w29=qcp_word_min(a.w29,x,vl,29);
r.w30=qcp_word_min(a.w30,x,vl,30);
r.w31=qcp_word_min(a.w31,x,vl,31);
return r;}
vuint8m8_t __riscv_vmaxu_vx_u8m8(vuint8m8_t a,unsigned char x,size_t vl)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (x8:Z) (x9:Z) (x10:Z) (x11:Z) (x12:Z) (x13:Z) (x14:Z) (x15:Z) (x16:Z) (x17:Z) (x18:Z) (x19:Z) (x20:Z) (x21:Z) (x22:Z) (x23:Z) (x24:Z) (x25:Z) (x26:Z) (x27:Z) (x28:Z) (x29:Z) (x30:Z) (x31:Z) Require 0<vl && vl<=128 && 0<=x && x<=255 && store(&(a.w0),unsigned int,x0) * store(&(a.w1),unsigned int,x1) * store(&(a.w2),unsigned int,x2) * store(&(a.w3),unsigned int,x3) * store(&(a.w4),unsigned int,x4) * store(&(a.w5),unsigned int,x5) * store(&(a.w6),unsigned int,x6) * store(&(a.w7),unsigned int,x7) * store(&(a.w8),unsigned int,x8) * store(&(a.w9),unsigned int,x9) * store(&(a.w10),unsigned int,x10) * store(&(a.w11),unsigned int,x11) * store(&(a.w12),unsigned int,x12) * store(&(a.w13),unsigned int,x13) * store(&(a.w14),unsigned int,x14) * store(&(a.w15),unsigned int,x15) * store(&(a.w16),unsigned int,x16) * store(&(a.w17),unsigned int,x17) * store(&(a.w18),unsigned int,x18) * store(&(a.w19),unsigned int,x19) * store(&(a.w20),unsigned int,x20) * store(&(a.w21),unsigned int,x21) * store(&(a.w22),unsigned int,x22) * store(&(a.w23),unsigned int,x23) * store(&(a.w24),unsigned int,x24) * store(&(a.w25),unsigned int,x25) * store(&(a.w26),unsigned int,x26) * store(&(a.w27),unsigned int,x27) * store(&(a.w28),unsigned int,x28) * store(&(a.w29),unsigned int,x29) * store(&(a.w30),unsigned int,x30) * store(&(a.w31),unsigned int,x31) Ensure store(&(__return.w0),unsigned int,word_max(x0,x,vl,0)) * store(&(__return.w1),unsigned int,word_max(x1,x,vl,1)) * store(&(__return.w2),unsigned int,word_max(x2,x,vl,2)) * store(&(__return.w3),unsigned int,word_max(x3,x,vl,3)) * store(&(__return.w4),unsigned int,word_max(x4,x,vl,4)) * store(&(__return.w5),unsigned int,word_max(x5,x,vl,5)) * store(&(__return.w6),unsigned int,word_max(x6,x,vl,6)) * store(&(__return.w7),unsigned int,word_max(x7,x,vl,7)) * store(&(__return.w8),unsigned int,word_max(x8,x,vl,8)) * store(&(__return.w9),unsigned int,word_max(x9,x,vl,9)) * store(&(__return.w10),unsigned int,word_max(x10,x,vl,10)) * store(&(__return.w11),unsigned int,word_max(x11,x,vl,11)) * store(&(__return.w12),unsigned int,word_max(x12,x,vl,12)) * store(&(__return.w13),unsigned int,word_max(x13,x,vl,13)) * store(&(__return.w14),unsigned int,word_max(x14,x,vl,14)) * store(&(__return.w15),unsigned int,word_max(x15,x,vl,15)) * store(&(__return.w16),unsigned int,word_max(x16,x,vl,16)) * store(&(__return.w17),unsigned int,word_max(x17,x,vl,17)) * store(&(__return.w18),unsigned int,word_max(x18,x,vl,18)) * store(&(__return.w19),unsigned int,word_max(x19,x,vl,19)) * store(&(__return.w20),unsigned int,word_max(x20,x,vl,20)) * store(&(__return.w21),unsigned int,word_max(x21,x,vl,21)) * store(&(__return.w22),unsigned int,word_max(x22,x,vl,22)) * store(&(__return.w23),unsigned int,word_max(x23,x,vl,23)) * store(&(__return.w24),unsigned int,word_max(x24,x,vl,24)) * store(&(__return.w25),unsigned int,word_max(x25,x,vl,25)) * store(&(__return.w26),unsigned int,word_max(x26,x,vl,26)) * store(&(__return.w27),unsigned int,word_max(x27,x,vl,27)) * store(&(__return.w28),unsigned int,word_max(x28,x,vl,28)) * store(&(__return.w29),unsigned int,word_max(x29,x,vl,29)) * store(&(__return.w30),unsigned int,word_max(x30,x,vl,30)) * store(&(__return.w31),unsigned int,word_max(x31,x,vl,31)) */
{vuint8m8_t r;r.w0=qcp_word_max(a.w0,x,vl,0);
r.w1=qcp_word_max(a.w1,x,vl,1);
r.w2=qcp_word_max(a.w2,x,vl,2);
r.w3=qcp_word_max(a.w3,x,vl,3);
r.w4=qcp_word_max(a.w4,x,vl,4);
r.w5=qcp_word_max(a.w5,x,vl,5);
r.w6=qcp_word_max(a.w6,x,vl,6);
r.w7=qcp_word_max(a.w7,x,vl,7);
r.w8=qcp_word_max(a.w8,x,vl,8);
r.w9=qcp_word_max(a.w9,x,vl,9);
r.w10=qcp_word_max(a.w10,x,vl,10);
r.w11=qcp_word_max(a.w11,x,vl,11);
r.w12=qcp_word_max(a.w12,x,vl,12);
r.w13=qcp_word_max(a.w13,x,vl,13);
r.w14=qcp_word_max(a.w14,x,vl,14);
r.w15=qcp_word_max(a.w15,x,vl,15);
r.w16=qcp_word_max(a.w16,x,vl,16);
r.w17=qcp_word_max(a.w17,x,vl,17);
r.w18=qcp_word_max(a.w18,x,vl,18);
r.w19=qcp_word_max(a.w19,x,vl,19);
r.w20=qcp_word_max(a.w20,x,vl,20);
r.w21=qcp_word_max(a.w21,x,vl,21);
r.w22=qcp_word_max(a.w22,x,vl,22);
r.w23=qcp_word_max(a.w23,x,vl,23);
r.w24=qcp_word_max(a.w24,x,vl,24);
r.w25=qcp_word_max(a.w25,x,vl,25);
r.w26=qcp_word_max(a.w26,x,vl,26);
r.w27=qcp_word_max(a.w27,x,vl,27);
r.w28=qcp_word_max(a.w28,x,vl,28);
r.w29=qcp_word_max(a.w29,x,vl,29);
r.w30=qcp_word_max(a.w30,x,vl,30);
r.w31=qcp_word_max(a.w31,x,vl,31);
return r;}
uint32_t qcp_get_word(const vuint8m8_t*a,size_t i)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (x8:Z) (x9:Z) (x10:Z) (x11:Z) (x12:Z) (x13:Z) (x14:Z) (x15:Z) (x16:Z) (x17:Z) (x18:Z) (x19:Z) (x20:Z) (x21:Z) (x22:Z) (x23:Z) (x24:Z) (x25:Z) (x26:Z) (x27:Z) (x28:Z) (x29:Z) (x30:Z) (x31:Z) Require 0<=i && i<32 && store(&(a->w0),unsigned int,x0) * store(&(a->w1),unsigned int,x1) * store(&(a->w2),unsigned int,x2) * store(&(a->w3),unsigned int,x3) * store(&(a->w4),unsigned int,x4) * store(&(a->w5),unsigned int,x5) * store(&(a->w6),unsigned int,x6) * store(&(a->w7),unsigned int,x7) * store(&(a->w8),unsigned int,x8) * store(&(a->w9),unsigned int,x9) * store(&(a->w10),unsigned int,x10) * store(&(a->w11),unsigned int,x11) * store(&(a->w12),unsigned int,x12) * store(&(a->w13),unsigned int,x13) * store(&(a->w14),unsigned int,x14) * store(&(a->w15),unsigned int,x15) * store(&(a->w16),unsigned int,x16) * store(&(a->w17),unsigned int,x17) * store(&(a->w18),unsigned int,x18) * store(&(a->w19),unsigned int,x19) * store(&(a->w20),unsigned int,x20) * store(&(a->w21),unsigned int,x21) * store(&(a->w22),unsigned int,x22) * store(&(a->w23),unsigned int,x23) * store(&(a->w24),unsigned int,x24) * store(&(a->w25),unsigned int,x25) * store(&(a->w26),unsigned int,x26) * store(&(a->w27),unsigned int,x27) * store(&(a->w28),unsigned int,x28) * store(&(a->w29),unsigned int,x29) * store(&(a->w30),unsigned int,x30) * store(&(a->w31),unsigned int,x31) Ensure store(&(a->w0),unsigned int,x0) * store(&(a->w1),unsigned int,x1) * store(&(a->w2),unsigned int,x2) * store(&(a->w3),unsigned int,x3) * store(&(a->w4),unsigned int,x4) * store(&(a->w5),unsigned int,x5) * store(&(a->w6),unsigned int,x6) * store(&(a->w7),unsigned int,x7) * store(&(a->w8),unsigned int,x8) * store(&(a->w9),unsigned int,x9) * store(&(a->w10),unsigned int,x10) * store(&(a->w11),unsigned int,x11) * store(&(a->w12),unsigned int,x12) * store(&(a->w13),unsigned int,x13) * store(&(a->w14),unsigned int,x14) * store(&(a->w15),unsigned int,x15) * store(&(a->w16),unsigned int,x16) * store(&(a->w17),unsigned int,x17) * store(&(a->w18),unsigned int,x18) * store(&(a->w19),unsigned int,x19) * store(&(a->w20),unsigned int,x20) * store(&(a->w21),unsigned int,x21) * store(&(a->w22),unsigned int,x22) * store(&(a->w23),unsigned int,x23) * store(&(a->w24),unsigned int,x24) * store(&(a->w25),unsigned int,x25) * store(&(a->w26),unsigned int,x26) * store(&(a->w27),unsigned int,x27) * store(&(a->w28),unsigned int,x28) * store(&(a->w29),unsigned int,x29) * store(&(a->w30),unsigned int,x30) * store(&(a->w31),unsigned int,x31) * (__return==(cons(x0,cons(x1,cons(x2,cons(x3,cons(x4,cons(x5,cons(x6,cons(x7,cons(x8,cons(x9,cons(x10,cons(x11,cons(x12,cons(x13,cons(x14,cons(x15,cons(x16,cons(x17,cons(x18,cons(x19,cons(x20,cons(x21,cons(x22,cons(x23,cons(x24,cons(x25,cons(x26,cons(x27,cons(x28,cons(x29,cons(x30,cons(x31,nil)))))))))))))))))))))))))))))))))[i]) */
{if(i==0)return a->w0;
if(i==1)return a->w1;
if(i==2)return a->w2;
if(i==3)return a->w3;
if(i==4)return a->w4;
if(i==5)return a->w5;
if(i==6)return a->w6;
if(i==7)return a->w7;
if(i==8)return a->w8;
if(i==9)return a->w9;
if(i==10)return a->w10;
if(i==11)return a->w11;
if(i==12)return a->w12;
if(i==13)return a->w13;
if(i==14)return a->w14;
if(i==15)return a->w15;
if(i==16)return a->w16;
if(i==17)return a->w17;
if(i==18)return a->w18;
if(i==19)return a->w19;
if(i==20)return a->w20;
if(i==21)return a->w21;
if(i==22)return a->w22;
if(i==23)return a->w23;
if(i==24)return a->w24;
if(i==25)return a->w25;
if(i==26)return a->w26;
if(i==27)return a->w27;
if(i==28)return a->w28;
if(i==29)return a->w29;
if(i==30)return a->w30;
return a->w31;}
unsigned char qcp_get_byte(const vuint8m8_t*a,size_t i)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (x8:Z) (x9:Z) (x10:Z) (x11:Z) (x12:Z) (x13:Z) (x14:Z) (x15:Z) (x16:Z) (x17:Z) (x18:Z) (x19:Z) (x20:Z) (x21:Z) (x22:Z) (x23:Z) (x24:Z) (x25:Z) (x26:Z) (x27:Z) (x28:Z) (x29:Z) (x30:Z) (x31:Z) Require 0<=i && i<128 && store(&(a->w0),unsigned int,x0) * store(&(a->w1),unsigned int,x1) * store(&(a->w2),unsigned int,x2) * store(&(a->w3),unsigned int,x3) * store(&(a->w4),unsigned int,x4) * store(&(a->w5),unsigned int,x5) * store(&(a->w6),unsigned int,x6) * store(&(a->w7),unsigned int,x7) * store(&(a->w8),unsigned int,x8) * store(&(a->w9),unsigned int,x9) * store(&(a->w10),unsigned int,x10) * store(&(a->w11),unsigned int,x11) * store(&(a->w12),unsigned int,x12) * store(&(a->w13),unsigned int,x13) * store(&(a->w14),unsigned int,x14) * store(&(a->w15),unsigned int,x15) * store(&(a->w16),unsigned int,x16) * store(&(a->w17),unsigned int,x17) * store(&(a->w18),unsigned int,x18) * store(&(a->w19),unsigned int,x19) * store(&(a->w20),unsigned int,x20) * store(&(a->w21),unsigned int,x21) * store(&(a->w22),unsigned int,x22) * store(&(a->w23),unsigned int,x23) * store(&(a->w24),unsigned int,x24) * store(&(a->w25),unsigned int,x25) * store(&(a->w26),unsigned int,x26) * store(&(a->w27),unsigned int,x27) * store(&(a->w28),unsigned int,x28) * store(&(a->w29),unsigned int,x29) * store(&(a->w30),unsigned int,x30) * store(&(a->w31),unsigned int,x31) Ensure store(&(a->w0),unsigned int,x0) * store(&(a->w1),unsigned int,x1) * store(&(a->w2),unsigned int,x2) * store(&(a->w3),unsigned int,x3) * store(&(a->w4),unsigned int,x4) * store(&(a->w5),unsigned int,x5) * store(&(a->w6),unsigned int,x6) * store(&(a->w7),unsigned int,x7) * store(&(a->w8),unsigned int,x8) * store(&(a->w9),unsigned int,x9) * store(&(a->w10),unsigned int,x10) * store(&(a->w11),unsigned int,x11) * store(&(a->w12),unsigned int,x12) * store(&(a->w13),unsigned int,x13) * store(&(a->w14),unsigned int,x14) * store(&(a->w15),unsigned int,x15) * store(&(a->w16),unsigned int,x16) * store(&(a->w17),unsigned int,x17) * store(&(a->w18),unsigned int,x18) * store(&(a->w19),unsigned int,x19) * store(&(a->w20),unsigned int,x20) * store(&(a->w21),unsigned int,x21) * store(&(a->w22),unsigned int,x22) * store(&(a->w23),unsigned int,x23) * store(&(a->w24),unsigned int,x24) * store(&(a->w25),unsigned int,x25) * store(&(a->w26),unsigned int,x26) * store(&(a->w27),unsigned int,x27) * store(&(a->w28),unsigned int,x28) * store(&(a->w29),unsigned int,x29) * store(&(a->w30),unsigned int,x30) * store(&(a->w31),unsigned int,x31) * (__return==vec_byte(cons(x0,cons(x1,cons(x2,cons(x3,cons(x4,cons(x5,cons(x6,cons(x7,cons(x8,cons(x9,cons(x10,cons(x11,cons(x12,cons(x13,cons(x14,cons(x15,cons(x16,cons(x17,cons(x18,cons(x19,cons(x20,cons(x21,cons(x22,cons(x23,cons(x24,cons(x25,cons(x26,cons(x27,cons(x28,cons(x29,cons(x30,cons(x31,nil)))))))))))))))))))))))))))))))),i)) */
{return qcp_word_byte(qcp_get_word(a,i/4),(uint32_t)(i%4));}
void qcp_rvv_store(unsigned char*p,const vuint8m8_t*a,size_t vl)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (x8:Z) (x9:Z) (x10:Z) (x11:Z) (x12:Z) (x13:Z) (x14:Z) (x15:Z) (x16:Z) (x17:Z) (x18:Z) (x19:Z) (x20:Z) (x21:Z) (x22:Z) (x23:Z) (x24:Z) (x25:Z) (x26:Z) (x27:Z) (x28:Z) (x29:Z) (x30:Z) (x31:Z) (n:Z) Require 0<vl && vl<=128 && vl<=n && n<=18446744073709551615 && store(&(a->w0),unsigned int,x0) * store(&(a->w1),unsigned int,x1) * store(&(a->w2),unsigned int,x2) * store(&(a->w3),unsigned int,x3) * store(&(a->w4),unsigned int,x4) * store(&(a->w5),unsigned int,x5) * store(&(a->w6),unsigned int,x6) * store(&(a->w7),unsigned int,x7) * store(&(a->w8),unsigned int,x8) * store(&(a->w9),unsigned int,x9) * store(&(a->w10),unsigned int,x10) * store(&(a->w11),unsigned int,x11) * store(&(a->w12),unsigned int,x12) * store(&(a->w13),unsigned int,x13) * store(&(a->w14),unsigned int,x14) * store(&(a->w15),unsigned int,x15) * store(&(a->w16),unsigned int,x16) * store(&(a->w17),unsigned int,x17) * store(&(a->w18),unsigned int,x18) * store(&(a->w19),unsigned int,x19) * store(&(a->w20),unsigned int,x20) * store(&(a->w21),unsigned int,x21) * store(&(a->w22),unsigned int,x22) * store(&(a->w23),unsigned int,x23) * store(&(a->w24),unsigned int,x24) * store(&(a->w25),unsigned int,x25) * store(&(a->w26),unsigned int,x26) * store(&(a->w27),unsigned int,x27) * store(&(a->w28),unsigned int,x28) * store(&(a->w29),unsigned int,x29) * store(&(a->w30),unsigned int,x30) * store(&(a->w31),unsigned int,x31) * UCharArray::undef_seg(p,0,n) Ensure store(&(a->w0),unsigned int,x0) * store(&(a->w1),unsigned int,x1) * store(&(a->w2),unsigned int,x2) * store(&(a->w3),unsigned int,x3) * store(&(a->w4),unsigned int,x4) * store(&(a->w5),unsigned int,x5) * store(&(a->w6),unsigned int,x6) * store(&(a->w7),unsigned int,x7) * store(&(a->w8),unsigned int,x8) * store(&(a->w9),unsigned int,x9) * store(&(a->w10),unsigned int,x10) * store(&(a->w11),unsigned int,x11) * store(&(a->w12),unsigned int,x12) * store(&(a->w13),unsigned int,x13) * store(&(a->w14),unsigned int,x14) * store(&(a->w15),unsigned int,x15) * store(&(a->w16),unsigned int,x16) * store(&(a->w17),unsigned int,x17) * store(&(a->w18),unsigned int,x18) * store(&(a->w19),unsigned int,x19) * store(&(a->w20),unsigned int,x20) * store(&(a->w21),unsigned int,x21) * store(&(a->w22),unsigned int,x22) * store(&(a->w23),unsigned int,x23) * store(&(a->w24),unsigned int,x24) * store(&(a->w25),unsigned int,x25) * store(&(a->w26),unsigned int,x26) * store(&(a->w27),unsigned int,x27) * store(&(a->w28),unsigned int,x28) * store(&(a->w29),unsigned int,x29) * store(&(a->w30),unsigned int,x30) * store(&(a->w31),unsigned int,x31) * UCharArray::full(p,vl,sublist(0,vl,vec_bytes(cons(x0,cons(x1,cons(x2,cons(x3,cons(x4,cons(x5,cons(x6,cons(x7,cons(x8,cons(x9,cons(x10,cons(x11,cons(x12,cons(x13,cons(x14,cons(x15,cons(x16,cons(x17,cons(x18,cons(x19,cons(x20,cons(x21,cons(x22,cons(x23,cons(x24,cons(x25,cons(x26,cons(x27,cons(x28,cons(x29,cons(x30,cons(x31,nil))))))))))))))))))))))))))))))))))) * UCharArray::undef_full(p+vl,n-vl) */
{size_t i;
/*@ Inv 0<=i && i<=vl && vl==vl@pre && p==p@pre && a==a@pre && 0<vl && vl<=128 && vl<=n && n<=18446744073709551615 && store(&(a->w0),unsigned int,x0) * store(&(a->w1),unsigned int,x1) * store(&(a->w2),unsigned int,x2) * store(&(a->w3),unsigned int,x3) * store(&(a->w4),unsigned int,x4) * store(&(a->w5),unsigned int,x5) * store(&(a->w6),unsigned int,x6) * store(&(a->w7),unsigned int,x7) * store(&(a->w8),unsigned int,x8) * store(&(a->w9),unsigned int,x9) * store(&(a->w10),unsigned int,x10) * store(&(a->w11),unsigned int,x11) * store(&(a->w12),unsigned int,x12) * store(&(a->w13),unsigned int,x13) * store(&(a->w14),unsigned int,x14) * store(&(a->w15),unsigned int,x15) * store(&(a->w16),unsigned int,x16) * store(&(a->w17),unsigned int,x17) * store(&(a->w18),unsigned int,x18) * store(&(a->w19),unsigned int,x19) * store(&(a->w20),unsigned int,x20) * store(&(a->w21),unsigned int,x21) * store(&(a->w22),unsigned int,x22) * store(&(a->w23),unsigned int,x23) * store(&(a->w24),unsigned int,x24) * store(&(a->w25),unsigned int,x25) * store(&(a->w26),unsigned int,x26) * store(&(a->w27),unsigned int,x27) * store(&(a->w28),unsigned int,x28) * store(&(a->w29),unsigned int,x29) * store(&(a->w30),unsigned int,x30) * store(&(a->w31),unsigned int,x31) * UCharArray::seg(p,0,i,sublist(0,i,vec_bytes(cons(x0,cons(x1,cons(x2,cons(x3,cons(x4,cons(x5,cons(x6,cons(x7,cons(x8,cons(x9,cons(x10,cons(x11,cons(x12,cons(x13,cons(x14,cons(x15,cons(x16,cons(x17,cons(x18,cons(x19,cons(x20,cons(x21,cons(x22,cons(x23,cons(x24,cons(x25,cons(x26,cons(x27,cons(x28,cons(x29,cons(x30,cons(x31,nil))))))))))))))))))))))))))))))))))) * UCharArray::undef_seg(p,i,n) */
for(i=0;i<vl;++i)p[i]=qcp_get_byte(a,i);
}
#define __riscv_vse8_v_u8m8(p,a,vl) {vuint8m8_t qcp_tmp; qcp_tmp=(a);qcp_rvv_store((p),&qcp_tmp,(vl));}
