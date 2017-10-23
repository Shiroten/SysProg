==================
Gruppe 5 - Übung 2 
==================
Von: 	Ivo Janowitz, Nguyen Anh Quang, Tillman Rossa
	Roman Seiler, Alexander Uhl


1.
	* Verändern Sie den Rückgabewert im Programm und starten Sie es erneut. Ist der Rückgabewert nun 		  anders?

		Ja, den der Rückgabwert wird direkt ins Register %ebx geschrieben und dann beim Systemcall 			übergeben worden

	* Fügen Sie ein neues Target zu Ihrem Makefile das die Anzahl der Zeilen in main.s zählt. Verwenden 	  Sie dazu das Werkzeug wc (word count) so: wc -l main.s. 

**Todo**
		.. include:: first_programm/main.s
			:code:

	* Was muss man am Anfang der Zeile eines Makefile-Targets beachten?

**Todo**

	|

2.	
		**Know the Concepts**

	* What does if mean if a line in the program starts with the ’#’ character?

		The line is a comment and won’t be compiled

	* What is the difference between an assembly language file and an object code file?
	
		The assembly file contains human readable code, whereas the object file contains machine 			readable code

	* What does the linker do?

		The linker combines object files that have dependencies to one another

	* How do you check the result status code of the last program you ran?

		With the shell command "Echo $?"

	* What is the difference between movl $1, %eax and movl 1, %eax ?

		Movl $1 %eax moves the value one into the %eax register, 
  		movl 1 %eax moves the content at the address   one into %eax

	* Which register holds the system call number?

		The %eax register

	* What are indexes used for?

		An index is used to access data in an array

	* Why do indexes usually start at 0?

		The index is zero because address_of_array + index retrieves the first item of the array

	* If I issued the command movl data_items(,%edi,4), %eax and data_items was address
  	  3634 and %edi held the value 13, what address would you be using to move into %eax ?

		3643 + 4 * 13 = 3695		

	* List the general-purpose registers.

		Eax, ebx, ecx, edx, edi, esi

	* What is the difference between movl and movb ?

		Movl moves a whole word, movb only moves a byte

	* What is flow control?

		Flow control are structures that decide the path the program takes, e.g. if-construct

	* What does a conditional jump do?

		A conditional jump only jumps to the specified routine if the comparison of two values holds true

	* What things do you have to plan for when writing a program?

		You have to plan the registers to use, the algorithm and the amount of storage needed.

	* Go through every instruction and list what addressing mode is being used for each operand.

		Address modes:

        	* Movl $1 %eax: Immediate mode
        	* Movl $0 %ebx: Immediate mode
        	* movl $0, %edi: Immediate mode
        	* movl data_items(,%edi,4), %eax: indexed addressing mode
        	* movl %eax, %ebx: indirect addressing mode

	|

		**Use the Concepts**

	* Modify the first program to return the value 3.
	
	.. include:: first_programm/main.s
		:code:

	|

	* Modify the maximum program to find the minimum instead.

	.. include:: minimum/minimum.s
		:code: 
	
	|

	* Modify the maximum program to use the number 255 to end the list rather than the number 0

	.. include:: maximum_255/maximum.s
		:code: 

	|

	* Modify the maximum program to use an ending address rather than the number 0 to know when
	  to stop.

**Todo**
	.. include:: maximum_ending_address/maximum.s
		:code: 

	|

	* Modify the maximum program to use a length count rather than the number 0 to know when to
	  stop.

	.. include:: maximum_length_count/maximum.s
		:code: 

	|
		
	* What would the instruction movl _start, %eax do? Be specific, based on your knowledge
	  of both addressing modes and the meaning of _start . How would this differ from the
	  instruction movl $_start, %eax ?
		    
		Movl _start, %eax would move the address of the first instruction into the eax register, 			movl $_start, %eax would move the string ‘_start’ into eax

	|

3.      
		**Going Further**

	* Modify the first program to leave off the int instruction line. Assemble, link, and execute the
	  new program. What error message do you get. Why do you think this might be?

		    Error message: Speicherzugriffsfehler, ‚echo $?‘ shows 136. Probably because the system 			recognises changes in the registers, but without a signal what to do with them, marks them 				as an error

	* So far, we have discussed three approaches to finding the end of the list - using a special
	  number, using the ending address, and using the length count. Which approach do you think is
	  best? Why? Which approach would you use if you knew that the list was sorted? Why?

		    Length count is probably best, since sometimes all values are needed (no value free as 				marker) and the ending address is not always known. Same reasoning if the list was sorted.

	|
        
