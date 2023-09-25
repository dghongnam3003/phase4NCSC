section	.text
   global _start	 ;must be declared for linker (gcc)
	
_start:	         ;tell linker entry point
 mov	edx,MsgLen  ;message length
   mov	ecx,SysMsg  ;message to write
   mov	ebx,1    ;file descriptor (stdout)
   mov	eax,4    ;system call number (sys_write)
   int	0x80     ;call kernel

   mov	edx,len  ;message length
   mov	ecx,msg  ;message to write
   mov	ebx,1    ;file descriptor (stdout)
   mov	eax,4    ;system call number (sys_write)
   int	0x80     ;call kernel

   mov	edx,1   ;message length
   mov	ecx,num   ;message to write
   mov	ebx,2    ;file descriptor (stdout)
   mov	eax,3    ;system call number (sys_write)
   int	0x80     ;call kernel
	
   mov	edx,num   ;message length
   mov	ecx,s2   ;message to write
   mov	ebx,1    ;file descriptor (stdout)
   mov	eax,4    ;system call number (sys_write)
   int	0x80     ;call kernel
	
   mov	eax,1    ;system call number (sys_exit)
   mov  ebx,0
   int	0x80     ;call kernel
	
section	.data
SysMsg db 'Input number of stars',0xa
MsgLen equ $ - SysMsg
msg db 'Displaying 8 stars',0xa ;a message
len equ $ - msg  ;length of message
s2 times num db '*'

section .bss
num resb 1