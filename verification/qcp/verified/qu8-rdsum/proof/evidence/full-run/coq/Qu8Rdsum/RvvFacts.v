From Coq Require Import ZArith Lia List.
From Qu8Rdsum Require Export RvvModel RowFacts.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma rd_u64_bound : forall x,0<=rd_u64 x<=18446744073709551615.
Proof. intros;unfold rd_u64;pose proof(unsigned_Lastnbits_range x 64 ltac:(lia));change(0<=unsigned_last_nbits x 64<18446744073709551616)in H;lia. Qed.
Lemma rd_u64_in_range : forall x,0<=x<=18446744073709551615 ->rd_u64 x=x.
Proof. intros;unfold rd_u64;apply unsigned_last_nbits_eq;change(0<=x<18446744073709551616);lia. Qed.
Lemma rd_u64_add : forall a b,rd_u64(rd_u64 a+rd_u64 b)=rd_u64(a+b).
Proof. intros;unfold rd_u64;rewrite unsigned_unsigned_add_l by lia;rewrite unsigned_unsigned_add_r by lia;reflexivity. Qed.
Lemma rd_u16_bound : forall x,0<=rs_u16 x<=65535.
Proof. intros;pose proof(unsigned_Lastnbits_range x 16 ltac:(lia));unfold rs_u16;change(0<=unsigned_last_nbits x 16<65536)in H;lia. Qed.
Lemma rd_u16_in_range : forall x,0<=x<=65535 ->rs_u16 x=x.
Proof. intros;unfold rs_u16;apply unsigned_last_nbits_eq;change(0<=x<65536);lia. Qed.
Lemma rd_u16_add_l : forall a b,rs_u16(rs_u16 a+b)=rs_u16(a+b).
Proof. intros;unfold rs_u16;apply unsigned_unsigned_add_l;lia. Qed.
Lemma rd_u16_add_r : forall a b,rs_u16(a+rs_u16 b)=rs_u16(a+b).
Proof. intros;unfold rs_u16;apply unsigned_unsigned_add_r;lia. Qed.
Lemma rd_min252_range : forall r,0<=r ->0<=rd_min252 r<=252 /\ rd_min252 r<=r.
Proof. intros;unfold rd_min252;pose proof(Z.le_min_l r 252);pose proof(Z.le_min_r r 252);split;[split;[apply Z.min_glb;lia|assumption]|assumption]. Qed.
Lemma rd_done_initial : forall r,0<=r ->rd_done r(rd_min252 r)=0.
Proof. intros;unfold rd_done;rewrite Z.sub_diag;apply Z.min_r;pose proof(rd_min252_range r H);lia. Qed.
Lemma rd_done_finish : forall r cb,cb<=0 ->rd_done r cb=rd_min252 r.
Proof. intros;unfold rd_done;apply Z.min_l;lia. Qed.
Lemma rd_done_range : forall r cb,0<=r ->cb<=rd_min252 r ->0<=rd_done r cb<=252.
Proof. intros;pose proof(rd_min252_range r H);unfold rd_done;split;[apply Z.min_glb;lia|eapply Z.le_trans;[apply Z.le_min_l|lia]]. Qed.
Lemma rd_acc32_range : forall M base stride col rows i vl,0<=rd_acc32 M base stride col rows i vl<=4294967295.
Proof. intros;unfold rd_acc32;destruct(Z.ltb i vl);[apply rs_u32_bound|lia]. Qed.
Lemma rd_acc16_range : forall M base stride col start count i vl,0<=rd_acc16 M base stride col start count i vl<=65535.
Proof. intros;unfold rd_acc16;destruct(Z.ltb i vl);[apply rd_u16_bound|lia]. Qed.
Lemma rd_acc32_zero : forall M base stride col i vl,rd_acc32 M base stride col 0 i vl=0.
Proof. intros;unfold rd_acc32;destruct(Z.ltb i vl);[rewrite rd_column_zero;apply rs_u32_in_range;lia|reflexivity]. Qed.
Lemma rd_acc16_zero : forall M base stride col start i vl,rd_acc16 M base stride col start 0 i vl=0.
Proof. intros;unfold rd_acc16;destruct(Z.ltb i vl);[rewrite rd_column_zero;apply rd_u16_in_range;lia|reflexivity]. Qed.
Lemma rd_mem_addresses : forall M,rd_mem M |-- “forall p:Z,rd_present M p ->0<=p<=18446744073709551615”.
Proof. unfold derivable1,coq_prop,rd_mem;intros M h[Hs[Ht H]]p[v Hp];specialize(H p);rewrite Hp in H;destruct H as[Hvalid _];change(p>=0 /\ p<=18446744073709551615)in Hvalid;lia. Qed.
Lemma rd_window_capacity : forall M p n,(forall q,rd_present M q ->q<=18446744073709551615) ->0<n ->rd_window M p n ->p+n<=18446744073709551616.
Proof. intros M p n Haddr Hn Hwindow;pose proof(Haddr(p+(n-1))(Hwindow(n-1)ltac:(lia)));lia. Qed.
Lemma rd_inputs_window : forall M base rows channels stride r col width,rd_inputs M base rows channels stride ->0<=r<rows ->0<=col ->col+width<=channels+8 ->rd_window M(base+r*stride+col)width.
Proof. intros M base rows channels stride r col width Hin Hr Hcol Hwidth i Hi;replace(base+r*stride+col+i)with(rd_row_address base stride r(col+i))by(unfold rd_row_address;ring);apply Hin;lia. Qed.
Lemma rd_small_batch_needs_zero : forall rows r cb,0<r ->r<=rows ->0<cb<=6 ->rd_mod252(rows-r)=0 ->(rd_min252 r-cb)mod 7=0 ->rows mod 7<>0.
Proof.
 intros rows r cb Hr Hrows Hcb Hprogress Hstep Hbad.
 unfold rd_mod252 in Hprogress.
 pose proof(Z.div_mod(rows-r)252 ltac:(lia))as E1;rewrite Hprogress in E1.
 pose proof(Z.div_mod(rd_min252 r-cb)7 ltac:(lia))as E2;rewrite Hstep in E2.
 pose proof(Z.div_mod rows 7 ltac:(lia))as E3;rewrite Hbad in E3.
 unfold rd_min252 in E2;destruct(Z_le_gt_dec r 252);[rewrite Z.min_l in E2 by lia|rewrite Z.min_r in E2 by lia];lia.
Qed.
Print Assumptions rd_u64_bound.
Print Assumptions rd_u64_in_range.
Print Assumptions rd_u64_add.
Print Assumptions rd_u16_bound.
Print Assumptions rd_u16_in_range.
Print Assumptions rd_u16_add_l.
Print Assumptions rd_u16_add_r.
Print Assumptions rd_min252_range.
Print Assumptions rd_done_initial.
Print Assumptions rd_done_finish.
Print Assumptions rd_done_range.
Print Assumptions rd_acc32_range.
Print Assumptions rd_acc16_range.
Print Assumptions rd_acc32_zero.
Print Assumptions rd_acc16_zero.
Print Assumptions rd_mem_addresses.
Print Assumptions rd_window_capacity.
Print Assumptions rd_inputs_window.
Print Assumptions rd_small_batch_needs_zero.
