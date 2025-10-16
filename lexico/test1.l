%option noyywrap
%{
 
#include <stdio.h>

%}

TokenNumero [0-9]+

%%

[0-9]+  {printf("TokenNumero=%s\n", yytext);}

%%

int main(){
yylex();
return 0;
}
