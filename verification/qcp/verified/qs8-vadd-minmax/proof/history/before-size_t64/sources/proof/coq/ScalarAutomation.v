From Coq Require Export ZArith Lia Psatz.
From SimpleC.SL Require Export Mem SeparationLogic.
From Qs8Add Require Export ShiftFacts scalar_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma qa_half_bound : forall p, 0<=p -> 0<=p/2<=p.
Proof. intros p Hp;split;[apply Z.div_pos|apply Z.div_le_upper_bound];lia. Qed.
Ltac qa_half := match goal with H : 1 <= ?p |- _=>pose proof(qa_half_bound p ltac:(lia)) end.
Ltac qa_divfacts :=
 repeat match goal with
 | |-context[Z.div ?a ?d]=>
   let q:=fresh "quotient"in let E:=fresh "quotient_eq"in
   pose proof(Z.div_mod a d ltac:(lia));pose proof(Z.mod_pos_bound a d ltac:(lia));
   remember(a/d)as q eqn:E in *
 end.
Ltac qa_neon_reduce :=
 repeat match goal with |-context[qa_neon_shift ?a ?b]=>
 first[rewrite(qa_neon_left_out a b)by lia|rewrite(qa_neon_right_out a b)by lia|
 rewrite(qa_neon_left_power a b)by lia|rewrite(qa_neon_right_floor a b)by lia]
 end.
Ltac qa_pure := unfold derivable1,andp,coq_prop;intros;
 repeat first[assumption|split|reflexivity];try lia;try ring;try nia.
Ltac qa_core :=
 try qa_neon_reduce;
 repeat rewrite qa_rnu_floor in * by lia;
 repeat rewrite qa_rvv_sll_power in * by lia;
 unfold qa_neon_mul,qa_rvv_mul,qa_neon_mla,qa_rvv_macc,
 qa_neon_add16,qa_rvv_add16,qa_pow2,qa_floor in *;
 try(repeat rewrite Z.quot_div_nonneg in * by lia);
 try(repeat rewrite qa_floor_negative in * by lia);
 try(repeat rewrite Z.shiftl_mul_pow2 in * by lia);
 unfold qa_sat16,qa_sat8 in *;
 repeat match goal with |-context[Z.ltb ?x ?y]=>destruct(Z.ltb_spec x y) end;
 try(entailer!);try qa_pure;
 try match goal with |-context[signed_last_nbits ?x 32]=>pose proof(qa_s32_range x);unfold qa_s32 in *;lia end;
 try match goal with |-context[unsigned_last_nbits (Z.shiftl 1 ?d) 32]=>
 let E:=fresh "pow_eq"in pose proof(qa_pow2_unsigned32 d ltac:(lia))as E;change(unsigned_last_nbits(Z.shiftl 1 d)32=qa_pow2 d)in E;unfold qa_pow2 in E;rewrite E;lia end.
