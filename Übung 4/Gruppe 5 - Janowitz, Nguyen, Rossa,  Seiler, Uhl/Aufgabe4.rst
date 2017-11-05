==================
Gruppe 5 - Übung 4 
==================
Von: 	Ivo Janowitz, Nguyen Anh Quang, Tillman Rossa, Roman Seiler, Alexander Uhl


1. Aufgabe 1 	
------------
	
	**Stack**


		* Wozu braucht man einen Stack? 

			Der Stack wird benötigt, um nach dem Ausführen von Unterprogrammen wieder zum 				Aufrufer zurückzukehren. Außerdem werden dort die Parameter eines 				Funktionsaufrufs abgelegt. 

		* Über welche Befehle spricht man den Stack an?
			
			Die Befehle sind pushl (einen Wert auf den Stack legen) und popl (den obersten 				Wert vom Stack holen und löschen). Movl %esp [Zielregister] liest einen Wert vom 				Stack ohne ihn zu löschen.
	

2. Aufgabe 2
------------

	**Funktionen**

		* Beschreiben Sie, was an den Stellen (1) bis (7) gemacht wird.

			.. code::

				...`
				pushl $2		# Push 2 auf den Stack
				pushl $4		# Push 4 auf den Stack
				call tuwas		# Rufe Funktion tuwas auf
				addl $8, %esp		# Setze den Stackpointer wieder zurück
				...
				tuwas:
				pushl %ebp		# Zuerst werden die Werte 2 und 4 auf den Stack 
							  geschoben
				movl %esp, %ebp		# Überschreiben des Basepointers mit dem
 						          Stackpointer
				subl $8, %esp		# Der Stackpointer wird um zwei Register nach
 							  unten bewegt um Platz für lokale Variablen zu
 							  reservieren
				...
				movl %ebp, %esp		# Der Stackpointer wird mit dem Basepointer
 							  überschrieben
				popl %ebp		# Der alte Basepointer wird wiederhergestellt,
 							  indem der zuvor gesicherte BP in den aktuellen
 							  geschrieben wird
				ret			# Vom Stack wird gepopt und in den eip
							  geschrieben. Damit wird die Rücksprungsadresse
 							  in den Instructionpointer geschrieben

		* Zeichnen Sie den Stack direkt nach der Ausführung von Zeile 5.
		  Zeichnen Sie auch Framepointer und Stackpointer ein.

			.. code::

				2
				4
				R.A.
				old %ebp	  <---- %ebp
				local varible 1
				local varible 2   <---- %esp

		* Wie greift man innerhalb der Funktion tuwas() auf die lokalen Daten zu?
		  Nehmen Sie an, dass die 8 Byte aus zwei Integer Werten bestehen.
		  Schreiben Sie die Framepointer-relative Adressierung für den Integer
		  mit der kleineren Adresse hin.

		        .. code::

                               movl 12(%ebp), %eax      # Zugriff auf 2
                               movl  8(%ebp), %ebx      # Zugriff auf 4


3. Funktionen
-------------

	**C Aufrufkonvention**

		* In welcher Reihenfolge werden die Argumente der Funktion cfun(int a,
		  int b, int c) auf dem Stack abgelegt?Wie wird der Rückgabewert einer Funktion an den 			  Aufrufer übergeben?

			Die Reihenfolge ist umgedreht. Bei der Funktion foo(a, b, c) liegen im Speicher von oben nach unten c, b, a

		* Unterscheiden Sie: (a) der Wert ist 32-Bit gross, (b) der Wert ist grösser
		  als 32-Bit.

			Bei a: Wert wird in eax geschrieben. 

			Bei b: Pointer wird in eax geschrieben

		* Wer kümmert sich um die Sicherung der Register -- der Aufrufer oder
		  der Aufgerufene?

			Der Aufrufer muss sich um die Sicherung kümmern, da der Aufgerufene alle Register überschreiben / löschen kann

		* Wer korrigiert den Stack, der Aufrufer oder der Aufgerufene?

			Annahme: Unter Korrektur des Stacks ist das Zurücksetzen des Stackpointers (esp) gemeint. Dafür ist wieder der Aufrufer zuständig

5. Use the Concepts
-------------------

	**Quadrat**

		* Schreiben Sie eine Funktion quadrat(x) , die aus dem Argument x das
		  Quadrat x * x berechnet. Rufen Sie diese Funktion zum Test auch ein
		  paar Mal mit unterschiedlichem Argument auf.

		 .. include:: quadrat/quadrat.s
			:code:

	**Maximum**

		* Schreiben Sie die Maximumsuche aus dem Kapitel 3 nun als Funktion
		  maximum(ptr) . Der Zeiger ptr zeigt auf eine Liste von Elementen, deren
		  grösster Wert zurückgegeben wird. Rufen Sie diese Funktion zum Test
		  ein paar Mal mit unterschiedlichen Listen auf.


		 .. include:: maximum/maximum.s
			:code:
		
        
