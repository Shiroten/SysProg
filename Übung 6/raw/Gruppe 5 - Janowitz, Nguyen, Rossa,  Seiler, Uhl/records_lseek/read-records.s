
    .include "linux.s"
    .include "record-def.s"

    .section .data
    
    .equ SYS_LSEEK, 19
    .equ SEEK_SET, 0
        
        
file_name:
    .ascii "test.dat\0"
    
    
    .section .bss
    .lcomm record_buffer, RECORD_SIZE
    .lcomm index_buffer, 4

    .section .text
    #Main program
    .globl _start
_start:
    #These are the locations on the stack where
    #we will store the input and output descriptors
    #(FYI - we could have used memory addresses in
    #a .data section instead)
    .equ ST_INPUT_DESCRIPTOR, -4
    .equ ST_OUTPUT_DESCRIPTOR, -8
    .equ ST_READER_DESCRIPTOR, -12
    #Copy the stack pointer to %ebp
    movl %esp, %ebp
    #Allocate space to hold the file descriptors
    subl $12, %esp
    #Open the file
    movl $SYS_OPEN, %eax
    movl $file_name, %ebx
    movl $0, %ecx #This says to open read-only

    movl $0666, %edx
    int $LINUX_SYSCALL
    #Save file descriptor
    movl %eax, ST_INPUT_DESCRIPTOR(%ebp)
    
    #Even though it's a constant, we are
    #saving the output file descriptor in
    #a local variable so that if we later
    #decide that it isn't always going to
    #be STDOUT, we can change it easily.
    movl $STDOUT, ST_OUTPUT_DESCRIPTOR(%ebp)
    #STDIN is the source for getting the index
    movl $STDIN, ST_READER_DESCRIPTOR(%ebp)
    
    
read_index_loop:
    movl $SYS_READ, %eax
    movl ST_READER_DESCRIPTOR(%ebp), %ebx
    movl $index_buffer, %ecx    # the location to read into
    movl $4, %edx               # the size of the buffer
    int $LINUX_SYSCALL          # Size of buffer read is returned in %eax
    cmpl $0, %eax               # check if end of file
    je finished_reading

    # offset
    movl $0, %eax
    movb index_buffer, %al  # get index byte and save to eax
    subl $49,%eax    # value of '0' = 48, correct zero-based index = +1
    imull $RECORD_SIZE, %eax
    movl %eax, %ecx


    # lseek
    movl $SYS_LSEEK, %eax
    movl ST_INPUT_DESCRIPTOR(%ebp), %ebx
    movl $SEEK_SET, %edx
    int $LINUX_SYSCALL 
    
    
    
record_read_loop:
    pushl ST_INPUT_DESCRIPTOR(%ebp)
    pushl $record_buffer
    call read_record
    addl $8, %esp
    #Returns the number of bytes read.
    #If it isn't the same number we
    #requested, then it's either an
    #end-of-file, or an error, so we're
    #quitting
    cmpl $RECORD_SIZE, %eax
    jne finished_reading
    #Otherwise, print out the first name
    #but first, we must know it's size
    pushl $RECORD_FIRSTNAME + record_buffer
    call count_chars
    addl $4, %esp

    movl %eax, %edx
    movl ST_OUTPUT_DESCRIPTOR(%ebp), %ebx
    movl $SYS_WRITE, %eax
    movl $RECORD_FIRSTNAME + record_buffer, %ecx
    int $LINUX_SYSCALL
    pushl ST_OUTPUT_DESCRIPTOR(%ebp)
    call write_newline
    addl $4, %esp
    jmp read_index_loop
    
    
finished_reading:
    movl $SYS_EXIT, %eax
    movl $0, %ebx
    int $LINUX_SYSCALL        

# vim: expandtab ts=4 sw=4
