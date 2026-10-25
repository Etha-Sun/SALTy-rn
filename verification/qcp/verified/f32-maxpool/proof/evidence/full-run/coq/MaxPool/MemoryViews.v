From Coq Require Import ZArith.
From MaxPool Require Export MemoryModel.
Local Open Scope Z_scope.
Definition mp_load_lane(F:MPFloatMap)(p lane:Z):fp32:=mp_get F(p+4*lane).
Definition mp_loaded_lane(O:MPOutput)(p lane:Z)(r:fp32):Prop:=mp_loaded O(p+4*lane)r.
Lemma mp_load_lane_byte_address:forall F p j,mp_load_lane F p j=mp_get F(p+4*j).
Proof. reflexivity. Qed.
Lemma mp_loaded_lane_byte_address:forall O p j r,mp_loaded_lane O p j r=mp_loaded O(p+4*j)r.
Proof. reflexivity. Qed.
