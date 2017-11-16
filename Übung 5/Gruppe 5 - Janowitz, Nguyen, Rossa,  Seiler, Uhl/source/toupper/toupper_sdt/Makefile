
all: toupper 

toupper.o: toupper.s
	as --32 -al=toupper.lst -g -o toupper.o toupper.s

toupper: toupper.o
	ld -m elf_i386 -o toupper toupper.o
# Mit linker map:
#	ld -m elf_i386 -M -Map=toupper.map -o toupper toupper.o

clean:
	rm -f toupper.o toupper  *.lst *~
