From Coq Require Import ZArith Bool List Lia.
From MaxPool Require Export Bits.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
(* Bit-exact output values: Arm AH=DN=FZ=0, binary32; flags and traps
   are not observed. RVV maxNum/minNum remain separate from Arm propagation.
   A source-reviewed spec boundary is not an ISA refinement theorem. *)
Definition mp_abs_bits(u:Z):Z:=Z.land u 2147483647.
Definition mp_nan_bits(u:Z):bool:=Z.ltb 2139095040(mp_abs_bits u).
Definition mp_quiet_clear(u:Z):bool:=Z.eqb(Z.land u 4194304)0.
Definition mp_snan_bits(u:Z):bool:=andb(mp_nan_bits u)(mp_quiet_clear u).
Definition mp_quiet_bits(u:Z):Z:=Z.lor u 4194304.
Definition mp_key(u:Z):Z:=if Z.eqb(Z.land u 2147483648)0 then Z.lxor u 2147483648 else Z.lxor u 4294967295.
Definition mp_ordered_bits(minimum:bool)(a b:Z):Z:=
 if andb(Z.eqb(mp_abs_bits a)0)(Z.eqb(mp_abs_bits b)0)
 then if minimum then Z.lor a b else Z.land a b
 else if (if minimum then Z.ltb(mp_key a)(mp_key b) else Z.ltb(mp_key b)(mp_key a)) then a else b.
Definition mp_arm_bits(minimum:bool)(a b:Z):Z:=
 if mp_snan_bits a then mp_quiet_bits a else
 if mp_snan_bits b then mp_quiet_bits b else
 if mp_nan_bits a then a else if mp_nan_bits b then b else mp_ordered_bits minimum a b.
Definition mp_rvv_bits(minimum:bool)(a b:Z):Z:=
 if mp_nan_bits a then if mp_nan_bits b then 2143289344 else b
 else if mp_nan_bits b then a else mp_ordered_bits minimum a b.
Definition mp_merge_bits(a b:Z)(mask:bool):Z:=if mask then b else a.
(* This is precisely the sequential mask/merge adapter, not a redefinition
   of either ISA's original extreme-value instruction. *)
Definition mp_restore_bits(a b numeric:Z):Z:=
 let r0:=mp_merge_bits numeric(mp_quiet_bits b)(mp_nan_bits b) in
 let r1:=mp_merge_bits r0(mp_quiet_bits a)(mp_nan_bits a) in
 let r2:=mp_merge_bits r1(mp_quiet_bits b)(mp_snan_bits b) in
 mp_merge_bits r2(mp_quiet_bits a)(mp_snan_bits a).
Definition mp_arm(minimum:bool)(a b:fp32):fp32:=fp32_of_bits(mp_arm_bits minimum(bits_of_fp32 a)(bits_of_fp32 b)).
Definition mp_rvv(minimum:bool)(a b:fp32):fp32:=fp32_of_bits(mp_rvv_bits minimum(bits_of_fp32 a)(bits_of_fp32 b)).
Definition mp_repaired(minimum:bool)(a b:fp32):fp32:=
 fp32_of_bits(mp_restore_bits(bits_of_fp32 a)(bits_of_fp32 b)(mp_rvv_bits minimum(bits_of_fp32 a)(bits_of_fp32 b))).
Definition mp_max:=mp_arm false.
Definition mp_min:=mp_arm true.
Definition mp_tree9(v:Z->fp32):fp32:=
 let a:=mp_max(v 0)(v 1) in let b:=mp_max a(v 8) in
 let c:=mp_max(v 2)(v 3) in let d:=mp_max(v 4)(v 5) in
 let e:=mp_max(v 6)(v 7) in mp_max(mp_max c d)(mp_max b e).
Definition mp_group(available:Z)(v:Z->fp32):fp32:=mp_tree9(fun j=>v(if Z.ltb j available then j else 0)).
Definition mp_first(lo hi group:fp32):fp32:=mp_min(mp_max group lo)hi.
Definition mp_more(hi prev group:fp32):fp32:=mp_min(mp_max prev group)hi.
Fixpoint mp_scan_more(hi acc:fp32)(groups:list fp32):fp32:=
 match groups with []=>acc|g::rest=>mp_scan_more hi(mp_more hi acc g)rest end.
Definition mp_observe(a b:fp32):Prop:=a=b.
Definition mp_remaining(k:Z):Z:=if Z.ltb 9 k then k-9 else 0.
(* VLEN=128, e32,m8 VLMAX=32. No inactive-lane value is asserted;
   every admissible strip-mining length is covered by the public contract. *)
Definition mp_vl_allowed(avl vl:Z):Prop:=
 (0<=avl<=32 /\ vl=avl) \/
 (32<avl<64 /\ (avl+1)/2<=vl<=32) \/
 (64<=avl /\ vl=32).
Definition mp_active_matches(v:list fp32)(value:Z->fp32)(vl:Z):Prop:=
 forall j,0<=j<vl->forall d,nth(Z.to_nat j)v d=value j.
