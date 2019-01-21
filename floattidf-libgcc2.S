	.text
	.p2align 4
	.globl	__floattidf_libgcc2
	.hidden	__floattidf_libgcc2
	.type	__floattidf_libgcc2, @function
__floattidf_libgcc2:
.LFB23:
	.cfi_startproc
	endbr64
	movq	%rdi, %r8
	movq	%rdi, %rcx
	sarq	$63, %rdi
	movq	%rsi, %r9
	cmpq	%rsi, %rdi
	je	.L24
	testq	%rsi, %rsi
	js	.L25
	movq	%r8, %rdi
	jne	.L26
	movq	%r8, %rax
	shrdq	$1, %rsi, %rax
	andl	$1, %ecx
	jne	.L27
.L22:
	pxor	%xmm1, %xmm1
	movsd	.LC0(%rip), %xmm0
	cvtsi2sdq	%rax, %xmm1
.L9:
	mulsd	%xmm1, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L25:
	negq	%rsi
	movsd	.LC3(%rip), %xmm0
	bsrq	%rsi, %rsi
	xorq	$63, %rsi
	testl	%esi, %esi
	je	.L28
	movslq	%esi, %rsi
	movq	%r8, %rdi
.L13:
	movl	$65, %ecx
	movq	%r8, %rax
	pxor	%xmm1, %xmm1
	movq	%r9, %rdx
	subq	%rsi, %rcx
	movsd	.LC1(%rip), %xmm0
	sarq	%cl, %rdx
	shrdq	%r9, %rax
	testb	$64, %cl
	movq	%rcx, %rsi
	cmovne	%rdx, %rax
	movl	$64, %ecx
	subl	%esi, %ecx
	movq	%rax, %rdx
	salq	%cl, %rdi
	orq	$1, %rdx
	testq	%rdi, %rdi
	cmovne	%rdx, %rax
	cvtsi2sdq	%rax, %xmm1
	cmpq	$64, %rsi
	je	.L9
	cmpq	$63, %rsi
	jne	.L29
	movsd	.LC2(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L24:
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%r8, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L27:
	orq	$1, %rax
	jmp	.L22
	.p2align 4,,10
	.p2align 3
.L28:
	ret
	.p2align 4,,10
	.p2align 3
.L26:
	bsrq	%rsi, %rsi
	xorq	$63, %rsi
	movslq	%esi, %rsi
	jmp	.L13
.L29:
	movl	$1, %eax
	movl	%esi, %ecx
	pxor	%xmm0, %xmm0
	salq	%cl, %rax
	cvtsi2sdq	%rax, %xmm0
	jmp	.L9
	.cfi_endproc
.LFE23:
	.size	__floattidf_libgcc2, .-__floattidf_libgcc2
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1073741824
	.align 8
.LC1:
	.long	0
	.long	1139802112
	.align 8
.LC2:
	.long	0
	.long	1138753536
	.align 8
.LC3:
	.long	0
	.long	-941621248
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
