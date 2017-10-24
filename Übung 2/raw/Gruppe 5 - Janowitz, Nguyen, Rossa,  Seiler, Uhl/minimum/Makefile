
all: minimum 

minimum.o: minimum.s
	as --32 -al=minimum.lst -g -o minimum.o minimum.s

minimum: minimum.o
	ld -m elf_i386 -o minimum minimum.o
# Mit linker map:
#	ld -m elf_i386 -M -Map=minimum.map -o minimum minimum.o

clean:
	rm -f minimum.o minimum  *.lst *~
