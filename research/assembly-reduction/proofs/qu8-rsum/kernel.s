	.file	"kernel-input.c"
	.option nopic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	test_rvv
	.type	test_rvv, @function
test_rvv:
	vsetvli	a4,zero,e32,m8,ta,ma
	vmv.v.i	v8,0
	beq	a0,zero,.L2
.L3:
	vsetvli	a5,a0,e32,m8,tu,ma
	vle8.v	v2,0(a1)
	sub	a0,a0,a5
	add	a1,a1,a5
	vzext.vf4	v16,v2
	vadd.vv	v8,v8,v16
	bne	a0,zero,.L3
.L2:
	vsetvli	a5,zero,e32,m1,ta,ma
	vmv.v.i	v1,0
	vsetvli	a4,zero,e32,m8,ta,ma
	lw	a3,0(a2)
	vredsum.vs	v8,v8,v1
	vmv.x.s	a5,v8
	addw	a5,a5,a3
	sw	a5,0(a2)
	ret
	.size	test_rvv, .-test_rvv
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC x86_64) 15.2.0"
	.section	.note.GNU-stack,"",@progbits
