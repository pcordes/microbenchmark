	.text
	.p2align 4
	.globl	__floattixf_libgcc2
	.hidden	__floattixf_libgcc2
	.type	__floattixf_libgcc2, @function
__floattixf_libgcc2:
.LFB23:
	.cfi_startproc
	endbr64
	movq	%rsi, -16(%rsp)
	fildq	-16(%rsp)
	flds	.LC0(%rip)
	movq	%rdi, -16(%rsp)
	fmul	%st, %st(1)
	fildq	-16(%rsp)
	testq	%rdi, %rdi
	jns	.L4
	faddp	%st, %st(1)
	jmp	.L2
	.p2align 4,,10
	.p2align 3
.L4:
	fstp	%st(1)
.L2:
	faddp	%st, %st(1)
	ret
	.cfi_endproc
.LFE23:
	.size	__floattixf_libgcc2, .-__floattixf_libgcc2
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC0:
	.long	1602224128
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
