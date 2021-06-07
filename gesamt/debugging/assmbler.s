
.globl testclass
testclass:   
.quad testclass_main
.quad testclass_call
class_size_testclass_class = 8


testclass_main:
	enter	$16, $0
	leaq	testclass(%rip), %rax
	movq	%rax, (%r15)
	leaq	(%r15), %rax
	addq	$class_size_testclass_class,%r15
	movq	%rax, 0(%rsp)
	movq	0(%rsp), %rax
	# start function call
	call	*8(%rax)
	movq	%rax, %rax
	# end function call
	leave
	ret
testclass_call:
	enter	$16, $0
	movq	$12, 0(%rsp)
	movq	0(%rsp), %rax
	leave
	ret
