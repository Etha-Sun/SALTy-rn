From Coq Require Import ZArith Bool List Lia.
From SimpleC.SL Require Export Mem SeparationLogic.
From FMin Require Export Bits.
Local Open Scope Z_scope.

(* Exact binary32 representation operations. Arm and RVV retain separate
   NaN behavior; only their numeric ordering helper is shared. *)
Definition mm_abs_bits (u:Z) : Z := Z.land u 2147483647.
Definition mm_nan_bits (u:Z) : Z :=
 if Z.ltb 2139095040 (mm_abs_bits u) then 1 else 0.
Definition mm_snan_bits (u:Z) : Z :=
 if Z.eqb (mm_nan_bits u) 1 then
   if Z.eqb (Z.land u 4194304) 0 then 1 else 0
 else 0.
Definition mm_order_key (u:Z) : Z :=
 if Z.eqb (Z.land u 2147483648) 0
 then Z.lxor u 2147483648 else Z.lxor u 4294967295.
Definition mm_ordered_bits (a b:Z) : Z :=
 if andb (Z.eqb (mm_abs_bits a) 0) (Z.eqb (mm_abs_bits b) 0)
 then Z.lor a b
 else if Z.ltb (mm_order_key a) (mm_order_key b) then a else b.
Definition mm_arm_bits (a b:Z) : Z :=
 if Z.eqb (mm_snan_bits a) 1 then Z.lor a 4194304 else
 if Z.eqb (mm_snan_bits b) 1 then Z.lor b 4194304 else
 if Z.eqb (mm_nan_bits a) 1 then a else
 if Z.eqb (mm_nan_bits b) 1 then b else mm_ordered_bits a b.
Definition mm_rvv_bits (a b:Z) : Z :=
 if Z.eqb (mm_nan_bits a) 1 then
   if Z.eqb (mm_nan_bits b) 1 then 2143289344 else b
 else if Z.eqb (mm_nan_bits b) 1 then a else mm_ordered_bits a b.
Definition mm_arm (a b:fp32) : fp32 :=
 fp32_of_bits (mm_arm_bits (bits_of_fp32 a) (bits_of_fp32 b)).
Definition mm_rvv (a b:fp32) : fp32 :=
 fp32_of_bits (mm_rvv_bits (bits_of_fp32 a) (bits_of_fp32 b)).
Definition mm_canonical_nan : fp32 := fp32_of_bits 2143289344.
Definition mm_rvv_add (a b:fp32) : fp32 :=
 if orb (Z.eqb (mm_nan_bits (bits_of_fp32 a)) 1)
        (Z.eqb (mm_nan_bits (bits_of_fp32 b)) 1)
 then mm_canonical_nan
 else let r := fp32_add a b in
   if Z.eqb (mm_nan_bits (bits_of_fp32 r)) 1 then mm_canonical_nan else r.
Definition mm_rvv_ne (a b:fp32) : Z :=
 let ua := bits_of_fp32 a in let ub := bits_of_fp32 b in
 if orb (Z.eqb (mm_nan_bits ua) 1) (Z.eqb (mm_nan_bits ub) 1) then 1 else
 if andb (Z.eqb (mm_abs_bits ua) 0) (Z.eqb (mm_abs_bits ub) 0) then 0 else
 if Z.eqb ua ub then 0 else 1.
