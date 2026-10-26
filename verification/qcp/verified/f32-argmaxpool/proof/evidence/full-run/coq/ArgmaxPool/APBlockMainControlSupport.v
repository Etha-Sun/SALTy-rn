From Coq Require Import ZArith Lia Ring List.
From ArgmaxPool Require Export APBlockMainArithmeticSupport NeonKernelMemoryRowsFacts NeonKernelMemoryOffsetFacts NeonKernelMemoryGeometryFacts NeonKernelCompactFrame.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Ltac apbmc_frame:=apma_widths;apkcf_frame.
