
# Ejercicio: ARSENICO -----------------------------------------------------

datos_limpios_numericos %>% 
  filter(parametro == "ARSÉNICO") %>% 
  #filtramos los no cumple o no es informado
  filter(evaluacion != "Cumple" & evaluacion != "No Informado") %>% 
  filter(!str_detect(evaluacion, "Sin")) %>% #filtramos los sin servicio
  group_by(servicio, evaluacion, anio) %>% 
  summarise(promedio = mean(valor_promedio)) 
