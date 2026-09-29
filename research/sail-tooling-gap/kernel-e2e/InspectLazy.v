Require Import isla.riscv64.riscv64 RvvLazyTrace RvvCompactLoad.
Goal forall (n : bv 64), True.
intros n.
pose (TRACE := TRACE_LET a800001ca_shared).
let es := constr:(subst_trace (Val_Bits n) 0 TRACE) in
let es' := eval hnf in es in
lazymatch es' with
| ?e :t: ?tail => idtac "HEAD OK" e
| _ => idtac "HEAD FAILED" es'
end.
Abort.
