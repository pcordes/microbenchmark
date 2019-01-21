	.text
	.globl	__floattixf_libgcc2
	.p2align 4,,15
	.globl	int128_long_double_libgcc2
	.type	int128_long_double_libgcc2, @function
int128_long_double_libgcc2:
.LFB0:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	__floattixf_libgcc2
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE0:
	.size	int128_long_double_libgcc2, .-int128_long_double_libgcc2
	.section	.note.GNU-stack,"",@progbits
