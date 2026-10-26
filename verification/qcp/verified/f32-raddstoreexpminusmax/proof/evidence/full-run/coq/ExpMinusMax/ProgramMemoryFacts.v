From Coq Require Import ZArith List Lia.
From ExpMinusMax Require Export KernelModel BorrowedMemory.
Local Open Scope Z_scope.
(* Source-level migration of APProgramMemoryFacts prefix writes.  No floating
   expression is reassociated; arbitrary initial option states are retained. *)
Lemma em_write_nat_inside : forall O p n f j,
 0<=j<Z.of_nat n -> em_write_nat O p n f(p+4*j)=Some(f j).
Proof.
 intros O p n;revert O;induction n as[|n IH];intros O f j Hj;[lia|].
 cbn[em_write_nat];unfold em_output_put,em_put.
 destruct(Z.eqb_spec(p+4*j)(p+4*Z.of_nat n))as[E|E].
 - assert(j=Z.of_nat n)by lia;subst j;reflexivity.
 - apply IH;rewrite Nat2Z.inj_succ in Hj;lia.
Qed.
Lemma em_write_nat_outside : forall O p n f q,
 (forall j,0<=j<Z.of_nat n ->q<>p+4*j)->em_write_nat O p n f q=O q.
Proof.
 intros O p n;revert O;induction n as[|n IH];intros O f q Hout;[reflexivity|].
 cbn[em_write_nat];unfold em_output_put,em_put.
 destruct(Z.eqb_spec q(p+4*Z.of_nat n))as[E|E].
 - exfalso;apply(Hout(Z.of_nat n));[rewrite Nat2Z.inj_succ;lia|exact E].
 - apply IH;intros;apply Hout;rewrite Nat2Z.inj_succ;lia.
Qed.
Lemma em_write_nat_ext : forall O p n f g,
 (forall j,0<=j<Z.of_nat n ->f j=g j)->em_write_nat O p n f=em_write_nat O p n g.
Proof.
 intros O p n;revert O;induction n as[|n IH];intros O f g Hfg;[reflexivity|].
 cbn[em_write_nat];rewrite(IH O f g ltac:(intros;apply Hfg;rewrite Nat2Z.inj_succ;lia)).
 rewrite Hfg by(rewrite Nat2Z.inj_succ;lia);reflexivity.
Qed.
Lemma em_write_nat_append : forall O p n m f,
 em_write_nat(em_write_nat O p n f)(p+4*Z.of_nat n)m(fun j=>f(Z.of_nat n+j))=
 em_write_nat O p(n+m)f.
Proof.
 intros O p n m;induction m as[|m IH];intro f.
 - cbn[em_write_nat];rewrite Nat.add_0_r;reflexivity.
 - rewrite Nat.add_succ_r;cbn[em_write_nat];rewrite IH.
   rewrite Nat2Z.inj_add;repeat first[solve[reflexivity|ring]|f_equal].
Qed.
Lemma em_output_write_ext : forall O p count f g,
 0<=count ->(forall j,0<=j<count ->f j=g j)->
 em_output_write O p count f=em_output_write O p count g.
Proof.
 intros O p count f g Hcount Hfg;unfold em_output_write;apply em_write_nat_ext.
 intros j Hj;rewrite Z2Nat.id in Hj by assumption;now apply Hfg.
Qed.
Lemma em_output_write_append : forall O p done k f,
 0<=done ->0<=k ->
 em_output_write(em_output_write O p done f)(p+4*done)k(fun j=>f(done+j))=
 em_output_write O p(done+k)f.
Proof.
 intros;unfold em_output_write;rewrite Z2Nat.inj_add by assumption.
 pose proof(em_write_nat_append O p(Z.to_nat done)(Z.to_nat k)f)as E.
 rewrite Z2Nat.id in E by assumption;exact E.
Qed.
Lemma em_arm_prefix_append : forall F P M Q done k O,
 0<=done ->0<=k ->
 em_output_write(em_arm_output_prefix F P M Q done O)(Q+4*done)k
 (fun j=>em_arm_value(em_get F(P+4*(done+j)))(em_get F M))=
 em_arm_output_prefix F P M Q(done+k)O.
Proof. intros;unfold em_arm_output_prefix;apply em_output_write_append;assumption. Qed.
Lemma em_rvv_prefix_append : forall F P M Q done k O,
 0<=done ->0<=k ->
 em_output_write(em_rvv_output_prefix F P M Q done O)(Q+4*done)k
 (fun j=>em_rvv_value(em_get F(P+4*(done+j)))(em_get F M))=
 em_rvv_output_prefix F P M Q(done+k)O.
