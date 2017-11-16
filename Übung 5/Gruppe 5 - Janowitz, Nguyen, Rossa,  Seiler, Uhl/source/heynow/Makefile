
all: heynow 

maximum.o: heynow.s
	as --32 -al=heynow.lst -g -o heynow.o heynow.s

maximum: heynow.o
	ld -m elf_i386 -o heynow heynow.o
# Mit linker map:
#	ld -m elf_i386 -M -Map=heynow.map -o heynow heynow.o

clean:
	rm -f heynow.o heynow  *.lst *~
