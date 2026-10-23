From Coq Require Import ZArith List.
From FullU8 Require Import U8Logic.
From AUXLib Require Import ListLib.
Open Scope Z_scope.
Definition u8_prefix_n (n:Z) := n/64*64.
Definition u8_prefix_list (lo hi:Z) (A:list Z) := List.map(fun x=>u8_prefix x lo hi) A.
Definition u8_suffix_list (lo hi:Z) (A:list Z) := List.map(fun x=>u8_suffix x lo hi) A.
Definition u8_phase_all (n lo hi:Z) (A:list Z) :=
 u8_prefix_list lo hi (sublist 0 (u8_prefix_n n) A) ++
 u8_suffix_list lo hi (sublist (u8_prefix_n n) n A).
