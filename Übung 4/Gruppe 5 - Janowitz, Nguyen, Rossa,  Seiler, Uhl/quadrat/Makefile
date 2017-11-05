
all: quadrat 

quadrat.o: quadrat.s
	as --32 -al=quadrat.lst -g -o quadrat.o quadrat.s

quadrat: quadrat.o
#	ld -m elf_i386 -o quadrat quadrat.o
# Mit linker map:
	ld -m elf_i386 -M -Map=quadrat.map -o quadrat quadrat.o

clean:
	rm -f quadrat.o quadrat  *.lst *~
