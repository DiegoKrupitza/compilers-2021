
.globl testclass
testclass:   
.quad testclass_main
.quad testclass_call
.quad testclass_call2
class_size_testclass_class = 8


testclass_main:
	enter	$32, $0
	leaq	testclass(%rip), %rax
	movq	%rax, (%r15)
	leaq	(%r15), %rax
	addq	$class_size_testclass_class,%r15
	movq	%rax, 0(%rsp)
	movq	0(%rsp), %rax
	# start function call
	movq	(%rax), %rax
	call	*8(%rax)
	movq	%rax, %rax
	# end function call
	movq	%rax, 8(%rsp)
	movq	8(%rsp), %rax
	leave
	ret
testclass_call:
	enter	$32, $0
	movq	$12, 0(%rsp)
	movq	0(%rsp), %rax
	movq	%rdi, %r11
	# start function call
	pushq	%rax
	movq	(%r11), %r11
	call	*16(%r11)
	movq	%rax, %r11
	popq	%rax
	# end function call
	addq	%r11, %rax
	leave
	ret
testclass_call2:
	enter	$32, $0
	movq	$69, 0(%rsp)
	movq	0(%rsp), %rax
	leave
	ret
