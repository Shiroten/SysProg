==================
Gruppe 5 - Übung 3 
==================
Von: 	Ivo Janowitz, Nguyen Anh Quang, Tillman Rossa
	Roman Seiler, Alexander Uhl


1. Diverses	
-------------
	
	**1.1** Zeichnen Sie alle Register der x86 CPU in ein Diagramm. Wie ist der Name für die 8-, 16- und 32-Bit Register?
		
	|

		+----------+--------------------------+----------------------+-------------------+-------------------+
		| Register | General                                                                                 |
		+----------+--------------------------+----------------------+-------------------+-------------------+
		|          | Accumulator              | Counter              | Data              | Base              |
		+----------+--------------------------+----------------------+-------------------+-------------------+
		| 32       | EAX                      | EBX                  | ECX               | EDX               |
		+----------+----------------+---------+------------+---------+---------+---------+---------+---------+
		| 16       |                | AX      |            | BX      |         | CX      |         | DX      |
		+----------+----------------+----+----+------------+----+----+---------+----+----+---------+----+----+
		| 8        |                | AH | AL |            | BH | BL |         | CH | CL |         | DH | DL |
		+----------+----------------+----+----+------------+----+----+---------+----+----+---------+----+----+		

		|

		+----------+-----------------------+--------------------------------------------------------------+-------------------+
		| Register | Segment               | Indexes                                                      |                   |
		+----------+-----------------------+----------------------+-------------------+-------------------+-------------------+
		|          |                       | Stack Pointer        | Stack Base Pointer| Source            |Destination        |
		+----------+-----------------------+----------------------+-------------------+-------------------+-------------------+
		| 32       |                       | RSP                  | RBP               | RSI               | RDI               |
		+----------+---+---+---+---+---+---+-----------+----------+---------+---------+---------+---------+---------+---------+
		| 16       | C | D | E | F | G | S |           | ESP      |         | EBP     |         | ESI     |         | EDI     |
		|          | S | S | S | S | S | S |           |          |         |         |         |         |         |         |
		+----------+---+---+---+---+---+---+-----------+----------+---------+---------+---------+---------+---------+---------+
		| 8        |                       |           | SP       |         | BP      |         | SI      |         | DI      |
		+----------+-----------------------+-----------+----------+---------+---------+---------+---------+---------+---------+	

	|

		| EFLAGS:
		| Bit   Label    Desciption
		| ---------------------------
		| 0      CF      Carry flag
		| 2      PF      Parity flag
		| 4      AF      Auxiliary carry flag
		| 6      ZF      Zero flag
		| 7      SF      Sign flag
		| 8      TF      Trap flag
		| 9      IF      Interrupt enable flag
		| 10     DF      Direction flag
		| 11     OF      Overflow flag
		| 12-13  IOPL    I/O Priviledge level
		| 14     NT      Nested task flag
		| 16     RF      Resume flag
		| 17     VM      Virtual 8086 mode flag
		| 18     AC      Alignment check flag (486+)
		| 19     VIF     Virutal interrupt flag
		| 20     VIP     Virtual interrupt pending flag
		| 21     ID      ID flag

	|

	**1.2** Was bedeuten die folgenden Pseudo-Anweisungen?
	
		- .data

		 Data Section:
		 Bereich der Initierten Variablen zur späteren Benutzung und Manipulation 
		 
		- .bss 

		 Buffer Section:
		 Platz für temporäre Daten, zB. Datei einlesen

		- .text

		 Text Section:
		 Enthält den Programm Code

		- .byte

		 Benutzt eine "storage location" (Ein Byte),Werte zwischen 0-255

		- .hword

		 Fügt Daten als halbes Wort (jeweils 2 Bytes) in zwei "storage locations"

		- .long

		 Fügt Daten als ganzes Wort (4 Byte) in vier "storage locations", Werte zwischen 0-4294967295

		- .int

		 Fügt Daten der größe 2 Byte (zwei "storage locations), Wertebereich: 0-65535 

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


	**1.3** Was bedeutet die folgende Zeile?

		* .global _start, demofunc ?
	

		  Export vom Symbolen, werden vom Linker nicht "weggeworfen".
		  Erlaubt Zugriff auf Code Teile per Name statt Adresse.

	|

	**1.4** Übersetzen Sie die folgende Anweisung in Maschinencode:

		* Maschinencode für 'str1: .asciz "SYSPROG"

		  | 53 59 53 50 >> SYSP
		  | 52 4F 47 00 >> ROG\_ (Nullbyte am Ende vom String)

	|

	**-----------Todo-----------**

	**1.6** Adressierungsarten üben:

		* Denken Sie die Beispiele in 01-addr-modes/ durch so dass Sie wissen, was bei jedem Befehl passiert.

		  **-----------Todo-----------**

		* Wie lang sind die einzelnen Befehle?
		
		  **-----------Todo-----------**

		* Ist "movl %eax, %ebx" ein gültiger Befehl?

		  "movl %eax, %ebx" ist ein gültiger Befehel. Es wird der Inhalt von Register %eax nach %ebx geschrieben.

		* Ist "movl (%eax), (%ebx)" ein gültiger Befehl?

		  Ebenfall gültig. Diesmal wird was an der Adresse von %eax steht an der effektiven Stelle von %ebx geschrieben.

	|
		

	**1.7** Bedingte Sprünge


		 .. include:: jump/jump.s
			:code:

	|

	**1.8** Entfernen Sie das _start Label bei einem Programm und untersuchen Sie, was dann beim Assemblieren passiert. Verändern Sie in 		    einem zweiten Schritt den Namen dieses Labels.
	

		- kein _start Label & umbenanntes Label:

		  ld: warning: cannot find entry symbol _start; defaulting to 00000000004000b0

		  Linker kann den einstiegs Punkt vom Assembler nicht finden und weiß so nicht wo das Programm anfängt.
		  Dies passiert wenn das Label _start vergessen wird oder falsch benannt ist.
	




		
        
