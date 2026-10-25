From Coq Require Import ZArith Lia.
From MaxPool Require Export KernelState CompareModel.
From MaxPool Require Import WindowFacts WriteFacts.
Local Open Scope Z_scope.
Definition mp_last_pointer(output outinc pixels channel:Z):Z:=
 mp_output_cursor(mp_output_at output outinc(pixels-1))channel.
Definition mp_last_value(F:MPFloatMap)(PT:MPPtrMap)
 (table offset stride inc pixels K channel:Z)(lo hi:fp32):fp32:=
 mp_result_lane F PT(mp_table_at table inc(pixels-1))
 (mp_offset_at offset stride(pixels-1))K channel lo hi.
Lemma mp_complete_last_known:forall F PT old pixels K channels table offset stride inc output outinc channel lo hi,
 0<pixels->0<=channel<channels->
 mp_out_known(mp_complete F PT old pixels K channels table offset stride inc output outinc lo hi)
 (mp_last_pointer output outinc pixels channel)
 (mp_last_value F PT table offset stride inc pixels K channel lo hi).
Proof.
 intros F PT old pixels K channels table offset stride inc output outinc channel lo hi HP Hchannel.
 unfold mp_out_known,mp_complete,mp_last_pointer,mp_last_value,mp_output_cursor.
 replace(Z.to_nat pixels)with(S(Z.to_nat(pixels-1)))
 by(rewrite<-Z2Nat.inj_succ by lia;f_equal;lia).
 cbn[mp_finish_pixels mp_finish_pixel].
 rewrite Z2Nat.id by lia;apply mp_write_inside;assumption.
Qed.
Lemma mp_last_window:forall F PT W pixels K channels table offset stride inc output outinc channel,
 mp_geometry F PT W pixels K channels table offset stride inc output outinc->
 0<pixels->0<=channel<channels->
 mp_write_window W(mp_last_pointer output outinc pixels channel)4.
Proof.
 intros F PT W pixels K channels table offset stride inc output outinc channel HG HP HC.
 pose proof(mp_geometry_pixel F PT W pixels K channels table offset stride inc output outinc(pixels-1)HG ltac:(lia))as[HR HW].
 unfold mp_last_pointer,mp_output_cursor;eapply mp_write_window_suffix;[exact HW|lia|lia|lia].
Qed.
