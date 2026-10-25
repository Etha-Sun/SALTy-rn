From Coq Require Import ZArith List Lia Ring.
From X32Packw Require Export Types AddressSupport TileAccessFacts.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Ltac pw_tile_normalize:=
 cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;
 unfold pw_offset in *;subst;
 try unfold UndefStructPreduint32x2_t;
 try unfold UndefStructPredvuint32m1_t;
 repeat rewrite pw_local_field_address.
Ltac pw_tile_facts:=
 try match goal with
 | H:pw_header_pre ?F ?W ?b ?p ?count |- _ =>
  let Hw:=fresh"Hwrite"in pose proof(pw_header_word_write F W b p count H)as Hw;
  let Hs:=fresh"Hstore"in pose proof(pw_header_store_window F W b p count H)as Hs;
  try(let Hr:=fresh"Hread"in pose proof(pw_header_word_read F W b p count H ltac:(lia))as Hr);
  try(let Hl:=fresh"Hload"in pose proof(pw_header_pair_load F W b p count H ltac:(lia)ltac:(lia))as Hl);
  let Hcopy:=fresh"Hparts"in pose proof H as Hcopy;unfold pw_header_pre in Hcopy
 end;
 repeat match goal with H:_ /\ _ |- _=>destruct H end.
Ltac pw_header_model:=
 try unfold pw_header_run,pw_header;
 unfold pw_load_lane;
 repeat match goal with
 | |- context[Z.eqb ?x ?y] => destruct(Z.eqb_spec x y)
 | |- context[Z.ltb ?x ?y] => destruct(Z.ltb_spec x y)
 end;
 try congruence;try lia;cbn[negb];
 repeat rewrite Z.add_0_r;try replace(4*1)with(4:Z)by lia.
Ltac pw_tile_auto:=
 pw_tile_normalize;pw_tile_facts;pw_header_model;
 solve[entailer!].
