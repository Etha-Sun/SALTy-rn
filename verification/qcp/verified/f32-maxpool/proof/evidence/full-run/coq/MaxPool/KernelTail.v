From Coq Require Import ZArith.
From MaxPool Require Export KernelState PackModel.
Local Open Scope Z_scope.
Definition mp_tail_two(c:Z):Z:=if Z.leb 2 c then 2 else 0.
Definition mp_tail_low(c:Z)(low high:fp32):fp32:=if Z.leb 2 c then high else low.
Definition mp_output_equal(a b:MPOutput):Prop:=a=b.
Definition mp_tail_values(F:MPFloatMap)(PT:MPPtrMap)
 (table offset K group done count:Z)(lo hi q0 q1 q2 q3:fp32):Prop:=
 forall j,0<=j<count->mp_pack4 q0 q1 q2 q3 j=
 mp_after_groups F PT table offset K group(done+j)lo hi.
