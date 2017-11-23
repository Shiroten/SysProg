.include "linux.s"

.section .data

	.equ BUFFER_SIZE, 500
	.equ O_RDONLY, 0
	.equ CHARCOUNT, -4
	.equ LINECOUNT, -8
	.lcomm BUFFER_DATA, BUFFER_SIZE
	.lcomm FILEIN, 4

.section .text

char_count:
	.long 0

line_count:
	.long 0

	.globl _start

_start:
	movl  %esp, %ebp
	subl $8, %esp
	movl $0, CHARCOUNT(%ebp)
	movl $0, LINECOUNT(%ebp)

open_file:
	cmp $2, (%ebp)
	jne wrong_arguments
	
	movl  $SYS_OPEN, %eax        
	movl  8(%ebp), %ebx   #Get Filename from Stack
	movl  $O_RDONLY, %ecx        
	movl  $0666, %edx            
	int   $LINUX_SYSCALL         

store_fd_in:
	movl  %eax, FILEIN  
  
read_loop_begin:
	movl  $SYS_READ, %eax
	movl  FILEIN, %ebx     
	movl  $BUFFER_DATA, %ecx       
	movl  $BUFFER_SIZE, %edx       
	int   $LINUX_SYSCALL           

	cmpl  $END_OF_FILE, %eax       
	jle   end_loop                 

continue_read_loop:
	### Counter Words
	pushl $BUFFER_DATA     #location of buffer
	pushl %eax             #size of the buffer
	call  char_counter
	addl  %eax,CHARCOUNT(%ebp)
	popl  %eax             #get the size back
	addl  $4, %esp         #restore %esp

	### Count Linebreaks
	pushl $BUFFER_DATA     #location of buffer
	pushl %eax             #size of the buffer
	call  line_counter
	addl  %eax,LINECOUNT(%ebp)
	popl  %eax             #get the size back
	addl  $4, %esp         #restore %esp

	jmp   read_loop_begin

end_loop:
	pushl LINECOUNT(%ebp)
        pushl CHARCOUNT(%ebp)

	call  print
	addl  $8, %esp

	movl  $SYS_CLOSE, %eax
	movl  FILEIN, %ebx
	int   $LINUX_SYSCALL

	movl  $SYS_EXIT, %eax
	movl  $0, %ebx
	int   $LINUX_SYSCALL

wrong_arguments:
	movl  $SYS_EXIT, %eax
	movl  (%ebp), %ebx
	int   $LINUX_SYSCALL






