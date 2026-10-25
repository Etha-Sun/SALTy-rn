From Coq Require Import ZArith List Lia Ring.
From X32Packw Require Export AccessModel.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Lemma pw_window_shift:forall F base cap offset count,
 pw_window F base cap->0<=offset->0<=count->offset+count<=cap->
 pw_window F(base+4*offset)count.
Proof.
 intros F base cap offset count[Hb[Hcap Hlanes]]Ho Hc Hend.
 split;[lia|];split;[assumption|];intros i Hi.
 replace(base+4*offset+4*i)with(base+4*(offset+i))by ring.
 apply Hlanes;lia.
Qed.
Lemma pw_write_window_shift:forall W base cap offset count,
 pw_write_window W base cap->0<=offset->0<=count->offset+count<=cap->
 pw_write_window W(base+4*offset)count.
Proof.
 intros W base cap offset count[Hb[Hcap Hlanes]]Ho Hc Hend.
 split;[lia|];split;[assumption|];intros i Hi.
 replace(base+4*offset+4*i)with(base+4*(offset+i))by ring.
 apply Hlanes;lia.
Qed.
Lemma pw_pair_inner_windows:forall F W a b p kc done width,
 pw_pair_pre F W a b p kc->0<=done->0<width->done+width<=kc->
 pw_window F(a+4*done)width /\ pw_window F(b+4*done)width /\
 pw_write_window W(p+8*done)(2*width).
Proof.
 intros F W a b p kc done width Hpre Hd Hw Hend.
 unfold pw_pair_pre in Hpre;destruct Hpre as[Hkc[Ha[Hb[Hp[Hae[Hbe[Hpe[Haw[Hbw[Hpw Hnd]]]]]]]]]].
 repeat split.
 - destruct Haw as[Hbase _];lia.
 - lia.
 - intros i Hi;destruct Haw as[_[_ Hlanes]].
   replace(a+4*done+4*i)with(a+4*(done+i))by ring;apply Hlanes;lia.
 - destruct Hbw as[Hbase _];lia.
 - lia.
 - intros i Hi;destruct Hbw as[_[_ Hlanes]].
   replace(b+4*done+4*i)with(b+4*(done+i))by ring;apply Hlanes;lia.
 - lia.
 - lia.
 - intros i Hi;destruct Hpw as[_[_ Hlanes]].
   replace(p+8*done+4*i)with(p+4*(2*done+i))by ring;apply Hlanes;lia.
Qed.
Print Assumptions pw_window_shift.
Print Assumptions pw_write_window_shift.
Print Assumptions pw_pair_inner_windows.
Lemma pw_pair_run_step_two:forall n F a b p O,0<=n->
 pw_pair_run(n+2)F a b p O=
 pw_write_pair(pw_write_pair(pw_pair_run n F a b p O)(p+8*n)
  (pw_get F(a+4*n))(pw_get F(b+4*n)))(p+8*n+8)
  (pw_get F(a+4*n+4))(pw_get F(b+4*n+4)).
Proof.
 intros;replace(n+2)with(n+1+1)by ring.
 rewrite !pw_pair_run_step by lia;f_equal;try(f_equal;ring);ring.
Qed.
Print Assumptions pw_pair_run_step_two.
