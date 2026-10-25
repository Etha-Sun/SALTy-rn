From Coq Require Import ZArith Lia.
Open Scope Z_scope.
Lemma pw_tile_bound : forall g nc kc gap pairs M,
 1<=g ->1<=nc ->1<=kc ->0<=gap ->0<=pairs ->2*pairs<=nc ->nc<=2*pairs+1 ->
 g*(nc-pairs)*(2+(2*kc+gap))<=M -> 2+(2*kc+gap)<=M.
Proof.
 intros g nc kc gap pairs M Hg Hn Hk Hd Hp Hnp Hpn HO.
 assert(HT:1<=nc-pairs) by lia.
 pose proof(Z.mul_le_mono_nonneg_r 1 g (nc-pairs) ltac:(lia) Hg) as HF.
 rewrite Z.mul_1_l in HF.
 assert(HF1:1<=g*(nc-pairs)) by lia.
 pose proof(Z.mul_le_mono_nonneg_r 1 (g*(nc-pairs)) (2+(2*kc+gap)) ltac:(lia) HF1) as HB.
 rewrite Z.mul_1_l in HB;lia.
Qed.
Print Assumptions pw_tile_bound.
Lemma pw_block_index_bound : forall g unit gi pos,
 1<=g ->0<=unit ->0<=gi<g ->0<=pos<=unit ->
 0<=gi*unit+pos<=g*unit.
Proof.
 intros g unit gi pos Hg HU Hgi Hp.
 assert(Hlo:0<=gi*unit) by (apply Z.mul_nonneg_nonneg;lia).
 pose proof(Z.mul_le_mono_nonneg_r (gi+1) g unit HU ltac:(lia)) as HH.
 replace((gi+1)*unit)with(gi*unit+unit) in HH by ring;lia.
Qed.
Lemma pw_window_index_bound : forall g unit gi pos count stride,
 1<=g ->0<=unit ->0<=gi<g ->0<=pos ->0<=count ->pos+count<=unit ->0<=stride ->
 0<=(gi*unit+pos)*stride /\
 (gi*unit+pos)*stride+count*stride<=g*unit*stride.
Proof.
 intros g unit gi pos count stride Hg HU Hgi Hp HC Hpc HS.
 pose proof(pw_block_index_bound g unit gi pos Hg HU Hgi ltac:(lia)) as HL.
 pose proof(pw_block_index_bound g unit gi (pos+count) Hg HU Hgi ltac:(lia)) as HH.
 split;[apply Z.mul_nonneg_nonneg;lia|].
 pose proof(Z.mul_le_mono_nonneg_r (gi*unit+(pos+count)) (g*unit) stride HS ltac:(lia)) as HM.
 replace((gi*unit+(pos+count))*stride)with((gi*unit+pos)*stride+count*stride) in HM by ring;exact HM.
Qed.
Print Assumptions pw_block_index_bound.
Print Assumptions pw_window_index_bound.
