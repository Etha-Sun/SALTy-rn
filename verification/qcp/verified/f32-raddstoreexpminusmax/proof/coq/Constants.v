From Coq Require Import ZArith.
From ExpMinusMax Require Export Model.
Local Open Scope Z_scope.
Definition em_log2e:fp32:=fp32_of_bits 1069066811.
Definition em_magic_bias:fp32:=fp32_of_bits 1262485631.
Definition em_c5:fp32:=fp32_of_bits 1007144910.
Definition em_c4:fp32:=fp32_of_bits 1026268429.
Definition em_c3:fp32:=fp32_of_bits 1042984256.
Definition em_c2:fp32:=fp32_of_bits 1056964323.
Definition em_c1:fp32:=fp32_of_bits 1065353211.
Definition em_denorm_cutoff:fp32:=fp32_of_bits 3266227279.
Definition em_minus_ln2:fp32:=fp32_of_bits 3207688728.
