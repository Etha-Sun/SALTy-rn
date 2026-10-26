From Coq Require Import ZArith Lia List.
From ArgmaxPool Require Export RvvUpdateIntoProbeModel RvvUpdateIntoSupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Ltac apup_goal:=apb_intro;apu_frame.
