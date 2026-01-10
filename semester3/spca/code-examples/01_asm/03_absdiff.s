absdiff:
    movl %edi, %eax     
    subl %esi, %eax     // arg2 - arg1 -> eax
    movl %esi, %edx     
    subl %edi, %edx     // arg1 - arg2 -> edx
    cmpl %esi, %edi     // Set condition flags
    cmovle %edx, %eax   // edx -> eax, only if eax <= edx
    ret