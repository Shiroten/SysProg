==================
Gruppe 5 - Übung 5 
==================
Von: 	Ivo Janowitz, Nguyen Anh Quang, Tillman Rossa, Roman Seiler, Alexander Uhl


1. Timespow 	
------------
	
		**Aufgabe 1**


		* Schreiben Sie eine Lösung für den kurzen Test timespow.s aus der letzten 			  Veranstaltung. Der Code befindet sich im Git Repository sysprog

		 .. include:: source/timepow/timepow.s
			:code:


	|

2. Selbst Übung
---------------

		**Aufgabe 2**

		* Vollziehen Sie das im Kapitel 5 (Bartlett) beschriebene Programm mit dem Debugger gdb 		  nach

	|

3. ToUpper in anderen Sprachen
-------------------------------

		**Aufgabe 3**

		* Formulieren Sie das Programm aus Kapitel 5 in den Sprachen

	|

		**ToUpper in C**

			 .. include:: source/toupper/toupper.c
				:code:

		|

		**ToUpper in Java**	

			 .. include:: source/toupper/toupper.java
				:code:

		|

		**ToUpper in Python**

			 .. include:: source/toupper/toupper.py
				:code:

	|	


4. Aufgaben von Kapitel 5
--------------------------

		**Know the concepts**

			* Describe the lifecycle of a file descriptor.

				A file descriptor is created when we open a file until we close it.

			* What are the standard file descriptors and what are they used for?

				File Descriptor 0, 1 and 2 are the standard one.
				0 is the STDIN, 1 is the STDOUT and 2 is the STDERR
				Where STDIN represend the default keyboard, STDOUT the screen and STDERR 					is the standard error

			* What is a buffer?

				A Buffer is a place to store a big junk of data for example from the 
				read of a file

			* What is the difference between the .data section and the .bss section?

				The .data section is static and the .bss is dynamic for one example.
				Also the .data section stores the initialized data from the source code
				where the .bss holds temporary new data create in the runtime

			* What are the system calls related to reading and writing files?

				**Todo**

	|

			**Use the concepts**

			* Modify the toupper program so that it reads from STDIN and writes to STDOUT instead of using the files on the command-line.

				 .. include:: source/toupper/toupper_sdt/toupper.s
					:code:

	|

			**ToUpper Buffer Version**

			* Change the size of the buffer.

				 .. include:: source/toupper/toupper_buffer/toupper.s
					:code:

	|

			**ToUpper BSS Version**

			* Rewrite the program so that it uses storage in the .bss section rather than the stack to store the file descriptors.

				 .. include:: source/toupper/toupper_bss/toupper.s
					:code:

	|

			**HeyNow**

			* Write a program that will create a file called heynow.txt and write the words “Hey diddle diddle!” into it.
					
				 .. include:: source/heynow/heynow.s
					:code:

	
