    # carry check
    # logik behind my solution
    # s < 5  means its also s <= 5                          this results in only 1 check
    # if s < 5 not valid we only have to check for x <=5    this results in 2 checks
    
    # my solution we just set carry = s<x[i]
    # if carry=1 set we just compary again with s<=x[i]
    # we only change carry to 0 if s<=x[i] is not valid



cmpq    %r9, (%rdi,%r11,8) # comparing sum[i] = s  and x[i]
    JNL      sum_not_less_x

sum_less_x: # aka sum[i] < x[i]
    movq    $1, %r9  # moving the tmp carry val to %r9
    JMP     loop_end_check

sum_not_less_x: # aka sum[i] >= x[i]
    # now we check if carry=1 was present or not
    cmpq    $0, %r8 # is carry =0
    JNE     carry_was_set_for_if

carry_was_not_set_for_if: # aka = carry = 0
    movq    $0, %r9
    JMP     loop_end_check


carry_was_set_for_if: # aka carry = 1
    movq    (%rdx,%r11,8), %r9
    cmpq    %r9,(%rdi,%r11,8) # checking sum[i] <= x[i]
    JLE     set_carry_temp_to_1

set_carry_temp_to_0:
    movq    $0, %r9
    JMP     loop_end_check

set_carry_temp_to_1: 
    movq    $1,%r9




# ganz unten beim loop_end_check
loop_end_check:
    # move temp val of carry back to carry 
    movq    %r9, %r8