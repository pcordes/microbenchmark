	.text
	.p2align 4
	.globl	__floattixf_soft_fp
	.hidden	__floattixf_soft_fp
	.type	__floattixf_soft_fp, @function
__floattixf_soft_fp:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	subq	$56, %rsp
	.cfi_def_cfa_offset 96
#APP
# 39 "/export/gnu/import/git/sources/gcc/libgcc/soft-fp/floattixf.c" 1
	stmxcsr	28(%rsp)
# 0 "" 2
#NO_APP
	movq	%rsi, %rax
	orq	%rdi, %rax
	je	.L2
	movq	%rsi, %r8
	movq	%rdi, %r14
	movq	%rsi, %r15
	shrq	$63, %r8
	testq	%rsi, %rsi
	js	.L30
	movq	%r15, %rdi
	testq	%r15, %r15
	je	.L4
.L32:
	bsrq	%r15, %rcx
	movl	$16510, %r10d
	xorq	$63, %rcx
	subl	%ecx, %r10d
	movslq	%r10d, %r9
	cmpl	$16449, %r10d
	jg	.L5
	movq	%r14, %rax
	cmpq	$16449, %r9
	je	.L10
	movl	$16449, %edx
	leal	-16385(%r10), %ecx
	movq	%r14, %r11
	subl	%r10d, %edx
	shrq	%cl, %r11
	movl	%edx, %ecx
	salq	%cl, %rdi
	salq	%cl, %rax
	orq	%r11, %rdi
.L10:
	andq	$-5, %rdi
	testb	$7, %al
	je	.L11
.L33:
	movl	28(%rsp), %edx
	andl	$24576, %edx
	cmpl	$8192, %edx
	je	.L12
	cmpl	$16384, %edx
	je	.L13
	testl	%edx, %edx
	je	.L31
.L14:
	shrq	$3, %rax
	salq	$61, %rdi
	andw	$32767, %r9w
	orq	%rax, %rdi
	movzwl	40(%rsp), %eax
	sall	$7, %r8d
	btsq	$63, %rdi
	andw	$-32768, %ax
	movq	%rdi, 32(%rsp)
	movl	$32, %edi
	orl	%r9d, %eax
	movw	%ax, 40(%rsp)
	movzbl	%ah, %eax
	andl	$127, %eax
	orl	%eax, %r8d
	movb	%r8b, 41(%rsp)
	fldt	32(%rsp)
	fstpt	(%rsp)
	call	__sfp_handle_exceptions@PLT
	fldt	(%rsp)
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2:
	.cfi_restore_state
	movq	$0, 32(%rsp)
	xorl	%eax, %eax
	movw	%ax, 40(%rsp)
	fldt	32(%rsp)
.L1:
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L30:
	.cfi_restore_state
	negq	%r14
	adcq	$0, %r15
	negq	%r15
	movq	%r15, %rdi
	testq	%r15, %r15
	jne	.L32
.L4:
	bsrq	%r14, %rcx
	movl	$16446, %edx
	movq	%r14, %rax
	xorq	$63, %rcx
	subl	%ecx, %edx
	movl	$16446, %ecx
	movslq	%edx, %rsi
	subq	%rsi, %rcx
	je	.L7
	cmpq	$64, %rcx
	je	.L8
	movl	$16446, %ecx
	sall	$7, %r8d
	subl	%edx, %ecx
	andw	$32767, %dx
	salq	%cl, %rax
	btsq	$63, %rax
	movq	%rax, 32(%rsp)
	movzwl	40(%rsp), %eax
	andw	$-32768, %ax
	orl	%eax, %edx
	movw	%dx, 40(%rsp)
	movzbl	%dh, %edx
	andl	$127, %edx
	orl	%edx, %r8d
	movb	%r8b, 41(%rsp)
	fldt	32(%rsp)
	jmp	.L1
	.p2align 4,,10
	.p2align 3
.L5:
	leal	-16449(%r10), %ecx
	movq	%r14, %rax
	movq	%r15, %rdx
	xorl	%edi, %edi
	shrq	%cl, %rdx
	shrdq	%r15, %rax
	testb	$64, %cl
	movl	$16577, %ecx
	cmovne	%rdx, %rax
	cmovne	%rdi, %rdx
	subl	%r10d, %ecx
	xorl	%r11d, %r11d
	movq	%rax, %r12
	movq	%rdx, %r13
	movq	%r14, %rax
	movq	%r15, %rdx
	salq	%cl, %rax
	shldq	%r14, %rdx
	testb	$64, %cl
	movq	%r13, %rdi
	cmovne	%rax, %rdx
	cmovne	%r11, %rax
	movq	%rax, %rcx
	xorl	%eax, %eax
	orq	%rdx, %rcx
	setne	%al
	andq	$-5, %rdi
	orq	%r12, %rax
	testb	$7, %al
	jne	.L33
.L11:
	shrq	$3, %rax
	salq	$61, %rdi
	andw	$32767, %r10w
	orq	%rax, %rdi
	movzwl	40(%rsp), %eax
	sall	$7, %r8d
	btsq	$63, %rdi
	andw	$-32768, %ax
	movq	%rdi, 32(%rsp)
	orl	%r10d, %eax
	movw	%ax, 40(%rsp)
	movzbl	%ah, %eax
	movl	%eax, %r10d
	andl	$127, %r10d
	orl	%r10d, %r8d
	movb	%r8b, 41(%rsp)
	fldt	32(%rsp)
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L7:
	.cfi_restore_state
	btsq	$63, %rax
	movq	%rax, 32(%rsp)
	movzwl	40(%rsp), %eax
	andw	$-32768, %ax
	orw	$16446, %ax
.L28:
	movw	%ax, 40(%rsp)
	movzbl	%ah, %eax
	sall	$7, %r8d
	andl	$127, %eax
	orl	%eax, %r8d
	movb	%r8b, 41(%rsp)
	fldt	32(%rsp)
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L8:
	.cfi_restore_state
	movabsq	$-9223372036854775808, %rax
	movq	%rax, 32(%rsp)
	movzwl	40(%rsp), %eax
	andw	$-32768, %ax
	orw	$16382, %ax
	jmp	.L28
	.p2align 4,,10
	.p2align 3
.L31:
	movq	%rax, %rdx
	andl	$15, %edx
	cmpq	$4, %rdx
	je	.L14
	movq	%rdi, %rdx
#APP
# 40 "/export/gnu/import/git/sources/gcc/libgcc/soft-fp/floattixf.c" 1
	addq $4,%rax
	adcq $0,%rdx
# 0 "" 2
#NO_APP
	movq	%rdx, %rdi
	andl	$4, %edx
.L15:
	testq	%rdx, %rdx
	je	.L14
	andq	$-5, %rdi
	addq	$1, %r9
	jmp	.L14
	.p2align 4,,10
	.p2align 3
.L13:
	testq	%rsi, %rsi
	js	.L14
.L27:
	movq	%rdi, %rdx
#APP
# 40 "/export/gnu/import/git/sources/gcc/libgcc/soft-fp/floattixf.c" 1
	addq $8,%rax
	adcq $0,%rdx
# 0 "" 2
#NO_APP
	movq	%rdx, %rdi
	andl	$4, %edx
	jmp	.L15
	.p2align 4,,10
	.p2align 3
.L12:
	testq	%rsi, %rsi
	jns	.L14
	jmp	.L27
	.cfi_endproc
.LFE0:
	.size	__floattixf_soft_fp, .-__floattixf_soft_fp
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
