import re

def main():
    texto = input()
    lexemas = texto.split()
    total_lexemas = len(lexemas)
    
    total_enteros = 0
    total_minusculas = 0
    total_mayusculas = 0
    total_identificadores = 0
    total_simbolos = 0
    
    for lexema in lexemas:
        if entero(lexema):
            total_enteros += 1
        elif minusculas(lexema):
            total_minusculas += 1
        elif mayusculas(lexema):
            total_mayusculas += 1
        elif identificador(lexema):
            total_identificadores += 1
        elif simbolo(lexema):
            total_simbolos += 1
    
    print("Total de lexemas:", total_lexemas)
    print("Total de números enteros:", total_enteros)
    print("Total de palabras en minúsculas:", total_minusculas)
    print("Total de palabras en mayúsculas:", total_mayusculas)
    print("Total de identificadores:", total_identificadores)
    print("Total de símbolos:", total_simbolos)

def entero(txt):
    return bool(re.match(r'^-?\d+$', txt))

def minusculas(txt):
    return bool(re.match(r'^[a-z]+$', txt))

def mayusculas(txt):
    return bool(re.match(r'^[A-Z]+$', txt))

def identificador(txt):
    return bool(re.match(r'^[a-zA-Z_][a-zA-Z0-9_]*$', txt))

def simbolo(txt):
    return bool(re.match(r'^[^\w\s]+$', txt))

main()