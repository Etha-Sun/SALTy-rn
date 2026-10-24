(* Prepared full-parameter model candidate. NOT compiled or a kernel proof. *)
From Coq Require Import ZArith List Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From Qd8Phase Require Import PhaseModel.
From Qd8Cast Require Import CastModel.
From GemmSpec Require Import FmaModel IntrinsicModel.
Require Import MixedPacked.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.

Record panel_data := {
  sums : list Z;
  weights : list Z;
  scales : list fp32;
  biases : list fp32
}.
Definition empty_panel := {| sums := []; weights := []; scales := []; biases := [] |}.
Definition panel_bytes (K:Z) := 96+8*K.
Definition panels (N:Z) := (N+7)/8.
Definition a_read_extent (K:Z) := 8*((K+7)/8).
Definition panel_at (ps:list panel_data) (p:Z) := Znth p ps empty_panel.
Definition completed (N p:Z) := Z.min N (8*p).
Definition remaining (N p:Z) := N-completed N p.
Definition active_lanes (N p:Z) := Z.min 8 (remaining N p).

Definition panel_wf (K:Z) (x:panel_data) : Prop :=
  Zlength (sums x)=8 /\ Zlength (weights x)=8*K /\
  Zlength (scales x)=8 /\ Zlength (biases x)=8.

Fixpoint packed_matrix (K w:Z) (ps:list panel_data) : Assertion :=
  match ps with
  | [] => emp
  | x::rest => qd8_block w K (sums x) (weights x) (scales x) (biases x) **
               packed_matrix K (w+panel_bytes K) rest
  end.

Definition acc_bits (K depth lane zp:Z) (A:list Z) (x:panel_data) :=
  PhaseModel.lane_acc depth (Znth lane (sums x) 0) zp lane A (weights x).
Definition converted_acc (K lane zp:Z) (A:list Z) (x:panel_data) :=
  fp32_of_Z (signed32_view (acc_bits K K lane zp A x)).
Definition raw_output (K lane zp:Z) (A:list Z) (x:panel_data) (inv:fp32) :=
  fma_rne (fp32_mul (converted_acc K lane zp A x) inv)
          (Znth lane (scales x) fp32_zero)
          (Znth lane (biases x) fp32_zero).

(* QD8 source order is max(lo), then min(hi). The existing f32 GEMM
   neon_clamp uses the opposite order and MUST NOT be substituted here. *)
Definition qd8_neon_clamp (x lo hi:fp32) :=
  fp32_neon_min (fp32_neon_max x lo) hi.
Definition qd8_rvv_clamp (x lo hi:fp32) :=
  if orb (Binary.is_nan 24 128 lo) (Binary.is_nan 24 128 hi)
  then canonical_qnan
  else if Binary.is_nan 24 128 x then x
       else fp32_min_number (fp32_max_number x lo) hi.
Definition observed_equal (x y:fp32) : Prop :=
  fp32_compare x y = Some Eq \/
  (Binary.is_nan 24 128 x=true /\ Binary.is_nan 24 128 y=true).

Definition output_cell (K col zp:Z) (A:list Z) (ps:list panel_data)
                       (inv lo hi:fp32) :=
  qd8_neon_clamp (raw_output K (col mod 8) zp A (panel_at ps (col/8)) inv) lo hi.
Definition completed_values (K count zp:Z) (A:list Z) (ps:list panel_data)
                            (inv lo hi:fp32) : list fp32 :=
  map (fun i => output_cell K (Z.of_nat i) zp A ps inv lo hi)
      (seq 0 (Z.to_nat count)).

(* No zero/undisturbed requirement on unobserved RVV slots. *)
Definition active_accumulators (K depth vl zp:Z) (A:list Z) (x:panel_data)
                              (regs:list Z) : Prop :=
  Zlength regs=8 /\ forall lane, 0<=lane<vl ->
    Znth lane regs 0=acc_bits K depth lane zp A x.

Definition integer_cursor (K depth a w ap wp k:Z) : Prop :=
  0<=depth<=K /\ k=K-depth /\ ap=a+depth /\ wp=w+32+8*depth.
Definition neon_main_K_cursor (K depth a w ap wp k:Z) : Prop :=
  integer_cursor K depth a w ap wp k /\ depth mod 8=0.

(* NEON tail returns without restoring a0. RVV restores it every panel.
   Returning local pointers are not part of the public observation. *)
Definition neon_outer_cursor (N K p a w c ap wp cp nc:Z) : Prop :=
  0<=p<=panels N /\ nc=remaining N p /\ wp=w+p*panel_bytes K /\
  (0<nc -> ap=a /\ cp=c+32*p).
Definition rvv_outer_cursor (N K p a w c ap wp cp nc:Z) : Prop :=
  0<=p<=panels N /\ nc=remaining N p /\ wp=w+p*panel_bytes K /\
  ap=a /\ cp=(c+32*p) mod 18446744073709551616.

Definition output_prefix (N K p c zp:Z) (A:list Z) (ps:list panel_data)
                         (inv lo hi:fp32) : Assertion :=
  FloatArray.full c (completed N p)
    (completed_values K (completed N p) zp A ps inv lo hi) **
  FloatArray.undef_seg c (completed N p) N.

(* Field addresses are explicit parameters: matching them to actual C
   struct fields is a pending layout binding, not an assumed byte cast. *)
Definition input_resources (K a w p_lo p_hi p_zp p_inv zp:Z)
    (A:list Z) (ps:list panel_data) (inv lo hi:fp32) : Assertion :=
  CharArray.full a (a_read_extent K) A ** packed_matrix K w ps **
  store_float p_lo lo ** store_float p_hi hi **
  store_int p_zp zp ** store_float p_inv inv.

Definition outer_resources (N K p a w c p_lo p_hi p_zp p_inv zp:Z)
    (A:list Z) (ps:list panel_data) (inv lo hi:fp32) : Assertion :=
  input_resources K a w p_lo p_hi p_zp p_inv zp A ps inv lo hi **
  output_prefix N K p c zp A ps inv lo hi.

Definition domain_shape (mr N K:Z) (ps:list panel_data) : Prop :=
  mr=1 /\ 0<N /\ 0<K /\ Zlength ps=panels N /\ Forall (panel_wf K) ps.

(* Machine capacity and prefetch-pointer validity must be separately bound
   to the actual C model. No extra448-byte W resource is assumed here. *)
Definition data_capacity (N K a w c:Z) : Prop :=
  0<a /\ 0<w /\ 0<c /\ w mod 4=0 /\
  a+a_read_extent K<=18446744073709551615 /\
  w+panels N*panel_bytes K<=18446744073709551615 /\
  c+4*N<=18446744073709551615.

Check outer_resources.
Check active_accumulators.
Check domain_shape.
