#include "rvv_memory.h"
#include "rvv_arithmetic.h"
#include "setvl.h"
#include "program_model.h"
#include "control.h"
/*@ Extern Coq (qa_negword:Z -> Z) (qa_ctrl:Z -> Z) */
#define __riscv_vse8_v_i8m2(p,a,vl) qcp_qa_rvv_store32((p),&(a),(vl))
