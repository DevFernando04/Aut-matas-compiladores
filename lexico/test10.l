%option noyywrap
%{

#include<stdio.h>

%}

TokenPalabraReservada "auto"|"break"|"case"|"const"|"continue"|"default"|"do"|"else"|"enum"|"extern"|"for"|"goto"|"if"|"register"|"return"|"signed"|"sizeof"|"static"|"struct"|"switch"|"typedef"|"union"|"unsigned"|"volatile"|"while"|"class"|"namespace"|"public"|"private"|"protected"|"new"|"delete"|"this"|"virtual"|"bool"|"true"|"false"|"try"|"catch"|"throw"|"template"|"typename"|"using"|"inline"|"explicit"|"operator"|"friend"|"const_cast"|"dynamic_cast"|"static_cast"|"reinterpret_cast" 

TokenTipoDato "int"|"char"|"float"|"double"|"void"|"long"|"short"

TokenVariable [a-zA-Z_][a-zA-Z0-9_]*
%%
"auto"|"break"|"case"|"const"|"continue"|"default"|"do"|"else"|"enum"|"extern"|"for"|"goto"|"if"|"register"|"return"|"signed"|"sizeof"|"static"|"struct"|"switch"|"typedef"|"union"|"unsigned"|"volatile"|"while"|"class"|"namespace"|"public"|"private"|"protected"|"new"|"delete"|"this"|"virtual"|"bool"|"true"|"false"|"try"|"catch"|"throw"|"template"|"typename"|"using"|"inline"|"explicit"|"operator"|"friend"|"const_cast"|"dynamic_cast"|"static_cast"|"reinterpret_cast" { printf("TokenPalabraReservada=%s\n", 

yytext); }
"int"|"char"|"float"|"double"|"void"|"long"|"short"|"signed"|"unsigned" { printf("TokenTipoDato=%s\n", yytext); }

[a-zA-Z_][a-zA-Z0-9_]* { printf("TokenVariable=%s\n", yytext); }

%%

int main(){
yylex();
return 0;
}
