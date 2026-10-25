From Coq Require Import ZArith List Lia.
From X32Packw Require Export LayoutModel ScalarMemory.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.

(* Each prefix is an ordered sequence of actual word writes. None values in
   untouched padding and holes are retained. Readonly W/B share the input
   map, so a bias pointer may alias a weight pointer without double ownership. *)
Definition pw_write_pair(O:PWOutput)(p a b:Z):PWOutput:=
 pw_output_put(pw_output_put O p a)(p+4)b.
Fixpoint pw_pair_run_nat(n:nat)(F:PWMap)(a b p:Z)(O:PWOutput):PWOutput:=
 match n with
 |O=>O
 |S rest=>let i:=Z.of_nat rest in
  pw_write_pair(pw_pair_run_nat rest F a b p O)(p+8*i)
   (pw_get F(a+4*i))(pw_get F(b+4*i))
 end.
Definition pw_pair_run(n:Z):=pw_pair_run_nat(Z.to_nat n).
Fixpoint pw_odd_run_nat(n:nat)(F:PWMap)(a p:Z)(O:PWOutput):PWOutput:=
 match n with
 |O=>O
 |S rest=>let i:=Z.of_nat rest in
  pw_output_put(pw_odd_run_nat rest F a p O)(p+8*i)(pw_get F(a+4*i))
 end.
Definition pw_odd_run(n:Z):=pw_odd_run_nat(Z.to_nat n).
Definition pw_header(F:PWMap)(present:bool)(pair:bool)(b p:Z)(O:PWOutput):PWOutput:=
 if present then if pair then pw_write_pair O p(pw_get F b)(pw_get F(b+4))
                 else pw_output_put O p(pw_get F b)
 else pw_write_pair O p 0 0.
Definition pw_tile_output(G:PWCall)(group tile:Z):Z:=
 pw_output_base G+(group*pw_tiles G+tile)*pw_tile_bytes G.
Definition pw_tile_weight(G:PWCall)(group tile:Z):Z:=
 pw_weights G+(group*pw_channels G+2*tile)*pw_depth G*4.
Definition pw_tile_bias(G:PWCall)(group tile:Z):Z:=
 pw_bias G+(group*pw_channels G+2*tile)*4.
Definition pw_tile(F:PWMap)(G:PWCall)(group tile:Z)(O:PWOutput):PWOutput:=
 let present:=negb(Z.eqb(pw_bias G)0)in
 let pair:=Z.ltb(2*tile+1)(pw_channels G)in
 let a:=pw_tile_weight G group tile in
 let p:=pw_tile_output G group tile in
 let H:=pw_header F present pair(pw_tile_bias G group tile)p O in
 if pair then pw_pair_run(pw_depth G)F a(a+4*pw_depth G)(p+8)H
 else pw_odd_run(pw_depth G)F a(p+8)H.
Fixpoint pw_tiles_run_nat(n:nat)(F:PWMap)(G:PWCall)(group:Z)(O:PWOutput):PWOutput:=
 match n with O=>O|S rest=>pw_tile F G group(Z.of_nat rest)(pw_tiles_run_nat rest F G group O)end.
Definition pw_tiles_run(n:Z):=pw_tiles_run_nat(Z.to_nat n).
Fixpoint pw_groups_run_nat(n:nat)(F:PWMap)(G:PWCall)(O:PWOutput):PWOutput:=
 match n with O=>O|S rest=>pw_tiles_run(pw_tiles G)F G(Z.of_nat rest)(pw_groups_run_nat rest F G O)end.
Definition pw_groups_run(n:Z):=pw_groups_run_nat(Z.to_nat n).
Definition pw_program(F:PWMap)(G:PWCall)(O:PWOutput):PWOutput:=
 pw_groups_run(pw_groups G)F G O.
Definition pw_program_storage(F:PWMap)(W:list Z)(G:PWCall):Prop:=
 pw_call_inputs F G /\ NoDup W /\
 (forall i,0<=i<pw_output_bytes G/4->In(pw_output_base G+4*i)W).
Definition pw_legal_vl(avl vl:Z):Prop:=
 (0<=avl<=16/\vl=avl)\/(16<avl<32/\(avl+1)/2<=vl<=16)\/(32<=avl/\vl=16).
Definition pw_active_lane(F:PWMap)(p vl i x:Z):Prop:=i<vl->x=pw_get F(p+4*i).
Definition pw_vec2(a b:Z):list Z:=[a;b].
Definition pw_vec16(a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15:Z):list Z:=
 [a0;a1;a2;a3;a4;a5;a6;a7;a8;a9;a10;a11;a12;a13;a14;a15].
Fixpoint pw_segmented_nat(n:nat)(A B:list Z)(p:Z)(O:PWOutput):PWOutput:=
 match n with O=>O|S rest=>let i:=Z.of_nat rest in
 pw_write_pair(pw_segmented_nat rest A B p O)(p+8*i)(Znth i A 0)(Znth i B 0)end.
Definition pw_segmented(vl:Z):=pw_segmented_nat(Z.to_nat vl).
Fixpoint pw_strided_nat(n:nat)(A:list Z)(p:Z)(O:PWOutput):PWOutput:=
 match n with O=>O|S rest=>let i:=Z.of_nat rest in
 pw_output_put(pw_strided_nat rest A p O)(p+8*i)(Znth i A 0)end.
Definition pw_strided(vl:Z):=pw_strided_nat(Z.to_nat vl).
