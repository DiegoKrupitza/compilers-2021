all:
	ox parser.y scanner.l
	flex oxout.l
	yacc -d -v oxout.y
	
	gcc -c lex.yy.c  
	gcc -c y.tab.c	

	gcc -g -c -pedantic -Wall list.c
	gcc -g -c -pedantic -Wall tree.c
	gcc -g -c -pedantic -Wall code_generator.c

	gcc -g list.o tree.o y.tab.o lex.yy.o -ly -ll -o ag
                                                                                                                                                                                                                 
clean:    
	rm -f ag *.o oxout.* lex.yy.c y.tab.* y.output parser