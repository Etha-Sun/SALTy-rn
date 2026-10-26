(* PRIVATE common observation for one output allocation and arbitrary initial None/Some. *)
From HwcConv Require Export RvvKernelModel.
From Coq Require Import ZArith List.
Local Open Scope Z_scope.
Definition hwp_optional_observe(reference actual:option fp32):Prop:=
 match reference,actual with
 |None,None=>True
 |Some a,Some b=>dw_observe a b
 |_,_=>False
 end.
Definition hwp_state_observe(reference actual:HwcOutput):Prop:=
 forall p,hwp_optional_observe(reference p)(actual p).
Definition hwp_unwritten_frame(before after:HwcOutput)(output hs cs C start finish ow:Z):Prop:=
 forall p,hc_decode output hs cs C start finish ow p=None->after p=before p.
Lemma hwp_optional_refl:forall v,hwp_optional_observe v v.
Proof. intros[v|];cbn[hwp_optional_observe];[apply dw_related_observe;apply dw_rel_refl|exact I]. Qed.
Lemma hwp_state_refl:forall O,hwp_state_observe O O.
Proof. intros O p;apply hwp_optional_refl. Qed.
Lemma hwp_raw_related:forall F input zero weights H N top lo hi ch lane y x,
 dw_rel(hc_neon_raw F input zero weights H N top lo hi ch lane y x)
       (hc_rvv_raw F input zero weights H N top lo hi ch lane y x).
Proof. intros;unfold hc_neon_raw,hc_rvv_raw,hc_neon_pixel;apply hc_rvv_source_result_related. Qed.
Lemma hwp_final_same_allocation:forall F input zero weights H N top lo hi C O output hs cs start finish ow,
 hwp_state_observe
 (hc_final(hc_visible(hc_neon_raw F input zero weights H N top lo hi)C)O output hs cs C start finish ow)
 (hc_final(hc_visible(hc_rvv_raw F input zero weights H N top lo hi)C)O output hs cs C start finish ow).
Proof.
 intros F input zero weights H N top lo hi C O output hs cs start finish ow p.
 unfold hc_final;destruct(hc_decode output hs cs C start finish ow p)as[q|].
 - cbn[hwp_optional_observe];apply dw_related_observe;unfold hc_visible;apply hwp_raw_related.
 - apply hwp_optional_refl.
Qed.
Lemma hwp_final_unwritten:forall R O output hs cs C start finish ow,
 hwp_unwritten_frame O(hc_final R O output hs cs C start finish ow)output hs cs C start finish ow.
Proof. intros R O output hs cs C start finish ow p HD;unfold hc_final;rewrite HD;reflexivity. Qed.
Module Independent.
Definition optional_exact:forall v,hwp_optional_observe v v:=hwp_optional_refl.
Definition all_state_exact:forall F input zero weights H N top lo hi C O output hs cs start finish ow,
 hwp_state_observe
 (hc_final(hc_visible(hc_neon_raw F input zero weights H N top lo hi)C)O output hs cs C start finish ow)
 (hc_final(hc_visible(hc_rvv_raw F input zero weights H N top lo hi)C)O output hs cs C start finish ow):=hwp_final_same_allocation.
Definition frame_exact:forall R O output hs cs C start finish ow,
 hwp_unwritten_frame O(hc_final R O output hs cs C start finish ow)output hs cs C start finish ow:=hwp_final_unwritten.
End Independent.
Print Assumptions hwp_optional_refl.
Print Assumptions hwp_state_refl.
Print Assumptions hwp_raw_related.
Print Assumptions hwp_final_same_allocation.
Print Assumptions hwp_final_unwritten.
Print Assumptions Independent.optional_exact.
Print Assumptions Independent.all_state_exact.
Print Assumptions Independent.frame_exact.
