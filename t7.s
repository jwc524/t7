	.cpu generic+fp+simd
	.file	"t0.c"
	.text
	.align	2
	.global	Fib
	.type	Fib, %function
Fib:
	subs w0, w0, #1
	bgt	 recursion
	mov	 w0, #1
	ret

recursion:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	w0, [x29,28]
	
	bl	Fib
	
	str	w0, [x29,24]
	ldr	w0, [x29,28]
	sub	w0, w0, #1
	bl	Fib
	
	ldr	w1, [x29,24]
	add	w0, w1, w0
	ldp	x29, x30, [sp], 32
	ret
	
	.size	Fib, .-Fib
	.ident	"GCC: (SUSE Linux) 4.8.5"
	.section	.note.GNU-stack,"",%progbits
