	.type line_counter, @function
	.globl line_counter

.section .data

	.equ BUFFER_SIZE, 500
	.lcomm BUFFER_DATA, BUFFER_SIZE

.section .text
    
	###CONSTANTS##
	#ASCII Value of linebreak
	.equ  LINEBREAK, 10                

	###STACK CONSTANTS###
	.equ  ST_BUFFER_LEN, 8 #Length of buffer
	.equ  ST_BUFFER, 12    #actual buffer

line_counter:
	pushl %ebp
	movl  %esp, %ebp
	subl  $4, %esp
	movl $0, -4(%ebp)

	movl  ST_BUFFER(%ebp), %eax
	movl  ST_BUFFER_LEN(%ebp), %ebx
	movl  $0, %edi

	cmpl  $0, %ebx
	je    line_end_convert_loop

line_loop:
	movb  (%eax,%edi,1), %cl
	cmpb  $LINEBREAK, %cl
	jne   line_next_byte

	incl -4(%ebp)

line_next_byte:
	incl  %edi              #next byte
	cmpl  %edi, %ebx        #continue unless 
	                        #we've reached the 
	                        #end
	jne   line_loop

line_end_convert_loop:
	movl  -4(%ebp), %eax
	movl  %ebp, %esp
	popl  %ebp
	ret
