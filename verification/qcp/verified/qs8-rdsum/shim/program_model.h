#ifndef RDSUM_PROGRAM_MODEL_H
#define RDSUM_PROGRAM_MODEL_H
#include "output_vector.h"
#include "read_model.h"
/*@ Import Coq Require Import Qs8Rdsum.ProgramModel */
/*@ Extern Coq (rd_results:RDMap -> Z -> Z -> Z -> Z -> list Z -> list Z)
 (rd_inputs:RDMap -> Z -> Z -> Z -> Z -> Prop)
 (rd_zero_condition:RDMap -> Z -> Z -> Z -> Prop)
 (rd_column:RDMap -> Z -> Z -> Z -> Z -> Z) */
int rdsum_equal_i32(size_t n,const int32_t *left,const int32_t *right)
/*@ With (L:list Z)
 Require 0<=n && n<=4611686018427387903 && IntArray::full(left,n,L) * IntArray::full(right,n,L)
 Ensure __return==1 && IntArray::full(left,n,L) * IntArray::full(right,n,L) */;
#endif
