
all: maximum 

maximum.o: maximum.s
	as -al=maximum.lst -g -o maximum.o maximum.s

maximum: maximum.o
	ld -o maximum maximum.o
# Mit linker map:
#	ld -M -Map=maximum.map -o maximum maximum.o

clean:
	rm -f maximum.o maximum  *.lst *~
