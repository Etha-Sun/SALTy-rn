typedef unsigned long long size_t;
typedef unsigned char uint8_t;
typedef unsigned int uint32_t;
#include "arrays.h"
/*@ Import Coq Require Import FullU8.Packed32Model */
/*@ Extern Coq (pack4:Z->Z->Z->Z->Z) (lane_load:list Z->Z->Z->Z) (word_load:list Z->Z->Z->Z) */
uint32_t qcp_pack4(unsigned char a,unsigned char b,unsigned char c,unsigned char d)
/*@ Require 0<=a && a<=255 && 0<=b && b<=255 && 0<=c && c<=255 && 0<=d && d<=255 Ensure __return==pack4(a,b,c,d) && 0<=__return && __return<=4294967295 */
;
/* QCP_BODY:qcp_load_lane */

/* QCP_BODY:qcp_load_word */

