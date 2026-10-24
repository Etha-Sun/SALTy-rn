From Coq Require Import ZArith List.
From SimpleC.SL Require Export Mem SeparationLogic.
Local Open Scope Z_scope.
Definition ptr_modulus:Z:=18446744073709551616.
Definition zget (i:Z) (xs:list Z):Z:=Znth i xs 0.
Definition selected_address (entry zero zero_data offset:Z):Z :=
 if Z.eq_dec entry zero then zero_data else entry+offset.

Definition select_domain (entry zero offset:Z):Prop :=
 0<=offset<ptr_modulus /\ (entry=zero \/ (0<=entry /\ entry+offset<ptr_modulus)).
