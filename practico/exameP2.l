%option noyywrap
%{
#include<stdio.h>
int comentarios = 0;
%}

PalabrasReservadas if|else|switch|case|default|for|while|do|break|continue|return|goto|bool|char|short|int|long|float|double|void|wchar_t|class|struct|union|enum|typename|template|friend|virtual|explicit|private|protected|public|operator|this|new|delete|using|namespace|try|catch|throw|noexcept|false|true|const|static|extern|auto|register|signed|unsigned|sizeof|volatile|inline
Comentarios "//".*
ConstanteNumerica [0-9]+\.[0-9]+|[0-9]+
Variable [a-zA-Z_][a-zA-Z0-9_]*
OperadorAritmetico "+"|"-"|"*"|"/"|"%"|"++"|"--"|"+="|"-="|"*="|"/="|"%="
OperadorLogico "&&"|"||"|"!"|"=="|"!="|"<"|">"|"<="|">="|"&"|"|"|"^"|"~"|"<<"|">>"
Simbolos ";"|","|"."|"("|")"|"{"|"}"|"["|"]"|":"|"="|"#"|"->"|"::"|"?"|"\\"

%%
{PalabrasReservadas} {printf("Palabra Reservada: %s\n", yytext);}
{Comentarios} {printf("Comentario Línea: %s\n", yytext); comentarios++;}
{ConstanteNumerica} {printf("Constante Numérica: %s\n", yytext);}
{OperadorAritmetico {printf("Operador Aritmético: %s\n", yytext);}
{OperadorLogico} {printf("Operador Lógico: %s\n", yytext);}
{Simbolos} {printf("Símbolo Especial: %s\n", yytext);}
{Variable} {printf("Variable: %s\n", yytext);}
%%

int main(int argc, char *argv[]) {
    if (argc < 2) {
        printf("Uso: %s archivo.cpp\n", argv[0]);
        return 1;
    }
    
    FILE *archivo = fopen(argv[1], "r");
    if (!archivo) {
        printf("Error: No se puede abrir %s\n", argv[1]);
        return 1;
    }
    
    printf("=== ANALIZANDO: %s ===\n\n", argv[1]);
    
    yyin = archivo;
    yylex();
    fclose(archivo);
    
    printf("\n=== RESUMEN ===\n");
    printf("Total de comentarios encontrados: %d\n", comentarios);
    
    return 0;
}
