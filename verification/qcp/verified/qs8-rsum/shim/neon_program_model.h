#ifndef RSUM_NEON_PROGRAM_MODEL_H
#define RSUM_NEON_PROGRAM_MODEL_H
#include "array_model.h"
/*@ Import Coq Require Import Qs8Rsum.NeonProgramModel */
/*@ Extern Coq (rs_prefix:list Z -> Z -> Z) (rs_acc_total:Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z) */
/*@ Extern Coq (rs_sum4:Z -> Z -> Z -> Z -> Z) (rs_sum8:Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z) (rs_rem2048:Z -> Z) (rs_mod16:Z -> Z) (rs_count16:Z -> Z) (rs_onemask:list Z) */
struct xnn_qs8_rsum_params { char _; };
#endif
