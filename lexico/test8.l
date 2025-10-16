%option noyywrap
%{
#include<stdio.h>
%}

TokenVerboAplicacion "aplicar"|"calcular"|"cambiar"|"comprobar"|"computar"|"contrastar"|"construir"|"convertir"|"demostrar"|"desarrollar"|"dibujar"|"dramatizar"|"ejemplificar"|"emplear"|"ensamblar"|"entrevistar"|"escoger"|"estimar"|"extrapolar"|"fabricar"|"ilustrar"|"interpolar"|"interpretar"|"hacer"|"manipular"|"modelar"|"modificar"|"mostrar"|"operar"|"organizar"|"planear"|"practicar"|"preparar"|"producir"|"programar"|"realizar"|"redactar"|"relatar"|"resolver"|"traducir"|"transformar"|"trazar"|"usar"|"utilizar"|"esbozar"|"solucionar"

%%

"aplicar"|"calcular"|"cambiar"|"comprobar"|"computar"|"contrastar"|"construir"|"convertir"|"demostrar"|"desarrollar"|"dibujar"|"dramatizar"|"ejemplificar"|"emplear"|"ensamblar"|"entrevistar"|"escoger"|"estimar"|"extrapolar"|"fabricar"|"ilustrar"|"interpolar"|"interpretar"|"hacer"|"manipular"|"modelar"|"modificar"|"mostrar"|"operar"|"organizar"|"planear"|"practicar"|"preparar"|"producir"|"programar"|"realizar"|"redactar"|"relatar"|"resolver"|"traducir"|"transformar"|"trazar"|"usar"|"utilizar"|"esbozar"|"solucionar" { printf("TokenVerboAplicacion=%s\n", yytext); }

%%

int main(){
yylex();
return 0;
}

