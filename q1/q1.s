.global lonely

# %rdi contains the pointer to first element of array a, %rsi contains n
lonely:
    movq $0, %rax # rax = 0
    movq $0, %rbx # rbx = 0 (Loop variable i)
    imul $2, %rsi # rsi *= 2
    jmp .C

.L:
    movq (%rdi, %rbx, 8), %rcx
    xor %rcx, %rax # rax = rax ^ a[i]
    inc %rbx # i++

.C: # Checks whether i <= 2n
    cmpq %rsi, %rbx # Compare i and 2n
    jbe .L # Jump to loop if less than or equal to
    ret
