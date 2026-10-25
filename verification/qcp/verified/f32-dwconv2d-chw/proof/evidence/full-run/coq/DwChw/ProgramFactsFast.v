From Coq Require Import ZArith List.
From DwChw Require Export ProgramModel PixelFacts.
Import ListNotations.
Local Opaque dw_chw_neon_pixel dw_chw_rvv_pixel dw_observe dw_rel.
Lemma dw_pixel_related:forall F input zero weights H N y x lo hi,
 dw_rel(dw_pixel F input zero weights H N y x lo hi)
       (dw_pixel_rvv F input zero weights H N y x lo hi).
Proof. intros;unfold dw_pixel,dw_pixel_rvv;apply dw_chw_pixel_related. Qed.
Lemma dw_pixel_observation:forall F input zero weights H N y x lo hi,
 dw_observe(dw_pixel F input zero weights H N y x lo hi)
           (dw_pixel_rvv F input zero weights H N y x lo hi).
Proof. intros;apply dw_related_observe;apply dw_pixel_related. Qed.
Theorem dw_output_observation:forall F input zero weights H N lo hi,
 Forall2 dw_observe(dw_output_values F input zero weights H N lo hi)
                   (dw_output_rvv_values F input zero weights H N lo hi).
Proof.
 intros;unfold dw_output_values,dw_output_rvv_values.
 generalize(seq 0(Z.to_nat(H*N)));intro L;induction L as[|i L IH];simpl.
 - constructor.
 - constructor;[apply dw_pixel_observation|exact IH].
Qed.
Print Assumptions dw_pixel_related.
Print Assumptions dw_pixel_observation.
Print Assumptions dw_output_observation.
