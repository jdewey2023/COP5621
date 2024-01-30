testdir=test
file=t1
test=$(testdir)/$(file)

default: lexer

lexer: lex.l
	flex lex.l
	gcc lex.yy.c -o lex

run: ./lex
	./lex < $(test)

clean:
	rm -rf lex.yy.c lex