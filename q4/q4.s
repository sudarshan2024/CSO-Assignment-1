.global sum

# %rdi contains the pointer to first element of array a, %rsi contains n
sum:
    movq $0, %rax # rax = 0 (Sum of smallest and largest element in array)
    movq $1, %rbx # rbx = 1 (Loop variable i)
    movq (%rdi), %rcx # Smallest element (rcx = a[0])
    movq (%rdi), %rdx # Largest element (rdx = a[0])
    jmp .LoopCondition

.Loop:
    movq (%rdi, %rbx, 8), %r8 # r8 = a[i]
    cmpq %r8, %rcx # Smallest and a[i]
    cmovg %r8, %rcx # If a[i] < Smallest, Smallest = a[i]
    cmpq %r8, %rdx # Largest and a[i]
    cmovl %r8, %rdx # If a[i] > Largest, Largest = a[i]
    incq %rbx # i++

.LoopCondition:
    cmpq %rsi, %rbx # Compare i and n
    jl .Loop # Jump to loop if i < n
    movq %rcx, %rax # rax = rcx
    addq %rdx, %rax # rax += rdx
    ret
