�bungsblatt 3
===================

1.2 
---
- .data

 Data Section:
 Fest kodierte Werte
 
- .bss 

 Buffer Section:
 Platz f�r tempor�re Daten, zB. Datei einlesen

- .text

 Text Section:
 Enth�lt Programm Code

- .byte

 Ein Byte, 0-255

- .hword

 ???

- .long

 4 Byte, 0-4294967295

- .int

 4 Byte, 0-65535 

- .ascii

 Speichern von Text, jeder Charakter wird mit seinem Char-Code gespeichert.
 Nullbyte muss angegeben werden um Ende von einem String zu signalisieren.
 Mehere String, durch Komma getrennt, werden direkt aneinander gespeichert.

- .asciz

 Wie .ascii, aber Strings bekommen das Nullbyte automatisch angeh�ngt, bevor
 sie gespeichert werden.

- .lcomm

 Erstellt einen Buffer mit einer festen Gr��e



1.3 .global _start, demofunc ?
-----------------------------------

Export vom Symbolen, werden vom Linker nicht "weggeworfen".
Erlaubt Zugriff auf Code Teile per Name statt Adresse.

1.4 Maschinencode f�r 'str1: .asciz "SYSPROG"
--------------------------------------------------

| 53 59 53 50 >> SYSP
| 52 4F 47 00 >> ROG\_ (Nullbyte am Ende vom String)


1.8 _start Label
----------------

- kein _start Label & umbenanntes Label:

  ld: warning: cannot find entry symbol _start; defaulting to 00000000004000b0

Linker nimmt die Adresse nach der Data Sektion (nicht sicher)
