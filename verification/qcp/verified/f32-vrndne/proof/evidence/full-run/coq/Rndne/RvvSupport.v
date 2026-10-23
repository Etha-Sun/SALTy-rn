From Rndne Require Export KernelSupport.
From QcpRvv32 Require Import RvvLogic RvvStoreModel RvvLoopModel.
Ltac rndne_rvv_finish :=
 unfold Rndne.Types.UndefStructPredvfloat32m8_t,
   QcpRvv32.RvvLayout.UndefStructPredvfloat32m8_t,
   Rndne.Types.UndefStructPredvuint32m8_t,
   Rndne.Types.UndefStructPredvbool4_t;
 rndne_kernel_finish.
