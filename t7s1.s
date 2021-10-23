	.cpu generic+fp+simd
	.file	"t0s1.c"
	.text
	.align	2
	.global	Power
	.type	Power, %function
Power:
    cmp x1, #1
    blt .L0
    beq .L2
    bgt recursion

/* only do this if n >= 2 */
recursion:
    cmp x2, #0
    beq .L3
    mul x2, x2, x0
    sub x1, x1, #1
    b Power

/* counter = 0, return sum if sum > 1, return 1 if sum <= 1 */
.L0:
    cmp x2, #1
    bgt .L1
    mov x0, #1
    ret

/* return sum */
.L1:
    mov x0, x2
    ret
    
/* return */
.L2:
    cmp x2, #0
    bgt recursion
    ret

/* initial x2 = 1, branch back to recursion */
.L3:
    mov x2, #1
    b recursion

	.size	Power, .-Power
	.ident	"Jonathan W. Cole"
	.section	.note.GNU-stack,"",%progbits
