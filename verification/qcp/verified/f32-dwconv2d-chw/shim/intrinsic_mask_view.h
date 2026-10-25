#ifndef DWCHW_INTRINSIC_MASK_VIEW_H
#define DWCHW_INTRINSIC_MASK_VIEW_H
#include "types_def.h"
/*@ Import Coq Require Import DwChw.Mask7Model */
/*@ Extern Coq (dw_mask7_word:Z->Z->Z) */
/* Context-specialized original vld1q_u32 boundary: the unescaped seven-int32
 * table remains singly owned; four32-bit unsigned load words are observed.
 * Signed -1 has all32 bits set under the explicit int32 representation.
 * No C body or formal physical-ISA/ABI refinement credit is claimed. */
uint32x4_t dw_isa_mask7(const uint32_t *p)
/*@ With (base:Z) (index:Z) Require 0<=index && index<=3 && p==pointer_offset(base,index,int) && store(pointer_offset(base,0,int),int,-1) * store(pointer_offset(base,1,int),int,-1) * store(pointer_offset(base,2,int),int,-1) * store(pointer_offset(base,3,int),int,-1) * store(pointer_offset(base,4,int),int,0) * store(pointer_offset(base,5,int),int,0) * store(pointer_offset(base,6,int),int,0) Ensure store(pointer_offset(base,0,int),int,-1) * store(pointer_offset(base,1,int),int,-1) * store(pointer_offset(base,2,int),int,-1) * store(pointer_offset(base,3,int),int,-1) * store(pointer_offset(base,4,int),int,0) * store(pointer_offset(base,5,int),int,0) * store(pointer_offset(base,6,int),int,0) * store(&(__return.s0),unsigned int,dw_mask7_word(index,0)) * store(&(__return.s1),unsigned int,dw_mask7_word(index,1)) * store(&(__return.s2),unsigned int,dw_mask7_word(index,2)) * store(&(__return.s3),unsigned int,dw_mask7_word(index,3)) */;

/* Array-owner presentation of the same original four-word read. L is the
   unchanged seven-cell signed table, not a second resource or a new domain. */
/*@ Extern Coq (dw_mask7_values:list Z) */
uint32x4_t dw_isa_mask7_array(const uint32_t *p)
/*@ With (base:Z) (index:Z) (L:list Z)
 Require 0<=index && index<=3 && L==dw_mask7_values && p==pointer_offset(base,index,int) && IntArray::full(base,7,L)
 Ensure IntArray::full(base,7,L) * store(&(__return.s0),unsigned int,dw_mask7_word(index,0)) * store(&(__return.s1),unsigned int,dw_mask7_word(index,1)) * store(&(__return.s2),unsigned int,dw_mask7_word(index,2)) * store(&(__return.s3),unsigned int,dw_mask7_word(index,3)) */;
#endif
