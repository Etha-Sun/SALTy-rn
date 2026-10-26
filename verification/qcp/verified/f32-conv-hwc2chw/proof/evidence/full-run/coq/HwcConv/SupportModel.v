From HwcConv Require Export Types.
Definition hc_round_model(n:Z):Z:=n-Z.modulo n 4.
Definition hc_doz_model(a b:Z):Z:=Z.max 0(a-b).
