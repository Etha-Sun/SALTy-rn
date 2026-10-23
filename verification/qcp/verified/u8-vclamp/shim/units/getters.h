typedef unsigned long long size_t;
typedef unsigned char uint8_t;
typedef unsigned int uint32_t;
typedef struct vuint8m8_t {uint32_t w0;uint32_t w1;uint32_t w2;uint32_t w3;uint32_t w4;uint32_t w5;uint32_t w6;uint32_t w7;uint32_t w8;uint32_t w9;uint32_t w10;uint32_t w11;uint32_t w12;uint32_t w13;uint32_t w14;uint32_t w15;uint32_t w16;uint32_t w17;uint32_t w18;uint32_t w19;uint32_t w20;uint32_t w21;uint32_t w22;uint32_t w23;uint32_t w24;uint32_t w25;uint32_t w26;uint32_t w27;uint32_t w28;uint32_t w29;uint32_t w30;uint32_t w31;} vuint8m8_t;
/*@ Import Coq Require Import FullU8.Packed32Model */
/*@ Extern Coq (word_byte:Z->Z->Z) (vec_byte:list Z->Z->Z) */
unsigned char qcp_word_byte(uint32_t w,uint32_t lane)
/*@ Require 0<=lane && lane<4 Ensure __return==word_byte(w,lane) && 0<=__return && __return<=255 */
;
/* QCP_BODY:qcp_get_word */

/* QCP_BODY:qcp_get_byte */

