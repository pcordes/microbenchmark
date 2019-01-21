	.text
	.p2align 4
	.globl	__floattidf_soft_fp
	.hidden	__floattidf_soft_fp
	.type	__floattidf_soft_fp, @function
__floattidf_soft_fp:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	subq	$40, %rsp
	.cfi_def_cfa_offset 64
	stmxcsr	28(%rsp)
	movq	%rsi, %rax
	orq	%rdi, %rax
	movq	%rax, %xmm0
	je	.L1
	movq	%rdi, %r14
	movq	%rsi, %rdi
	movq	%rsi, %r15
	shrq	$63, %rdi
	testq	%rsi, %rsi
	js	.L31
	testq	%r15, %r15
	je	.L5
.L33:
	bsrq	%r15, %rdx
	movl	$1150, %eax
	xorq	$63, %rdx
	subl	%edx, %eax
	movslq	%eax, %rdx
.L6:
	leal	-1078(%rax), %ecx
	movq	%r14, %r8
	movq	%r15, %r9
	shrq	%cl, %r9
	shrdq	%r15, %r8
	testb	$64, %cl
	movl	$1206, %ecx
	cmovne	%r9, %r8
	subl	%eax, %ecx
	movq	%r15, %r9
	xorl	%r11d, %r11d
	shldq	%r14, %r9
	movq	%r8, %r10
	movq	%r14, %r8
	salq	%cl, %r8
	testb	$64, %cl
	cmovne	%r8, %r9
	cmovne	%r11, %r8
	xorl	%ecx, %ecx
	movq	%r8, %rax
	orq	%r9, %rax
	setne	%cl
	orq	%rcx, %r10
.L10:
	movq	%r10, %rax
	btrq	$55, %rax
	testb	$7, %r10b
	je	.L11
.L34:
	movl	28(%rsp), %ecx
	andl	$24576, %ecx
	cmpl	$8192, %ecx
	je	.L12
	cmpl	$16384, %ecx
	je	.L13
	testl	%ecx, %ecx
	je	.L14
	shrq	$3, %rax
.L29:
	movabsq	$4503599627370495, %rcx
	salq	$52, %rdx
	andq	%rcx, %rax
	salq	$63, %rdi
	orq	%rdx, %rax
	orq	%rdi, %rax
	movq	%rax, %xmm0
.L20:
	movl	$32, %edi
	movsd	%xmm0, 8(%rsp)
	call	__sfp_handle_exceptions@PLT
	movsd	8(%rsp), %xmm0
.L1:
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L5:
	.cfi_restore_state
	bsrq	%r14, %rdx
	movl	$1086, %eax
	movq	%r14, %r10
	xorq	$63, %rdx
	subl	%edx, %eax
	movslq	%eax, %rdx
	cmpl	$1075, %eax
	jg	.L7
	je	.L32
	movl	$1075, %ecx
	salq	$52, %rdx
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	subl	%eax, %ecx
	salq	$63, %rdi
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	movabsq	$4503599627370495, %rax
	salq	%cl, %r10
	movq	%r10, %rcx
	andq	%rax, %rcx
	orq	%rcx, %rdx
	orq	%rdi, %rdx
	movq	%rdx, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L31:
	.cfi_restore_state
	negq	%r14
	adcq	$0, %r15
	negq	%r15
	testq	%r15, %r15
	je	.L5
	jmp	.L33
	.p2align 4,,10
	.p2align 3
.L11:
	salq	$9, %rax
	salq	$52, %rdx
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	shrq	$12, %rax
	salq	$63, %rdi
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	orq	%rdx, %rax
	orq	%rdi, %rax
	movq	%rax, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L32:
	.cfi_restore_state
	movabsq	$4503599627370495, %rax
	salq	$63, %rdi
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movabsq	$4841369599423283200, %rdx
	andq	%r14, %rax
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	orq	%rdx, %rax
	orq	%rdi, %rax
	movq	%rax, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L7:
	.cfi_restore_state
	cmpl	$1078, %eax
	jg	.L6
	cmpq	$1078, %rdx
	je	.L10
	movl	$1078, %ecx
	subl	%eax, %ecx
	salq	%cl, %r10
	movq	%r10, %rax
	btrq	$55, %rax
	testb	$7, %r10b
	je	.L11
	jmp	.L34
	.p2align 4,,10
	.p2align 3
.L12:
	testq	%rsi, %rsi
	js	.L28
	salq	$9, %rax
	salq	$52, %rdx
	movq	%rax, %rcx
	shrq	$12, %rcx
	orq	%rdx, %rcx
	movq	%rcx, %xmm0
	jmp	.L20
	.p2align 4,,10
	.p2align 3
.L14:
	andl	$15, %r10d
	cmpq	$4, %r10
	je	.L18
	movabsq	$36028797018963968, %rcx
	addq	$4, %rax
	andq	%rax, %rcx
.L17:
	shrq	$3, %rax
	testq	%rcx, %rcx
	je	.L29
	addq	$1, %rdx
	jmp	.L29
	.p2align 4,,10
	.p2align 3
.L13:
	testq	%rsi, %rsi
	js	.L18
.L28:
	movabsq	$36028797018963968, %rcx
	addq	$8, %rax
	andq	%rax, %rcx
	jmp	.L17
	.p2align 4,,10
	.p2align 3
.L18:
	salq	$9, %rax
	salq	$52, %rdx
	movq	%rax, %rcx
	salq	$63, %rdi
	shrq	$12, %rcx
	orq	%rcx, %rdx
	orq	%rdi, %rdx
	movq	%rdx, %xmm0
	jmp	.L20
	.cfi_endproc
.LFE0:
	.size	__floattidf_soft_fp, .-__floattidf_soft_fp
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
