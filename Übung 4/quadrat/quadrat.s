	.section .data
	.section .text
	.globl _start

_start: 
	pushl $2
	call quadrat
	addl $4, %esp
	movl %eax, %ebx
	movl $1, %eax
	int  $0x80

quadrat:
	pushl %ebp
	movl %esp, %ebp
	
	movl 8(%ebp), %eax
	imull %eax, %eax
	movl %ebp, %esp
	popl %ebp
	ret	
