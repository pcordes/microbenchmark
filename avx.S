	.text
	.p2align 4,,15
	.globl	avx
	.type	avx, @function
avx:
	vcvtsd2ss	%xmm1, %xmm0, %xmm0
        ret
	.size	avx, .-avx
	.section	.note.GNU-stack,"",@progbits
