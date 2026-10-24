From Coq Require Import ZArith.
From Dwconv Require Export OutputReadModel.
Import Snaive_C_Rules64.
Definition dw_output_ready(O:DwOutput)(p:Z):Prop:=
 exists v,dw_initialized O p v.
