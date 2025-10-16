%option noyywrap
%{

	#include<stdio.h>

%}

TokenVariable [a-zA-Z][(_)a-zA-Z0-9]*

%%

[a-zA-Z][(_)a-zA-Z0-9]* { printf("TokenVariable=%s\n", yytext);}

%%

int main(){
yylex();
return 0;
}
