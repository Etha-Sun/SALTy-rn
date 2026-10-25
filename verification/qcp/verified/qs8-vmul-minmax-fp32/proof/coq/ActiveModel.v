From Coq Require Import ZArith.
From Qs8Mul Require Export IntrinsicModel.
Local Open Scope Z_scope.
Definition qm_read(M:RDMap)(p i:Z):Z:=rd_get M (p+i).
Definition qm_sub_read(M:RDMap)(p z i:Z):Z:=qm_sub16(qm_read M p i)z.
Definition qm_product(M:RDMap)(pa pb az bz i:Z):Z:=qm_sub_read M pa az i*qm_sub_read M pb bz i.
Definition qm_converted(M:RDMap)(pa pb az bz i:Z):fp32:=qm_of_int(qm_product M pa pb az bz i).
Definition qm_scaled(M:RDMap)(pa pb az bz:Z)(scale:fp32)(i:Z):fp32:=qm_rvv_mul(qm_converted M pa pb az bz i)scale.
Definition qm_biased(M:RDMap)(pa pb az bz:Z)(scale:fp32)(i:Z):fp32:=qm_rvv_add(qm_scaled M pa pb az bz scale i)qm_magic.
Definition qm_restored(M:RDMap)(pa pb az bz:Z)(scale:fp32)(i:Z):fp32:=
 if Z.eqb(qm_ne scale scale)0 then qm_biased M pa pb az bz scale i else qm_sign(qm_biased M pa pb az bz scale i)scale.
Definition qm_reinterpreted(M:RDMap)(pa pb az bz:Z)(scale:fp32)(i:Z):Z:=qm_signed_bits(bits_of_fp32(qm_restored M pa pb az bz scale i)).
Definition qm_offset(M:RDMap)(pa pb az bz:Z)(scale:fp32)(oz i:Z):Z:=qm_sat32(qm_reinterpreted M pa pb az bz scale i-(1262485504-oz)).
Definition qm_narrow16(M:RDMap)(pa pb az bz:Z)(scale:fp32)(oz i:Z):Z:=qm_sat16(qm_offset M pa pb az bz scale oz i).
Definition qm_narrow8(M:RDMap)(pa pb az bz:Z)(scale:fp32)(oz i:Z):Z:=qm_sat8(qm_narrow16 M pa pb az bz scale oz i).
Definition qm_lowered(M:RDMap)(pa pb az bz:Z)(scale:fp32)(oz lo i:Z):Z:=qm_max(qm_narrow8 M pa pb az bz scale oz i)lo.
Definition qm_finished(M:RDMap)(pa pb az bz:Z)(scale:fp32)(oz lo hi i:Z):Z:=qm_min(qm_lowered M pa pb az bz scale oz lo i)hi.
