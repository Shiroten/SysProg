	.type print, @function
	.globl print

.section .data

	.equ BUFFER_SIZE, 500
	.lcomm BUFFER_DATA, BUFFER_SIZE
	.lcomm LINE_COUNT_ASCII, 100
	.lcomm CHAR_COUNT_ASCII, 100

.section .text

line_text:
	.asciz "Anzahl Zeilen: "

char_text:
	.asciz "Anzahl Character: "

blank_text:
	.asciz "\n"

    	###CONSTANTS###
	.equ  ST_LINE_COUNT, 12
	.equ  ST_CHAR_COUNT, 8 
	.equ  STDOUT, 1
	.equ  SYS_WRITE, 4

print:
    pushl %ebp
    movl  %esp, %ebp

    pushl ST_CHAR_COUNT(%ebp) 
    pushl $CHAR_COUNT_ASCII
    call convert_number
    addl $8, %esp

    pushl ST_LINE_COUNT(%ebp) 
    pushl $LINE_COUNT_ASCII
    call convert_number
    addl $8, %esp

    pushl $char_text
    call  write
    addl  $4, %esp

    pushl $CHAR_COUNT_ASCII
    call  write
    addl  $4, %esp

    pushl $blank_text
    call  write
    addl  $4, %esp

    pushl $line_text
    call  write
    addl  $4, %esp

    pushl $LINE_COUNT_ASCII
    call  write
    addl  $4, %esp

    pushl $blank_text
    call  write
    addl  $4, %esp


finished_reading:
    movl  %ebp, %esp 
    popl  %ebp
    ret




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
    
