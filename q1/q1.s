.global lonely

# %rdi contains the pointer to first element of array a, %rsi contains n
lonely:
    movq $0, %rax # rax = 0
    movq $0, %rbx # rbx = 0 (Loop variable i)
    salq $1, %rsi # rsi *= 2
    jmp .C

.L:
    movq (%rdi, %rbx, 8), %rcx # rcx = a[i]
    xorq %rcx, %rax # rax = rax ^ a[i]
    incq %rbx # i++

.C: # Checks whether i <= 2n
    cmpq %rsi, %rbx # Compare i and 2n
    jbe .L # Jump to loop if lesser than or equal to
    ret
