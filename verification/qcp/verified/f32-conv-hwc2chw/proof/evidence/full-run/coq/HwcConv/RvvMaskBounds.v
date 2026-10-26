From HwcConv Require Export KernelPointers.
Local Open Scope Z_scope.
Definition hc_mask_start(dx x:Z):Z:=if andb(Z.eqb dx 0)(Z.eqb x 0)then 1 else 0.
Definition hc_mask_end(dx width remaining vl:Z):Z:=
 if andb(Z.eqb dx 2)(andb(negb(Z.eqb(width mod 2)0))(Z.eqb remaining vl))then vl-1 else vl.
