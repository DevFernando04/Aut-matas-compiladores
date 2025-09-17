def main():
    texto = input()
    
    lexemas = texto.split()
    
    enteros = []
    minusculas = []
    mayusculas = []
    identificadores = []
    
    for lexema in lexemas:
        if es_entero(lexema):
            enteros.append(lexema)
        elif es_minusculas(lexema):
            minusculas.append(lexema)
        elif es_mayusculas(lexema):
            mayusculas.append(lexema)
        elif es_identificador(lexema):
            identificadores.append(lexema)
    
    print(f"Números enteros: {len(enteros)}")
    print(f"Palabras en minúsculas: {len(minusculas)}")
    print(f"Palabras en mayúsculas: {len(mayusculas)}")
    print(f"Identificadores: {len(identificadores)}")

def es_entero(lexema):
    if not lexema:
        return False
    inicio = 0
    if lexema[0] == '-':
        if len(lexema) == 1:
            return False
        inicio = 1
    
    for i in range(inicio, len(lexema)):
        if not (lexema[i] >= '0' and lexema[i] <= '9'):
            return False
    return True

def es_minusculas(lexema):
    if not lexema:
        return False
    for char in lexema:
        if not (char >= 'a' and char <= 'z'):
            return False
    return True

def es_mayusculas(lexema):
    if not lexema:
        return False
    for char in lexema:
        if not (char >= 'A' and char <= 'Z'):
            return False
    return True

def es_identificador(lexema):
    if not lexema:
        return False
    
    primer_char = lexema[0]
    if not ((primer_char >= 'a' and primer_char <= 'z') or 
            (primer_char >= 'A' and primer_char <= 'Z') or 
            primer_char == '_'):
        return False
    
    for i in range(1, len(lexema)):
        char = lexema[i]
        if not ((char >= 'a' and char <= 'z') or 
                (char >= 'A' and char <= 'Z') or 
                (char >= '0' and char <= '9') or 
                char == '_'):
            return False
    return True

main()