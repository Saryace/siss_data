
# Hay que arreglar las classes chr a numeric ------------------------------

datos_limpios_numericos <-
  datos_limpios %>%
  mutate(valor_promedio = as.numeric(str_replace(valor_promedio, ",", ".")),
         limite = as.numeric(str_replace(limite, ",", "."))) %>%
# Hay que detallar mes y año de la medicion -------------------------------
  mutate(fecha = str_remove(nombre_link, "Detalle por servicios - ")) %>% 
  separate(fecha, c("mes","anio"), sep = " ")
  