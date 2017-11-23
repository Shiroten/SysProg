	.type char_counter, @function
	.globl char_counter

.section .data

	.equ BUFFER_SIZE, 500

	.lcomm BUFFER_DATA, BUFFER_SIZE

.section .text

	###CONSTANTS##
	.equ  LOWERCASE_A, 'a'              
	.equ  LOWERCASE_Z, 'z'
	.equ  UPPERCASE_A, 'A'              
	.equ  UPPERCASE_Z, 'Z'           

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

	cmpb  $UPPERCASE_A, %cl		#Überspringe Zeichen kleiner als A(0x41)
	jl    char_next_byte
	cmpb  $LOWERCASE_Z, %cl		#Überspringe Zeichen größer  als z(0x7A)
	jg    char_next_byte
	
	cmpb  $UPPERCASE_Z, %cl		#Wenn kleiner als Z(0x5A) incrementiere
	jle   char_increment

	cmpb  $LOWERCASE_A, %cl		#Wenn größer  als a(0x61) incrementiere
	jge   char_increment

	jmp   char_next_byte		#Ansonsten überspringe Zeichen

	
char_increment:	
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
