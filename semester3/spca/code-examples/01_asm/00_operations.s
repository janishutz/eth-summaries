main:
	movq %rax, %rdx # rax is src, rdx is dest
	cmp  %rax, %rdx # rax is src2, rdx is src1
	jmp  func       # func is label
	notq %rax       # rax is dest (and src)
	ret  # No argument
