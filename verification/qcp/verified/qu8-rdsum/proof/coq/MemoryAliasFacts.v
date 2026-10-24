From Coq Require Import ZArith Bool Lia.
From Qu8Rdsum Require Export ProgramModel.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Lemma rd_full_rows_shared_zero_witness : forall rows,
 exists (F:RDMap) h,rd_mem F h /\ rd_inputs F 8 rows 1 0 /\ rd_zero_condition F 8 rows 1.
Proof.
 intro rows;set(F:=(fun q:Z=>if andb(Z.leb 8 q)(Z.ltb q 40)then Some 0 else None)).
 assert(Hpresent:forall q,8<=q<40 ->F q=Some 0).
 { intros q H;unfold F;assert(E:Z.leb 8 q=true)by(apply Z.leb_le;lia);assert(E':Z.ltb q 40=true)by(apply Z.ltb_lt;lia);rewrite E,E';reflexivity. }
 assert(Hrange:forall q v,F q=Some v ->isvalidptr_char q /\ 0<=v<=255).
 { intros q v H;unfold F in H;destruct(andb(Z.leb 8 q)(Z.ltb q 40))eqn:E;[|discriminate].
   inversion H;subst v;apply andb_true_iff in E;destruct E as[E E'];apply Z.leb_le in E;apply Z.ltb_lt in E';split;[change(q>=0 /\ q<=18446744073709551615)|];lia. }
 destruct(rd_mem_witness F Hrange)as[h Hmem]. exists F,h;split;[assumption|]. split.
 - intros r col Hr Hc;unfold rd_row_address;replace(8+r*0+col)with(8+col)by ring;exists 0;apply Hpresent;lia.
 - right;unfold rd_zeros;change(0<8 /\ rd_window F 8 8 /\ forall i:Z,0<=i<8 ->rd_get F(8+i)=0);split;[lia|]. split.
   + intros i Hi;exists 0;apply Hpresent;lia.
   + intros i Hi;unfold rd_get;rewrite(Hpresent(8+i)ltac:(lia));reflexivity.
Qed.
Print Assumptions rd_full_rows_shared_zero_witness.
