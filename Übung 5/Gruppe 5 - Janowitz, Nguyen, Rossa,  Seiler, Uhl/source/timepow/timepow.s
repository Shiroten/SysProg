# Systemnahe Programmierung - Testen Sie Ihre Kenntnisse!
# H. Hoegl, 2012-11-08 

#   timespow(3, 2) + timespow(2, 3)

    .section .data
    .section .text
    .globl _start

_start:
    pushl $1        # b
    pushl $7        # x
    call  timespow2
    addl  $8, %esp  
    pushl %eax      
    pushl $0        # b    
    pushl $2        # x
    call  timespow2
    addl  $8, %esp  
    popl  %ebx      
    addl %eax, %ebx 
    movl $1, %eax   
    int $0x80


# timespow2(x, b)
#   return x * 2^b
#   Trick: x * 2^b = shift argument x left by b bits 
#                    shll %cl, %ebx  (shift ebx left by cl bits)
.type timespow2, @function
timespow2:
    pushl %ebp		  # 1 Prolog
    movl %esp, %ebp	  # 2 Prolog
    movl 12(%ebp), %ebx	  # 3 Argument holen 
    movb 8(%ebp), %cl	  # 4 Argument holen
    shll %cl, %ebx	  # 5 Schieben
    movl %ebx, %eax	  # 6 Ergebnis ablegen
    movl %ebp, %esp	  # 7 Epilog
    popl %ebp		  # 8 Epilog
    ret			  # 9 Zurueckkehren

