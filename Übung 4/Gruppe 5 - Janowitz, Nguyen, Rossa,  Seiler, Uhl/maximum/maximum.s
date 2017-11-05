	.section .data

data_items: 
	.long 3,67,34,2,45,75,54,34,44,33,22,11,66,0

	.section .text

	.globl _start
_start:
	leal data_items, %ecx
	pushl %ecx
	call maximum
	addl $4, %esp		  # reset StackPointer
	
	movl %eax, %ebx		  # prepare exit 
	movl $1, %eax
	int $0x80

maximum:
	pushl %ebp			  # Prolog
	movl %esp, %ebp			  #
	
	subl $4, %esp			  # Make room for local variable
	movl 8(%ebp), %ecx 		  # Copy data_items adress to local variable
	movl (%ecx), %eax		  # Erstes Byte laden
	addl $4, %ecx		 	  # Zeige auf nächsten wert von data_items

	movl %eax, %ebx 		  # Erster wert ist vorerst der größte
	
start_loop:	                  	  # start loop
	cmpl $0, %eax             	  # check to see if we've hit the end
	je loop_exit

	movl (%ecx),%eax 		  # Siehe Oben
	addl $4, %ecx			  # 

	cmpl %ebx, %eax           	  # compare values
	jle start_loop            	  # jump to loop beginning if the new 
	                          	  # one isn't bigger
	movl %eax, %ebx           	  # move the value as the largest 
	jmp start_loop            	  # jump to loop beginning

loop_exit:
	movl %ebx, %eax			  # Move Biggest Value to %eax for returning

	movl %ebp, %esp			  # Epilog
	popl %ebp			  #
	ret				  #
