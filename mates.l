%option noyywrap

%{

#include <stdio.h>
int lineas = 1;
int palabras = 0;
int caracteres = 0;
int palabras_ni = 0;
int palabras_num = 0;
int palabras_b_to = 0;
int palabras_jo = 0;
int numeros = 0;
int total_carac = 0;


void imprimirResultados();

%}

%%

\n                      { lineas++; total_carac++; }
[ \t]                   { total_carac++; }
[Nn][Ii][a-zA-Z]*       { palabras++; palabras_ni++; total_carac += yyleng; }
[Nn][Uu][Mm][a-zA-Z]*   { palabras++; palabras_num++; total_carac += yyleng; }
[Bb][a-zA-Z]*[Tt][Oo]   { palabras++; palabras_b_to++; total_carac += yyleng; }
[a-zA-Z]*[Jj][Oo]       { palabras++; palabras_jo++; total_carac += yyleng; }
[0-9]+                  { palabras++; numeros++; total_carac += yyleng; }
[a-zA-Z]+               { palabras++; total_carac += yyleng; }
.                       { total_carac++; }

%%

void imprimirResultados() {

    printf("Total de lineas: %d\n", lineas);
    printf("Total de palabras: %d\n", palabras);
    printf("Total de caracteres: %d\n", total_carac);
    printf("Palabras que inician con 'ni': %d\n", palabras_ni);
    printf("Palabras que inician con 'num': %d\n", palabras_num);
    printf("Palabras que inician con 'b' y terminan con 'to': %d\n", palabras_b_to);
    printf("Palabras que terminan con 'jo': %d\n", palabras_jo);
    printf("Palabras que son digitos: %d\n", numeros);

}

int main() {
    char name[] = "elbrutodelasmates.txt";
    FILE *archivo = fopen(name, "r");
    
    if (!archivo) {
        printf("Error al abrir el archivo %s\n", name);
        return 1;
    }
    
    yyin = archivo;
    yylex();
    
    imprimirResultados();
    
    fclose(archivo);
    return 0;
}
