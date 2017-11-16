# Systemnahe Programmierung - Testen Sie Ihre Kenntnisse!
# H. Hoegl, 2012-11-08 

#   timespow(3, 2) + timespow(2, 3)

    .section .data
    .section .text
    .globl _start

_start:
    pushl $2        # b
    pushl $3        # x
    call  timespow2
    addl  $8, %esp  
    pushl %eax      
    pushl $3        # b    
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
    _____________________ # 1 Prolog
    _____________________ # 2 Prolog
    _____________________ # 3 Argument holen 
    _____________________ # 4 Argument holen
    _____________________ # 5 Schieben
    _____________________ # 6 Ergebnis ablegen
    _____________________ # 7 Epilog
    _____________________ # 8 Epilog
    _____________________ # 9 Zurueckkehren

