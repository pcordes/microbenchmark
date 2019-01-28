	.text
	.p2align 4,,15
	.globl	sse
	.type	sse, @function
sse:
	cvtsd2ss	%xmm1, %xmm0
	ret
	.size	sse, .-sse
	.section	.note.GNU-stack,"",@progbits
