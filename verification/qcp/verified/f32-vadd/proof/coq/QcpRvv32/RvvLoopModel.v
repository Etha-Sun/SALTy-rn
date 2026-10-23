From Coq Require Import ZArith List Lia.
From QcpRvv32 Require Export RvvStoreModel RvvResultBridge RvvLoopMemory RvvLoopResult.
Require Import VaddSegments.
From AUXLib Require Import ListLib.
Definition rvv_slice : Z -> Z -> list fp32 -> list fp32 := @sublist fp32.
