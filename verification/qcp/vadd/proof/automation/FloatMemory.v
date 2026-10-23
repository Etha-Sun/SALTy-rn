From Coq Require Import ZArith Lia.
From SimpleC.SL Require Export Mem SeparationLogic.
From QcpNeon Require Import NeonBridge.
From QcpNeonLoop Require Import NeonLoopBridge.
From QcpRvv32 Require Import RvvLayout FastFrame.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.

(* Type/layout registration for the existing f32x4/f32x2 representation.
   No kernel variable names, VC numbers, or arithmetic operation are used. *)
Ltac float_layout :=
  unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t;
  rewrite ?rvv_local_field_address; try csimpl.

Ltac forget_float_cells :=
  repeat match goal with |- ?P |-- ?Q =>
    multimatch Q with context[undef_store_float ?p] =>
      multimatch P with context[store_float p ?value] =>
        sep_apply (store_float_undef_store_float p value)
      end
    end
  end.

Ltac float_cancel :=
  forget_float_cells; opaque_leaves; sepcon_assoc_change; fast_cancel.

Ltac float_frame :=
  unfold fp32_slice;
  repeat progress rewrite <- logic_equiv_andp_assoc;
  first [apply _derivable1_andp_intros;
    [unfold derivable1, andp, coq_prop; intros;
     repeat first [assumption | split | reflexivity]; lia
    |float_cancel]
  |float_cancel].

(* Prefix rules are registered once per supported element/vector layout. *)
Ltac undef_prefix_rule width :=
  lazymatch width with
  | 1 => constr:(float_undef_open1)
  | 2 => constr:(float_undef_open2)
  | 4 => constr:(float_undef_open4)
  end.

Ltac float_zero_offset :=
  repeat match goal with
  | |- context[?p + 0 * sizeof(FLOAT)] =>
    replace (p + 0 * sizeof(FLOAT)) with p by lia
  end.

Ltac float_open_write :=
  multimatch goal with |- ?P |-- ?Q =>
    multimatch Q with context[FloatArray.undef_seg ?p ?width ?n] =>
      multimatch P with context[FloatArray.undef_full p n] =>
        let rule := undef_prefix_rule width in
        sep_apply_l_atomic (rule p n);
        [dump_pre_spatial; lia |float_zero_offset; float_frame]
      end
    end
  end.

Ltac float_open_tail :=
  multimatch goal with |- ?P |-- ?Q =>
    multimatch P with context[FloatArray.undef_seg ?p ?lo ?hi] =>
      multimatch Q with context[FloatArray.undef_seg p (lo + 1) hi] =>
        sep_apply_l_atomic (FloatArray.undef_seg_unfold p lo hi);
        [dump_pre_spatial; lia
        |unfold StoreFloatAsElement.undefstoreA; float_zero_offset; float_frame]
      end
    end
  end.

Ltac float_open_read :=
  multimatch goal with |- ?P |-- ?Q =>
    multimatch P with context[FloatArray.full ?p ?n ?xs] =>
      multimatch Q with context[FloatArray.seg p 4 n _] =>
        multimatch Q with context[Znth 0 xs ?default] =>
          sep_apply_l_atomic (float_full_open4 p n xs default);
          [dump_pre_spatial; rewrite sizeof_float in *; lia |float_frame]
        end
      end
    end
  end.

Ltac float_memory :=
  intros; float_layout;
  first [solve [float_frame] |solve [float_open_write]
        |solve [float_open_tail] |solve [float_open_read]].
