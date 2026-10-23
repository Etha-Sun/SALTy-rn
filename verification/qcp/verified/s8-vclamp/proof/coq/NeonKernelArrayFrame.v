From Coq Require Import ZArith String List Lia.
From S8Clamp Require Export NeonKernelRetrySupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac s8_opaque_except_undef_rec l :=
 lazymatch l with
 | nil => idtac
 | cons (norm_asrt ?v) ?tail =>
   first [lazymatch v with CharArray.undef_full _ _ => idtac end
         |let cell:=fresh "cell" in let H:=fresh "cell_eq" in
          remember v as cell eqn:H;clear H];
   s8_opaque_except_undef_rec tail
 end.
Ltac s8_neon_array_split_resource m :=
 lazymatch goal with |- ?P |-- ?Q =>
  lazymatch P with context [CharArray.undef_full ?p ?n] =>
   lazymatch Q with context [CharArray.undef_full ?post (n-m)] =>
    let Hbound:=fresh "split_bound" in assert (Hbound:0<=m<=n) by lia;
    let H:=fresh "split_undef" in
    pose proof (CharArray.undef_full_split_to_undef_full p m n Hbound) as H;
    unfold StoreCharAsElement.sizeA in H;rewrite sizeof_char in H;
    replace (p+m*1) with post in H by lia;
    let leaves:=All_listasrts P in s8_opaque_except_undef_rec leaves;
    sep_apply_l_atomic H;neon_frame
   end
  end
 end.
Ltac s8_neon_array_split m :=
 rewrite ?sizeof_char,?sizeof_uchar,?Z.quot_1_r in *;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 apply _derivable1_andp_intros;
 [s8_neon_pure|s8_neon_array_split_resource m].
Ltac s8_neon_address_frame :=
 rewrite ?sizeof_char,?sizeof_uchar,?Z.quot_1_r in *;
 repeat progress (
  lazymatch goal with |- ?P |-- ?Q => s8_neon_norm_heap P end;
  lazymatch goal with |- ?P |-- ?Q => s8_neon_norm_heap Q end);
 unfold UndefStructPreduint8x8_t,UndefStructPredint8x8_t,UndefStructPredint8x16_t;
 unfold undef_store_uchar;fold undef_store_char;neon_frame.
