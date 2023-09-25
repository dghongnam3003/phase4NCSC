section	.text
   global _start        ;must be declared for using gcc

_start:	                ;tell linker entry point

   mov     esi, 4       ;pointing to the rightmost digit
   mov     ecx, 5       ;num of digits
   clc                  ;clear carry flag - để xem cộng có dư không
add_loop:  
   mov 	al, [num1 + esi];load the digit from num1
   adc 	al, [num2 + esi];add the corresponding digit from num2 along with carry
   aaa                  ;adjust ascii after addition
   pushf                ;push the flags onto the stack
   or 	al, 30h         ;convert the result to ascii
   popf                 ;restore the flags
	
   mov	[sum + esi], al ;store the result in sum
   dec	esi             ;move to the next digit
   loop	add_loop        ;repeat the loop until all digits are precessed
	
   mov	edx,len	        ;message length
   mov	ecx,msg	        ;message to write
   mov	ebx,1	        ;file descriptor (stdout)
   mov	eax,4	        ;system call number (sys_write)
   int	0x80	        ;call kernel
	
   mov	edx,5	        ;message length
   mov	ecx,sum	        ;message to write
   mov	ebx,1	        ;file descriptor (stdout)
   mov	eax,4	        ;system call number (sys_write)
   int	0x80	        ;call kernel
	
   mov	eax,1	        ;system call number (sys_exit)
   int	0x80	        ;call kernel

section	.data
msg db 'The Sum is:',0xa	
len equ $ - msg			
num1 db '12345'
num2 db '23456'
sum db '     '