From HwcConv Require Export Main443Tactics Main443WindowFacts Main443IntegerGeometry.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Ltac hcp_columns :=
 try multimatch goal with
 | |- context[Z.quot (?n-?i) 2] =>
  let B:=fresh "Hcolumns" in
  assert(B:(4<=i->0<=Z.quot(n-i)2 /\ Z.quot(n-i)2+1<Z.quot(n+1)2) /\
   (0<i<4->0<=Z.quot(n-i)2<Z.quot(n+1)2) /\
   (i=3->Z.quot(n-i)2+1<Z.quot(n+1)2))by
   (apply hcm_quot_rem_columns;[lia|split;lia|assumption]);
  let HB:=fresh "Hbulk" in let HT:=fresh "Htail" in let HH:=fresh "Hthree" in
  destruct B as[HB[HT HH]];
  try(let K:=fresh "Hactive"in pose proof(HB ltac:(lia))as K);
  try(let K:=fresh "Hactive"in pose proof(HT ltac:(lia))as K);
  try(let K:=fresh "Hactive"in pose proof(HH ltac:(lia))as K)
 end;
 repeat match goal with H:_ /\ _|-_=>destruct H end;
 repeat progress(rewrite Z.quot_div_nonneg in * by lia).
Ltac hcp_word :=
 repeat multimatch goal with
 | |-context[unsigned_last_nbits ?v 64] =>
  let E:=fresh "Hword"in
  assert(E:unsigned_last_nbits v 64=v)by
   (apply unsigned_last_nbits_eq;change(0<=v<18446744073709551616);lia);
  rewrite E;clear E
 end.
Ltac hcp_pure :=
 lazymatch goal with|-_ \/ _=>right|_=>idtac end;
 intros;hcm_constants;subst;hcm_domain;hcp_columns;hcp_word;
 entailer!;try lia;try nia.
