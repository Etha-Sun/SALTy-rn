From Coq Require Import ZArith Lia List.
From AUXLib Require Import ListLib.
From QcpRvv32 Require Import RvvStoreModel.
From Rndne Require Import RvvKernelModel RvvResult ProgramModel.
Local Open Scope Z_scope.
Lemma rndne_kernel_result_lane : forall vl a i,
 rndne_kernel_result (Z.of_nat i) vl a=rndne_rvv_lane vl a i.
Proof. intros;reflexivity. Qed.
Definition rndne_kernel_packed (vl:Z)(a:list fp32):list fp32 := rvv_pack32
 (rndne_kernel_result 0 vl a)
 (rndne_kernel_result 1 vl a)
 (rndne_kernel_result 2 vl a)
 (rndne_kernel_result 3 vl a)
 (rndne_kernel_result 4 vl a)
 (rndne_kernel_result 5 vl a)
 (rndne_kernel_result 6 vl a)
 (rndne_kernel_result 7 vl a)
 (rndne_kernel_result 8 vl a)
 (rndne_kernel_result 9 vl a)
 (rndne_kernel_result 10 vl a)
 (rndne_kernel_result 11 vl a)
 (rndne_kernel_result 12 vl a)
 (rndne_kernel_result 13 vl a)
 (rndne_kernel_result 14 vl a)
 (rndne_kernel_result 15 vl a)
 (rndne_kernel_result 16 vl a)
 (rndne_kernel_result 17 vl a)
 (rndne_kernel_result 18 vl a)
 (rndne_kernel_result 19 vl a)
 (rndne_kernel_result 20 vl a)
 (rndne_kernel_result 21 vl a)
 (rndne_kernel_result 22 vl a)
 (rndne_kernel_result 23 vl a)
 (rndne_kernel_result 24 vl a)
 (rndne_kernel_result 25 vl a)
 (rndne_kernel_result 26 vl a)
 (rndne_kernel_result 27 vl a)
 (rndne_kernel_result 28 vl a)
 (rndne_kernel_result 29 vl a)
 (rndne_kernel_result 30 vl a)
 (rndne_kernel_result 31 vl a).
Lemma rndne_kernel_packed_prefix : forall vl a,0<=vl<=32 -> vl<=Zlength a ->
 rvv_take vl(rndne_kernel_packed vl a)=rndne_rvv_values vl a.
Proof. change (forall vl a,0<=vl<=32 -> vl<=Zlength a -> rvv_take vl(rndne_rvv_packed vl a)=rndne_rvv_values vl a). exact rndne_rvv_packed_prefix. Qed.
Print Assumptions rndne_kernel_result_lane.
Print Assumptions rndne_kernel_packed_prefix.
