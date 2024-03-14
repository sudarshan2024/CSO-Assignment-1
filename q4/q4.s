.global sum

# %rdi contains the pointer to first element of array a, %rsi contains n
sum:
    movq $0, %rax
    movq $0, %rbx # rbx = 0 (Loop variable i)
    movq (%rdi), %rcx # Smallest element
    movq (%rdi), %rdx # Largest element
    jmp .C

.L:
    cmpq (%rdi, %rbx, 8), %rcx # Smallest and a[i]
    cmovnle (%rdi, %rbx, 8), %rcx # Move if less than
    cmpq (%rdi, %rbx, 8), %rdx # Largest and a[i]
    cmovnge (%rdi, %rbx, 8), %rdx # Move if greater than
    incq %rbx # i++

.C:
    cmpq %rsi, %rbx # Compare i and n
    jb .L # Jump to loop if strictly lesser than
    addq %rcx, %rax
    addq %rdx, %rax
    ret
