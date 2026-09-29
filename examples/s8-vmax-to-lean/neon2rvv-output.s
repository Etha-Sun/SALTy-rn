	.file	"neon2rvv-input.c"
	.option nopic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	test_neon
	.type	test_neon, @function
test_neon:
	li	a5,15
	bleu	a0,a5,.L5
	vsetivli	zero,16,e8,m1,ta,ma
	vlse8.v	v2,0(a3),zero
	andi	a0,a0,-16
	add	a0,a1,a0
.L3:
	vle8.v	v1,0(a1)
	addi	a1,a1,16
	vmax.vv	v1,v1,v2
	vse8.v	v1,0(a2)
	addi	a2,a2,16
	bne	a1,a0,.L3
.L5:
	ret
	.size	test_neon, .-test_neon
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC x86_64) 15.2.0"
	.section	.note.GNU-stack,"",@progbits
