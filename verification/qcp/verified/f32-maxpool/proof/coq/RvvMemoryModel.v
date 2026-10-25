From Coq Require Import ZArith.
From MaxPool Require Export VectorModel MemoryViews PackModel.
Local Open Scope Z_scope.
(* The ISA exposes no inactive load value. For an active initialized cell the
   loaded bits are exact; a valid None cell permits an arbitrary bit pattern. *)
Definition mp_active_loaded(O:MPOutput)(p lane vl:Z)(r:fp32):Prop:=
 0<=lane<vl->mp_loaded_lane O p lane r.
