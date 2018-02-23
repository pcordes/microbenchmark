	.text
	.p2align 6
	.globl	jump
	.type	jump, @function
jump:
	.rept 4096
	jmp	1f
	.rept NOP_REPEAT
	.byte 0x66,0x2e,0x0f,0x1f,0x84,0x00,0x00,0x00,0x00,0x00
	.endr
	.byte 0x66,0x90
1:
	.endr
	ret
	.size	jump, .-jump
	.section	.note.GNU-stack,"",@progbits
