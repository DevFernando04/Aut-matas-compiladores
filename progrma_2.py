def entero(cadena):
    for c in cadena:
        if c < '0' or c > '9':
            return False
    return len(cadena) > 0

def palabraa(cadena):
    for c in cadena:
        if not (('a' <= c <= 'z') or ('A' <= c <= 'Z')):
            return False
    return len(cadena) > 0

def compuesta(cadena):
    for c in cadena:
        if not (('a' <= c <= 'z') or ('A' <= c <= 'Z') or ('0' <= c <= '9')):
            return False
    return len(cadena) > 0

def clasificar(cadena):
    if entero(cadena):
        return "entero"
    elif palabraa(cadena):
        return "palabra"
    elif compuesta(cadena):
        return "compuesta"

def procesar_entrada(entrada):
    palabras = entrada.split()
    
    count_entero = 0
    count_palabra = 0
    count_compuesta = 0
    
    print("\nClasificación:")
    for palabra in palabras:
        resultado = clasificar(palabra)
        print(f"{palabra}: {resultado}")
        
        if resultado == "entero":
            count_entero += 1
        elif resultado == "palabra":
            count_palabra += 1
        elif resultado == "compuesta":
            count_compuesta += 1
    
    print("\nResumen:")
    resultado_partes = []
    if count_entero > 0:
        resultado_partes.append(f"{count_entero} - entero")
    if count_palabra > 0:
        resultado_partes.append(f"{count_palabra} - palabra")
    if count_compuesta > 0:
        resultado_partes.append(f"{count_compuesta} - compuesta")
    
    print(", ".join(resultado_partes))

while True:
    entrada = input("Ingrese algo: ").strip()
    
    if entrada.lower() == "salir":
        print("Saliendo del programa...")
        break
    
    if not entrada:
        print("Por favor, ingrese una cadena válida.")
        continue
    
    procesar_entrada(entrada)
    print("-" * 50)

