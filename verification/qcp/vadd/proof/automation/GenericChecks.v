From Coq Require Import ZArith Lia.
From MemoryAuto Require Import FloatMemory.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.

(* Different names, arbitrary operation and arbitrary frame: no VADD model. *)
Lemma frame_for_any_operation : forall (dst scratch:Z) (a b:fp32)
  (op:fp32 -> fp32 -> fp32) (rest:Assertion),
  store_float dst a ** store_float scratch (op a b) ** rest |--
  rest ** store_float scratch (op a b) ** store_float dst a.
Proof. float_memory. Qed.

Lemma open_write_with_unrelated_frame : forall (dst total:Z) (rest:Assertion),
  4 <= total -> FloatArray.undef_full dst total ** rest |--
  rest ** (dst+0*sizeof(FLOAT)) # Float |->_ **
  (dst+1*sizeof(FLOAT)) # Float |->_ **
  (dst+2*sizeof(FLOAT)) # Float |->_ **
  (dst+3*sizeof(FLOAT)) # Float |->_ ** FloatArray.undef_seg dst 4 total.
Proof. float_memory. Qed.

(* Failure is required: neither insufficient bounds nor initialized values
   may be invented. The surrounding theorem proves only True. *)
Example reject_invalid_memory_claims : True.
Proof.
  Fail assert (forall (dst total:Z), 1 <= total ->
    FloatArray.undef_full dst total |--
    (dst+0*sizeof(FLOAT)) # Float |->_ **
    (dst+1*sizeof(FLOAT)) # Float |->_ **
    (dst+2*sizeof(FLOAT)) # Float |->_ **
    (dst+3*sizeof(FLOAT)) # Float |->_ ** FloatArray.undef_seg dst 4 total)
    by float_memory.
  Fail assert (forall (dst:Z) (value:fp32),
    undef_store_float dst |-- store_float dst value) by float_memory.
  exact I.
Qed.
