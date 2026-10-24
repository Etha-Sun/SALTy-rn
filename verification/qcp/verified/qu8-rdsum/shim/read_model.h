#ifndef RDSUM_READ_MODEL_H
#define RDSUM_READ_MODEL_H
#include "formal_model.h"
/*@ Import Coq Require Import Qu8Rdsum.MemoryModel */
/*@ Extern Coq (RDMap :: *) */
/*@ Extern Coq (rd_mem:RDMap -> Assertion)
 (rd_get:RDMap -> Z -> Z)
 (rd_present:RDMap -> Z -> Prop)
 (rd_remove:RDMap -> Z -> RDMap)
 (rd_window:RDMap -> Z -> Z -> Prop) */
uint8_t rdsum_read_byte(const uint8_t *p)
/*@ With (M:RDMap)
 Require p!=0 && rd_present(M,p) && rd_mem(M)
 Ensure __return==rd_get(M,p) && 0<=__return && __return<=255 && rd_mem(M) */;
#endif
