	.text
	.file	"kernel-neon.c"
	.globl	test_neon
	.p2align	2
	.type	test_neon,@function
test_neon:
	movi	v0.2d, #0000000000000000
	cmp	x0, #2048
	b.lo	.LBB0_5
	movi	v0.2d, #0000000000000000
.LBB0_2:
	movi	v1.2d, #0000000000000000
	mov	x8, xzr
.LBB0_3:
	ldr	q2, [x1, x8]
	add	x8, x8, #16
	cmp	x8, #2048
	uadalp	v1.8h, v2.16b
	b.ne	.LBB0_3
	uadalp	v0.4s, v1.8h
	add	x1, x1, #2048
	sub	x0, x0, #2048
	cmp	x0, #2047
	b.hi	.LBB0_2
.LBB0_5:
	cbnz	x0, .LBB0_7
.LBB0_6:
	addv	s0, v0.4s
	ldr	w8, [x2]
	fmov	w9, s0
	add	w8, w8, w9
	str	w8, [x2]
	ret
.LBB0_7:
	movi	v1.2d, #0000000000000000
	cmp	x0, #16
	b.lo	.LBB0_11
	movi	v1.2d, #0000000000000000
.LBB0_9:
	ldr	q2, [x1], #16
	sub	x0, x0, #16
	cmp	x0, #15
	uadalp	v1.8h, v2.16b
	b.hi	.LBB0_9
	cbz	x0, .LBB0_12
.LBB0_11:
	adrp	x8, test_neon.onemask_table
	ldr	q2, [x1]
	add	x8, x8, :lo12:test_neon.onemask_table
	sub	x8, x8, x0
	ldr	q3, [x8, #16]
	mul	v2.16b, v3.16b, v2.16b
	uadalp	v1.8h, v2.16b
.LBB0_12:
	uadalp	v0.4s, v1.8h
	b	.LBB0_6
.Lfunc_end0:
	.size	test_neon, .Lfunc_end0-test_neon

	.type	test_neon.onemask_table,@object
	.section	.rodata.cst32,"aM",@progbits,32
	.p2align	4
test_neon.onemask_table:
	.zero	16,1
	.zero	16
	.size	test_neon.onemask_table, 32

	.ident	"Ubuntu clang version 14.0.0-1ubuntu1.1"
	.section	".note.GNU-stack","",@progbits
	.addrsig
