
# Hay que arreglar las classes chr a numeric ------------------------------

datos_limpios_numericos <- 
datos_limpios %>%
  mutate(
    valor_promedio = as.numeric(str_replace(valor_promedio,",","."))
  )

