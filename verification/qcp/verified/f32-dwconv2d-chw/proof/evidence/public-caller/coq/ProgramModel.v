From Coq Require Import ZArith List Bool Lia.
From DwChw Require Export PixelModel MemoryModel.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Definition dw_u64_limit:Z:=18446744073709551616.
(* A shared read-only cell map permits input, weights, zero and parameter
   overlap. Each distinct cell is owned once by dw_data; there is no read/read
   separation requirement. Horizontal padding uses architectural +0, while
   missing image rows read the supplied zero row, whose values are arbitrary. *)
Definition dw_image(F:DwROMap)(input zero H N y x:Z):fp32:=
 if orb (x<?0) (N<=?x) then fp32_zero else
 if orb (y<?0) (H<=?y) then dw_get F(zero+4*x)
 else dw_get F(input+4*(y*N+x)).
Definition dw_pixel(F:DwROMap)(input zero weights H N y x:Z)(lo hi:fp32):fp32:=
 dw_chw_neon_pixel(dw_get F weights)
 (dw_image F input zero H N(y-1)x)(dw_image F input zero H N y x)(dw_image F input zero H N(y+1)x)
 (dw_image F input zero H N(y-1)(x-1))(dw_image F input zero H N y(x-1))(dw_image F input zero H N(y+1)(x-1))
 (dw_image F input zero H N(y-1)(x+1))(dw_image F input zero H N y(x+1))(dw_image F input zero H N(y+1)(x+1))
 (dw_get F(weights+4))(dw_get F(weights+8))(dw_get F(weights+12))
 (dw_get F(weights+16))(dw_get F(weights+20))(dw_get F(weights+24))
 (dw_get F(weights+28))(dw_get F(weights+32))(dw_get F(weights+36))lo hi.
Definition dw_pixel_rvv(F:DwROMap)(input zero weights H N y x:Z)(lo hi:fp32):fp32:=
 dw_chw_rvv_pixel(dw_get F weights)
 (dw_image F input zero H N(y-1)x)(dw_image F input zero H N y x)(dw_image F input zero H N(y+1)x)
 (dw_image F input zero H N(y-1)(x-1))(dw_image F input zero H N y(x-1))(dw_image F input zero H N(y+1)(x-1))
 (dw_image F input zero H N(y-1)(x+1))(dw_image F input zero H N y(x+1))(dw_image F input zero H N(y+1)(x+1))
 (dw_get F(weights+4))(dw_get F(weights+8))(dw_get F(weights+12))
 (dw_get F(weights+16))(dw_get F(weights+20))(dw_get F(weights+24))
 (dw_get F(weights+28))(dw_get F(weights+32))(dw_get F(weights+36))lo hi.
Definition dw_output_values(F:DwROMap)(input zero weights H N:Z)(lo hi:fp32):list fp32:=
 map(fun k=>dw_pixel F input zero weights H N(Z.of_nat k/N)(Z.of_nat k mod N)lo hi)(seq 0(Z.to_nat(H*N))).
Definition dw_output_rvv_values(F:DwROMap)(input zero weights H N:Z)(lo hi:fp32):list fp32:=
 map(fun k=>dw_pixel_rvv F input zero weights H N(Z.of_nat k/N)(Z.of_nat k mod N)lo hi)(seq 0(Z.to_nat(H*N))).
(* All numeric uint64 dimensions are quantified conditionally on actual valid
   nonwrapping footprints. These explicit byte bounds describe memory, not a
   fixed INT32/SIZE_MAX/32 restriction on rows or width. *)
Definition dw_footprint(base count:Z):Prop:=0<base /\ 0<=count /\ base+4*count<=dw_u64_limit.
Definition dw_inputs(F:DwROMap)(input zero weights params H N:Z):Prop:=
 0<H /\ 0<N /\ H<dw_u64_limit /\ 4*N<dw_u64_limit /\
 dw_footprint input(H*N+3) /\ dw_footprint zero(N+3) /\
 dw_footprint weights 10 /\ dw_footprint params 2 /\
 dw_window F input(H*N+3) /\ dw_window F zero(N+3) /\
 dw_window F weights 10 /\ dw_window F params 2.
