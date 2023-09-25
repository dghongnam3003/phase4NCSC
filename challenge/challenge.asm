section .data
    InputMsg db 'Please enter number of inputs: ', 0
    NumMsg db 'Enter your number: ',0
    resultMsg db "The sum is: %llu",10, 0
    InputFormat db "%llu", 0

section .bss
    counter resd 1 ;for number of inputs
    sum resq 1
    num resq 1

section .text
    extern printf ;use printf from gcc
    extern scanf ;use scanf from gcc
    global main

main:
    push ebp
    mov ebp, esp

    ;push arguments to the stack
    push InputMsg
    call printf
    add esp, 4 ;clear the stack

    push counter
    push InputFormat
    call scanf ;scanf the address of input to counter
    add esp, 8

    mov edi, dword[counter] ;get the value of counter from input

loop:
    push NumMsg
    call printf
    add esp, 4

    push num
    push InputFormat
    call scanf
    add esp, 8

    ;4 lower bytes
    mov ecx, dword[num]
    mov ebx, dword[sum]
    add ecx, ebx

    ;4 higher bytes
    mov edx, dword[num+4]
    mov eax, dword[sum+4]
    adc edx, eax

    mov [sum], ecx
    mov [sum+4], edx

    dec edi
    jnz loop ;loop when counter is not zero

    ;print the sum
    push dword[sum+4]
    push dword[sum]
    push resultMsg
    call printf
    add esp, 12

    mov esp, ebp
    pop ebp
    ret