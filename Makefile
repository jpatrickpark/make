nsh: main.l main.y parse.h parse.c
	bison -d main.y
	flex main.l
	gcc -g -Wno-implicit-function-declaration -Wno-int-conversion -o $@ main.tab.c lex.yy.c parse.c

run: nsh
	./nsh

memcheck: nsh
	valgrind --tool=memcheck --leak-check=yes ./nsh

.PHONY: clean
clean:
	rm -f parse ./nsh ./lex.yy.c ./main.tab.c ./main.tab.h 
