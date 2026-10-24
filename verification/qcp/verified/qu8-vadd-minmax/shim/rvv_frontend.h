#include "rvv_memory.h"
#include "rvv_arithmetic.h"
#include "setvl.h"
#include "program_model.h"
#include "control.h"
/*@ Extern Coq (qu_negword:Z -> Z) (qu_ctrl:Z -> Z) */
#define __riscv_vse8_v_u8m2(p,a,vl) qcp_qu_rvv_store32((p),&(a),(vl))

/*@ include strategies "rvv_kernel.strategies" */

/*@ Import Coq Require Import Qu8Add.ControlFacts */
