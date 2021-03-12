	.file	"AsmaAngabe.c"
	.text
	.globl	asma
	.type	asma, @function
asma:
.LFB0:
	.cfi_startproc
	movq	(%rdi), %r8
	movq	%r8, %rcx
	addq	(%rsi), %rcx
	movq	%rcx, (%rdx)
	movq	8(%rsi), %rax
	addq	8(%rdi), %rax
	cmpq	%rcx, %r8
	seta	%cl
	movzbl	%cl, %ecx
	addq	%rcx, %rax
	movq	%rax, 8(%rdx)
	ret
	.cfi_endproc
.LFE0:
	.size	asma, .-asma
	.ident	"GCC: (Debian 6.3.0-18+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",@progbits
