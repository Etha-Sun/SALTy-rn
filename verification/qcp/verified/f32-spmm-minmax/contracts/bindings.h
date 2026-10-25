#ifndef SPMM_CONTRACT_BINDINGS_H
#define SPMM_CONTRACT_BINDINGS_H
#include "../shim/types.h"
/*@ Import Coq Require Import SpmmSpec.Memory */
/*@ Extern Coq
 (spmm_shape:Z -> Z -> Z -> list Z -> list Z -> list fp32 -> list fp32 -> Prop)
 (spmm_capacity:Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> list Z -> list Z -> list fp32 -> list fp32 -> Prop)
 (spmm_output:Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> list Z -> list Z -> list fp32 -> list fp32 -> fp32 -> fp32 -> Assertion)
 (spmm_output_hole:Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> list Z -> list Z -> list fp32 -> list fp32 -> fp32 -> fp32 -> Assertion)
 (spmm_acc:Z -> Z -> Z -> Z -> list Z -> list Z -> list fp32 -> list fp32 -> fp32)
 (spmm_cell:Z -> Z -> Z -> list Z -> list Z -> list fp32 -> list fp32 -> fp32 -> fp32 -> fp32)
 (spmm_column_prefix:Z -> Z -> Z -> list Z -> list Z -> list fp32 -> list fp32 -> fp32 -> fp32 -> list fp32)
 (IntArray::full:Z -> Z -> list Z -> Assertion)
 (UIntArray::full:Z -> Z -> list Z -> Assertion)
 (FloatArray::missing_i:Z -> Z -> Z -> Z -> list fp32 -> Assertion)
 (prefix_sum:list Z -> Z -> Z) (nnz_before:list Z -> Z -> Z)
 (bias_index:list Z -> Z -> Z) (input_index:list Z -> Z -> Z -> Z -> Z)
 (fp_at:list fp32 -> Z -> fp32) (z_at:list Z -> Z -> Z)
 (word64:Z -> Z) (modulus64:Z)
 (spmm_output_cursor:Z -> Z -> Z -> Z -> Z)
*/
#endif
