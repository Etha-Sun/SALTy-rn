From iris.proofmode Require Import environments.
(* Inline tactic definitions: these need no libraries created after coqc started. *)
Ltac applyCachedVector n es ann e value H ::=
  notypeclasses refine (tac_fast_apply (tagged_vector_definition n es ann e value H) _);
  let v := fresh "VEC" in iIntros (v) "%";
  idtac "resumed vector expression" n v;
  liSimpl.
Ltac preserveVectorEqualities :=
  repeat match goal with
  | E : ?v = ?value |- _ =>
    lazymatch type of v with
    | bv 65536 =>
      let H := fresh "VECTOR_EQUATION" in
      assert (H : vector_value_eq v value) by (constructor; exact E); clear E
    end
  end.
Ltac freshGuard ::=
  match goal with
  | HG : ?P |- _ =>
    let T := type of P in unify T Prop;
    lazymatch P with
    | guard_seen _ => fail
    | vector_value_eq _ _ => fail
    | _ =>
      tryif (match goal with _ : guard_seen P |- _ => idtac end)
      then fail
      else first [solve [exfalso;
        repeat match goal with v : bv 65536 |- _ => clear dependent v end;
        bv_solve]
      | let marker := fresh "GUARD" in pose proof (guard_seen_intro P) as marker]
    end
  end.

all: preserveVectorEqualities.
all: repeat freshGuard.
all: liSimpl.
Ltac terminalCachedAStep := lazymatch goal with
| |- envs_entails _ (WPasm tnil) => fail
| _ => freshCachedAStep end.
all: repeat terminalCachedAStep.
Show.
Load "/srv/home/yuechunsun/tools/lean/research/sail-tooling-gap/kernel-e2e/RvvLoadTagFinalCase5.v".
