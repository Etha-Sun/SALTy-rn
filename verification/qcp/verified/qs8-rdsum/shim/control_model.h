#ifndef RDSUM_CONTROL_MODEL_H
#define RDSUM_CONTROL_MODEL_H
#include "formal_model.h"
/*@ Import Coq Require Import Qs8Rdsum.ControlModel */
/*@ Extern Coq (rd_min252:Z -> Z) (rd_ceil252:Z -> Z) */
int rdsum_min252(size_t r)
/*@ Require 0<=r && r<=18446744073709551615 && emp Ensure __return==rd_min252(r) && 0<=__return && __return<=252 && emp */;
size_t rdsum_ceil252(size_t r)
/*@ Require 0<=r && r<=18446744073709551615 && emp Ensure __return==rd_ceil252(r) && 0<=__return && __return<=r && emp */;
#endif
