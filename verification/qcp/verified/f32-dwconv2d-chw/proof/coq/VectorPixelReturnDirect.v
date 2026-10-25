From Coq Require Import ZArith Lia List.
From SimpleC.SL Require Import Mem SeparationLogic.
From DwChw Require Import VectorPixelModel Store8Model pixel_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque dw_rvv_fma dw_repaired_min dw_repaired_max.
Lemma proof_of_dw_vector_pixel_compute_return_wit_1:
 DwChw.pixel_unit_goal.dw_vector_pixel_compute_return_wit_1.
Proof.
 unfold DwChw.pixel_unit_goal.dw_vector_pixel_compute_return_wit_1;right;intros.
 cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *.
 lazymatch goal with |- _ |-- andp(coq_prop ?P)_=>assert(Hresult:P)end.
 - unfold dw_vector_match8;intros i Hi.
   assert(Hcases:i=0 \/ i=1 \/ i=2 \/ i=3 \/ i=4 \/ i=5 \/ i=6 \/ i=7)by lia.
   destruct Hcases as[H0|[H1|[H2|[H3|[H4|[H5|[H6|H7]]]]]]].
   + subst i. idtac "exact-lane-0".
     unfold dw_vector_pixel,dw_load,dw_chw_rvv_pixel,dw_chw_rvv_fold,dw_chw_terms.
     cbn[List.fold_left fst snd dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH1;destruct PreH1 as[Hbad|E1];[lia|];rewrite E1;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH9;destruct PreH9 as[Hbad|E9];[lia|];rewrite E9;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH17;destruct PreH17 as[Hbad|E17];[lia|];rewrite E17;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH34;destruct PreH34 as[Hbad|E34];[lia|];rewrite E34;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH51;destruct PreH51 as[Hbad|E51];[lia|];rewrite E51;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH68;destruct PreH68 as[Hbad|E68];[lia|];rewrite E68;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH85;destruct PreH85 as[Hbad|E85];[lia|];rewrite E85;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH102;destruct PreH102 as[Hbad|E102];[lia|];rewrite E102;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH119;destruct PreH119 as[Hbad|E119];[lia|];rewrite E119;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH128;destruct PreH128 as[Hbad|E128];[lia|];rewrite E128;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH137;destruct PreH137 as[Hbad|E137];[lia|];rewrite E137;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH146;destruct PreH146 as[Hbad|E146];[lia|];rewrite E146;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH26;destruct PreH26 as[Hbad|E26];[lia|];rewrite E26;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH43;destruct PreH43 as[Hbad|E43];[lia|];rewrite E43;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH60;destruct PreH60 as[Hbad|E60];[lia|];rewrite E60;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH77;destruct PreH77 as[Hbad|E77];[lia|];rewrite E77;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH94;destruct PreH94 as[Hbad|E94];[lia|];rewrite E94;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH111;destruct PreH111 as[Hbad|E111];[lia|];rewrite E111;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_same in PreH25;rewrite PreH25.
     unfold dw_same in PreH42;rewrite PreH42.
     unfold dw_same in PreH59;rewrite PreH59.
     unfold dw_same in PreH76;rewrite PreH76.
     unfold dw_same in PreH93;rewrite PreH93.
     unfold dw_same in PreH110;rewrite PreH110.
     unfold dw_same in PreH127;rewrite PreH127.
     unfold dw_same in PreH136;rewrite PreH136.
     unfold dw_same in PreH145;rewrite PreH145.
     unfold dw_same in PreH154;rewrite PreH154.
     reflexivity.
   + subst i. idtac "exact-lane-1".
     unfold dw_vector_pixel,dw_load,dw_chw_rvv_pixel,dw_chw_rvv_fold,dw_chw_terms.
     cbn[List.fold_left fst snd dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH2;destruct PreH2 as[Hbad|E2];[lia|];rewrite E2;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH10;destruct PreH10 as[Hbad|E10];[lia|];rewrite E10;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH18;destruct PreH18 as[Hbad|E18];[lia|];rewrite E18;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH35;destruct PreH35 as[Hbad|E35];[lia|];rewrite E35;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH52;destruct PreH52 as[Hbad|E52];[lia|];rewrite E52;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH69;destruct PreH69 as[Hbad|E69];[lia|];rewrite E69;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH86;destruct PreH86 as[Hbad|E86];[lia|];rewrite E86;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH103;destruct PreH103 as[Hbad|E103];[lia|];rewrite E103;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH120;destruct PreH120 as[Hbad|E120];[lia|];rewrite E120;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH129;destruct PreH129 as[Hbad|E129];[lia|];rewrite E129;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH138;destruct PreH138 as[Hbad|E138];[lia|];rewrite E138;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH147;destruct PreH147 as[Hbad|E147];[lia|];rewrite E147;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH27;destruct PreH27 as[Hbad|E27];[lia|];rewrite E27;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH44;destruct PreH44 as[Hbad|E44];[lia|];rewrite E44;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH61;destruct PreH61 as[Hbad|E61];[lia|];rewrite E61;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH78;destruct PreH78 as[Hbad|E78];[lia|];rewrite E78;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH95;destruct PreH95 as[Hbad|E95];[lia|];rewrite E95;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH112;destruct PreH112 as[Hbad|E112];[lia|];rewrite E112;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_same in PreH25;rewrite PreH25.
     unfold dw_same in PreH42;rewrite PreH42.
     unfold dw_same in PreH59;rewrite PreH59.
     unfold dw_same in PreH76;rewrite PreH76.
     unfold dw_same in PreH93;rewrite PreH93.
     unfold dw_same in PreH110;rewrite PreH110.
     unfold dw_same in PreH127;rewrite PreH127.
     unfold dw_same in PreH136;rewrite PreH136.
     unfold dw_same in PreH145;rewrite PreH145.
     unfold dw_same in PreH154;rewrite PreH154.
     reflexivity.
   + subst i. idtac "exact-lane-2".
     unfold dw_vector_pixel,dw_load,dw_chw_rvv_pixel,dw_chw_rvv_fold,dw_chw_terms.
     cbn[List.fold_left fst snd dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH3;destruct PreH3 as[Hbad|E3];[lia|];rewrite E3;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH11;destruct PreH11 as[Hbad|E11];[lia|];rewrite E11;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH19;destruct PreH19 as[Hbad|E19];[lia|];rewrite E19;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH36;destruct PreH36 as[Hbad|E36];[lia|];rewrite E36;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH53;destruct PreH53 as[Hbad|E53];[lia|];rewrite E53;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH70;destruct PreH70 as[Hbad|E70];[lia|];rewrite E70;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH87;destruct PreH87 as[Hbad|E87];[lia|];rewrite E87;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH104;destruct PreH104 as[Hbad|E104];[lia|];rewrite E104;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH121;destruct PreH121 as[Hbad|E121];[lia|];rewrite E121;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH130;destruct PreH130 as[Hbad|E130];[lia|];rewrite E130;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH139;destruct PreH139 as[Hbad|E139];[lia|];rewrite E139;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH148;destruct PreH148 as[Hbad|E148];[lia|];rewrite E148;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH28;destruct PreH28 as[Hbad|E28];[lia|];rewrite E28;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH45;destruct PreH45 as[Hbad|E45];[lia|];rewrite E45;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH62;destruct PreH62 as[Hbad|E62];[lia|];rewrite E62;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH79;destruct PreH79 as[Hbad|E79];[lia|];rewrite E79;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH96;destruct PreH96 as[Hbad|E96];[lia|];rewrite E96;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH113;destruct PreH113 as[Hbad|E113];[lia|];rewrite E113;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_same in PreH25;rewrite PreH25.
     unfold dw_same in PreH42;rewrite PreH42.
     unfold dw_same in PreH59;rewrite PreH59.
     unfold dw_same in PreH76;rewrite PreH76.
     unfold dw_same in PreH93;rewrite PreH93.
     unfold dw_same in PreH110;rewrite PreH110.
     unfold dw_same in PreH127;rewrite PreH127.
     unfold dw_same in PreH136;rewrite PreH136.
     unfold dw_same in PreH145;rewrite PreH145.
     unfold dw_same in PreH154;rewrite PreH154.
     reflexivity.
   + subst i. idtac "exact-lane-3".
     unfold dw_vector_pixel,dw_load,dw_chw_rvv_pixel,dw_chw_rvv_fold,dw_chw_terms.
     cbn[List.fold_left fst snd dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH4;destruct PreH4 as[Hbad|E4];[lia|];rewrite E4;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH12;destruct PreH12 as[Hbad|E12];[lia|];rewrite E12;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH20;destruct PreH20 as[Hbad|E20];[lia|];rewrite E20;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH37;destruct PreH37 as[Hbad|E37];[lia|];rewrite E37;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH54;destruct PreH54 as[Hbad|E54];[lia|];rewrite E54;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH71;destruct PreH71 as[Hbad|E71];[lia|];rewrite E71;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH88;destruct PreH88 as[Hbad|E88];[lia|];rewrite E88;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH105;destruct PreH105 as[Hbad|E105];[lia|];rewrite E105;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH122;destruct PreH122 as[Hbad|E122];[lia|];rewrite E122;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH131;destruct PreH131 as[Hbad|E131];[lia|];rewrite E131;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH140;destruct PreH140 as[Hbad|E140];[lia|];rewrite E140;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH149;destruct PreH149 as[Hbad|E149];[lia|];rewrite E149;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH29;destruct PreH29 as[Hbad|E29];[lia|];rewrite E29;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH46;destruct PreH46 as[Hbad|E46];[lia|];rewrite E46;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH63;destruct PreH63 as[Hbad|E63];[lia|];rewrite E63;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH80;destruct PreH80 as[Hbad|E80];[lia|];rewrite E80;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH97;destruct PreH97 as[Hbad|E97];[lia|];rewrite E97;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH114;destruct PreH114 as[Hbad|E114];[lia|];rewrite E114;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_same in PreH25;rewrite PreH25.
     unfold dw_same in PreH42;rewrite PreH42.
     unfold dw_same in PreH59;rewrite PreH59.
     unfold dw_same in PreH76;rewrite PreH76.
     unfold dw_same in PreH93;rewrite PreH93.
     unfold dw_same in PreH110;rewrite PreH110.
     unfold dw_same in PreH127;rewrite PreH127.
     unfold dw_same in PreH136;rewrite PreH136.
     unfold dw_same in PreH145;rewrite PreH145.
     unfold dw_same in PreH154;rewrite PreH154.
     reflexivity.
   + subst i. idtac "exact-lane-4".
     unfold dw_vector_pixel,dw_load,dw_chw_rvv_pixel,dw_chw_rvv_fold,dw_chw_terms.
     cbn[List.fold_left fst snd dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH5;destruct PreH5 as[Hbad|E5];[lia|];rewrite E5;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH13;destruct PreH13 as[Hbad|E13];[lia|];rewrite E13;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH21;destruct PreH21 as[Hbad|E21];[lia|];rewrite E21;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH38;destruct PreH38 as[Hbad|E38];[lia|];rewrite E38;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH55;destruct PreH55 as[Hbad|E55];[lia|];rewrite E55;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH72;destruct PreH72 as[Hbad|E72];[lia|];rewrite E72;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH89;destruct PreH89 as[Hbad|E89];[lia|];rewrite E89;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH106;destruct PreH106 as[Hbad|E106];[lia|];rewrite E106;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH123;destruct PreH123 as[Hbad|E123];[lia|];rewrite E123;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH132;destruct PreH132 as[Hbad|E132];[lia|];rewrite E132;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH141;destruct PreH141 as[Hbad|E141];[lia|];rewrite E141;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH150;destruct PreH150 as[Hbad|E150];[lia|];rewrite E150;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH30;destruct PreH30 as[Hbad|E30];[lia|];rewrite E30;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH47;destruct PreH47 as[Hbad|E47];[lia|];rewrite E47;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH64;destruct PreH64 as[Hbad|E64];[lia|];rewrite E64;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH81;destruct PreH81 as[Hbad|E81];[lia|];rewrite E81;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH98;destruct PreH98 as[Hbad|E98];[lia|];rewrite E98;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH115;destruct PreH115 as[Hbad|E115];[lia|];rewrite E115;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_same in PreH25;rewrite PreH25.
     unfold dw_same in PreH42;rewrite PreH42.
     unfold dw_same in PreH59;rewrite PreH59.
     unfold dw_same in PreH76;rewrite PreH76.
     unfold dw_same in PreH93;rewrite PreH93.
     unfold dw_same in PreH110;rewrite PreH110.
     unfold dw_same in PreH127;rewrite PreH127.
     unfold dw_same in PreH136;rewrite PreH136.
     unfold dw_same in PreH145;rewrite PreH145.
     unfold dw_same in PreH154;rewrite PreH154.
     reflexivity.
   + subst i. idtac "exact-lane-5".
     unfold dw_vector_pixel,dw_load,dw_chw_rvv_pixel,dw_chw_rvv_fold,dw_chw_terms.
     cbn[List.fold_left fst snd dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH6;destruct PreH6 as[Hbad|E6];[lia|];rewrite E6;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH14;destruct PreH14 as[Hbad|E14];[lia|];rewrite E14;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH22;destruct PreH22 as[Hbad|E22];[lia|];rewrite E22;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH39;destruct PreH39 as[Hbad|E39];[lia|];rewrite E39;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH56;destruct PreH56 as[Hbad|E56];[lia|];rewrite E56;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH73;destruct PreH73 as[Hbad|E73];[lia|];rewrite E73;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH90;destruct PreH90 as[Hbad|E90];[lia|];rewrite E90;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH107;destruct PreH107 as[Hbad|E107];[lia|];rewrite E107;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH124;destruct PreH124 as[Hbad|E124];[lia|];rewrite E124;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH133;destruct PreH133 as[Hbad|E133];[lia|];rewrite E133;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH142;destruct PreH142 as[Hbad|E142];[lia|];rewrite E142;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH151;destruct PreH151 as[Hbad|E151];[lia|];rewrite E151;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH31;destruct PreH31 as[Hbad|E31];[lia|];rewrite E31;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH48;destruct PreH48 as[Hbad|E48];[lia|];rewrite E48;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH65;destruct PreH65 as[Hbad|E65];[lia|];rewrite E65;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH82;destruct PreH82 as[Hbad|E82];[lia|];rewrite E82;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH99;destruct PreH99 as[Hbad|E99];[lia|];rewrite E99;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH116;destruct PreH116 as[Hbad|E116];[lia|];rewrite E116;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_same in PreH25;rewrite PreH25.
     unfold dw_same in PreH42;rewrite PreH42.
     unfold dw_same in PreH59;rewrite PreH59.
     unfold dw_same in PreH76;rewrite PreH76.
     unfold dw_same in PreH93;rewrite PreH93.
     unfold dw_same in PreH110;rewrite PreH110.
     unfold dw_same in PreH127;rewrite PreH127.
     unfold dw_same in PreH136;rewrite PreH136.
     unfold dw_same in PreH145;rewrite PreH145.
     unfold dw_same in PreH154;rewrite PreH154.
     reflexivity.
   + subst i. idtac "exact-lane-6".
     unfold dw_vector_pixel,dw_load,dw_chw_rvv_pixel,dw_chw_rvv_fold,dw_chw_terms.
     cbn[List.fold_left fst snd dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH7;destruct PreH7 as[Hbad|E7];[lia|];rewrite E7;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH15;destruct PreH15 as[Hbad|E15];[lia|];rewrite E15;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH23;destruct PreH23 as[Hbad|E23];[lia|];rewrite E23;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH40;destruct PreH40 as[Hbad|E40];[lia|];rewrite E40;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH57;destruct PreH57 as[Hbad|E57];[lia|];rewrite E57;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH74;destruct PreH74 as[Hbad|E74];[lia|];rewrite E74;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH91;destruct PreH91 as[Hbad|E91];[lia|];rewrite E91;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH108;destruct PreH108 as[Hbad|E108];[lia|];rewrite E108;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH125;destruct PreH125 as[Hbad|E125];[lia|];rewrite E125;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH134;destruct PreH134 as[Hbad|E134];[lia|];rewrite E134;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH143;destruct PreH143 as[Hbad|E143];[lia|];rewrite E143;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH152;destruct PreH152 as[Hbad|E152];[lia|];rewrite E152;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH32;destruct PreH32 as[Hbad|E32];[lia|];rewrite E32;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH49;destruct PreH49 as[Hbad|E49];[lia|];rewrite E49;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH66;destruct PreH66 as[Hbad|E66];[lia|];rewrite E66;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH83;destruct PreH83 as[Hbad|E83];[lia|];rewrite E83;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH100;destruct PreH100 as[Hbad|E100];[lia|];rewrite E100;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH117;destruct PreH117 as[Hbad|E117];[lia|];rewrite E117;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_same in PreH25;rewrite PreH25.
     unfold dw_same in PreH42;rewrite PreH42.
     unfold dw_same in PreH59;rewrite PreH59.
     unfold dw_same in PreH76;rewrite PreH76.
     unfold dw_same in PreH93;rewrite PreH93.
     unfold dw_same in PreH110;rewrite PreH110.
     unfold dw_same in PreH127;rewrite PreH127.
     unfold dw_same in PreH136;rewrite PreH136.
     unfold dw_same in PreH145;rewrite PreH145.
     unfold dw_same in PreH154;rewrite PreH154.
     reflexivity.
   + subst i. idtac "exact-lane-7".
     unfold dw_vector_pixel,dw_load,dw_chw_rvv_pixel,dw_chw_rvv_fold,dw_chw_terms.
     cbn[List.fold_left fst snd dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH8;destruct PreH8 as[Hbad|E8];[lia|];rewrite E8;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH16;destruct PreH16 as[Hbad|E16];[lia|];rewrite E16;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH24;destruct PreH24 as[Hbad|E24];[lia|];rewrite E24;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH41;destruct PreH41 as[Hbad|E41];[lia|];rewrite E41;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH58;destruct PreH58 as[Hbad|E58];[lia|];rewrite E58;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH75;destruct PreH75 as[Hbad|E75];[lia|];rewrite E75;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH92;destruct PreH92 as[Hbad|E92];[lia|];rewrite E92;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH109;destruct PreH109 as[Hbad|E109];[lia|];rewrite E109;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH126;destruct PreH126 as[Hbad|E126];[lia|];rewrite E126;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH135;destruct PreH135 as[Hbad|E135];[lia|];rewrite E135;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH144;destruct PreH144 as[Hbad|E144];[lia|];rewrite E144;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH153;destruct PreH153 as[Hbad|E153];[lia|];rewrite E153;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH33;destruct PreH33 as[Hbad|E33];[lia|];rewrite E33;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH50;destruct PreH50 as[Hbad|E50];[lia|];rewrite E50;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH67;destruct PreH67 as[Hbad|E67];[lia|];rewrite E67;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH84;destruct PreH84 as[Hbad|E84];[lia|];rewrite E84;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH101;destruct PreH101 as[Hbad|E101];[lia|];rewrite E101;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_fp_match in PreH118;destruct PreH118 as[Hbad|E118];[lia|];rewrite E118;cbn[dw_fp8 List.nth Z.to_nat].
     unfold dw_same in PreH25;rewrite PreH25.
     unfold dw_same in PreH42;rewrite PreH42.
     unfold dw_same in PreH59;rewrite PreH59.
     unfold dw_same in PreH76;rewrite PreH76.
     unfold dw_same in PreH93;rewrite PreH93.
     unfold dw_same in PreH110;rewrite PreH110.
     unfold dw_same in PreH127;rewrite PreH127.
     unfold dw_same in PreH136;rewrite PreH136.
     unfold dw_same in PreH145;rewrite PreH145.
     unfold dw_same in PreH154;rewrite PreH154.
     reflexivity.
 - entailer!.
Qed.
Print Assumptions proof_of_dw_vector_pixel_compute_return_wit_1.
