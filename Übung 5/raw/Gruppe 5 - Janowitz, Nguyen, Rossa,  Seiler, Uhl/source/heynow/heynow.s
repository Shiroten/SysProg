# -*- indent-tabs-mode: nil -*- (for Emacs)
    
# PURPOSE: 

        .section .data
        
        # File name and contents
file_name:
        .ascii "heynow.txt\0"
file_contents:
        .ascii "Hey diddle diddle!\0"

        #######CONSTANTS########
        # system call numbers
        .equ SYS_OPEN, 5
        .equ SYS_WRITE, 4
        .equ SYS_READ, 3
        .equ SYS_CLOSE, 6
        .equ SYS_EXIT, 1

        # options for open (look at
        # /usr/include/asm/fcntl.h for
        # various values. You can combine them
        # by adding them or ORing them)
        # This is discussed at greater length
        # in "Counting Like a Computer"
        .equ O_RDONLY, 0
        .equ O_CREAT_WRONLY_TRUNC, 03101

        # standard file descriptors
        .equ STDIN, 0
        .equ STDOUT, 1
        .equ STDERR, 2

        # system call interrupt
        .equ LINUX_SYSCALL, 0x80
        .equ END_OF_FILE, 0 #This is the return value

        # of read which means we've
        # hit the end of the file
        .equ NUMBER_ARGUMENTS, 2

        .section .bss

        # Buffer - this is where the data is loaded into
        # from the data file and written from
        # into the output file. This should
        # never exceed 16,000 for various
        # reasons.
        .equ BUFFER_SIZE, 500
        .lcomm BUFFER_DATA, BUFFER_SIZE

        .section .text

        # STACK POSITIONS
        .equ ST_SIZE_RESERVE, 8
        .equ ST_FD_OUT, -4
        .globl _start

_start:
        ### INITIALIZE PROGRAM ###
        # save the stack pointer        

        movl %esp, %ebp

        # Allocate space for our file descriptors
        # on the stack
        subl $ST_SIZE_RESERVE, %esp

open_files:
open_fd_out:
                                ### OPEN OUTPUT FILE ###
                                # open the file
        movl $SYS_OPEN, %eax
                                # output filename into %ebx
        movl $file_name, %ebx
                                # flags for writing to the file
        movl $O_CREAT_WRONLY_TRUNC, %ecx
                                # mode for new file (if it's created)
        movl $0666, %edx
                                # call Linux
        int $LINUX_SYSCALL

store_fd_out:
                                # store the file descriptor here
        movl %eax, ST_FD_OUT(%ebp)

get_length:
        # text to write
        movl $file_contents, %ebx
        # counter
        movl $0, %edi
        

length_loop:
        # get byte
        movb (%ebx,%edi,1), %cl
		
        # if zero byte, string is done
        cmpb $0, %cl
        je loop_end
        
        # increment
        incl %edi  
        jmp length_loop
        
loop_end:
        
        ### WRITE THE BLOCK OUT TO THE OUTPUT FILE ###
        movl %edi, %edx         # size of the buffer
        movl $SYS_WRITE, %eax
        movl ST_FD_OUT(%ebp), %ebx  # file to use
        movl $file_contents, %ecx     # location of the buffer
        int $LINUX_SYSCALL

close_files:
                                ###CLOSE THE FILES###
                                # NOTE - we don't need to do error checking
                                # on these, because error conditions
                                # don't signify anything special here
        movl $SYS_CLOSE, %eax
        movl ST_FD_OUT(%ebp), %ebx
        int $LINUX_SYSCALL
        
                                ### EXIT ###
        movl $SYS_EXIT, %eax
        movl $0, %ebx
        int $LINUX_SYSCALL

        
# vim: expandtab sw=8 sts=8
