typedef unsigned long long size_t;
typedef unsigned char uint8_t;
typedef unsigned int uint32_t;
/*@ Import Coq Require Import FullU8.U8Logic FullU8.Packed32Model */
/*@ Extern Coq (pack4:Z->Z->Z->Z->Z) (word_byte:Z->Z->Z) (u8_min:Z->Z->Z) (u8_max:Z->Z->Z) (active_min:Z->Z->Z->Z->Z) (active_max:Z->Z->Z->Z->Z) (word_min:Z->Z->Z->Z->Z) (word_max:Z->Z->Z->Z->Z) */
uint32_t qcp_pack4(unsigned char a,unsigned char b,unsigned char c,unsigned char d)
/*@ Require 0<=a && a<=255 && 0<=b && b<=255 && 0<=c && c<=255 && 0<=d && d<=255 Ensure __return==pack4(a,b,c,d) && 0<=__return && __return<=4294967295 */
;
unsigned char qcp_word_byte(uint32_t w,uint32_t lane)
/*@ Require 0<=lane && lane<4 Ensure __return==word_byte(w,lane) && 0<=__return && __return<=255 */
;
/* QCP_BODY:qcp_u8_min */

/* QCP_BODY:qcp_u8_max */

/* QCP_BODY:qcp_active_min */

/* QCP_BODY:qcp_active_max */

/* QCP_BODY:qcp_word_min */

/* QCP_BODY:qcp_word_max */

