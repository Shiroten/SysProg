# Finding a Maximum, Bartlett PGU Chapter 3

    # ----- data section -----
    .section .data

data_items:
    .long   3, 67, 34, 12, 17, 0

    # ----- text section -----
    .section .text
    .globl _start

_start:
    movl    $0, %edi
    movl    data_items(, %edi, 4), %eax
    movl    %eax, %ebx

start_loop:
    cmpl    $0, %eax
    je      loop_exit
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
