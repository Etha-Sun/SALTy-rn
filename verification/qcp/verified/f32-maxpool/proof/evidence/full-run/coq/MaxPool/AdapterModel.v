From Coq Require Import ZArith.
From MaxPool Require Export VectorModel.
Local Open Scope Z_scope.
(* One active lane of the actual shim/propagate.c integer-mask/merge chain.
   The arithmetic ISA specs remain the separate original definitions. *)
Definition mp_propagate_pipeline(a b numeric:fp32):fp32:=
 let ua:=bits_of_fp32 a in let ub:=bits_of_fp32 b in
 let aa:=mp_land ua 2147483647 in let ab:=mp_land ub 2147483647 in
 let na:=mp_bit_gt aa 2139095040 in let nb:=mp_bit_gt ab 2139095040 in
 let ba:=mp_land ua 4194304 in let bb:=mp_land ub 4194304 in
 let za:=mp_bit_eq ba 0 in let zb:=mp_bit_eq bb 0 in
 let sa:=mp_mask_and na za in let sb:=mp_mask_and nb zb in
 let qa:=mp_lor ua 4194304 in let qb:=mp_lor ub 4194304 in
 let fa:=fp32_of_bits qa in let fb:=fp32_of_bits qb in
 let r0:=mp_float_merge numeric fb nb in
 let r1:=mp_float_merge r0 fa na in
 let r2:=mp_float_merge r1 fb sb in
 mp_float_merge r2 fa sa.
