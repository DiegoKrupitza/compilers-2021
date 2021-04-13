all:
	flex scanner.l && yacc -d -v parser.y && gcc lex.yy.c y.tab.c -o parser -lfl
clean:
	rm -f *.h *.c *.output parser
