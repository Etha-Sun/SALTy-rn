From HwcConv Require Export RvvMain401InitSupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma hmi_cast64:forall x,unsigned_last_nbits x 64=hc_addr64 x.
Proof. intros;unfold unsigned_last_nbits,hc_addr64;reflexivity. Qed.
Lemma hmi_addr_add_l:forall a b,hc_addr64(hc_addr64 a+b)=hc_addr64(a+b).
Proof. intros;unfold hc_addr64.
 rewrite(Z.add_mod(a mod 18446744073709551616)b 18446744073709551616)by lia.
 rewrite Z.mod_mod by lia;symmetry;apply Z.add_mod;lia. Qed.
Lemma hmi_addr_add_r:forall a b,hc_addr64(a+hc_addr64 b)=hc_addr64(a+b).
Proof. intros;unfold hc_addr64.
 rewrite(Z.add_mod a(b mod 18446744073709551616)18446744073709551616)by lia.
 rewrite Z.mod_mod by lia;symmetry;apply Z.add_mod;lia. Qed.
Lemma hmi_addr_idem:forall a,hc_addr64(hc_addr64 a)=hc_addr64 a.
Proof. intros;unfold hc_addr64;apply Z.mod_mod;lia. Qed.
Ltac hmi_output_expand:=repeat multimatch goal with
 | HP:?p=hc_addr64 ?e|-context[?p]=>is_var p;rewrite HP end.
Ltac hmi_mod_nf:=rewrite ?hmi_cast64;hmi_output_expand;
 repeat progress(try rewrite <-Z.add_assoc;rewrite ?hmi_addr_add_l,?hmi_addr_add_r,?hmi_addr_idem).
Ltac hmi_clip_small:=repeat multimatch goal with
 | |-context[?c-0-1]=>let E:=fresh "Hcsmall"in
 first[assert(E:c=1)by lia|assert(E:c=2)by lia|assert(E:c=3)by lia];rewrite E
 | H1:Z.gt (Z.add ?y 2) ?finish,H2:Z.lt ?y ?finish|-context[Z.sub ?finish 1]=>
 let E:=fresh "Hrowclip"in assert(E:finish-1=y)by lia;rewrite E end.
Ltac hmi_output_solve:=hmi_min;hmi_mod_nf;hmi_clip_small;
 first[reflexivity|apply(f_equal hc_addr64);ring].
Ltac hmi_atom3:=first[solve[hmi_init_atom2]|solve[hmi_word_goal;hmi_addr;lia]|solve[hmi_output_solve]].
Ltac hmi_init_dispatch3:=first[solve[apply hmi_pure_intro;hmi_atom3]|
 lazymatch goal with|-_ |-- andp _ _=>apply _derivable1_andp_intros;[hmi_init_dispatch3|hmi_init_dispatch3]
 | _=>first[solve[fast_cancel]|apply hmi_pure_intro]end].
