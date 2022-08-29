
# Limpiar datos -----------------------------------------------------------

datos_limpios_xls <- 
  datos_raw_xls %>% 
  clean_names() %>% 
  select(source,concesionaria,servicio,tipo_de_parametro, parametro,limite,unidades,valor_promedio,evaluacion) %>% 
  mutate(source = str_remove(source,"data/descarga_")) %>% 
  left_join(links_solo_xls,  by = c("source" = "value")) %>% 
  drop_na() 


datos_limpios_excel <- 
  datos_raw_excel %>% 
  clean_names() %>% 
  select(source,concesionaria,servicio,parametro,limite,unidades,valor_promedio,evaluacion) %>% 
  mutate(source = str_remove(source,"data/descarga_"),
         tipo_de_parametro = NA_character_) %>% 
  left_join(links_solo_xls,  by = c("source" = "value")) %>% 
  drop_na() 

datos_limpios <- bind_rows(datos_limpios_xls,datos_limpios_excel)

