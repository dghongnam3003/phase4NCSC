section	.text
   global _start        ;must be declared for using gcc
	
_start:	                ;tell linker entry point
   sub     ah, ah       ;clear ah register
   mov     al, '9'      ;load '0' into al
   sub     al, '3'      ;subtract '3' from al (al = '9' - '3' = 6) because 57-51=6
   aas                  ;ascii adjust al after subtraction (al = 6, ah = 0)
   or      al, 30h      ;convert al to ascii ('0' + 6 = '6')
   mov     [res], ax    ;store the result (6) in memory location 'res'
	
   mov	edx,len	        ;message length
   mov	ecx,msg	        ;message to write
   mov	ebx,1	        ;file descriptor (stdout)
   mov	eax,4	        ;system call number (sys_write)
   int	0x80	        ;call kernel
	
   mov	edx,1	        ;message length
   mov	ecx,res	        ;message to write
   mov	ebx,1	        ;file descriptor (stdout)
   mov	eax,4	        ;system call number (sys_write)
   int	0x80	        ;call kernel
	
   mov	eax,1	        ;system call number (sys_exit)
   int	0x80	        ;call kernel
	
section	.data
msg db 'The Result is:',0xa	
len equ $ - msg			
section .bss
res resb 1