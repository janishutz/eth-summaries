# Copyright 2011-2012 Nicholas J. Kain, licensed under standard MIT license
setjmp:
	mov %rbx, (%rdi)
	mov %rbp, 8(%rdi)
	mov %r12, 16(%rdi)
	mov %r13, 24(%rdi)
	mov %r14, 32(%rdi)
	mov %r15, 40(%rdi)
	lea 8(%rsp), %rdx
	mov %rdx, 48(%rdi)
	mov (%rsp), %rdx
	mov %rdx, 56(%rdi)
	xor %eax, %eax
	ret

longjmp:
	xor %eax, %eax
	cmp $1, %esi       # CF = val ? 0 : 1
	adc %esi, %eax     # eax = val + !val
	mov (%rdi), %rbx   # rdi is the jmp_buf, restore regs from it
	mov 8(%rdi), %rbp
	mov 16(%rdi), %r12
	mov 24(%rdi), %r13
	mov 32(%rdi), %r14
	mov 40(%rdi), %r15
	mov 48(%rdi), %rsp
	jmp *56(%rdi)      # goto saved address without altering rsp
