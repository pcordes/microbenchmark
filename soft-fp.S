	.text
	.globl	__floattidf_soft_fp
	.p2align 4,,15
	.globl	int128_double_soft_fp
	.type	int128_double_soft_fp, @function
int128_double_soft_fp:
.LFB0:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	__floattidf_soft_fp
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE0:
	.size	int128_double_soft_fp, .-int128_double_soft_fp
	.section	.note.GNU-stack,"",@progbits
