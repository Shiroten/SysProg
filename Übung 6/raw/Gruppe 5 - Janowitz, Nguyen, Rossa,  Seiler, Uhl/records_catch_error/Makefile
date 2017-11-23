all: write-records read-records add-year

write-records: write-records.o write-record.o 
	ld -m elf_i386 write-record.o write-records.o -o write-records

write-records.o: write-records.s 
	as --32 -g write-records.s -o write-records.o

write-record.o: write-record.s
	as --32 -g write-record.s -o write-record.o

read-records: read-record.o count-chars.o write-newline.o read-records.o 
	ld -m elf_i386 read-record.o count-chars.o write-newline.o read-records.o -o read-records

read-record.o: read-record.s
	as --32 -g read-record.s -o read-record.o

read-records.o: read-records.s
	as --32 -g read-records.s -o read-records.o

write-newline.o: write-newline.s
	as --32 -g write-newline.s -o write-newline.o

count-chars.o: count-chars.s
	as --32 -g count-chars.s -o count-chars.o

add-year: add-year.o read-records.o write-record.o error-exit.o count-chars.o write-newline.o
	ld -m elf_i386 add-year.o read-record.o write-record.o error-exit.o count-chars.o write-newline.o -o add-year

add-year.o: add-year.s
	as --32 -g add-year.s -o add-year.o
error-exit.o: error-exit.s
	as --32 -g error-exit.s -o error-exit.o

clean:
	rm -f *.o add-year write-records read-records *.lst *~
