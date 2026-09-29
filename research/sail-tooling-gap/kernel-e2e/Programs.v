From isla Require Import opsem.
Require Import Kernel.neon.a80001000.
Require Import Kernel.neon.a80001004.
Require Import Kernel.neon.a80001008.
Require Import Kernel.neon.a8000100c.
Require Import Kernel.neon.a80001010.
Require Import Kernel.neon.a80001014.
Require Import Kernel.neon.a80001018.
Require Import Kernel.neon.a8000101c.
Require Import Kernel.neon.a80001020.
Require Import Kernel.neon.a80001024.
Require Import Kernel.neon.a80001028.
Require Import Kernel.neon.a8000102c.
Require Import Kernel.neon.a80001030.
Require Import Kernel.neon.a80001034.
Require Import Kernel.neon.a80001038.
Require Import Kernel.neon.a8000103c.
Require Import Kernel.neon.a80001040.
Require Import Kernel.neon.a80001044.
Require Import Kernel.neon.a80001048.
Require Import Kernel.neon.a8000104c.

Definition neon_program : gmap addr isla_trace := list_to_map [
  (BV 64 2147487744%Z, Kernel.neon.a80001000.a80001000);
  (BV 64 2147487748%Z, Kernel.neon.a80001004.a80001004);
  (BV 64 2147487752%Z, Kernel.neon.a80001008.a80001008);
  (BV 64 2147487756%Z, Kernel.neon.a8000100c.a8000100c);
  (BV 64 2147487760%Z, Kernel.neon.a80001010.a80001010);
  (BV 64 2147487764%Z, Kernel.neon.a80001014.a80001014);
  (BV 64 2147487768%Z, Kernel.neon.a80001018.a80001018);
  (BV 64 2147487772%Z, Kernel.neon.a8000101c.a8000101c);
  (BV 64 2147487776%Z, Kernel.neon.a80001020.a80001020);
  (BV 64 2147487780%Z, Kernel.neon.a80001024.a80001024);
  (BV 64 2147487784%Z, Kernel.neon.a80001028.a80001028);
  (BV 64 2147487788%Z, Kernel.neon.a8000102c.a8000102c);
  (BV 64 2147487792%Z, Kernel.neon.a80001030.a80001030);
  (BV 64 2147487796%Z, Kernel.neon.a80001034.a80001034);
  (BV 64 2147487800%Z, Kernel.neon.a80001038.a80001038);
  (BV 64 2147487804%Z, Kernel.neon.a8000103c.a8000103c);
  (BV 64 2147487808%Z, Kernel.neon.a80001040.a80001040);
  (BV 64 2147487812%Z, Kernel.neon.a80001044.a80001044);
  (BV 64 2147487816%Z, Kernel.neon.a80001048.a80001048);
  (BV 64 2147487820%Z, Kernel.neon.a8000104c.a8000104c)].
Lemma neon_program_size : size neon_program = 20%nat.
Proof. vm_compute. reflexivity. Qed.
Print Assumptions neon_program_size.
Require Import Simple.rvv.a800001bc.
Require Import Simple.rvv.a800001c0.
Require Import Simple.rvv.a800001c4.
Require Import Simple.rvv.a800001c6.
Require Import Simple.rvv.a800001ca.
Require Import Simple.rvv.a800001ce.
Require Import Simple.rvv.a800001d0.
Require Import Simple.rvv.a800001d2.
Require Import Simple.rvv.a800001d6.
Require Import Simple.rvv.a800001da.
Require Import Simple.rvv.a800001dc.
Require Import Simple.rvv.a800001e0.
Require Import Simple.rvv.a800001e4.
Require Import Simple.rvv.a800001e8.
Require Import Simple.rvv.a800001ea.
Require Import Simple.rvv.a800001ee.
Require Import Simple.rvv.a800001f2.
Require Import Simple.rvv.a800001f4.
Require Import Simple.rvv.a800001f6.

Definition rvv_program : gmap addr isla_trace := list_to_map [
  (BV 64 2147484092%Z, Simple.rvv.a800001bc.a800001bc);
  (BV 64 2147484096%Z, Simple.rvv.a800001c0.a800001c0);
  (BV 64 2147484100%Z, Simple.rvv.a800001c4.a800001c4);
  (BV 64 2147484102%Z, Simple.rvv.a800001c6.a800001c6);
  (BV 64 2147484106%Z, Simple.rvv.a800001ca.a800001ca);
  (BV 64 2147484110%Z, Simple.rvv.a800001ce.a800001ce);
  (BV 64 2147484112%Z, Simple.rvv.a800001d0.a800001d0);
  (BV 64 2147484114%Z, Simple.rvv.a800001d2.a800001d2);
  (BV 64 2147484118%Z, Simple.rvv.a800001d6.a800001d6);
  (BV 64 2147484122%Z, Simple.rvv.a800001da.a800001da);
  (BV 64 2147484124%Z, Simple.rvv.a800001dc.a800001dc);
  (BV 64 2147484128%Z, Simple.rvv.a800001e0.a800001e0);
  (BV 64 2147484132%Z, Simple.rvv.a800001e4.a800001e4);
  (BV 64 2147484136%Z, Simple.rvv.a800001e8.a800001e8);
  (BV 64 2147484138%Z, Simple.rvv.a800001ea.a800001ea);
  (BV 64 2147484142%Z, Simple.rvv.a800001ee.a800001ee);
  (BV 64 2147484146%Z, Simple.rvv.a800001f2.a800001f2);
  (BV 64 2147484148%Z, Simple.rvv.a800001f4.a800001f4);
  (BV 64 2147484150%Z, Simple.rvv.a800001f6.a800001f6)].
Lemma rvv_program_size : size rvv_program = 19%nat.
Proof. vm_compute. reflexivity. Qed.
Print Assumptions rvv_program_size.
