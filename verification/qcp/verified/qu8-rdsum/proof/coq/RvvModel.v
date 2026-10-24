From Coq Require Import ZArith List.
From Qu8Rdsum Require Export ProgramModel VlModel.
Local Open Scope Z_scope.
Definition rd_u64(x:Z):Z := unsigned_last_nbits x 64.
Definition rd_partial(M:RDMap)(base rows channels stride k:Z)(Init:list Z):list Z :=
 firstn(Z.to_nat k)(rd_results M base rows channels stride Init)++skipn(Z.to_nat k)Init.
Definition rd_acc32(M:RDMap)(base stride col rows i vl:Z):Z :=
 if Z.ltb i vl then rs_u32(rd_column M base rows stride(col+i))else 0.
Definition rd_acc16(M:RDMap)(base stride col start count i vl:Z):Z :=
 if Z.ltb i vl then rs_u16(rd_column M(base+start*stride)count stride(col+i))else 0.
Definition rd_done(r cb:Z):Z := Z.min(rd_min252 r)(rd_min252 r-cb).
Definition rd_mod252(x:Z):Z := x mod 252.
Definition rd_ptr_gate(live p expected:Z):Prop := live<=0 \/ p=expected.
Definition rd_progress(rows r:Z):Prop := r=0 \/ rd_mod252(rows-r)=0.
Definition rd_bit4(n:Z):Z := Z.land n 4.
Definition rd_bit2(n:Z):Z := Z.land n 2.
