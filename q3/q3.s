.global palindrome

# %rdi contains the pointer to first character of string s, %rsi contains n (the length of the string)
palindrome:
    movq $1, %rax # rax = 1 (Whether the string is a palindrome, 1 is true and 0 is false)
    movq $0, %rbx # rbx = 0 (Loop variable i)
    movq %rsi, %r9 # r9 = n
    sarq $1, %r9 # r9 /= 2
    movq %rsi, %r8 # r8 = n
    jmp .Condition

.Loop:
    movzbq (%rdi, %rbx, 1), %rcx # Move zero extended byte to quad (rcx = s[i])
    decq %r8 # r8-- (r8 = n - 1 - i)
    movzbq (%rdi, %r8, 1), %rdx # rdx = s[n - 1 - i]
    cmpq %rcx, %rdx # s[i] == s[n - 1 - i] ?
    jne .False # If not equal, jump to false condition which invalidates the palindrome
    incq %rbx # i++

.Condition:
    cmpq %r9, %rbx # Compare i and n / 2
    jl .Loop # Jump to loop if i < n / 2
    ret

.False: # Will never reach here if the string is a palindrome
    movq $0, %rax # rax = 0 (Not a palindrome)
    ret
