factorial:
    jmp .COMP           # Check condition
.LOOP: 
    imull %edx, %eax    # %eax *= %edx
    decl %edx           # %edx--
.COMP:
    cmpl $1, %edx       # 1 < %edx ?
    jg .LOOP            # if yes, go to loop
    ret