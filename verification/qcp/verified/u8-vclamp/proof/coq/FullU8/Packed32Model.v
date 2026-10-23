From Coq Require Import ZArith List.
From AUXLib Require Import ListLib.
From FullU8 Require Import U8Logic.
Local Open Scope Z_scope.
Definition pack4(a b c d:Z):Z:=a+256*b+65536*c+16777216*d.
Definition word_byte(w lane:Z):Z:=(w/2^(8*lane)) mod 256.
Definition lane_load(A:list Z)(vl i:Z):Z:=if Z.ltb i vl then Znth i A 0 else 0.
Definition active_min(x y vl i:Z):Z:=if Z.ltb i vl then Z.min x y else x.
Definition active_max(x y vl i:Z):Z:=if Z.ltb i vl then Z.max x y else x.
Definition word_load(A:list Z)(vl wi:Z):Z:=pack4(lane_load A vl(4*wi))(lane_load A vl(4*wi+1))(lane_load A vl(4*wi+2))(lane_load A vl(4*wi+3)).
Definition word_min(w y vl wi:Z):Z:=pack4(active_min(word_byte w 0)y vl(4*wi))(active_min(word_byte w 1)y vl(4*wi+1))(active_min(word_byte w 2)y vl(4*wi+2))(active_min(word_byte w 3)y vl(4*wi+3)).
Definition word_max(w y vl wi:Z):Z:=pack4(active_max(word_byte w 0)y vl(4*wi))(active_max(word_byte w 1)y vl(4*wi+1))(active_max(word_byte w 2)y vl(4*wi+2))(active_max(word_byte w 3)y vl(4*wi+3)).
Definition vec_byte(W:list Z)(i:Z):Z:=word_byte(Znth(i/4)W 0)(i mod 4).
Definition vec_bytes(W:list Z):list Z:=map(fun i=>vec_byte W(Z.of_nat i))(seq 0 128).
