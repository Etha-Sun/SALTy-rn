From Coq Require Import ZArith List Lia Ring.
From X32Packw Require Export MainFinalFacts neon_unit_goal.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Ltac pw_main_normalize:=
 cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;subst;
 replace(2*4)with(8:Z)in *by lia;replace(1*4)with(4:Z)in *by lia;
 try match goal with G:PWCall |- _=>replace(pw_depth G*4)with(4*pw_depth G)in *by ring end.
Ltac pw_main_facts:=
 try match goal with H:pw_program_storage ?F ?W ?G |- _=>
 let Hs:=fresh"Hsizes"in pose proof(pw_storage_sizes F W G H)as Hs;
 let Ha:=fresh"Htilearith"in pose proof(pw_tiles_arithmetic G ltac:(intuition lia))as Ha;
 let Hm:=fresh"Hmap"in pose proof(pw_storage_map_nodup F W G H)as Hm
 end;
 repeat match goal with H:_ /\ _ |- _=>destruct H end;
 try multimatch goal with H:pw_program_storage ?F ?W ?G,Hg : (0 <= ?group), Hgl : (?group < pw_groups ?G), Ht : (0 <= ?tile) |- _=>
 try(let Hh:=fresh"Hheader2"in pose proof(pw_tile_header_pre F W G group tile 2 H ltac:(lia)Ht ltac:(auto)ltac:(lia))as Hh);
 try(let Hh:=fresh"Hheader1"in pose proof(pw_tile_header_pre F W G group tile 1 H ltac:(lia)Ht ltac:(auto)ltac:(lia))as Hh);
 try(let Hh:=fresh"Hpair"in pose proof(pw_tile_pair_pre F W G group tile H ltac:(lia)Ht ltac:(lia))as Hh);
 try(let Hh:=fresh"Hodd"in pose proof(pw_tile_odd_pre F W G group tile H ltac:(lia)Ht ltac:(lia))as Hh)
 end.
Ltac pw_main_auto:=pw_main_normalize;pw_main_facts;solve[entailer!].
