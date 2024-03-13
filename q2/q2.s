.global rotate

# %rdi contains the pointer to first element of array a, %rsi contains n
rotate:
    movq $1, %rbx # rbx = 1 (Loop variable i)
    movq (%rdi), %rax # rax = a[0]
    jmp .C

.L:
    movq (%rdi, %rbx, 8), %rcx # rcx = a[i]
    movq %rcx, -8(%rdi, %rbx, 8) # a[i - 1] = rcx
    incq %rbx # i++

.C:
    cmpq %rsi, %rbx # Compare i and n
    jb .L # Jump to loop if strictly lesser than
    movq %rax, -8(%rdi, %rbx, 8) # a[n - 1] = rax (a[0])
    ret
