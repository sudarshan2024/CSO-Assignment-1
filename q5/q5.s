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
    je .BackToLoop # continue if a[i] = 0
    imulq %r8, %rax # rax *= a[i]
    incq %rbx # i++
    jmp .LoopCondition

.BackToLoop:
    incq %rcx # rcx++
    cmpq $2, %rcx # If we encounter two zeroes in array a
    je .TwoZeroesCondition # Jump to section which returns an array with all 0s
    incq %rbx # i++
    jmp .LoopCondition
    
.LoopCondition:
    cmpq %rsi, %rbx # Compare i and n
    jl .Loop # Jump to loop if i < n
    movq $0, %rbx # rbx = 0 (Reset loop variable i)
    jmp .Loop2Condition

# Now, if there's a 0 in the array, rcx = 1, and rax has the product of the array elements

.Loop2:
    movq (%rdi, %rbx, 8), %r8 # r8 = a[i]
    cmpq $0, %r8 # a[i] == 0 ?
    je .SetZeroElement # Set that element as product of other elements
    cmpq $1, %rcx # If there's a 0 in the array
    je .OneZero
    # ans[i] = Prod / a[i]
    movq %rdx, %r9 # r9 = ans, we temporarily store this since idivq takes rdx and rax together to store the dividend
    cqto # sign extend rax to rdx:rax
    idivq %r8 # rax /= a[i], idivq stores the quotient in %rax
    movq %r9, %rdx # rdx = r9 (Move rdx's original value back to it)
    movq %rax, (%rdx, %rbx, 8) # ans[i] = prod / a[i]
    imulq %r8, %rax # rax *= a[i] (Restore product of array elements in %rax)
    incq %rbx # i++
    jmp .Loop2Condition

.SetZeroElement:
    movq %rax, (%rdx, %rbx, 8) # ans[i] = prod
    incq %rbx # i++
    jmp .Loop2Condition

.OneZero:
    movq $0, (%rdi, %rbx, 8) # ans[i] = 0
    incq %rbx # i++
    jmp .Loop2Condition

.Loop2Condition:
    cmpq %rsi, %rbx # Compare i and n
    jl .Loop2 # Jump to loop if i < n
    movq $0, %rbx # rbx = 0
    ret

# Return ans with all 0s
.TwoZeroes:
    movq $0, (%rdx, %rbx, 8) # ans[i] = 0
    incq %rbx # i++
 
.TwoZeroesCondition:
    cmpq %rsi, %rbx # Compare i and n
    jl .TwoZeroes # Jump to loop if i < n
    ret
