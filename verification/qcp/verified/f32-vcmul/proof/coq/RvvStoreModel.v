From Coq Require Import List ZArith Lia.
From QcpRvv32 Require Export RvvStoreModel.
From VCMul Require Export Model.
Import ListNotations.
Definition vcmul_pack16 (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (x4:fp32) (x5:fp32) (x6:fp32) (x7:fp32) (x8:fp32) (x9:fp32) (x10:fp32) (x11:fp32) (x12:fp32) (x13:fp32) (x14:fp32) (x15:fp32) : list fp32 := [x0;x1;x2;x3;x4;x5;x6;x7;x8;x9;x10;x11;x12;x13;x14;x15].
