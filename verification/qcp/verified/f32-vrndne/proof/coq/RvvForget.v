From Coq Require Import ZArith Strings.String.
From Rndne Require Import KernelSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Lemma rndne_forget_m8_local : forall (v:string) (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (x4:fp32) (x5:fp32) (x6:fp32) (x7:fp32) (x8:fp32) (x9:fp32) (x10:fp32) (x11:fp32) (x12:fp32) (x13:fp32) (x14:fp32) (x15:fp32) (x16:fp32) (x17:fp32) (x18:fp32) (x19:fp32) (x20:fp32) (x21:fp32) (x22:fp32) (x23:fp32) (x24:fp32) (x25:fp32) (x26:fp32) (x27:fp32) (x28:fp32) (x29:fp32) (x30:fp32) (x31:fp32),
store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s0"))) x0 **
 store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s1"))) x1 **
 store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s2"))) x2 **
 store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s3"))) x3 **
 store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s4"))) x4 **
 store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s5"))) x5 **
 store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s6"))) x6 **
 store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s7"))) x7 **
 store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s8"))) x8 **
 store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s9"))) x9 **
 store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s10"))) x10 **
 store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s11"))) x11 **
 store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s12"))) x12 **
 store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s13"))) x13 **
 store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s14"))) x14 **
 store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s15"))) x15 **
 store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s16"))) x16 **
 store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s17"))) x17 **
 store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s18"))) x18 **
 store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s19"))) x19 **
 store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s20"))) x20 **
 store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s21"))) x21 **
 store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s22"))) x22 **
 store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s23"))) x23 **
 store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s24"))) x24 **
 store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s25"))) x25 **
 store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s26"))) x26 **
 store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s27"))) x27 **
 store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s28"))) x28 **
 store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s29"))) x29 **
 store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s30"))) x30 **
 store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s31"))) x31
 |-- Rndne.Types.UndefStructPredvfloat32m8_t (eval_addr_expr(RE_addr_of(LE_var v))).
Proof.
 intros. unfold Rndne.Types.UndefStructPredvfloat32m8_t.
 rewrite ?rndne_local_field_address.
 sep_apply (store_float_undef_store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s0"))) x0).
 sep_apply (store_float_undef_store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s1"))) x1).
 sep_apply (store_float_undef_store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s2"))) x2).
 sep_apply (store_float_undef_store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s3"))) x3).
 sep_apply (store_float_undef_store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s4"))) x4).
 sep_apply (store_float_undef_store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s5"))) x5).
 sep_apply (store_float_undef_store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s6"))) x6).
 sep_apply (store_float_undef_store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s7"))) x7).
 sep_apply (store_float_undef_store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s8"))) x8).
 sep_apply (store_float_undef_store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s9"))) x9).
 sep_apply (store_float_undef_store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s10"))) x10).
 sep_apply (store_float_undef_store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s11"))) x11).
 sep_apply (store_float_undef_store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s12"))) x12).
 sep_apply (store_float_undef_store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s13"))) x13).
 sep_apply (store_float_undef_store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s14"))) x14).
 sep_apply (store_float_undef_store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s15"))) x15).
 sep_apply (store_float_undef_store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s16"))) x16).
 sep_apply (store_float_undef_store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s17"))) x17).
 sep_apply (store_float_undef_store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s18"))) x18).
 sep_apply (store_float_undef_store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s19"))) x19).
 sep_apply (store_float_undef_store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s20"))) x20).
 sep_apply (store_float_undef_store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s21"))) x21).
 sep_apply (store_float_undef_store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s22"))) x22).
 sep_apply (store_float_undef_store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s23"))) x23).
 sep_apply (store_float_undef_store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s24"))) x24).
 sep_apply (store_float_undef_store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s25"))) x25).
 sep_apply (store_float_undef_store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s26"))) x26).
 sep_apply (store_float_undef_store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s27"))) x27).
 sep_apply (store_float_undef_store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s28"))) x28).
 sep_apply (store_float_undef_store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s29"))) x29).
 sep_apply (store_float_undef_store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s30"))) x30).
 sep_apply (store_float_undef_store_float (eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v)) "s31"))) x31).
 entailer!.
Qed.
Print Assumptions rndne_forget_m8_local.
