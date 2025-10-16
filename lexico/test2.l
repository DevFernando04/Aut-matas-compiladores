%option noyywrap
%{
 
#include <stdio.h>

%}

TokenDecimal [0-9]+[.][0-9]+

%%

[0-9]+[.][0-9]+ { printf("TokenDecimal=%s\n", yytext);}

%%

int main(){
yylex();
return 0;
}
