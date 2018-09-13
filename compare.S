	.text
	.p2align 4,,15
	.globl	compare
	.type	compare, @function
compare:
	.cfi_startproc
	movq	(%rsi), %rdx
	movq	(%rdi), %rcx
	movl	$1, %eax
	movq	8(%rdx), %rsi
	cmpq	%rsi, 8(%rcx)
	jl	.L1
	movl	$-1, %eax
	jg	.L1
	movq	(%rcx), %rcx
	movq	(%rdx), %rax
	movl	(%rax), %eax
	cmpl	%eax, (%rcx)
	setg	%al
	movzbl	%al, %eax
	leal	-1(%rax,%rax), %eax
.L1:
	ret
	.cfi_endproc
	.size	compare, .-compare
	.section	.note.GNU-stack,"",@progbits
