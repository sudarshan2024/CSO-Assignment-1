.global lonely

# %rdi contains the pointer to first element of array a, %rsi contains n
lonely:
    movq (%rdi), %rax # rax = a[0]
    movq $1, %rbx # rbx = 1 (Loop variable i)
    salq $1, %rsi # rsi *= 2
    jmp .LoopCondition

.Loop:
    movq (%rdi, %rbx, 8), %rcx # rcx = a[i]
    xorq %rcx, %rax # rax = rax ^ a[i]
    incq %rbx # i++

.LoopCondition: # Checks whether i <= 2n
    cmpq %rsi, %rbx # Compare i and 2n
    jle .Loop # Jump to loop if i <= 2n
    ret
