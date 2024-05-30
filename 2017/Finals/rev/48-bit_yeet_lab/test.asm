format ELF executable
segment readable executable

use32
    jmp 0x33:start64 ; jmp1
    db 0x54, 0x80, 0x04, 0x08, 0x00, 0x00, 0x00, 0x00, 0x23, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
start64:
use64
    db 0x2e, 0x48, 0xff, 0x2c, 0x25, 0x5b, 0x80, 0x04, 0x08
    jmp far FWORD [cs:0x0804805b]
    mov rax, [esp]
    mov rbx, [esp+0x8]
    mov rcx, [esp+0x10]
    mov rdx, [esp+0x18]
    mov r8, 0x316e6f63 ;omae
    mov r9, 0x326e6f63
    mov r10, 0x346e6f63
    cmp rax, [r8]
    jne j2failed
    cmp rbx, [r9]
    jne j2failed
    cmp rdx, [r10]
    jne j2failed


j2failed:
    db 0x2e, 0x48, 0xff, 0x2c, 0x25, 0x6a, 0x6d, 0x70, 0x33 ;jmp FWORD cs:jmp3 to failed

use32
failed:
    mov DWORD [esp+0x24], 0x0
    jmp yote

lastcheck:
    cmp ecx, [0x336e6f63] ; con3
    jne failed

yote:
    db "yote", 10

omaewa:
    db "'omae wa mou shindeiru' 'NANI!?'", 10
