From HwcConv Require Export HwcRvv336Pure.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma hr_packed_weight_present:forall F w dx ci ky lane,
 hc_window F w 112 -> 0<=dx<3 -> 0<=ci<3 -> 0<=ky<3 -> 0<=lane<4 ->
 hc_present F (w+((4+((dx*9+ci*3+ky)*4))+lane)*4).
Proof.
 intros F w dx ci ky lane HW HD HC HK HL.
 replace(w+((4+((dx*9+ci*3+ky)*4))+lane)*4)
 with(w+4*((4+((dx*9+ci*3+ky)*4))+lane))by ring.
 eapply hc_window_lane;[exact HW|lia].
Qed.
Ltac hr_weight_atom:=first[assumption|reflexivity|lia|congruence|
 solve[eapply hr_packed_weight_present;[eassumption|lia|lia|lia|lia]]].
Ltac hr_weight_pure:=lazymatch goal with
 | |- ?P |-- coq_prop ?Q => apply hr_pure_right;hr_weight_atom
 | |- ?P |-- andp ?Q ?S => apply _derivable1_andp_intros;[hr_weight_pure|hr_weight_pure]
 | |- ?P |-- truep => unfold derivable1,truep;intros;exact I end.
Ltac hr_weight_solve:=first[solve[hr_intro;hr_prepare;hr_weight_pure]|solve[left;hr_intro;hr_prepare;hr_weight_pure]|solve[right;hr_intro;hr_prepare;hr_weight_pure]].
Print Assumptions hr_packed_weight_present.
