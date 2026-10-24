From Coq Require Import List.
From NanBridge Require Export BridgeLogic ListBridge.
From AUXLib Require Import ListLib.
Definition outputs_related := Forall2 same_value.
