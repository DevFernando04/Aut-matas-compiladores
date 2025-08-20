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
        return "Numero entero"
    elif palabraa(cadena):
        return "Palabra"
    elif compuesta(cadena):
        return "Compuesta"

    
print("Escribe (Salir) para cerrar el programa")

while True:
    entrada = input("Ingrese algo: ")
    if entrada.lower() == "salir":
        print("saliendo")
        break

    palabras = entrada.split()
    for palabra in palabras:
        resultado = clasificar(palabra)
        print(f"{palabra}: {resultado}")
            """Ayudado por Omar"""