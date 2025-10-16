%option noyywrap
%{
#include<stdio.h>
%}

TokenVerboAnalizar "analizar"|"asociar"|"asumir"|"calcular"|"categorizar"|"clasificar"|"comparar"|"componer"|"concluir"|"contrastar"|"cuestionar"|"criticar"|"descubrir"|"desmenuzar"|"destacar"|"dibujar"|"diagramar"|"diferenciar"|"discutir"|"discriminar"|"disecar"|"distinguir"|"dividir"|"elegir"|"encuestar"|"ensamblar"|"estimar"|"examinar"|"experimentar"|"explicar"|"extrapolar"|"funcionar"|"inducir"|"inferir"|"inspeccionar"|"subdividir"

TokenAdjetivo "incrieble"|"excelente"|"chulo"|"feliz"|"alegre"|"inteligente"|"atractivo"|"creativo"|"eficiente"|"efectivo"|"positivo"|"agradable"|"maravilloso"|"grandioso"|"importante"|"grande"|"pequeño"|"amable"|"joven"|"mejor"|"perfecto"|"magnifico"

TokenConjuncion "y"|"e"|"ni"|"o"|"u"|"pero"|"mas"|"sino"|"aunque"|"porque"|"pues"|"si"|"que"

TokenPreposicion "a"|"ante"|"bajo"|"con"|"contra"|"de"|"desde"|"en"|"entre"|"hacia"|"hasta"|"para"|"por"|

TokenPronombre "yo"|"tu"|"el"|"ella"|"nosotros"|"ellos"|"ellas"

%%

"analizar"|"asociar"|"asumir"|"calcular"|"categorizar"|"clasificar"|"comparar"|"componer"|"concluir"|"contrastar"|"cuestionar"|"criticar"|"descubrir"|"desmenuzar"|"destacar"|"dibujar"|"diagramar"|"diferenciar"|"discutir"|"discriminar"|"disecar"|"distinguir"|"dividir"|"elegir"|"encuestar"|"ensamblar"|"estimar"|"examinar"|"experimentar"|"explicar"|"extrapolar"|"funcionar"|"inducir"|"inferir"|"inspeccionar"|"subdividir" { printf("TokenVerboAnalizar=%s\n", yytext); }

"bueno"|"excelente"|"hermoso"|"feliz"|"alegre"|"brillante"|"inteligente"|"creativo"|"eficiente"|"efectivo"|"positivo"|"agradable"|"maravilloso"|"espléndido"|"importante"|"grande"|"pequeño"|"nuevo"|"viejo"|"mejor"|"perfecto"|"magnifico" { printf("TokenAdjetivo=%s\n", yytext); }

"y"|"e"|"ni"|"o"|"u"|"pero"|"mas"|"sino"|"aunque"|"porque"|"pues"|"si"|"que" { printf("TokenConjuncion=%s\n", yytext); }

"a"|"ante"|"bajo"|"con"|"contra"|"de"|"desde"|"en"|"entre"|"hacia"|"hasta"|"para"|"por" { printf("TokenPreposicion=%s\n", yytext); }

"yo"|"tu"|"el"|"ella"|"nosotros"|"ellos"|"ellas" { printf("TokenPronombre=%s\n", yytext); }

%%

int main(){
yylex();
return 0;
}