Proof. intros;unfold em_rvv_output_prefix;apply em_output_write_append;assumption. Qed.
Lemma em_arm_prefix_one : forall F P M Q done O value,
 0<=done ->value=em_arm_value(em_get F(P+4*done))(em_get F M)->
 em_output_put(em_arm_output_prefix F P M Q done O)(Q+4*done)value=
 em_arm_output_prefix F P M Q(done+1)O.
Proof.
 intros F P M Q done O value Hd Hv.
 pose proof(em_arm_prefix_append F P M Q done 1 O Hd ltac:(lia))as E.
 unfold em_output_write in E.
 change (Z.to_nat 1) with 1%nat in E.
 cbn [em_write_nat] in E.
 rewrite ?Z.add_0_r,?Z.mul_0_r in E.
 rewrite Hv;exact E.
Qed.
Lemma em_arm_prefix_record4 : forall F P M Q done O V,
 0<=done ->
 (forall j,0<=j<4 ->em_get_float32x4_t V j=
 em_arm_value(em_get F(P+4*(done+j)))(em_get F M))->
 em_write_record4(em_arm_output_prefix F P M Q done O)(Q+4*done)V=
 em_arm_output_prefix F P M Q(done+4)O.
Proof.
 intros F P M Q done O V Hd HV;unfold em_write_record4.
 transitivity(em_output_write(em_arm_output_prefix F P M Q done O)(Q+4*done)4
 (fun j=>em_arm_value(em_get F(P+4*(done+j)))(em_get F M))).
 - apply em_output_write_ext;[lia|exact HV].
 - apply em_arm_prefix_append;lia.
Qed.
Lemma em_arm_prefix_low2 : forall F P M Q done O V,
 0<=done ->
 (forall j,0<=j<4 ->em_get_float32x4_t V j=
 em_arm_value(em_get F(P+4*(done+j)))(em_get F M))->
 em_write_record2(em_arm_output_prefix F P M Q done O)(Q+4*done)(em_neon_low V)=
 em_arm_output_prefix F P M Q(done+2)O.
Proof.
 intros F P M Q done O V Hd HV;unfold em_write_record2.
 transitivity(em_output_write(em_arm_output_prefix F P M Q done O)(Q+4*done)2
 (fun j=>em_arm_value(em_get F(P+4*(done+j)))(em_get F M))).
 - apply em_output_write_ext;[lia|]. intros j Hj.
   unfold em_neon_low;rewrite em_get_make_float32x2_t by lia;apply HV;lia.
 - apply em_arm_prefix_append;lia.
Qed.
Lemma em_arm_prefix_high1 : forall F P M Q done O V,
 0<=done ->
 (forall j,0<=j<4 ->em_get_float32x4_t V j=
 em_arm_value(em_get F(P+4*(done+j)))(em_get F M))->
 em_output_put(em_arm_output_prefix F P M Q(done+2)O)(Q+4*(done+2))
 (em_get_float32x2_t(em_neon_high V)0)=em_arm_output_prefix F P M Q(done+3)O.
Proof.
 intros F P M Q done O V Hd HV;replace(done+3)with((done+2)+1)by ring.
 apply em_arm_prefix_one;[lia|]. unfold em_neon_high.
 rewrite em_get_make_float32x2_t by lia;cbn[Z.add];apply HV;lia.
Qed.
Lemma em_arm_prefix_low1 : forall F P M Q done O V,
 0<=done ->
 (forall j,0<=j<4 ->em_get_float32x4_t V j=
 em_arm_value(em_get F(P+4*(done+j)))(em_get F M))->
 em_output_put(em_arm_output_prefix F P M Q done O)(Q+4*done)
 (em_get_float32x2_t(em_neon_low V)0)=em_arm_output_prefix F P M Q(done+1)O.
Proof.
 intros F P M Q done O V Hd HV;apply em_arm_prefix_one;[exact Hd|].
 unfold em_neon_low;rewrite em_get_make_float32x2_t by lia.
 specialize(HV 0 ltac:(lia));now rewrite Z.add_0_r in HV.
Qed.
Print Assumptions em_write_nat_inside.
Print Assumptions em_write_nat_outside.
Print Assumptions em_write_nat_ext.
Print Assumptions em_write_nat_append.
Print Assumptions em_output_write_ext.
Print Assumptions em_output_write_append.
Print Assumptions em_arm_prefix_append.
Print Assumptions em_rvv_prefix_append.
Print Assumptions em_arm_prefix_one.
Print Assumptions em_arm_prefix_record4.
Print Assumptions em_arm_prefix_low2.
Print Assumptions em_arm_prefix_high1.
Print Assumptions em_arm_prefix_low1.
