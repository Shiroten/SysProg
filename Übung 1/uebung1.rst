==================
Gruppe 5 - Übung 1
==================

1.
        Finden Sie heraus, welche genaue Bezeichnung die CPU in Ihrem Rechner
        (bzw. in der Virtuellen Maschine) hat. Arbeitet Ihr Rechner im 32- oder im 64-Bit Modus?        


        * Durch den Aufruf von cat /proc/cpuinfo finden wir heraus das zb ein:
          Intel(R) Core(TM) i5 CPU U470  @1.33GHz verbaut worden ist. Dieser
          läuft in 64 Bit Modus.

2.
        Worin unterscheiden sich Programmiersprachen die sich zur maschinennahen
        (= systemnahen) Programmierung eignen von Sprachen, die man "high-level" Sprachen nennt?
       

        * Systemnahe Sprachen erlauben den direkten Zugriff auf Systemkomponenten
          damit sind sie meist schneller, müssen aber auch sämtliche Belange
          wie Speicherverwaltung oder ähnliches selber erledigen.
        
        Nennen Sie jeweils zwei Sprachen aus jeder Gattung.

        * Systemnah: Assembler, C, Go, Rust
          HighLevel: Java, Python, 

        Welche Programmiersprachen kennen Sie schon ein wenig?

        * Java, C

3.      

        Welche Anwendungsbereiche für systemnahe Programmierung kennen Sie?

        * Treiber und andere Performance Relevante Programme (zb. Spiele)

4.
        **Know the Concepts**

        Describe the fetch-execute cycle.

        * The CPU goes to the programm counter and gets the command from the location it points.
          It executes it and put the programm counter to the next target.

        What is a register? How would computation be more difficult without registers?

        * A register holds temporary the data of the operation to get quick access to it.
          Without registers you would need to put every cached data to the system memory.

        How do you represent numbers larger than 255?

        * By using two bytes we can represent a number up to 2 to the power of 16

        How big are the registers on the machines we will be using?

        * They are four bytes long

        How does a computer know how to interpret a given byte or set of bytes of memory?

        * We need to tell it what the numbers stands for because the compter cant know the
          difference between data or instructions.

        What are the addressing modes and what are they used for?

        * - immediate
          - register
          - direct
          - indirect
          - indexed
          - base pointer addressing mode

          They are used to interact with the data in the memory.

        What does the instruction pointer do?

        * With the instruction pointer the computer knows which bytes belongs to a an instruction
          and which belongs to data. Its it only way of knowing. 

        **Use the Concepts**

        What data would you use in an employee record? How would you lay it out in memory?

        * - Employee id, name, birthdate, department     
           
          - One way: all data for one employee in consecutive words
        
          -  all ids etc in consecutive words

        If I had the pointer the the beginning of the employee record above, and wanted to access a
        particular piece of data inside of it, what addressing mode would I use?

        * base point addressing mode

        In base pointer addressing mode, if you have a register holding the value 3122, and an offset of
        20, what address would you be trying to access?

        * 3122 + 20 = 3142

        In indexed addressing mode, if the base address is 6512, the index register has a 5, and the
        multiplier is 4, what address would you be trying to access?

        * 6512 + 5 x 4 = 6532

        In indexed addressing mode, if the base address is 123472, the index register has a 0, and the
        multiplier is 4, what address would you be trying to access?

        * 123472 + 0 x 4 = 123476

        In indexed addressing mode, if the base address is 9123478, the index register has a 20, and the
        multiplier is 1, what address would you be trying to access?

        * 9123478 + 20 x 1 = 9123498



        **Going Further**

        What are the minimum number of addressing modes needed for computation?
        
        * 2: immediate and indirect addressing mode should cover most uses.

        Why include addressing modes that aren’t strictly needed?

        * They could be handy for different kinds of programms which uses other algorithem to
          be faster or easier to implement.

        Research and then describe how pipelining (or one of the other complicating factors) affects
        the fetch-execute cycle.

        * With pipelining it wouldnt execute the code in a linear order
          instead it would try to optimize the workload be trying to change the
          sequence to optimize the performance of the CPU by using the different kinds
          of ALUs better for example. 

        Research and then describe the tradeoffs between fixed-length instructions and variable-length
        instructions.

        * With fixed length instruction it is easier to fetch the information of the the instruction
          because we know exactly which bit must be where.

          With variable length instruction we get greater code density which would reduce static code size.

          There are many more tradeoffs like performance, bandwith usage, energy comsumtions....
