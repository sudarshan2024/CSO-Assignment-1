.global product

# %rdi contains the pointer to first element of array a, %rsi contains n, %rdx contains the pointer to the first element of the output array ans
product:
    movq $1, %rax # Product of array elements
    movq $0, %rbx # rbx = 0 (Loop variable i)
    movq $0, %rcx # rcx = 0 (Number of 0s in a)
    jmp .LoopCondition

.Loop:
    movq (%rdi, %rbx, 8), %r8 # r8 = a[i]
    cmpq $0, %r8 # If 0 in a
    jz .BackToLoop # continue if a[i] = 0
    imulq %r8, %rax # rax *= a[i]
    incq %rbx # i++
    jmp .LoopCondition

.BackToLoop:
    incq %rcx # rcx++
    cmpq $2, %rcx
    jz .TwoZeroesCondition
    incq %rbx
    jmp .LoopCondition
    
.LoopCondition:
    cmpq %rsi, %rbx # Compare i and n
    jb .Loop # Jump to loop if i < n
    movq $0, %rbx # rbx = 0
    jmp .Loop2Condition

# Now, if there's a 0 in the array, rcx = 1, and rax has the product of the array elements

.Loop2:
    movq (%rdi, %rbx, 8), %r8 # r8 = a[i]
    cmpq $0, %r8
    jz .SetZeroElement
    cmpq $1, %rcx
    jz .OneZero
    # ans[i] = Prod / a[i]
    movq %rdx, %r9
    movq $0, %rdx
    idivq %r8 # rax /= a[i]
    movq %r9, %rdx
    movq %rax, (%rdx, %rbx, 8) # ans[i] = prod / a[i]
    imulq %r8, %rax # rax *= a[i]
    incq %rbx # i++
    jmp .Loop2Condition

.SetZeroElement:
    movq %rax, (%rdx, %rbx, 8) # a[i] = rax
    incq %rbx
    jmp .Loop2Condition

.OneZero:
    movq $0, (%rdi, %rbx, 8)
    incq %rbx
    jmp .Loop2Condition

.Loop2Condition:
    cmpq %rsi, %rbx # Compare i and n
    jb .Loop2 # Jump to loop if i < n
    movq $0, %rbx # rbx = 0
    cmpq $1, %rcx
    ret

.TwoZeroes:
    movq $0, (%rdx, %rbx, 8)
    incq %rbx

.TwoZeroesCondition:
    cmpq %rsi, %rbx # Compare i and n
    jb .TwoZeroes # Jump to loop if i < n
    ret
