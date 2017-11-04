	.section .data

data_items: 
	.long 3,67,34,222,45,75,54,34,44,33,22,11,66,0

	.section .text

	.globl _start
_start:
	movl $0, %edi             # move 0 into the index register
	pushl data_items
	call maximum
	addl $4, %esp
	movl %eax, %ebx 
	movl $1, %eax
	int $0x80

maximum:
	pushl %ebp
	movl %esp, %ebp
	
	movl 8(%ebp), %ecx		  #In ecx steht nun die Base von data_items
	movl %ecx(,%edi, 4), %eax #Erstes Byte laden
	movl %eax, %ebx 		  #Erster wert ist vorerst der größte
	
start_loop:	                  # start loop
	cmpl $0, %eax             # check to see if we've hit the end
	je loop_exit
	incl %edi                 # load next value
	movl %ecx(,%edi,4), %eax 
	cmpl %ebx, %eax           # compare values
	jle start_loop            # jump to loop beginning if the new 
	                          # one isn't bigger
	movl %eax, %ebx           # move the value as the largest 
	jmp start_loop            # jump to loop beginning

loop_exit:
	movl %ebp, %esp
	popl %ebp
	ret
