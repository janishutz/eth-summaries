factorial:
    movl  $1, %eax      # Setup
.AGAIN:
    imull %edi, %eax    # %eax *= %edi
    subl  $1, %edi      # %edi--
    cmpl  $1, %edi      # 1 < %edi ?
    jg    .AGAIN        # go back, if yes
    ret