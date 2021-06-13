all: test 
	./test && make -s clean -C "/home/ublu21/u11808206/abgabe/gesamt/"
	
test: test.o code.o heap.o
	gcc -o test test.o code.o heap.o

heap.o: heap.s
	gcc -c heap.s -o heap.o

test.o: test.c 
	gcc -c -o test.o test.c

code.o: code.s 
	gcc -c -o code.o code.s

code.s: test.txt codea
	(/home/ublu21/u11808206/abgabe/gesamt/gesamt < test.txt) > code.s

codea:
	make -C "/home/ublu21/u11808206/abgabe/gesamt/"

clean: 
	rm code.s code.o test.o test

test2: 
	gcc -c -o code.o code.s && gcc -c -o test.o test.c -Wint-conversion && gcc -c -o heap.o heap.s && gcc -o test test.o code.o heap.o -Wint-conversion && ./test