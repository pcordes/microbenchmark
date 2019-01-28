	.text
	.p2align 4,,15
	.globl	sse_clear
	.type	sse_clear, @function
sse_clear:
	pxor	%xmm0, %xmm0
	cvtsd2ss	%xmm1, %xmm0
	ret
	.size	sse_clear, .-sse_clear
	.section	.note.GNU-stack,"",@progbits
