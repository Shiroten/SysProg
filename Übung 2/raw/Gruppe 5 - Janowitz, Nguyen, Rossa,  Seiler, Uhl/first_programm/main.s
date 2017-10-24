# Bartlett, chapter 3

.section .data
.section .text

.globl _start

_start:
    movl $1, %eax    # Nr. des Systemaufruf
    movl $3, %ebx   # Exit Code
    int $0x80        # Systemaufruf

# vim: expandtab ts=4 sw=4
