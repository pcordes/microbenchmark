	.text
	.p2align 4,,15
	.globl	compare_nop
	.type	compare_nop, @function
compare_nop:
	.cfi_startproc
	#endbr64
	.byte 0xf3, 0x0f, 0x1e, 0xfa
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
	.size	compare_nop, .-compare_nop
	.ident	"GCC: (GNU) 8.2.1 20180905 (Red Hat 8.2.1-3)"
	.section	.note.GNU-stack,"",@progbits
