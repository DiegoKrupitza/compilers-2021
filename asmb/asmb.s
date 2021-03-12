	.file	"startinPoint.c"
	.text
	.globl	asmb
	.type	asmb, @function
asmb:
.LFB0:
	.cfi_startproc
    # rdi = address of x
    # rsi = address of y
    # rdx = address of sum
    # rcx = actuall value of n

    # r8 = carry
    # r9 = s
    # r11 = i
    
    # init the values for s,i,carry
    movq    $0, %r8    #  carry = 0
    movq    $0, %r9    #  s = 0 not needed since we make s= x[i]
    movq    $0, %r11   #  i = 0
	
    cmpq    $0, %rcx   # n= 0
    JE      NULL_N


    # check if we even have to enter the loop
    cmpq    %rcx, %r11  # i < n
    JNL     exit # we dont need to enter the loop since i >= n

    # i=0 case berechnen
    CLC
    movq    (%rdi), %r9     # s = x[0]
    addq    (%rsi), %r9     # s += y[0]
    jnc     carry_not_set
    jmp     carry_set

loop:
    leaq    8(%rdi), %rdi # moving rdi aka x up position 1 
    leaq    8(%rsi), %rsi # moving rsi aka y up position 1
    leaq    8(%rdx), %rdx # moving rdx aka sum up position 1
    
    cmpq    $0, %r8 # check if carry is set
    JE      set_no_carry_action

set_carry_action:
    STC
    jmp     forward

set_no_carry_action:
    CLC

forward:
    movq    (%rdi), %r9     # s = x[i]
    adcq    (%rsi), %r9     # s += y[i]
    #adcq    %r8, %r9        # s += carry
    jnc     carry_not_set
    
carry_set:
    movq    $1, %r8
    jmp     conti

carry_not_set:
    movq    $0, %r8

conti:
    movq    %r9, (%rdx) # sum[i] = s  

loop_end_check:

    # increase the i and
    # check wether we should continue with the loop or not
    addq    $1, %r11
    CLC
    cmpq    %rcx, %r11 # i < n 
    JL      loop

exit:
    # we are done!

    # just need to move the carry to last n+1 position of the sum
    movq    %r8, 8(%rdx) 
    JMP     final_done

NULL_N:
    movq    $0, (%rdx)

final_done:
	ret
	.cfi_endproc
.LFE0:
	.size	asmb, .-asmb
	.ident	"GCC: (Debian 6.3.0-18+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",@progbits
