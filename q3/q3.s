.global palindrome

# %rdi contains the pointer to first character of string s, %rsi contains n (the length of the string)
palindrome:
    movq $1, %rax
    movq $0, %rbx # rbx = 0 (Loop variable i)
    movq %rsi, %r9
    sarq $1, %r9
    jmp .Condition

.Loop:
    movzbq (%rdi, %rbx, 1), %rcx
    movq %rsi, %r8
    subq $1, %r8
    subq %rbx, %r8
    movzbq (%rdi, %r8, 1), %rdx
    cmpq %rcx, %rdx
    jnz .False
    incq %rbx

.Condition:
    cmpq %r9, %rbx# Compare i and n / 2
    jb .Loop # Jump to loop if i < n / 2
    ret

.False:
    movq $0, %rax
    ret
