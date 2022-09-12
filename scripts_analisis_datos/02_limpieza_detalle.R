
# cargar los datos desde el csv -------------------------------------------

datos_limpios <- read_csv("data/datos_limpios.csv.gz")

# Crear y cambiar clase de columnas ---------------------------------------

datos_limpios_numericos <-
  datos_limpios %>%
# Hay que arreglar las classes chr a numeric ------------------------------
  mutate(valor_promedio = as.numeric(str_replace(valor_promedio, ",", ".")),
         limite = as.numeric(str_replace(limite, ",", "."))) %>%
# Nuevas columas mes y año de la medicion ---------------------------------
  separate(texto_link, c("detalle", "fecha"), sep = "–|-") %>% #datos con diferentes hyphens (ENDASH)
  mutate(fecha = tolower(str_trim(fecha))) %>% #meses en minuscula y sin espacios
  separate(fecha, c("mes", "anio"), sep = " ") 