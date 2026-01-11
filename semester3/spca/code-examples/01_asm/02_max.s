max:
    cmpl %esi, %edi     # Set condition flags
    jle .IF             # Conditional jump if %edi <= %esi
    movl %edi, %edx     # %edi -> return register
    jmp .ELSE
.IF:
    movl %esi, %edx     # &esi -> return register
.ELSE:
    ret
