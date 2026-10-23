#include "lrelu_rvv_vectors.h"
#include "rvv_active.h"
#include "rvv_arithmetic.h"
#include "rvv_memory.h"
#include "program_model.h"
#include "control.h"
#define __RISCV_VXRM_RNU 0
#define __RISCV_VXRM_RDN 2
/*@ include strategies "rvv_kernel.strategies" */
