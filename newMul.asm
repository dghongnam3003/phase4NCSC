SYS_WRITE equ 4
SYS_READ equ 3
SYS_EXIT equ 1
STDIN equ 0
STDOUT equ 1

segment .data
    msg1 db "Enter multiplicand: ", 0xa, 0xd
    len1 equ $ - msg1

    msg2 db "Enter the multiplier: ", 0xa, 0xd
    len2 equ $ - msg2

    msg3 db "The result is: "
    len3 equ $ - msg3

segment .bss
    num1 resb 2
    num2 resb 2
    res resb 1

section .text
    global _start

_start:
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg1
    mov edx, len1
    int 0x80

    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, num1
    mov edx, 2
    int 0x80

    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg2
    mov edx, len2
    int 0x80

    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, num2
    mov edx, 2
    int 0x80

    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg3
    mov edx, len3
    int 0x80

    mov al, [num1]
    sub al, '0'

    mov bl, [num2]
    sub bl, '0'

    mul bl
    add al, '0'

    mov [res], al

    ;print the result
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, res
    mov edx, 1
    int 0x80

    mov eax, SYS_EXIT
    int 0x80