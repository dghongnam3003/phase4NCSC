section .data
    userMsg db 'Please enter a number: ',0
    dispMsg db 'You have entered: %d', 10, 0 ; Format string for printf, %d is a placeholder for an integer

section .bss
    num resd 1 ; Reserve space for one integer (4 bytes)

section .text
    extern printf
    extern scanf
    global main
    sub esp, 4

main:
    push ebp
    mov ebp, esp

    ; Print user prompt using printf
    push userMsg
    call printf
    add esp, 4 ; Clean up the stack

    ; Read an integer from the user using scanf
    push num
    push formatInput ; Push the format specifier for scanf
    call scanf
    add esp, 8 ; Clean up the stack

    ; Print the entered number using printf
    mov edi, dword[num]
    
    push edi
    push dispMsg
    call printf
    add esp, 8 ; Clean up the stack

    ; Exit the program
    mov esp, ebp
    pop ebp
    ret

section .data
    formatInput db "%d", 0 ; Format specifier for scanf
