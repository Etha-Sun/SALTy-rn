#include "neon_api.h"
#include "program_model.h"
/*@ Import Coq Require Import S8Clamp.NeonFacts */
/*@ Extern Coq (s8_bulk_prefix:Z -> Z -> Z -> list Z -> list Z) (s8_tail_prefix:Z -> Z -> Z -> Z -> list Z -> list Z) */
/*@ Extern Coq (s8_bulk_count:Z -> Z) (Zlength:{A} -> list A -> Z) */
/*@ include strategies "s8_neon_memory.strategies" */
/*@ Extern Coq (s8_bulk_lane:Z -> Z -> Z -> Z) (s8_tail_lane:Z -> Z -> Z -> Z) */
