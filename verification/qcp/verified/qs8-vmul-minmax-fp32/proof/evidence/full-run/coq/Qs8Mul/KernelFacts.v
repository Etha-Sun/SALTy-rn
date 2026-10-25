From Coq Require Import ZArith Lia List.
From Qs8Mul Require Export PrefixFacts ProgramFacts MagicConstant VectorValuesFacts ExtFacts.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Lemma qm_memory_addresses : forall M,
 rd_mem M |-- “forall p:Z,rd_present M p ->0<=p<=18446744073709551615”.
Proof. unfold derivable1,coq_prop,rd_mem;intros M h[Hs[Ht H]]p[v Hp];specialize(H p);rewrite Hp in H;destruct H as[Hvalid _];change(p>=0 /\ p<=18446744073709551615)in Hvalid;lia. Qed.
Lemma qm_keep_pure_left : forall(R:Prop)(P Q:Assertion),
 (P|-- “R” && P) -> P**Q|-- “R” && (P**Q).
Proof. intros R P Q H;eapply derivable1_trans;[apply derivable1_sepcon_mono;[exact H|apply derivable1_refl]|entailer!]. Qed.
Lemma qm_keep_pure_right : forall(R:Prop)(P Q:Assertion),
 (Q|-- “R” && Q) -> P**Q|-- “R” && (P**Q).
Proof. intros R P Q H;eapply derivable1_trans;[apply derivable1_sepcon_mono;[apply derivable1_refl|exact H]|entailer!]. Qed.
Lemma qm_memory_addresses_keep : forall M,
 rd_mem M |-- “forall p:Z,rd_present M p ->0<=p<=18446744073709551615” &&rd_mem M.
Proof. intros;apply _derivable1_andp_intros;[apply qm_memory_addresses|apply derivable1_refl]. Qed.
Lemma qm_memory_ranges_keep : forall M,
 rd_mem M |-- “forall p:Z,rd_present M p ->-128<=rd_get M p<=127” &&rd_mem M.
Proof. intros;apply _derivable1_andp_intros;[apply rd_mem_range|apply derivable1_refl]. Qed.
Ltac qm_address_path := lazymatch goal with |-?P|--_=>lazymatch P with
 |rd_mem ?M=>apply qm_memory_addresses_keep
 |?A**?B=>first[eapply qm_keep_pure_left;qm_address_path|eapply qm_keep_pure_right;qm_address_path]
 end end.
Ltac qm_range_path := lazymatch goal with |-?P|--_=>lazymatch P with
 |rd_mem ?M=>apply qm_memory_ranges_keep
 |?A**?B=>first[eapply qm_keep_pure_left;qm_range_path|eapply qm_keep_pure_right;qm_range_path]
 end end.
Ltac qm_capture_addresses name := lazymatch goal with |-?P|--?Q=>lazymatch P with context[rd_mem ?M]=>
 let Facts:=constr:(forall p:Z,rd_present M p ->0<=p<=18446744073709551615)in
 eapply(derivable1_trans P(“Facts”&&P)Q);[qm_address_path|Intros_p name]end end.
Ltac qm_capture_ranges name := lazymatch goal with |-?P|--?Q=>lazymatch P with context[rd_mem ?M]=>
 let Facts:=constr:(forall p:Z,rd_present M p ->-128<=rd_get M p<=127)in
 eapply(derivable1_trans P(“Facts”&&P)Q);[qm_range_path|Intros_p name]end end.
Lemma qm_inputs_window_a : forall M pa pb n k r,
 qm_inputs M pa pb n ->0<=k ->0<=r ->k+r<=n+7 ->rd_window M(pa+k)r.
Proof. intros M pa pb n k r [Ha Hb] Hk Hr Hn;apply(qm_input_window_shift M pa(n+7)k r);assumption. Qed.
Lemma qm_inputs_window_b : forall M pa pb n k r,
 qm_inputs M pa pb n ->0<=k ->0<=r ->k+r<=n+7 ->rd_window M(pb+k)r.
Proof. intros M pa pb n k r [Ha Hb] Hk Hr Hn;apply(qm_input_window_shift M pb(n+7)k r);assumption. Qed.
Lemma qm_signed16_exact : forall x,-32768<=x<=32767 ->qm_s16 x=x.
Proof. intros;unfold qm_s16;apply signed_last_nbits_eq;[lia|change(-32768<=x<32768);lia]. Qed.
Lemma qm_sub16_byte : forall a b,-128<=a<=127 ->-128<=b<=127 ->qm_sub16 a b=a-b.
Proof. intros;unfold qm_sub16;apply qm_signed16_exact;lia. Qed.
Lemma qm_vl_bounds : forall n vl,0<n ->qm_vl_allowed n vl ->1<=vl<=32 /\ vl<=n.
Proof.
 intros n vl Hn H;unfold qm_vl_allowed in H;destruct H as[[Hn32 Hv]|[[Hn64 Hvl]|[Hn64 Hv]]];try lia.
 assert(Hlo:1<=(n+1)/2)by(apply Z.div_le_lower_bound;lia);lia.
Qed.
Print Assumptions qm_memory_addresses.
Print Assumptions qm_keep_pure_left.
Print Assumptions qm_keep_pure_right.
Print Assumptions qm_memory_addresses_keep.
Print Assumptions qm_memory_ranges_keep.
Print Assumptions qm_inputs_window_a.
Print Assumptions qm_inputs_window_b.
Print Assumptions qm_signed16_exact.
Print Assumptions qm_sub16_byte.
Print Assumptions qm_vl_bounds.
