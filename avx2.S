	.text
	.p2align 4,,15
	.globl	avx2
	.type	avx2, @function
avx2:
	vcvtsd2ss	%xmm1, %xmm1, %xmm0
	.size	avx2, .-avx2
	.section	.note.GNU-stack,"",@progbits
