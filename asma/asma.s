	.text
	.globl	asma
	.type	asma, @function
asma:
.LFB0:
	.cfi_startproc
    NOP # rdi = x  
    NOP # rsi = y  
    NOP # rdx = sum 
    NOP # rax = returnregister = sum0 
    NOP # rcx = carry 
	movq	(%rsi), %rax # sum0 = y[0]; 
	adcq	(%rdi), %rax # sum0 += x[0];
	jnc carry_not_set
carry_set:
    movq    $1, %rcx # when carry bit was set we want carry = 1
    jmp     conti
carry_not_set:
    movq    $0, %rcx # default when carry not set is carry = 0
conti:
    movq    %rax, (%rdx) # sum[0] = sum0
    NOP
    leaq    8(%rdi), %rdi  # moving rdi aka x to position 1 
    leaq    8(%rsi), %rsi # moving rsi aka y to position 1
    leaq    8(%rdx), %rdx # moving rdx aka sum to position 1
    NOP

    movq    (%rdi), %rax # tmpSum = x[1]
    addq    (%rsi), %rax # tmpSum += y[1]
    addq    %rcx, %rax # tmpSum += carry
    movq    %rax, (%rdx)

    NOP
	ret
	.cfi_endproc
.LFE0:
	.size	asma, .-asma
	.ident	"GCC: (Debian 6.3.0-18+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",@progbits
