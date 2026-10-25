From Coq Require Import ZArith Bool Strings.String.
From SimpleC.SL Require Import Mem SeparationLogic.
From MaxPool Require Import Bits CompareModel.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Lemma mp_local_field_address:forall(v t f:string),
 eval_addr_expr(RE_addr_of(LE_arrow_field(RE_const(eval_addr_expr(RE_addr_of(LE_var v)))(FET_alias t))f))=
 eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v))f)).
Proof.
 intros;apply eval_addr_expr_congr;apply RE_addr_of_congr;
 apply LE_arrow_field_congr;[apply eval_addr|reflexivity].
Qed.
Lemma mp_loaded_known_lane_zero:forall O p v r,
 mp_out_known O p v->mp_loaded_lane O p 0 r->r=v.
Proof.
 intros O p v r Hknown Hload;unfold mp_out_known in Hknown;
 unfold mp_loaded_lane in Hload;replace(p+4*0)with p in Hload by ring;
 unfold mp_loaded in Hload;rewrite Hknown in Hload;exact Hload.
Qed.
Lemma mp_word_equal_bits:forall a b,
 mp_word_equal(bits_of_fp32 a)(bits_of_fp32 b)=1 <-> a=b.
Proof.
 intros a b;unfold mp_word_equal;destruct(Z.eqb_spec(bits_of_fp32 a)(bits_of_fp32 b)).
 - split;intros;[|reflexivity].
   apply(f_equal fp32_of_bits)in e;rewrite !mp_fp32_of_bits_of_fp32 in e;exact e.
 - split;intro H;[discriminate|subst b;contradiction].
Qed.
