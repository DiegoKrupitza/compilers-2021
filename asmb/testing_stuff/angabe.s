	.file	"angabe.c"
	.text
	.globl	asmb
	.type	asmb, @function
asmb:
.LFB0:
	.cfi_startproc
	testq	%rcx, %rcx
	je	.L6
	movl	$0, %eax
	movl	$0, %r9d
	jmp	.L5
.L3:
	cmpq	%r8, %r10
	seta	%r9b
	movzbl	%r9b, %r9d
.L4:
	movq	%r8, (%rdx,%rax,8)
	addq	$1, %rax
	cmpq	%rax, %rcx
	je	.L2
.L5:
	movq	(%rdi,%rax,8), %r10
	movq	%r10, %r8
	addq	(%rsi,%rax,8), %r8
	addq	%r9, %r8
	testq	%r9, %r9
	je	.L3
	cmpq	%r8, %r10
	setnb	%r9b
	movzbl	%r9b, %r9d
	jmp	.L4
.L6:
	movq	%rcx, %rax
	movl	$0, %r9d
.L2:
	movq	%r9, (%rdx,%rax,8)
	ret
	.cfi_endproc
.LFE0:
	.size	asmb, .-asmb
	.ident	"GCC: (Debian 6.3.0-18+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",@progbits
