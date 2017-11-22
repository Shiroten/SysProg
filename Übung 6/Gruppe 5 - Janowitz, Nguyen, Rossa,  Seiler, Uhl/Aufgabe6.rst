==================
Gruppe 5 - Übung 6 
==================
Von: 	Ivo Janowitz, Nguyen Anh Quang, Tillman Rossa, Roman Seiler, Alexander Uhl

	|

1. Aufgabe 	
--------------------
	
	**ASCII Umwandlung**


		* Wie macht man aus einem Zahlenwert 0...9 das entsprechende ASCII Zeichen?

			Man addiert den ASCII Character für die Zahl '0' hinzu. Welches 0x30 oder 48 entspricht

		* Wie macht man im ASCII Code aus einem grossen Buchstaben einen kleinen Buchstaben?

			Durch die Addition von 'a'-'A' (0x61-0x41=0x20 entspricht 32 dezimal) wird aus einem großen Buchstabe ein kleiner.

	|

2. Aufgabe
-----------------------

	**Character/Line Count**

		* Schreiben Sie ein Programm in Assembler, das die Anzahl der Zeichen und die Anzahl der Zeilen in einer Textdatei bestimmt und auf den Bildschirm (stdout) schreibt. Der Name der Datei wird als Argument an das Programm übergeben.

		|

			**char_counter.s**

		 .. include:: character_count/char_counter.s
			:code:

		|	

			**line_counter.s**

		 .. include:: character_count/line_counter.s
			:code:

		|

			**character_counter.s**

		 .. include:: character_count/character_counter.s
			:code:


3. Aufgabe 
---------------------------------

	**Strukturdiagramm Read-Records**

		* Wie ist das Programm im Bartlett in Kapitel 6 strukturiert? Zeichnen Sie in einem Diagramm die Abhängigkeiten der einzelnen Dateien. Mit A ==> B kennzeichnen Sie, dass Datei B die Quelltextdatei A inkludiert. Mit A + B kennzeichnen Sie, dass die Objektdateien A und B miteinander gelinkt werden.

			**Todo Bild einfügen**

	|

4. Aufgabe
----------------------------

	**Going Further - Kapitel 6**


		* Schreiben Sie das Programm um, so dass Kommandozeilenargumente verwendet werden.

		 .. include:: records_cmd/dummy.txt
			:code:

	|

	
	**Error Catch**

		* Fangen Sie Fehler ab, die beim Öffnen der Dateien auftreten können. Welche Fehlercodes es gibt, finden Sie in der man page "man 2 open". Sie können einen Schreibschutzfehler hervorrufen, wenn Sie die Datei als normaler Anwender an einem nicht erlaubten Ort öffnen, z.B. mit dem Pfad "/meine-datei.txt".

		 .. include:: records_catch_error/dummy.txt
			:code:

	|

	**Records with lseek**

		* Schreiben Sie ein Programm mit dem Sie auswählen können, welcher Datensatz ausgegeben werden soll. Sie geben auf der Kommandozeile einfach die Nummer 0, 1, 2, ... an, dann wird der jeweilige Datensatz ausgegeben. Mit dem Systemaufruf lseek() können Sie schnell an eine beliebige Stelle in der Datei gehen. Der Funktionscode für lseek in Register eax ist 19. Siehe "man 2 lseek".


		 .. include:: records_lseek/dummy.txt
			:code:

        
