	.text
	.p2align 4,,15
	.globl	avx_clear
	.type	avx_clear, @function
avx_clear:
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsd2ss	%xmm1, %xmm0, %xmm0
        ret
	.size	avx_clear, .-avx_clear
	.section	.note.GNU-stack,"",@progbits
