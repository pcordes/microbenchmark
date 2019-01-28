	.text
	.p2align 4,,15
	.globl	avx_clear
	.type	avx_clear, @function
avx_clear:
	movslq	%edi, %rdx
	salq	$4, %rdx
	addq	xmm(%rip), %rdx
	vmovaps	(%rdx), %xmm0
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2ss	%edi, %xmm0, %xmm0
	vmovss	%xmm0, f(%rip)
	.size	avx_clear, .-avx_clear
	.section	.note.GNU-stack,"",@progbits
