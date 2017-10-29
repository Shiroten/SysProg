.section .data
.section .text

.globl _start

_start:
	movl $-8, %eax
	cmpl $-9, %eax
	jl exit0	
	#jne exit1
	jg exit2
	#jle exit 3
	
	jmp exit

exit0:
	movl $1, %eax
	movl $0, %ebx	#exit with 0
	int $0x80

exit1:
	movl $1, %eax
	movl $1, %ebx	#exit with 1
	int $0x80

exit2:
	movl $1, %eax
	movl $2, %ebx	#exit with 2
	int $0x80

exit3:
	movl $1, %eax
	movl $3, %ebx	#exit with 3
	int $0x80

exit:
	movl $1, %eax
	movl $99, %ebx	#exit with 99 as default
	int $0x80

