	.type char_counter, @function
	.globl char_counter

.section .data

	.equ BUFFER_SIZE, 500

	.lcomm BUFFER_DATA, BUFFER_SIZE

.section .text

	###CONSTANTS##
	#The lower boundary of our search
	.equ  LOWERCASE_A, 'a'              
	#The upper boundary of our search
	.equ  LOWERCASE_Z, 'z'         

	###STACK CONSTANTS###
	.equ  ST_BUFFER_LEN, 8 #Length of buffer
	.equ  ST_BUFFER, 12    #actual buffer

char_counter:
	pushl %ebp
	movl  %esp, %ebp
	subl  $4, %esp
	movl $0, -4(%ebp)

	movl  ST_BUFFER(%ebp), %eax
	movl  ST_BUFFER_LEN(%ebp), %ebx
	movl  $0, %edi

	cmpl  $0, %ebx
	je    char_end_convert_loop

char_loop:
	movb  (%eax,%edi,1), %cl
	cmpb  $LOWERCASE_A, %cl
	jl    char_next_byte
	cmpb  $LOWERCASE_Z, %cl
	jg    char_next_byte
	
	incl -4(%ebp)

char_next_byte:
	incl  %edi              #next byte
	cmpl  %edi, %ebx        #continue unless 
	                        #we've reached the 
	                        #end
	jne   char_loop

char_end_convert_loop:
	movl  -4(%ebp), %eax
	movl  %ebp, %esp
	popl  %ebp
	ret
