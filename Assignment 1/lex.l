%{
	#include <stdio.h>
%}

%option noyywrap

BCONST	"true"|"false"
BOP		"and"|"or"|"not"
COMP	<=?|>=?|=
CONST	-?[0-9]*
COP		"if"
LVD		"let"
NAME	[_a-zA-Z][_a-zA-Z0-9]*
NL		"\r"|"\n"|"\r\n"
NOWS	[.]
OP		[+|-|*]|"div"|"mod"
PEP		"print"
PREFUNC	"get-int"|"get-bool"
TYPE	"int"|"bool"
WS		[\t NL]+
COMMENT	;(.|\t|" ")*

%%

{NL}	{yylineno++;}
{COMMENT}	{;}
[(]		{printf("line %d: left parenthesis:\t\t%s\n", yylineno, yytext);}
[)]		printf("line %d: right parenthesis:\t\t%s\n", yylineno, yytext);
"define-fun"	{printf("line %d: function definition keyword:\t%s\n", yylineno, yytext);}
{PREFUNC}	{printf("line %d: predefined function:\t\t%s\n", yylineno, yytext);}
{BCONST}	{printf("line %d: boolean constant:\t\t%s\n", yylineno, yytext);}
{BOP}		{printf("line %d: boolean operator:\t\t%s\n", yylineno, yytext);}
{COP}		{printf("line %d: conditional operator:\t\t%s\n", yylineno, yytext);}
{LVD}		{printf("line %d: local variable declarer:\t\t%s\n", yylineno, yytext);}
{TYPE}		{printf("line %d: variable/function type:\t\t%s\n", yylineno, yytext);}
{PEP}		{printf("line %d: program entry:\t\t\t%s\n", yylineno, yytext);}
{COMP}	{printf("line %d: arithmetic comparison:\t\t%s\n", yylineno, yytext);}
{CONST}	{printf("line %d: integer constant:\t\t%s\n", yylineno, yytext);}
{OP}	{printf("line %d: arithmetic operation:\t\t%s\n", yylineno, yytext);}
{NAME}	{printf("line %d: variable/function:\t\t%s\n", yylineno, yytext);}
{WS}	{;}
{NOWS}	{printf("ERROR: %s\n", yytext); return -1;}

%%

int main(int argc, char *argv[]){
	yylex();
	printf("\n");
	return 0;
}