From Coq Require Import ZArith List Bool Lia.
From X32Packw Require Export InputMemory ControlModel.
From AUXLib Require Import ListLib.
Import ListNotations.
Local Open Scope Z_scope.

Record PWCall:Type:={
 pw_groups:Z;pw_channels:Z;pw_depth:Z;pw_extra_bytes:Z;
 pw_weights:Z;pw_bias:Z;pw_output_base:Z
}.
Definition pw_tiles(G:PWCall):Z:=(pw_channels G+1)/2.
Definition pw_tile_bytes(G:PWCall):Z:=8*(pw_depth G+1)+pw_extra_bytes G.
Definition pw_output_bytes(G:PWCall):Z:=pw_groups G*pw_tiles G*pw_tile_bytes G.
Definition pw_read_values(F:PWMap)(base count:Z):list Z:=
 map(fun i=>pw_get F(base+4*Z.of_nat i))(seq 0(Z.to_nat count)).
Definition pw_input_map_valid(F:PWMap):Prop:=
 NoDup(map fst F) /\ Forall(fun pv=>pw_word(snd pv))F.
(* Pinned Arcadia Entry permits bias/weights RO aliases. Own them in one
   input map; only the output must be spatially separate from that map. *)
Definition pw_call_inputs(F:PWMap)(G:PWCall):Prop:=
 0<pw_groups G<18446744073709551616 /\
 0<pw_channels G<18446744073709551616 /\
 0<pw_depth G<18446744073709551616 /\
 0<=pw_extra_bytes G<18446744073709551616 /\
 pw_extra_bytes G mod 4=0 /\
 0<pw_weights G /\ pw_weights G mod 4=0 /\
 0<pw_output_base G /\ pw_output_base G mod 4=0 /\
 pw_weights G+4*pw_groups G*pw_channels G*pw_depth G<18446744073709551616 /\
 pw_output_base G+pw_output_bytes G<18446744073709551616 /\
 pw_window F(pw_weights G)(pw_groups G*pw_channels G*pw_depth G) /\
 (pw_bias G=0 \/
   (0<pw_bias G /\ pw_bias G mod 4=0 /\
    pw_bias G+4*pw_groups G*pw_channels G<18446744073709551616 /\
    pw_window F(pw_bias G)(pw_groups G*pw_channels G))) /\
 pw_input_map_valid F.
(* Pure reference fold migrated from the old scalar development. A proof of
   this definition alone is NOT a proof of either actual original SIMD C. *)
Definition pw_packed_values(F:PWMap)(G:PWCall)(OLD:list Z):list Z:=
 pw_groups_prefix(pw_groups G)(negb(Z.eqb(pw_bias G)0))
 (pw_channels G)(pw_depth G)(pw_extra_bytes G/4)(pw_channels G/2)
 (pw_output_bytes G/4)
 (pw_read_values F(pw_weights G)(pw_groups G*pw_channels G*pw_depth G))
 (pw_read_values F(pw_bias G)(pw_groups G*pw_channels G))OLD.

Lemma pw_read_values_length:forall F base count,0<=count->
 Zlength(pw_read_values F base count)=count.
Proof. intros;unfold pw_read_values;rewrite Zlength_correct,map_length,seq_length,Z2Nat.id by lia;reflexivity. Qed.
Lemma pw_read_values_nth:forall F base count i,0<=i<count->
 Znth i(pw_read_values F base count)0=pw_get F(base+4*i).
Proof.
 intros F base count i Hi;unfold pw_read_values,Znth.
 rewrite nth_indep with(d':=pw_get F(base+4*Z.of_nat 0)).
 - rewrite (@List.map_nth nat Z (fun j:nat=>pw_get F(base+4*Z.of_nat j)) (seq 0(Z.to_nat count)) (0%nat)(Z.to_nat i));rewrite seq_nth by lia;change(pw_get F(base+4*Z.of_nat(Z.to_nat i))=pw_get F(base+4*i));rewrite Z2Nat.id by lia;reflexivity.
 - rewrite map_length,seq_length;apply Z2Nat.inj_lt;lia.
Qed.
Print Assumptions pw_read_values_length.
Print Assumptions pw_read_values_nth.
