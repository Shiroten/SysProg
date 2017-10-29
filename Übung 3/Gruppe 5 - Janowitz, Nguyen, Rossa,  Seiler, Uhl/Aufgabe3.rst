==================
Gruppe 5 - Übung 3 
==================
Von: 	Ivo Janowitz, Nguyen Anh Quang, Tillman Rossa
	Roman Seiler, Alexander Uhl


1. Diverses	
-------------
	
	1.1 
		|

	1.2 Was bedeuten die folgenden Pseudo-Anweisungen?
	
		- .data

		 Data Section:
		 Fest kodierte Werte
		 
		- .bss 

		 Buffer Section:
		 Platz für temporäre Daten, zB. Datei einlesen

		- .text

		 Text Section:
		 Enthält Programm Code

		- .byte

		 Ein Byte, 0-255

		- .hword

		 Insert the 16-bit half-word

		- .long

		 4 Byte, 0-4294967295

		- .int

		 4 Byte, 0-65535 

		- .ascii

		 Speichern von Text, jeder Charakter wird mit seinem Char-Code gespeichert.
		 Nullbyte muss angegeben werden um Ende von einem String zu signalisieren.
		 Mehere String, durch Komma getrennt, werden direkt aneinander gespeichert.

		- .asciz

		 Wie .ascii, aber Strings bekommen das Nullbyte automatisch angehängt, bevor
		 sie gespeichert werden.

		- .lcomm

		 Erstellt einen Buffer mit einer festen Größe

	|


	1.3 Was bedeutet die folgende Zeile?

		* .global _start, demofunc ?
	

		  Export vom Symbolen, werden vom Linker nicht "weggeworfen".
		  Erlaubt Zugriff auf Code Teile per Name statt Adresse.

	|

	1.4 Übersetzen Sie die folgende Anweisung in Maschinencode:

		* Maschinencode für 'str1: .asciz "SYSPROG"

		  | 53 59 53 50 >> SYSP
		  | 52 4F 47 00 >> ROG\_ (Nullbyte am Ende vom String)

	|

	1.6

		* Todo
	|	

	1.7

		* Todo
	|

	1.8 Entfernen Sie das _start Label bei einem Programm und untersuchen Sie, was dann beim Assemblieren passiert. Verändern Sie in 		    einem zweiten Schritt den Namen dieses Labels.
	

		- kein _start Label & umbenanntes Label:

		  ld: warning: cannot find entry symbol _start; defaulting to 00000000004000b0

		  Linker kann den einstiegs Punkt vom Assembler nicht finden und weiß so nicht wo das Programm anfängt.
		  Dies passiert wenn das Label _start vergessen wird oder falsch benannt ist.




	* 
	
	#.. include:: pfad
	#	:code:



		
        
