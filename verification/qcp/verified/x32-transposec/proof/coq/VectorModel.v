From Coq Require Import ZArith.
From X32Transpose Require Export Types Geometry.
Local Open Scope Z_scope.
Definition xt_write_pair(O:XTOutput)(p a b:Z):XTOutput:=xt_output_put(xt_output_put O p a)(p+4)b.
