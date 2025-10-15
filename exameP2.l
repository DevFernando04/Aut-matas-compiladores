%{
#include <stdio.h>
int comentarios = 0;
int palabras_reservadas = 0;
int variables = 0;
int constantes = 0;
int op_aritmeticos = 0;
int op_logicos = 0;
int simbolos = 0;
%}

%%

"//".*                          { comentarios++; printf("COMENTARIO: %s\n", yytext); }
"/*"([^*]|\*+[^*/])*"*/"        { comentarios++; printf("COMENTARIO_BLOQUE\n"); }

"auto"|"break"|"case"|"char"|"const"|"continue"|"default"|"do"|"double"|"else"|"enum"|"extern"|"float"|"for"|"goto"|"if"|"int"|"long"|"register"|"return"|"short"|"signed"|"sizeof"|"static"|"struct"|"switch"|"typedef"|"union"|"unsigned"|"void"|"volatile"|"while"|"class"|"namespace"|"public"|"private"|"protected"|"new"|"delete"|"this"|"virtual"|"bool"|"true"|"false"|"try"|"catch"|"throw"|"template"|"typename"|"using"|"inline"|"explicit"|"operator"|"friend"|"const_cast"|"dynamic_cast"|"static_cast"|"reinterpret_cast" {
    palabras_reservadas++;
    printf("PALABRA_RESERVADA: %s\n", yytext);
}

[a-zA-Z_][a-zA-Z0-9_]*          { variables++; printf("IDENTIFICADOR: %s\n", yytext); }

[0-9]+\.[0-9]+                  { constantes++; printf("CONSTANTE_REAL: %s\n", yytext); }
[0-9]+                          { constantes++; printf("CONSTANTE_ENTERA: %s\n", yytext); }

"++"|"--"|"+"|"-"|"*"|"/"|"%"|"+="|"-="|"*="|"/="|"%=" {
    op_aritmeticos++;
    printf("OP_ARITMETICO: %s\n", yytext);}

";"|","|"."|"("|")"|"{"|"}"|"["|"]"|":"|"="|"#"|"->"|"::"|"?" {
    simbolos++;
    printf("SIMBOLO: %s\n", yytext);}

%%

int yywrap() {
    return 1;
}

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
    printf("Comentarios:            %d\n", comentarios);
    printf("Palabras reservadas:    %d\n", palabras_reservadas);
    printf("Variables:              %d\n", variables);
    printf("Constantes numéricas:   %d\n", constantes);
    printf("Operadores aritméticos: %d\n", op_aritmeticos);
    printf("Símbolos especiales:    %d\n", simbolos);
    
    return 0;
}
