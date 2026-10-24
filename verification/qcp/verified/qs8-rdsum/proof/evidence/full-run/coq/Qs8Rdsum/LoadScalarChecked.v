From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From Qs8Rdsum Require Import LoadModel load_scalar_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedLoadScalar : Qs8Rdsum.load_scalar_goal.VC_Correct.
Lemma proof_of_rdsum_read_lane_safety_wit_1 : Qs8Rdsum.load_scalar_goal.rdsum_read_lane_safety_wit_1.
Proof. unfold Qs8Rdsum.load_scalar_goal.rdsum_read_lane_safety_wit_1;try left;intros;rewrite ?sizeof_char in *;repeat rewrite Z.mul_1_r in *;try change Int.max_signed with 2147483647;try change Int.min_signed with (-2147483648);try match goal with Hw:rd_window ?m ?p ?vl,Hi : ?i < ?vl, H0 : 0 <= ?i |- _ => let H:=fresh "Hpresent" in assert(H:rd_present m(p+i))by(apply Hw;lia) end;unfold rd_read_lane;repeat match goal with |- context[Z.ltb ?a ?b]=>destruct(Z.ltb_spec a b)end;entailer!;lia. Qed.
Lemma proof_of_rdsum_read_lane_return_wit_1 : Qs8Rdsum.load_scalar_goal.rdsum_read_lane_return_wit_1.
Proof. unfold Qs8Rdsum.load_scalar_goal.rdsum_read_lane_return_wit_1;try left;intros;rewrite ?sizeof_char in *;repeat rewrite Z.mul_1_r in *;try change Int.max_signed with 2147483647;try change Int.min_signed with (-2147483648);try match goal with Hw:rd_window ?m ?p ?vl,Hi : ?i < ?vl, H0 : 0 <= ?i |- _ => let H:=fresh "Hpresent" in assert(H:rd_present m(p+i))by(apply Hw;lia) end;unfold rd_read_lane;repeat match goal with |- context[Z.ltb ?a ?b]=>destruct(Z.ltb_spec a b)end;entailer!;lia. Qed.
Lemma proof_of_rdsum_read_lane_return_wit_2 : Qs8Rdsum.load_scalar_goal.rdsum_read_lane_return_wit_2.
Proof. unfold Qs8Rdsum.load_scalar_goal.rdsum_read_lane_return_wit_2;try left;intros;rewrite ?sizeof_char in *;repeat rewrite Z.mul_1_r in *;try change Int.max_signed with 2147483647;try change Int.min_signed with (-2147483648);try match goal with Hw:rd_window ?m ?p ?vl,Hi : ?i < ?vl, H0 : 0 <= ?i |- _ => let H:=fresh "Hpresent" in assert(H:rd_present m(p+i))by(apply Hw;lia) end;unfold rd_read_lane;repeat match goal with |- context[Z.ltb ?a ?b]=>destruct(Z.ltb_spec a b)end;entailer!;lia. Qed.
Lemma proof_of_rdsum_read_lane_partial_solve_wit_1_pure : Qs8Rdsum.load_scalar_goal.rdsum_read_lane_partial_solve_wit_1_pure.
Proof. unfold Qs8Rdsum.load_scalar_goal.rdsum_read_lane_partial_solve_wit_1_pure;try left;intros;rewrite ?sizeof_char in *;repeat rewrite Z.mul_1_r in *;try change Int.max_signed with 2147483647;try change Int.min_signed with (-2147483648);try match goal with Hw:rd_window ?m ?p ?vl,Hi : ?i < ?vl, H0 : 0 <= ?i |- _ => let H:=fresh "Hpresent" in assert(H:rd_present m(p+i))by(apply Hw;lia) end;unfold rd_read_lane;repeat match goal with |- context[Z.ltb ?a ?b]=>destruct(Z.ltb_spec a b)end;entailer!;lia. Qed.
Lemma proof_of_rdsum_read_lane_partial_solve_wit_1 : Qs8Rdsum.load_scalar_goal.rdsum_read_lane_partial_solve_wit_1.
Proof. unfold Qs8Rdsum.load_scalar_goal.rdsum_read_lane_partial_solve_wit_1, Qs8Rdsum.load_scalar_goal.rdsum_read_lane_partial_solve_wit_1_aux;try left;intros;rewrite ?sizeof_char in *;repeat rewrite Z.mul_1_r in *;try change Int.max_signed with 2147483647;try change Int.min_signed with (-2147483648);try match goal with Hw:rd_window ?m ?p ?vl,Hi : ?i < ?vl, H0 : 0 <= ?i |- _ => let H:=fresh "Hpresent" in assert(H:rd_present m(p+i))by(apply Hw;lia) end;unfold rd_read_lane;repeat match goal with |- context[Z.ltb ?a ?b]=>destruct(Z.ltb_spec a b)end;entailer!;lia. Qed.
End CheckedLoadScalar.
