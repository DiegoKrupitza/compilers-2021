all:
	flex scanner.l
	gcc lex.yy.c -lfl -o scanner

clean:
	rm -rf ./lex.yy.c
	rm -rf ./scanner