
all: maximum 

maximum.o: maximum.s
	as --32 -al=maximum.lst -g -o maximum.o maximum.s

maximum: maximum.o
	ld -m elf_i386 -o maximum maximum.o
# Mit linker map:
#	ld -m elf_i386 -M -Map=maximum.map -o maximum maximum.o

clean:
	rm -f maximum.o maximum  *.lst *~
