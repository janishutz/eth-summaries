sum:                        // Label
    endbr64                 // Indirect Branch target (No effect on code's logic)
    pushq %rbp              // Preserve caller stack frame
    movq %rsp, %rbp         // Set up new stack frame
    movl %edi, -20(%rbp)    // Arg1 register -> stack
    movl %esi, -24(%rbp)    // Arg2 register -> stack
    movl -20(%rbp), %edx    // stack[Arg1] -> gp register
    movl -24(%rbp), %eax    // stack[Arg2] -> gp register
    addl %edx, %eax         // Add Arg1 + Arg2 -> gp register
    movl %eax, -4(%rbp)     // result -> stack
    movl -4(%rbp), %eax     // stack[result] -> return register
    popq %rbp               // Restore caller stack frame
    ret                     // jump back to caller