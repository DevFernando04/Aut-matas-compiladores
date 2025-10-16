%option noyywrap
%{

#include<stdio.h>

%}


%%
.    { 
char c = yytext[0];
putchar((c >= 'A' && c <= 'Z') ? c + ('a' - 'A') : c);
     }

%%

int main(){
yylex();
return 0;
}
