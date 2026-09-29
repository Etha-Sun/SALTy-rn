Require Import isla.riscv64.riscv64.
Require Import WholeStruct BitsProof.
From iris.proofmode Require Import environments.
Require Import Bridge.rvv_widen.a800001d2.

Ltac original_let_hint :=
  idtac;
  match goal with
  | |- envs_entails ?Δ (let_bind_hint ?x ?f) =>
    let H := fresh "LET" in
    lazymatch x with
    | Val_Bits (bv_to_bvn ?y) =>
      lazymatch y with
      | _ _ =>
        pose (H := y);
        change (envs_entails Δ (f (Val_Bits (bv_to_bvn H)))); cbn beta
      | _ => (* No application, probably just another let binding. Don't create a new one.  *)
        change (envs_entails Δ (f x)); cbn beta
      end
    | Val_Bool ?y =>
      lazymatch y with
      | _ _ =>
        pose (H := y);
        change (envs_entails Δ (f (Val_Bool H))); cbn beta
      | _ => (* No application, probably just another let binding. Don't create a new one.  *)
        change (envs_entails Δ (f x)); cbn beta
      end
    end
  end.

(* Opaque, equality-certified payloads prevent accidental kernel evaluation
   of huge bitvector expressions. No axiom or checking switch is used. *)
Definition certified_seal {A : Type} (x : A) : { y : A | y = x }.
Proof. exists x. reflexivity. Qed.
Definition sealed_value {A : Type} (x : A) : A := proj1_sig (certified_seal x).
Lemma sealed_value_eq {A : Type} (x : A) : sealed_value x = x.
Proof. exact (proj2_sig (certified_seal x)). Qed.

Lemma let_bind_sealed {Sigma : gFunctors} (D : envs (iProp Sigma)) n
    (y : bv n) f :
  envs_entails D (f (Val_Bits (bv_to_bvn (sealed_value y)))) ->
  envs_entails D (let_bind_hint (Val_Bits (bv_to_bvn y)) f).
Proof. rewrite sealed_value_eq. exact (fun H => H). Qed.

Ltac liLetBindHint ::= first [
  lazymatch goal with
  | |- envs_entails ?D (let_bind_hint (Val_Bits (@bv_to_bvn 65536 ?y)) ?f) =>
    let value := fresh "SEALED" in
    apply (let_bind_sealed D 65536 y f);
    pose (value := sealed_value y);
    change (envs_entails D (f (Val_Bits (bv_to_bvn value)))); cbn beta
  end | original_let_hint ].

Lemma rvv_widen_first_lane_sealed `{!islaG Σ} `{!threadG} pc (q : nat -> bv 65536) :
  instr pc (Some a800001d2) ⊢ instr_body pc (
    "elen" ↦ᵣ (RegVal_Base (Val_Bits (BV 1%N 0x1%Z))) ∗
    "vlen" ↦ᵣ (RegVal_Base (Val_Bits (BV 4%N 0x3%Z))) ∗
    "misa" ↦ᵣ (RegVal_Struct [("bits", RegVal_Base (Val_Bits (BV 64%N 0x8000000000200100%Z)))]) ∗
    "rv_enable_zfinx" ↦ᵣ (RegVal_Base (Val_Bool false)) ∗
    "rv_enable_vext" ↦ᵣ (RegVal_Base (Val_Bool true)) ∗
    "mstatus" ↦ᵣ (RegVal_Struct [("bits", RegVal_Base (Val_Bits (BV 64%N 0x8000000000000600%Z)))]) ∗
    "vstart" ↦ᵣ (RegVal_Base (Val_Bits (BV 16%N 0x0%Z))) ∗
    "vl" ↦ᵣ (RegVal_Base (Val_Bits (BV 64%N 0x10%Z))) ∗
    "vlenb" ↦ᵣ (RegVal_Base (Val_Bits (BV 64%N 0x20%Z))) ∗
    "vtype" ↦ᵣ (RegVal_Struct [("bits", RegVal_Base (Val_Bits (BV 64%N 0x93%Z)))]) ∗
    "vr0" ↦ᵣ RVal_Bits (q 0%nat) ∗
    "vr16" ↦ᵣ RVal_Bits (BV 65536 0) ∗
    "vr17" ↦ᵣ RVal_Bits (BV 65536 0) ∗
    "vr18" ↦ᵣ RVal_Bits (BV 65536 0) ∗
    "vr19" ↦ᵣ RVal_Bits (BV 65536 0) ∗
    "vr20" ↦ᵣ RVal_Bits (BV 65536 0) ∗
    "vr21" ↦ᵣ RVal_Bits (BV 65536 0) ∗
    "vr22" ↦ᵣ RVal_Bits (BV 65536 0) ∗
    "vr23" ↦ᵣ RVal_Bits (BV 65536 0) ∗
    "vr2" ↦ᵣ RVal_Bits (q 2%nat) ∗
    "vr3" ↦ᵣ RVal_Bits (q 3%nat) ∗
    instr_pre (pc+4) (∃ result : bv 65536,
      "vr16" ↦ᵣ RVal_Bits result ∗
      ⌜bv_extract 0 32 result = bv_zero_extend 32 (bv_extract 0 8 (q 2%nat))⌝ ∗ True)).
Proof.
  Time iStartProof. Time (repeat demoAStep; liShow).
  Unshelve. all: prepare_sidecond.
  repeat rewrite sealed_value_eq.
  rewrite extract_packed_low32. reflexivity.
  Unshelve. all: try done.
Time Qed.
Print Assumptions rvv_widen_first_lane_sealed.
