	.text
	.p2align 4,,15
	.globl	avx
	.type	avx, @function
avx:
	movslq	%edi, %rdx
	salq	$4, %rdx
	addq	xmm(%rip), %rdx
	vmovaps	(%rdx), %xmm0
	vcvtsi2ss	%edi, %xmm0, %xmm0
	vmovss	%xmm0, f(%rip)
	.size	avx, .-avx
	.section	.note.GNU-stack,"",@progbits
