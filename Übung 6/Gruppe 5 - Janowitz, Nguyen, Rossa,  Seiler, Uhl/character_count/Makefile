all: main

main: character_counter.o char_counter.o line_counter.o print.o count-chars.o
	ld -m elf_i386 character_counter.o char_counter.o line_counter.o print.o count-chars.o -o character_counter

character_counter.o: character_counter.s
	as --32 -g character_counter.s -o character_counter.o

char_counter.o: char_counter.s
	as --32 -g char_counter.s -o char_counter.o

line_counter.o: line_counter.s
	as --32 -g line_counter.s -o line_counter.o

print.o: print.s
	as --32 -g print.s -o print.o

count-chars.o: count-chars.s
	as --32 -g count-chars.s -o count-chars.o

clean:
	rm -f *.o character_counter  *.lst *~

