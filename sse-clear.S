	.text
	.p2align 4,,15
	.globl	sse_clear
	.type	sse_clear, @function
sse_clear:
	movslq	%edi, %rdx
	salq	$4, %rdx
	addq	xmm(%rip), %rdx
	movaps	(%rdx), %xmm0
	pxor	%xmm0, %xmm0
	cvtsi2ss	%edi, %xmm0
	movss	%xmm0, f(%rip)
	ret
	.size	sse_clear, .-sse_clear
	.section	.note.GNU-stack,"",@progbits
