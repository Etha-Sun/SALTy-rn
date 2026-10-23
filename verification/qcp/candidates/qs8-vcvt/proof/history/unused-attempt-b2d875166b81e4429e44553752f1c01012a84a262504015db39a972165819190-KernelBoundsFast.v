From Coq Require Import ZArith Lia String.
From Qs8I8Cvt Require Export KernelFrame.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
(* Pure type-range obligations need the values' typed cells, independent of
   their arithmetic definitions. Generalization is an ordinary Coq proof step;
   the exact actual-C obligation remains the lemma's declared type. *)
Ltac qcv_abstract_value v :=
 tryif is_var v then fail 0 else
 lazymatch v with
 | Z0 => fail 0
 | Zpos _ => fail 0
 | Zneg _ => fail 0
 | _ => let x:=fresh "typed_value" in let E:=fresh "typed_value_eq" in
        remember v as x eqn:E in *;clear E
 end.
Ltac qcv_abstract_one P :=
 lazymatch P with
 | ?P1 ** ?P2 => first[qcv_abstract_one P1|qcv_abstract_one P2]
 | (?p # Char |-> ?v) => qcv_abstract_value v
 | (?p # Short |-> ?v) => qcv_abstract_value v
 | (?p # Int |-> ?v) => qcv_abstract_value v
 | _ => fail 0
 end.
Ltac qcv_abstract_typed_values :=
 repeat lazymatch goal with |- ?P |-- _ => qcv_abstract_one P end.
Ltac qcv_fast_bounds := qcv_abstract_typed_values;qcv_valid_types;qcv_pure.
Ltac qcv_fast_close := rewrite ?sizeof_char,?sizeof_uchar,?Z.quot_1_r in *;
 first[solve[qcv_pure]|solve[qcv_frame]|solve[qcv_fast_bounds]].
