factorial:
    pushq %rbx              # Preserve frame pointer
    movl %edi, %ebx     
    movl $1, %eax
    cmpl $1, %edi
    jle .QUIT               # Base case reached: quit
    leal -1(%rdi), %edi     # Prepare args for next function call
    call factorial
    imull %ebx, %eax        # Use result of function call
.QUIT:
    popq %rbx               # Restore frame pointer
    ret