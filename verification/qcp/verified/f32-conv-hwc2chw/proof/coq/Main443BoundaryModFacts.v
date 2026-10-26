From HwcConv Require Export Main443BoundaryEntryTactics.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma hmb_mod_add_congr:forall a a' b b',
 hc_addr64 a=hc_addr64 a'->hc_addr64 b=hc_addr64 b'->
 hc_addr64(a+b)=hc_addr64(a'+b').
Proof. unfold hc_addr64;intros a a' b b' HA HB.
 rewrite(Z.add_mod a b 18446744073709551616),(Z.add_mod a' b' 18446744073709551616)by lia;rewrite HA,HB;reflexivity. Qed.
Lemma hmb_mod_mul_congr:forall a a' b b',
 hc_addr64 a=hc_addr64 a'->hc_addr64 b=hc_addr64 b'->
 hc_addr64(a*b)=hc_addr64(a'*b').
Proof. unfold hc_addr64;intros a a' b b' HA HB.
 rewrite(Z.mul_mod a b 18446744073709551616),(Z.mul_mod a' b' 18446744073709551616)by lia;rewrite HA,HB;reflexivity. Qed.
Lemma hmb_mod_sub_congr:forall a a' b b',
 hc_addr64 a=hc_addr64 a'->hc_addr64 b=hc_addr64 b'->
 hc_addr64(a-b)=hc_addr64(a'-b').
Proof. unfold hc_addr64;intros a a' b b' HA HB.
 rewrite(Zminus_mod a b 18446744073709551616),(Zminus_mod a' b' 18446744073709551616)by lia;rewrite HA,HB;reflexivity. Qed.
Ltac hmb_strip64 v:=lazymatch v with
 |unsigned_last_nbits ?a 64=>hmb_strip64 a
 |hc_addr64 ?a=>hmb_strip64 a
 |Z.add ?a ?b=>let x:=hmb_strip64 a in let y:=hmb_strip64 b in constr:(x+y)
 |Z.mul ?a ?b=>let x:=hmb_strip64 a in let y:=hmb_strip64 b in constr:(x*y)
 |Z.sub ?a ?b=>let x:=hmb_strip64 a in let y:=hmb_strip64 b in constr:(x-y)
 |_=>v end.
Ltac hmb_mod_tree_proof:=first[reflexivity|lazymatch goal with
 | |-hc_addr64(unsigned_last_nbits ?a 64)=_=>rewrite(hmi_cast64 a),(hmi_addr_idem a);hmb_mod_tree_proof
 | |-hc_addr64(hc_addr64 ?a)=_=>rewrite(hmi_addr_idem a);hmb_mod_tree_proof
 | |-hc_addr64(Z.add _ _)=hc_addr64(Z.add _ _)=>apply hmb_mod_add_congr;hmb_mod_tree_proof
 | |-hc_addr64(Z.mul _ _)=hc_addr64(Z.mul _ _)=>apply hmb_mod_mul_congr;hmb_mod_tree_proof
 | |-hc_addr64(Z.sub _ _)=hc_addr64(Z.sub _ _)=>apply hmb_mod_sub_congr;hmb_mod_tree_proof
 end].
Ltac hmb_mod_nf2:=rewrite ?hmi_cast64;
 repeat multimatch goal with|-context[hc_addr64 ?v]=>
 let raw:=hmb_strip64 v in
 tryif constr_eq v raw then fail 1 else
 (let E:=fresh "Hmodtree"in assert(E:hc_addr64 v=hc_addr64 raw)by hmb_mod_tree_proof;rewrite E;clear E)
 end.
Ltac hmb_valid_read_solve2:=hmb_mod_nf2;
 multimatch goal with
 | |-hc_addr64 ?expr=hc_row_base ?input ?zero ?H ?N ?row=>
 replace expr with(input+12*N*row)by ring;
 apply hmb_valid_read;[lia|first[eassumption|unfold hc_footprint,hc_u64_limit;repeat split;nia]|lia]
 end.
Ltac hmb_rows_initial2:=unfold hc_rows_pending,hc_pending_row;
 intros;repeat split;intros;first[lia|reflexivity|hmb_valid_read_solve2].
Ltac hmb_pending_outputs2:=unfold hc_pending_outputs;intros;split;
 hmb_mod_nf2;apply(f_equal hc_addr64);ring.
Ltac hmb_entry_dispatch2:=lazymatch goal with
 | |-hc_rows_pending _ _ _ _ _ _ _ _ _ _ _ _=>hmb_rows_initial2
 | |-hc_pending_outputs _ _ _ _ _ _=>hmb_pending_outputs2
 | |- _ = _=>first[solve[hmi_word_goal;first[reflexivity|ring]]|
  solve[hmi_word_goal;hmb_mod_nf2;apply(f_equal hc_addr64);ring]]
 end.
Ltac hmb_entry_context2:=hmb_entry_context;
 multimatch goal with
 | HD:hc_input_domain ?F ?input ?zero ?weights ?params ?H ?N ?top ?start ?finish ?C|-_=>
 let HF:=fresh "Hinputfoot"in assert(HF:hc_footprint input(3*H*N+3))by(unfold hc_input_domain in HD;tauto) end.
