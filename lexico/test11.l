%option noyywrap
%{

#include<stdio.h>

%}

TokenComentario "//".* 

%%

"//".*  { printf("TokenComentario=%s\n", yytext); }

%%

int main(){
yylex();
return 0;
}
