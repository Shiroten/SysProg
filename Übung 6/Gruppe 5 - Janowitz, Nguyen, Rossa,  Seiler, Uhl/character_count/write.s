	.type write, @function
	.globl write

.section .data
.section .text
	.equ  STDOUT, 1
	.equ  SYS_WRITE, 4

write:
    pushl %ebp
    movl  %esp, %ebp

    pushl 8(%ebp)
    call count_chars
    addl $4, %esp

    movl %eax, %edx
    movl $STDOUT, %ebx
    movl $SYS_WRITE, %eax
    movl 8(%ebp), %ecx
    int $0x80

    movl  %ebp, %esp 
    popl  %ebp
    ret
