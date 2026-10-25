From Coq Require Import ZArith List Bool.
From DwChw Require Export ProgramModel OutputInterface.
Import ListNotations. Local Open Scope Z_scope.
Definition dw_row_base(input zero H N y:Z):Z:=if orb(y<?0)(H<=?y)then zero else input+4*y*N.
Definition dw_store_row(H y j:Z):Z:=Z.min(y+j)(H-1).
Definition dw_prev(F:DwROMap)(p x:Z):fp32:=if Z.eqb x 0 then fp32_zero else dw_get F(p+4*(x-1)).
Definition dw_addresses(output H N:Z):list Z:=map(fun i=>output+4*Z.of_nat i)(seq 0(Z.to_nat(H*N))).
Definition dw_neon_results(F:DwROMap)(input zero weights H N:Z)(lo hi:fp32):Z->fp32:=fun k=>dw_pixel F input zero weights H N(k/N)(k mod N)lo hi.
Definition dw_rvv_results(F:DwROMap)(input zero weights H N:Z)(lo hi:fp32):Z->fp32:=fun k=>dw_pixel_rvv F input zero weights H N(k/N)(k mod N)lo hi.
(* This map records exactly the completed rows and current three-row tile.
   Other addresses retain their original option value, including None.  It
   neither asserts read permission nor assumes initialized output cells. *)
Definition dw_progress(R:Z->fp32)(O:DwOutput)(output H N y x:Z):DwOutput:=fun p=>
 if andb(andb(output<=?p)(p<?output+4*H*N))(Z.eqb((p-output)mod 4)0)then
 let k:=(p-output)/4 in
 if orb(k/N<?y)(andb(k/N<?Z.min H(y+3))(k mod N<?x))then Some(R k)else O p
 else O p.
Definition dw_outer_pointers(input zero output H N rem i0 i1 i2 i3 i4 o0 o1 o2:Z):Prop:=
 rem=0 \/ let y:=H-rem in
 i0=dw_row_base input zero H N(y-1) /\ i1=dw_row_base input zero H N y /\
 (2<=rem->i2=dw_row_base input zero H N(y+1)) /\
 (3<=rem->i3=dw_row_base input zero H N(y+2)) /\
 (4<=rem->i4=dw_row_base input zero H N(y+3)) /\
 o0=output+4*y*N /\ (2<=rem->o1=output+4*(y+1)*N) /\ (3<=rem->o2=output+4*(y+2)*N).
