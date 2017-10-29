
all: jump 


jump.o: jump.s
	
	as -al=jump.lst -g -o jump.o jump.s

jump: jump.o

	ld -o jump jump.o
# Mit linker map:
#	ld -M -Map=jump.map -o jump jump.o

clean:
	rm -f jump.o jump  *.lst *~

