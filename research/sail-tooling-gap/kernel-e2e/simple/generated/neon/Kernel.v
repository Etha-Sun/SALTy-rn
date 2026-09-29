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

Definition neon_kernel : gmap Z isla_trace := list_to_map [
  (2147487744%Z, a80001000);
  (2147487748%Z, a80001004);
  (2147487752%Z, a80001008);
  (2147487756%Z, a8000100c);
  (2147487760%Z, a80001010);
  (2147487764%Z, a80001014);
  (2147487768%Z, a80001018);
  (2147487772%Z, a8000101c);
  (2147487776%Z, a80001020);
  (2147487780%Z, a80001024);
  (2147487784%Z, a80001028);
  (2147487788%Z, a8000102c);
  (2147487792%Z, a80001030);
  (2147487796%Z, a80001034);
  (2147487800%Z, a80001038);
  (2147487804%Z, a8000103c);
  (2147487808%Z, a80001040);
  (2147487812%Z, a80001044);
  (2147487816%Z, a80001048);
  (2147487820%Z, a8000104c)].

Lemma neon_kernel_size : size neon_kernel = 20%nat.
Proof. vm_compute. reflexivity. Qed.
