
# Analisis exploratorio ---------------------------------------------------

# cuantos datos hay por fecha

datos_limpios_numericos %>% 
  group_by(mes,anio) %>% 
  count() 

datos_limpios_numericos %>% 
  group_by(anio) %>% 
  count() 

# cuantos NO CUMPLE hay por fecha

datos_limpios_numericos %>% 
  filter(evaluacion != "Cumple") %>% 
  group_by(anio) %>% 
  count() 

# que parametros resumen los NO cumplimientos
datos_limpios_numericos %>% 
  filter(evaluacion != "Cumple") %>%
  group_by(parametro, anio) %>% 
  tally()

