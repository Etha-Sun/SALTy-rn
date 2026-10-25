From Coq Require Import ZArith List Lia Ring.
From X32Packw Require Export AddressSupport Types AccessFacts neon_pair_goal.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Ltac pw_normalize:=
 cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;
 unfold pw_offset in *;subst;try rewrite Z.sub_0_r in *.
Ltac pw_bounds:=
 repeat match goal with H:pw_pair_pre _ _ _ _ _ _ |- _ =>
 unfold pw_pair_pre in H;repeat match type of H with _ /\ _=>destruct H end end;
 try lia.
Ltac pw_window_solve:=
 multimatch goal with
 | H:pw_pair_pre ?F ?W ?a ?b ?p ?kc,Hk : (?k <= ?kc) |- pw_window ?F ?addr ?count =>
  first [replace addr with(a+4*(kc-k))by ring;
         exact(proj1(pw_pair_inner_windows F W a b p kc(kc-k)count H ltac:(lia)ltac:(lia)ltac:(lia)))
        |replace addr with(a+4*(kc-k+1))by ring;
         exact(proj1(pw_pair_inner_windows F W a b p kc(kc-k+1)count H ltac:(lia)ltac:(lia)ltac:(lia)))
        |replace addr with(b+4*(kc-k))by ring;
         exact(proj1(proj2(pw_pair_inner_windows F W a b p kc(kc-k)count H ltac:(lia)ltac:(lia)ltac:(lia))))
        |replace addr with(b+4*(kc-k+1))by ring;
         exact(proj1(proj2(pw_pair_inner_windows F W a b p kc(kc-k+1)count H ltac:(lia)ltac:(lia)ltac:(lia))))]
 | H:pw_pair_pre ?F ?W ?a ?b ?p ?kc,Hk : (?k <= ?kc) |- pw_write_window ?W ?addr 2 =>
  first [replace addr with(p+8*(kc-k))by ring;
         exact(proj2(proj2(pw_pair_inner_windows F W a b p kc(kc-k)1 H ltac:(lia)ltac:(lia)ltac:(lia))))
        |replace addr with(p+8*(kc-k+1))by ring;
         exact(proj2(proj2(pw_pair_inner_windows F W a b p kc(kc-k+1)1 H ltac:(lia)ltac:(lia)ltac:(lia))))]
 end.

Ltac pw_simplify_zero:=
 repeat rewrite Z.sub_diag in *;
 repeat rewrite pw_pair_run_zero in *.
Ltac pw_neon_pair_auto:=
 pw_normalize;pw_simplify_zero;
 unfold UndefStructPreduint32x2_t;repeat rewrite pw_local_field_address;
 first [solve [entailer!;pw_bounds]
       |solve [pw_bounds]
       |solve [entailer!;pw_window_solve]].
