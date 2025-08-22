def entero(cadena):
    for c in cadena:
        if c < '0' or c > '9':
            return False
    return len(cadena) > 0

def palabra(cadena):
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
        return "numero"
    elif palabra(cadena):
        return "palabra"
    elif compuesta(cadena):
        return "combinada"

def procesar_archivo(nombre_archivo):
    try:
        with open(nombre_archivo, 'r', encoding='utf-8') as archivo:
            contenido = archivo.read()
        
        total_con_espacios = len(contenido)
        total_sin_espacios = len(contenido.replace(' ', '').replace('\n', '').replace('\t', ''))
        
        lexemas = contenido.split()
        total_lexemas = len(lexemas)
        
        count_numero = 0
        count_palabra = 0
        count_combinada = 0
        
        print("Clasificación de lexemas:")
        for lexema in lexemas:
            resultado = clasificar(lexema)
            print(f"{lexema}: {resultado}")
            
            if resultado == "numero":
                count_numero += 1
            elif resultado == "palabra":
                count_palabra += 1
            elif resultado == "combinada":
                count_combinada += 1
        
        print("RESUMEN:")
        print(f"Total de caracteres (con espacios): {total_con_espacios}")
        print(f"Total de caracteres (sin espacios): {total_sin_espacios}")
        print(f"Total de lexemas: {total_lexemas}")
        print(f"Total de palabras: {count_palabra}")
        print(f"Total de números: {count_numero}")
        print(f"Total de combinadas: {count_combinada}")
        
    except FileNotFoundError:
        print(f"Error: No se pudo encontrar el archivo '{nombre_archivo}'")
    except Exception as e:
        print(f"Error al procesar el archivo: {e}")

def main():
    while True:
        print("CLASIFICADOR DE LEXEMAS")
        
        nombre_archivo = input("Ingrese el nombre del archivo (o 'salir' para terminar): ").strip()
        
        if nombre_archivo.lower() == 'salir':
            print("Saliendo del programa...")
            break
        
        if not nombre_archivo:
            print("Por favor, ingrese un nombre de archivo válido.")
            continue
        
        if not nombre_archivo.endswith('.txt'):
            nombre_archivo += '.txt'
        
        procesar_archivo(nombre_archivo)

if __name__ == "__main__":
    main()