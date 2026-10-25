From MaxPool Require Import RvvMemoryControlSupport RvvMemoryLaneFacts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque mp_arm mp_rvv mp_arm_min mp_arm_max mp_load_lane mp_after_groups mp_pass_partial mp_pass_complete mp_out mp_data mp_ptr_data.
Lemma proof_of_test_rvv_entail_wit_14:MaxPool.rvv_unit_goal.test_rvv_entail_wit_14.
Proof.
 unfold MaxPool.rvv_unit_goal.test_rvv_entail_wit_14;right;mpm_prepare.
 lazymatch goal with |-context[mp_write
 (mp_pass_partial ?F ?PT ?previous ?table ?offset ?output ?K ?channels ?group ?done ?lo ?hi)
 (mp_output_cursor ?output ?done) ?vl ?values]=>
 assert(Hvalues:forall lane,0<=lane<vl->values lane=mp_after_groups F PT table offset K group(done+lane)lo hi);
 [intros lane Hlane;unfold mp_pack32
 ;destruct(Z.eqb_spec lane 0)as[Heq0|Hneq0];[subst lane;solve[eapply (mpr_first_lane F PT table offset K done 0 vl lo hi);first[eassumption|reflexivity|lia]]|]
 ;assert(Hlower0:0<lane)by lia
 ;destruct(Z.eqb_spec lane 1)as[Heq1|Hneq1];[subst lane;solve[eapply (mpr_first_lane F PT table offset K done 1 vl lo hi);first[eassumption|reflexivity|lia]]|]
 ;assert(Hlower1:1<lane)by lia
 ;destruct(Z.eqb_spec lane 2)as[Heq2|Hneq2];[subst lane;solve[eapply (mpr_first_lane F PT table offset K done 2 vl lo hi);first[eassumption|reflexivity|lia]]|]
 ;assert(Hlower2:2<lane)by lia
 ;destruct(Z.eqb_spec lane 3)as[Heq3|Hneq3];[subst lane;solve[eapply (mpr_first_lane F PT table offset K done 3 vl lo hi);first[eassumption|reflexivity|lia]]|]
 ;assert(Hlower3:3<lane)by lia
 ;destruct(Z.eqb_spec lane 4)as[Heq4|Hneq4];[subst lane;solve[eapply (mpr_first_lane F PT table offset K done 4 vl lo hi);first[eassumption|reflexivity|lia]]|]
 ;assert(Hlower4:4<lane)by lia
 ;destruct(Z.eqb_spec lane 5)as[Heq5|Hneq5];[subst lane;solve[eapply (mpr_first_lane F PT table offset K done 5 vl lo hi);first[eassumption|reflexivity|lia]]|]
 ;assert(Hlower5:5<lane)by lia
 ;destruct(Z.eqb_spec lane 6)as[Heq6|Hneq6];[subst lane;solve[eapply (mpr_first_lane F PT table offset K done 6 vl lo hi);first[eassumption|reflexivity|lia]]|]
 ;assert(Hlower6:6<lane)by lia
 ;destruct(Z.eqb_spec lane 7)as[Heq7|Hneq7];[subst lane;solve[eapply (mpr_first_lane F PT table offset K done 7 vl lo hi);first[eassumption|reflexivity|lia]]|]
 ;assert(Hlower7:7<lane)by lia
 ;destruct(Z.eqb_spec lane 8)as[Heq8|Hneq8];[subst lane;solve[eapply (mpr_first_lane F PT table offset K done 8 vl lo hi);first[eassumption|reflexivity|lia]]|]
 ;assert(Hlower8:8<lane)by lia
 ;destruct(Z.eqb_spec lane 9)as[Heq9|Hneq9];[subst lane;solve[eapply (mpr_first_lane F PT table offset K done 9 vl lo hi);first[eassumption|reflexivity|lia]]|]
 ;assert(Hlower9:9<lane)by lia
 ;destruct(Z.eqb_spec lane 10)as[Heq10|Hneq10];[subst lane;solve[eapply (mpr_first_lane F PT table offset K done 10 vl lo hi);first[eassumption|reflexivity|lia]]|]
 ;assert(Hlower10:10<lane)by lia
 ;destruct(Z.eqb_spec lane 11)as[Heq11|Hneq11];[subst lane;solve[eapply (mpr_first_lane F PT table offset K done 11 vl lo hi);first[eassumption|reflexivity|lia]]|]
 ;assert(Hlower11:11<lane)by lia
 ;destruct(Z.eqb_spec lane 12)as[Heq12|Hneq12];[subst lane;solve[eapply (mpr_first_lane F PT table offset K done 12 vl lo hi);first[eassumption|reflexivity|lia]]|]
 ;assert(Hlower12:12<lane)by lia
 ;destruct(Z.eqb_spec lane 13)as[Heq13|Hneq13];[subst lane;solve[eapply (mpr_first_lane F PT table offset K done 13 vl lo hi);first[eassumption|reflexivity|lia]]|]
 ;assert(Hlower13:13<lane)by lia
 ;destruct(Z.eqb_spec lane 14)as[Heq14|Hneq14];[subst lane;solve[eapply (mpr_first_lane F PT table offset K done 14 vl lo hi);first[eassumption|reflexivity|lia]]|]
 ;assert(Hlower14:14<lane)by lia
 ;destruct(Z.eqb_spec lane 15)as[Heq15|Hneq15];[subst lane;solve[eapply (mpr_first_lane F PT table offset K done 15 vl lo hi);first[eassumption|reflexivity|lia]]|]
 ;assert(Hlower15:15<lane)by lia
 ;destruct(Z.eqb_spec lane 16)as[Heq16|Hneq16];[subst lane;solve[eapply (mpr_first_lane F PT table offset K done 16 vl lo hi);first[eassumption|reflexivity|lia]]|]
 ;assert(Hlower16:16<lane)by lia
 ;destruct(Z.eqb_spec lane 17)as[Heq17|Hneq17];[subst lane;solve[eapply (mpr_first_lane F PT table offset K done 17 vl lo hi);first[eassumption|reflexivity|lia]]|]
 ;assert(Hlower17:17<lane)by lia
 ;destruct(Z.eqb_spec lane 18)as[Heq18|Hneq18];[subst lane;solve[eapply (mpr_first_lane F PT table offset K done 18 vl lo hi);first[eassumption|reflexivity|lia]]|]
 ;assert(Hlower18:18<lane)by lia
 ;destruct(Z.eqb_spec lane 19)as[Heq19|Hneq19];[subst lane;solve[eapply (mpr_first_lane F PT table offset K done 19 vl lo hi);first[eassumption|reflexivity|lia]]|]
 ;assert(Hlower19:19<lane)by lia
 ;destruct(Z.eqb_spec lane 20)as[Heq20|Hneq20];[subst lane;solve[eapply (mpr_first_lane F PT table offset K done 20 vl lo hi);first[eassumption|reflexivity|lia]]|]
 ;assert(Hlower20:20<lane)by lia
 ;destruct(Z.eqb_spec lane 21)as[Heq21|Hneq21];[subst lane;solve[eapply (mpr_first_lane F PT table offset K done 21 vl lo hi);first[eassumption|reflexivity|lia]]|]
 ;assert(Hlower21:21<lane)by lia
 ;destruct(Z.eqb_spec lane 22)as[Heq22|Hneq22];[subst lane;solve[eapply (mpr_first_lane F PT table offset K done 22 vl lo hi);first[eassumption|reflexivity|lia]]|]
 ;assert(Hlower22:22<lane)by lia
 ;destruct(Z.eqb_spec lane 23)as[Heq23|Hneq23];[subst lane;solve[eapply (mpr_first_lane F PT table offset K done 23 vl lo hi);first[eassumption|reflexivity|lia]]|]
 ;assert(Hlower23:23<lane)by lia
 ;destruct(Z.eqb_spec lane 24)as[Heq24|Hneq24];[subst lane;solve[eapply (mpr_first_lane F PT table offset K done 24 vl lo hi);first[eassumption|reflexivity|lia]]|]
 ;assert(Hlower24:24<lane)by lia
 ;destruct(Z.eqb_spec lane 25)as[Heq25|Hneq25];[subst lane;solve[eapply (mpr_first_lane F PT table offset K done 25 vl lo hi);first[eassumption|reflexivity|lia]]|]
 ;assert(Hlower25:25<lane)by lia
 ;destruct(Z.eqb_spec lane 26)as[Heq26|Hneq26];[subst lane;solve[eapply (mpr_first_lane F PT table offset K done 26 vl lo hi);first[eassumption|reflexivity|lia]]|]
 ;assert(Hlower26:26<lane)by lia
 ;destruct(Z.eqb_spec lane 27)as[Heq27|Hneq27];[subst lane;solve[eapply (mpr_first_lane F PT table offset K done 27 vl lo hi);first[eassumption|reflexivity|lia]]|]
 ;assert(Hlower27:27<lane)by lia
 ;destruct(Z.eqb_spec lane 28)as[Heq28|Hneq28];[subst lane;solve[eapply (mpr_first_lane F PT table offset K done 28 vl lo hi);first[eassumption|reflexivity|lia]]|]
 ;assert(Hlower28:28<lane)by lia
 ;destruct(Z.eqb_spec lane 29)as[Heq29|Hneq29];[subst lane;solve[eapply (mpr_first_lane F PT table offset K done 29 vl lo hi);first[eassumption|reflexivity|lia]]|]
 ;assert(Hlower29:29<lane)by lia
 ;destruct(Z.eqb_spec lane 30)as[Heq30|Hneq30];[subst lane;solve[eapply (mpr_first_lane F PT table offset K done 30 vl lo hi);first[eassumption|reflexivity|lia]]|]
 ;assert(Hlower30:30<lane)by lia
 ;destruct(Z.eqb_spec lane 31)as[Heq31|Hneq31];[subst lane;solve[eapply (mpr_first_lane F PT table offset K done 31 vl lo hi);first[eassumption|reflexivity|lia]]|]
 ;assert(Hlower31:31<lane)by lia

 ;lia
 |rewrite(mp_rvv_write_step F PT previous table offset output K channels group done vl lo hi values ltac:(lia)ltac:(lia)Hvalues)]
 end.
 replace(channels_pre-(c-vl))with((channels_pre-c)+vl)by ring.
 unfold mp_row_cursor,mp_output_cursor.
 mp_call_frame.
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_14.
