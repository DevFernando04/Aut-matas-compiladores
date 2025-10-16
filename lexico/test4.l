%option noyywrap
%{

	#include<stdio.h>

%}

TokenRFC [A-Z]{4}[0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[1|2][0-9]|3[0-1])[A-Z0-9]{3}

%%

[A-Z]{4}[0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[1|2][0-9]|3[0-1])[A-Z0-9]{3} { printf("TokenRFC=%s\n", yytext);}

%%

int main(){
yylex();
return 0;
}
