#include "tuple_types.h"
/* Ordinary C representation probes. These are not intrinsic exemptions. */
uint32_t pw_tuple_first(const uint32x2x2_t*p)
/*@ With a0 a1 b0 b1
 Require store(field_addr(pointer_offset(&(p->val),0,struct uint32x2_t),uint32x2_t,s0),unsigned int,a0) * store(field_addr(pointer_offset(&(p->val),0,struct uint32x2_t),uint32x2_t,s1),unsigned int,a1) * store(field_addr(pointer_offset(&(p->val),1,struct uint32x2_t),uint32x2_t,s0),unsigned int,b0) * store(field_addr(pointer_offset(&(p->val),1,struct uint32x2_t),uint32x2_t,s1),unsigned int,b1)
 Ensure __return==a0 && store(field_addr(pointer_offset(&(p->val),0,struct uint32x2_t),uint32x2_t,s0),unsigned int,a0) * store(field_addr(pointer_offset(&(p->val),0,struct uint32x2_t),uint32x2_t,s1),unsigned int,a1) * store(field_addr(pointer_offset(&(p->val),1,struct uint32x2_t),uint32x2_t,s0),unsigned int,b0) * store(field_addr(pointer_offset(&(p->val),1,struct uint32x2_t),uint32x2_t,s1),unsigned int,b1) */
{return p->val[0].s0;}

uint32x2x2_t pw_tuple_copy(const uint32x2x2_t*p)
/*@ With a0 a1 b0 b1
 Require store(field_addr(pointer_offset(&(p->val),0,struct uint32x2_t),uint32x2_t,s0),unsigned int,a0) * store(field_addr(pointer_offset(&(p->val),0,struct uint32x2_t),uint32x2_t,s1),unsigned int,a1) * store(field_addr(pointer_offset(&(p->val),1,struct uint32x2_t),uint32x2_t,s0),unsigned int,b0) * store(field_addr(pointer_offset(&(p->val),1,struct uint32x2_t),uint32x2_t,s1),unsigned int,b1)
 Ensure store(field_addr(pointer_offset(&(p->val),0,struct uint32x2_t),uint32x2_t,s0),unsigned int,a0) * store(field_addr(pointer_offset(&(p->val),0,struct uint32x2_t),uint32x2_t,s1),unsigned int,a1) * store(field_addr(pointer_offset(&(p->val),1,struct uint32x2_t),uint32x2_t,s0),unsigned int,b0) * store(field_addr(pointer_offset(&(p->val),1,struct uint32x2_t),uint32x2_t,s1),unsigned int,b1) * store(field_addr(pointer_offset(&(__return.val),0,struct uint32x2_t),uint32x2_t,s0),unsigned int,a0) * store(field_addr(pointer_offset(&(__return.val),0,struct uint32x2_t),uint32x2_t,s1),unsigned int,a1) * store(field_addr(pointer_offset(&(__return.val),1,struct uint32x2_t),uint32x2_t,s0),unsigned int,b0) * store(field_addr(pointer_offset(&(__return.val),1,struct uint32x2_t),uint32x2_t,s1),unsigned int,b1) */
{uint32x2x2_t v=*p;return v;}
