all:
	ox parser.y scanner.l
	flex oxout.l
	yacc -d -v oxout.y
	
	gcc -c lex.yy.c  
	gcc -c y.tab.c	

	gcc -g -c -pedantic -Wall list.c
	gcc -g -c -pedantic -Wall implemented_meth_list.c
	gcc -g -c -pedantic -Wall tree.c
	gcc -g -c -pedantic -Wall code_generator.c

	bfe < codegen.bfe | iburg > codegen.c
	gcc -g -c -pedantic -Wall codegen.c
	gcc -g list.o tree.o codegen.o implemented_meth_list.o code_generator.o y.tab.o lex.yy.o -ll -o codeb
	                                                                                                                                                                                             
clean:    
	rm -f codea codegen.c *.o oxout.* lex.yy.c y.tab.* y.output parser
	