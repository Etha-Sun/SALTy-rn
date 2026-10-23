From Coq Require Import ZArith Lia.
From Qs8I8Cvt Require Export NeonKernelSupport.
Local Open Scope Z_scope.
Ltac qcv_concrete_land H a b :=
 let aa:=eval vm_compute in a in let bb:=eval vm_compute in b in
 let ca:=eval vm_compute in(Z.eqb aa aa)in
 let cb:=eval vm_compute in(Z.eqb bb bb)in
 lazymatch ca with true=>lazymatch cb with true=>
  let v:=eval vm_compute in(Z.land a b)in
  replace(Z.land a b)with v in H by reflexivity
 end end.
Ltac qcv_land_hyps :=
 repeat match goal with
 | H:Z.land ?a ?b = ?c |- _=>qcv_concrete_land H a b
 | H:Z.land ?a ?b <> ?c |- _=>qcv_concrete_land H a b
 end.
Ltac qcv_neon_bit_close := qcv_land_hyps;
 first[solve[discriminate]|solve[contradiction]|qcv_neon_close].
