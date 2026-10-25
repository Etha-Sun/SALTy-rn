From Coq Require Import ZArith List Lia Ring.
From X32Packw Require Export MainGeometry.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Lemma pw_u64_value:forall x,0<=x<18446744073709551616->unsigned_last_nbits x 64=x.
Proof. intros;apply unsigned_last_nbits_eq;change(0<=x<18446744073709551616);assumption. Qed.
Lemma pw_count_products_bounds:forall F W G,pw_program_storage F W G->
 (0<=2*pw_depth G<18446744073709551616) /\
 (0<=pw_channels G*pw_depth G<18446744073709551616).
Proof.
 intros F W G Hv.
 pose proof(pw_storage_sizes F W G Hv)as[Hgs[Hnc[Hkc[Hgap[Htiles Hbytes]]]]].
 pose proof(pw_storage_bounds F W G Hv)as[[Ho Hoe][Hw Hwe]].
 pose proof(pw_tile_output_span F W G 0 0 Hv ltac:(lia)ltac:(lia))as[Htile Hspan].
 unfold pw_tile_output in Hspan;ring_simplify in Hspan.
 assert(Hprod:0<=pw_channels G*pw_depth G)by(apply Z.mul_nonneg_nonneg;lia).
 pose proof(Z.mul_le_mono_nonneg_r 1(pw_groups G)(4*(pw_channels G*pw_depth G))ltac:(nia)ltac:(lia))as Hmul.
 unfold pw_tile_bytes in Hspan;split;split;nia.
Qed.
Lemma pw_tile_advance:forall F W G group tile,
 pw_program_storage F W G->0<=group<pw_groups G->0<=tile<pw_tiles G->
 unsigned_last_nbits
  (unsigned_last_nbits(pw_tile_output G group tile+(2+unsigned_last_nbits(2*pw_depth G)64)*4)64+pw_extra_bytes G)64=
 pw_tile_output G group(tile+1).
Proof.
 intros F W G group tile Hv Hg Ht.
 pose proof(pw_count_products_bounds F W G Hv)as[Htwice Hprod].
 pose proof(pw_storage_sizes F W G Hv)as[Hgs[Hnc[Hkc[Hgap Hrest]]]].
 pose proof(pw_tile_output_span F W G group tile Hv Hg Ht)as[Hp Hspan].
 pose proof(pw_storage_bounds F W G Hv)as[[Ho Hoe]Hw].
 unfold pw_tile_bytes in Hspan.
 assert(Hinner:0<=pw_tile_output G group tile+(2+2*pw_depth G)*4<18446744073709551616)by lia.
 assert(Houter:0<=pw_tile_output G group tile+(2+2*pw_depth G)*4+pw_extra_bytes G<18446744073709551616)by lia.
 rewrite(pw_u64_value(2*pw_depth G)Htwice).
 rewrite(pw_u64_value _ Hinner),(pw_u64_value _ Houter).
 unfold pw_tile_output,pw_tile_bytes;ring.
Qed.
Lemma pw_weight_advance:forall F W G group,
 pw_program_storage F W G->
 pw_group_weight G group+unsigned_last_nbits(pw_channels G*pw_depth G)64*4=
 pw_group_weight G(group+1).
Proof.
 intros;pose proof(pw_count_products_bounds F W G H)as[Htwice Hprod].
 rewrite(pw_u64_value _ Hprod);unfold pw_group_weight;ring.
Qed.
Lemma pw_output_next_group:forall G group,
 pw_tile_output G group(pw_tiles G)=pw_tile_output G(group+1)0.
Proof. intros;unfold pw_tile_output;ring. Qed.
Lemma pw_weight_next_tile:forall G group tile,
 pw_tile_weight G group tile+(pw_depth G+pw_depth G)*4=pw_tile_weight G group(tile+1).
Proof. intros;unfold pw_tile_weight;ring. Qed.
Print Assumptions pw_u64_value.
Print Assumptions pw_count_products_bounds.
Print Assumptions pw_tile_advance.
Print Assumptions pw_weight_advance.
Print Assumptions pw_output_next_group.
Print Assumptions pw_weight_next_tile.
