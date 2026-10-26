From HwcConv Require Import RvvKernelModel.
From Coq Require Import ZArith Lia.
Local Open Scope Z_scope.
Lemma hcm_endpoint_layout:
 hc_output_layout 18446744073709551608 8 8 1 4 1 1.
Proof. unfold hc_output_layout,hc_u64_limit;cbn;lia. Qed.
Lemma hcm_endpoint_dead_cursor:
 let out:=18446744073709551608 in
 hc_addr64 out+2*4 <>
 hc_addr64(out+4*((4-(4-4))/2)).
Proof. vm_compute;discriminate. Qed.
Print Assumptions hcm_endpoint_layout.
Print Assumptions hcm_endpoint_dead_cursor.
