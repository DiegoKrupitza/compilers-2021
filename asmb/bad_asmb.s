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
    #movq    $0, %r9    #  s = 0 not needed since we make s= x[i]
    movq    $0, %r11   #  i = 0
	
    # check if we even have to enter the loop
    cmpq    %rcx, %r11  # i < n
    JNL     exit # we dont need to enter the loop since i >= n

loop:
    
    movq    (%rdi,%r11,8), %r9 # s = x[i]
    CLC
    adcq    (%rsi,%r11,8), %r9 # s += y[i]
    adcq    %r8, %r9           # s += carry

    CLC
    # idk wyh aber immer um 2 zu viel

    # setting the val for sum[i] 
    movq    %r9, (%rdx,%r11,8) # sum[i] = s
    
    cmpq    $0, %r8 # carry = 0
    JE      carry_is_zero

carry_is_one:
    # we need to check s<=x[i]
    cmpq    %r9, (%rdi,%r11,8) # compary s and x[i]
    JLE     set_carry_to_1
    JMP     set_carry_to_0

carry_is_zero:
    # we need to check s<x[i]
    cmpq    %r9, (%rdi,%r11,8) # compary s and x[i]
    JL      set_carry_to_1
    JMP     set_carry_to_0


set_carry_to_1:
    movq    $1, %r8
    JMP     loop_end_check

set_carry_to_0:
    movq    $0, %r8

loop_end_check:

    # increase the i and
    # check wether we should continue with the loop or not
    addq    $1, %r11
    cmpq    %r11, %rcx
    JL      loop

exit:
    # we are done!

    # just need to move the carry to last n+1 position of the sum
    movq    %r8, (%rdx,%r11,8) 

final_done:
	ret
	.cfi_endproc
.LFE0:
	.size	asmb, .-asmb
	.ident	"GCC: (Debian 6.3.0-18+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",@progbits
