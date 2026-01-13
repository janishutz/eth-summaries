swap_and_sum:
    movq    %rbx, -16(%rsp)     # Save %rbx
    movslq  %esi,%rbx           # Save i    (and extend)
    movq    %r12, -8(%rsp)      # Save %r12
    movq    %rdi, %r12          # Save a
    leaq    (%rdi,%rbx,8), %rdi # & a[i]   -> %rdi (arg 1)
    subq    $16, %rsp           # Allocate stack frame
    leaq    8(%rdi), %rsi       # & a[i+1] -> %rsi (arg 2)
    call    swap                
    movq    (%r12,%rbx,8), %rax # a[i]
    addq    %rax, sum(%rip)     # sum += a[i]
    movq    (%rsp), %rbx        # Restore %rbx
    movq    8(%rsp), %r12       # Restore %r12
    addq    $16, %rsp           # Deallocate stack frame
    ret