==================
Gruppe 5 - Übung 4 
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

			 .. include:: source/toupper/dummy.s
				:code:

		|

		**ToUpper in Java**	

			 .. include:: source/toupper/dummy.s
				:code:

		|

		**ToUpper in Python**

			 .. include:: source/toupper/dummy.s
				:code:

	|	


4. Aufgaben von Kapitel 5
--------------------------

		**Know the concepts**

			* Describe the lifecycle of a file descriptor.

				**Todo**

			* What are the standard file descriptors and what are they used for?

				**Todo**

			* What is a buffer?

				**Todo**

			* What is the difference between the .data section and the .bss section?

				**Todo**

			* What are the system calls related to reading and writing files?

				**Todo**

	|

		**Use the concepts**


			* Modify the toupper program so that it reads from STDIN and writes to STDOUT instead of using the files on the command-line.

				 .. include:: source/toupper/toupper_sdt/toupper.s
					:code:

			* Change the size of the buffer.

				 .. include:: source/toupper/toupper_buffer/toupper.s
					:code:

			* Rewrite the program so that it uses storage in the .bss section rather than the stack to store the file descriptors.

				 .. include:: source/toupper/toupper_bss/toupper.s
					:code:

			* Write a program that will create a file called heynow.txt and write the words “Hey diddle diddle!” into it.
					
				 .. include:: source/heynow/heynow.s
					:code:

	
