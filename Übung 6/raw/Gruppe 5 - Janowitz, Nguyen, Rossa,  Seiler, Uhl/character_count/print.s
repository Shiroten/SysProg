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


