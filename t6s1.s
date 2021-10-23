	.cpu generic+fp+simd
	.file	"t0s1.c"
	.text
	.align	2
	.global	Power
	.type	Power, %function
Power:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	w0, [x29,28]
	str	w1, [x29,24]
	ldr	w0, [x29,24]
	cmp	w0, wzr
	beq	.L2
	ldr	w0, [x29,24]
	sub	w1, w0, #1
	ldr	w0, [x29,28]
	bl	Power
	mov	w1, w0
	ldr	w0, [x29,28]
	mul	w0, w1, w0
	b	.L3
.L2:
	mov	w0, 1
.L3:
	ldp	x29, x30, [sp], 32
	ret
	.size	Power, .-Power
	.ident	"GCC: (SUSE Linux) 4.8.5"
	.section	.note.GNU-stack,"",%progbits
