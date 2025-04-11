################ BUCLE Y GUARDADO ################ 

# Autor: Marina Pachón Mena
# Propósito: Escribir un bucle que lea los archivos climáticos y los guarde en
# una lista, pero añadiendo el nombre de cada sitio (obtenido del nombre del archivo).


# Carga de paquetes necesarios
library(tidyverse)

# Definimos la ruta de la carpeta donde están los archivos
ruta_clima <- "data/clima/"

# Obtenemos la lista de archivos .csv que tenemos en nuestra carpeta clima
archivos_clima <- list.files(path = ruta_clima, pattern = "*.csv", full.names = TRUE)

# Queremos darle nombres a los distintos .csv y que aparezcan como nombres de la lista

nombres_sitios <- archivos_clima %>%
  basename() %>%
  str_remove("clima_") %>%
  str_remove(".csv")

# Función para leer los archivos
leer_archivo_clima <- function(archivo) {
  datos <- read_csv(archivo)  # Cargamos el archivo y lo guardamos en datos
  datos  # Devolvemos el dataframe
}

# Aplicamos la función a todos los archivos para guardarlos en una lista
lista_datos_clima <- map(archivos_clima, leer_archivo_clima)

# Asignamos los nombres a la lista
names(lista_datos_clima) <- nombres_sitios

# Verificamos los nombres de los elementos de la lista
names(lista_datos_clima)

# Verificamos que la lista tenga los dataframes correctamente cargados
str(lista_datos_clima[[1]])

