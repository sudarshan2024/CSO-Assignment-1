.global rotate

# %rdi contains the pointer to first element of array a, %rsi contains n
rotate:
    movq (%rdi), %rax # rax = a[0]
    movq $1, %rbx # rbx = 1 (Loop variable i)
    jmp .LoopCondition

.Loop:
    movq (%rdi, %rbx, 8), %rcx # rcx = a[i]
    movq %rcx, -8(%rdi, %rbx, 8) # a[i - 1] = rcx
    incq %rbx # i++

.LoopCondition:
    cmpq %rsi, %rbx # Compare i and n
    jl .Loop # Jump to loop if i < n
    movq %rax, -8(%rdi, %rbx, 8) # a[n - 1] = a[0]
    ret
