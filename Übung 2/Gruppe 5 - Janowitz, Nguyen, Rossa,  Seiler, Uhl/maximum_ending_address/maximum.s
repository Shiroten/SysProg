# Finding a Maximum with ending adress, Bartlett PGU Chapter 3

    # ----- data section -----
    .section .data

data_items:
    .long   3, 67, 34, 12, 17, 0
data_items_end:

    # ----- text section -----
    .section .text
    .globl _start

_start:
    movl    $0, %edi
    movl    data_items(, %edi, 4), %eax
    lea     data_items_end, %edx
    movl    %eax, %ebx

start_loop:
    lea     data_items(, %edi, 4), %ecx
    cmpl    %ecx , data_items_end
    jge     loop_exit
    incl    %edi
    movl    data_items(, %edi, 4), %eax
    cmpl    %ebx, %eax
    jle     start_loop

    movl    %eax, %ebx
    jmp     start_loop

loop_exit:
    movl    $1, %eax
    int     $0x80


# vim: expandtab ts=4 sw=4
