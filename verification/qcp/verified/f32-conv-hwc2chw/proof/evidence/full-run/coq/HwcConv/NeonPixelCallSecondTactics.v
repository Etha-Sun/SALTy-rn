From HwcConv Require Export NeonPixelCallsTactics.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
(* Inner words are simplified first by backtracking over candidate subterms.
   A surrounding word is never erased without its own actual range proof. *)
Ltac hc_pixel_words:=repeat multimatch goal with
 | |-context[unsigned_last_nbits ?v 64]=>
   let E:=fresh "Hword"in assert(E:unsigned_last_nbits v 64=v)by
   (apply unsigned_last_nbits_eq;change(0<=v<18446744073709551616);lia);
   rewrite E;clear E
 | H:context[unsigned_last_nbits ?v 64]|-_=>
   let E:=fresh "Hword"in assert(E:unsigned_last_nbits v 64=v)by
   (apply unsigned_last_nbits_eq;change(0<=v<18446744073709551616);lia);
   rewrite E in H;clear E
 end.
Ltac hc_pixel_second:=hc_pixel_prepare;hc_pixel_words;hc_pixel_frame;try hc_pixel_window;try lia.
