From Coq Require Import ZArith List.
From AUXLib Require Import ListLib.
From GemmRvv Require Export Model.
Definition rvv_len (L:list fp32):Z := Zlength L.
