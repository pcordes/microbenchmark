	.text
	.p2align 4,,15
	.globl	sse
	.type	sse, @function
sse:
	movslq	%edi, %rdx
	salq	$4, %rdx
	addq	xmm(%rip), %rdx
	movaps	(%rdx), %xmm0
	cvtsi2ss	%edi, %xmm0
	movss	%xmm0, f(%rip)
	ret
	.size	sse, .-sse
	.section	.note.GNU-stack,"",@progbits
