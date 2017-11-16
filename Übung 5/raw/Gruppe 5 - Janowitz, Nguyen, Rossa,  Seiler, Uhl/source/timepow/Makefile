
all: timepow 

timepow.o: timepow.s
	as --32 -al=timepow.lst -g -o timepow.o timepow.s

timepow: timepow.o
	ld -m elf_i386 -o timepow timepow.o
# Mit linker map:
#	ld -m elf_i386 -M -Map=timepow.map -o timepow timepow.o

clean:
	rm -f timepow.o timepow  *.lst *~
