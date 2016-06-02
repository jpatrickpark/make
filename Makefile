out: main.c
	gcc -g -o $@ main.c

run: out
	./out

memcheck: out
	valgrind --tool=memcheck --leak-check=yes ./out

.PHONY: clean
clean:
	rm -f out
