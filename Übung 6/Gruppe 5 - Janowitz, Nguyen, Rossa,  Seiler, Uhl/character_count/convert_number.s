	.type convert_number, @function
	.globl convert_number

.section .data
.section .text

convert_number:
        ###CONSTANTS###
	.equ  ST_ASCII_BUFFER, 8
	.equ  ST_NUMBER, 12
	.equ ZERO, '0'

    pushl %ebp
    movl  %esp, %ebp
    
    movl  $0, %edi
    movl  ST_NUMBER(%ebp), %eax
    
convert_loop:
    movl  $10, %ebx
    movl  $0, %edx
    
    div %ebx			#divides %eax by %ebx, stores modulo at %edx and result at %eax

    addl  $ZERO, %edx
    pushl %edx
    incl  %edi

    cmpl $0,%eax
    je   reverse

    jmp convert_loop

reverse:
    movl %edi, %eax
    movl $0, %edi
    movl ST_ASCII_BUFFER(%ebp), %ebx

reverse_loop:
    popl  (%ebx,%edi,1)
    incl  %edi
    cmpl  %edi, %eax
    je    convert_end
    jmp   reverse_loop

convert_end:
    movl  %ebp, %esp 
    popl  %ebp
    ret
