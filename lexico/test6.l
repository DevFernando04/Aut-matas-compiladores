%option noyywrap
%{

	#include<stdio.h>

%}

TokenEmail [a-z]{2}[0-9]{6}["@uaeh.edu.mx"]

%%

[a-z]{2}[0-9]{6}["@uaeh.edu.mx"] { printf("TokenEmail=%s\n", yytext);}

%%

int main(){
yylex();
return 0;
}
