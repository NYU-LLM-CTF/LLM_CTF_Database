section .text

global main

exit:
    xor rdi, rdi
    xor rax, rax
    mov al, 60
    syscall

write:
    xor rax, rax
    inc al
    mov edi, 1
    mov rsi, rsp
    add rsi, 8
    syscall
    ret

read:
    xor rax, rax
    xor rdi, rdi
    mov rsi, rcx
    mov edx, 0x6f
    syscall
    ret

fail:
    xor rax, rax
    push rax
    mov eax, 0x2e2e2e74
    push rax
    mov rax, 0x636572726f636e49
    push rax

    mov edx, 16
    call write
    call exit

success:
    xor rax,rax
    push rax
    mov rax, 0x2174636572726f43
    push rax

    mov edx, 16
    call write
    call exit

main:
    push rbp
    mov rbp, rsp
    sub rbp, 0x70

    mov rax, 0x0a3e64
    push rax
    mov rax, 0x726f777373617020
    push rax
    mov rax, 0x656874207265746e
    push rax
    mov rax, 0x6520657361656c50
    push rax

    mov edx, 34
    call write

    mov rcx, rbp
    sub rcx, 70h
    call read
    
    mov rcx, rbp
    sub rcx, 70h
    xor rdx, rdx
    dec rax
    mov [rcx+rax], rdx

    ; check
    mov rax, 0x7c
    mov rbx, [rsi+0]
    and rbx, 0xFF
    xor rax, rbx
    cmp rax, 0x1f
    jne fail
    

    mov rax, 0xba
    mov rbx, [rsi+1]
    and rbx, 0xFF
    xor rax, rbx
    cmp rax, 0xc9
    jne fail
    

    mov rax, 0xca
    mov rbx, [rsi+2]
    and rbx, 0xFF
    xor rax, rbx
    cmp rax, 0xab
    jne fail
    

    mov rax, 0xbc
    mov rbx, [rsi+3]
    and rbx, 0xFF
    xor rax, rbx
    cmp rax, 0xcb
    jne fail
    

    mov rax, 0xbb
    mov rbx, [rsi+4]
    and rbx, 0xFF
    xor rax, rbx
    cmp rax, 0xd8
    jne fail
    

    mov rax, 0x59
    mov rbx, [rsi+5]
    and rbx, 0xFF
    xor rax, rbx
    cmp rax, 0x2d
    jne fail
    

    mov rax, 0x52
    mov rbx, [rsi+6]
    and rbx, 0xFF
    xor rax, rbx
    cmp rax, 0x34
    jne fail
    

    mov rax, 0x3
    mov rbx, [rsi+7]
    and rbx, 0xFF
    xor rax, rbx
    cmp rax, 0x78
    jne fail
    

    mov rax, 0xf8
    mov rbx, [rsi+8]
    and rbx, 0xFF
    xor rax, rbx
    cmp rax, 0xc9
    jne fail
    

    mov rax, 0x50
    mov rbx, [rsi+9]
    and rbx, 0xFF
    xor rax, rbx
    cmp rax, 0x65
    jne fail
    

    mov rax, 0x14
    mov rbx, [rsi+10]
    and rbx, 0xFF
    xor rax, rbx
    cmp rax, 0x4b
    jne fail
    

    mov rax, 0x20
    mov rbx, [rsi+11]
    and rbx, 0xFF
    xor rax, rbx
    cmp rax, 0x17
    jne fail
    

    mov rax, 0xdf
    mov rbx, [rsi+12]
    and rbx, 0xFF
    xor rax, rbx
    cmp rax, 0xb7
    jne fail
    

    mov rax, 0x11
    mov rbx, [rsi+13]
    and rbx, 0xFF
    xor rax, rbx
    cmp rax, 0x20
    jne fail
    

    mov rax, 0x6d
    mov rbx, [rsi+14]
    and rbx, 0xFF
    xor rax, rbx
    cmp rax, 0x58
    jne fail
    

    mov rax, 0x1b
    mov rbx, [rsi+15]
    and rbx, 0xFF
    xor rax, rbx
    cmp rax, 0x44
    jne fail
    

    mov rax, 0x29
    mov rbx, [rsi+16]
    and rbx, 0xFF
    xor rax, rbx
    cmp rax, 0x1c
    jne fail
    

    mov rax, 0x7c
    mov rbx, [rsi+17]
    and rbx, 0xFF
    xor rax, rbx
    cmp rax, 0x4f
    jne fail
    

    mov rax, 0x3f
    mov rbx, [rsi+18]
    and rbx, 0xFF
    xor rax, rbx
    cmp rax, 0x5c
    jne fail
    

    mov rax, 0x30
    mov rbx, [rsi+19]
    and rbx, 0xFF
    xor rax, rbx
    cmp rax, 0x45
    jne fail
    

    mov rax, 0x7d
    mov rbx, [rsi+20]
    and rbx, 0xFF
    xor rax, rbx
    cmp rax, 0xf
    jne fail
    

    mov rax, 0xbc
    mov rbx, [rsi+21]
    and rbx, 0xFF
    xor rax, rbx
    cmp rax, 0x8f
    jne fail
    

    mov rax, 0xb3
    mov rbx, [rsi+22]
    and rbx, 0xFF
    xor rax, rbx
    cmp rax, 0xec
    jne fail
    

    mov rax, 0x48
    mov rbx, [rsi+23]
    and rbx, 0xFF
    xor rax, rbx
    cmp rax, 0x2a
    jne fail
    

    mov rax, 0x8
    mov rbx, [rsi+24]
    and rbx, 0xFF
    xor rax, rbx
    cmp rax, 0x71
    jne fail
    

    mov rax, 0x6f
    mov rbx, [rsi+25]
    and rbx, 0xFF
    xor rax, rbx
    cmp rax, 0x30
    jne fail
    

    mov rax, 0xc8
    mov rbx, [rsi+26]
    and rbx, 0xFF
    xor rax, rbx
    cmp rax, 0xac
    jne fail
    

    mov rax, 0xca
    mov rbx, [rsi+27]
    and rbx, 0xFF
    xor rax, rbx
    cmp rax, 0xf9
    jne fail
    

    mov rax, 0xbe
    mov rbx, [rsi+28]
    and rbx, 0xFF
    xor rax, rbx
    cmp rax, 0x8b
    jne fail
    

    mov rax, 0xa0
    mov rbx, [rsi+29]
    and rbx, 0xFF
    xor rax, rbx
    cmp rax, 0x91
    jne fail
    

    mov rax, 0xd0
    mov rbx, [rsi+30]
    and rbx, 0xFF
    xor rax, rbx
    cmp rax, 0xe6
    jne fail
    

    mov rax, 0x97
    mov rbx, [rsi+31]
    and rbx, 0xFF
    xor rax, rbx
    cmp rax, 0xf9
    jne fail
    

    mov rax, 0x3d
    mov rbx, [rsi+32]
    and rbx, 0xFF
    xor rax, rbx
    cmp rax, 0x2
    jne fail
    

    mov rax, 0x9c
    mov rbx, [rsi+33]
    and rbx, 0xFF
    xor rax, rbx
    cmp rax, 0xe1
    jne fail


    call success



    





section .data

; You can define any necessary data in the .data section if needed.

section .bss

; You can define uninitialized data in the .bss section if needed.