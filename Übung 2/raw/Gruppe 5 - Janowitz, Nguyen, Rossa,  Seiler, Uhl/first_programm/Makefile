
all: main 


main.o: main.s
	
	as -al=main.lst -g -o main.o main.s

main: main.o

	ld -o main main.o
# Mit linker map:
#	ld -M -Map=main.map -o main main.o

clean:
	rm -f main.o main  *.lst *~

count: main.s
	wc -l main.s
