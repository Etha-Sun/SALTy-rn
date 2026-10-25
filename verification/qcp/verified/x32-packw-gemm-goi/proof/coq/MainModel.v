From Coq Require Import ZArith List Bool.
From X32Packw Require Export TileAccessModel.
Local Open Scope Z_scope.
Definition pw_group_weight(G:PWCall)(group:Z):Z:=
 pw_weights G+4*group*pw_channels G*pw_depth G.
Definition pw_bias_at(G:PWCall)(group channel:Z):Z:=
 if Z.eqb(pw_bias G)0 then 0 else pw_bias G+4*(group*pw_channels G+channel).
Definition pw_group_state(F:PWMap)(G:PWCall)(O:PWOutput)(group:Z):PWOutput:=
 pw_groups_run group F G O.
Definition pw_tile_state(F:PWMap)(G:PWCall)(O:PWOutput)(group tile:Z):PWOutput:=
 pw_tiles_run tile F G group(pw_group_state F G O group).
