default: lexer

lexer: lex.l
	flex lex.l
	gcc lex.yy.c -o lex