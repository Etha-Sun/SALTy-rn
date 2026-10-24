From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From Qu8Rdsum Require Import Model MemoryModel read_byte_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedReadByte : Qu8Rdsum.read_byte_goal.VC_Correct.
Lemma proof_of_rdsum_read_byte_entail_wit_1 : Qu8Rdsum.read_byte_goal.rdsum_read_byte_entail_wit_1.
Proof. unfold Qu8Rdsum.read_byte_goal.rdsum_read_byte_entail_wit_1;right;intros;apply rd_mem_extract;assumption. Qed.
Lemma proof_of_rdsum_read_byte_entail_wit_2 : Qu8Rdsum.read_byte_goal.rdsum_read_byte_entail_wit_2.
Proof. unfold Qu8Rdsum.read_byte_goal.rdsum_read_byte_entail_wit_2;right;intros;apply rd_mem_restore;assumption. Qed.
Lemma proof_of_rdsum_read_byte_return_wit_1 : Qu8Rdsum.read_byte_goal.rdsum_read_byte_return_wit_1.
Proof. unfold Qu8Rdsum.read_byte_goal.rdsum_read_byte_return_wit_1;left;intros p Mm Hnon Hp h HM;pose proof(rd_mem_range Mm h HM p Hp)as Hr;assert(E:rd_get Mm p=rd_get Mm p)by reflexivity;unfold andp,coq_prop;tauto. Qed.
End CheckedReadByte.
