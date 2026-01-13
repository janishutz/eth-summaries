echo:
    subq $24, %rsp      # Allocate stack space for buf  
    movq %rsp, %rdi
    call gets
    movq %rsp, %rdi
    call puts
    addq $24, %rsp
    ret