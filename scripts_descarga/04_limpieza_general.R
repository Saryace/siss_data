
# Limpiar datos -----------------------------------------------------------

datos_limpios_xls <-
  datos_raw_xls %>%
  clean_names() %>% #nombre de columnas en minusculas y "_"
  select( #selecciono las columnas
    source,
    concesionaria,
    servicio,
    tipo_de_parametro,
    parametro,
    limite,
    unidades,
    valor_promedio,
    evaluacion
  ) %>%
  # dejamos source como link relativo web
  mutate(source = str_remove(source, "data/descarga_")) %>%
  # se unen la info de los archivo con los datos limpios
  left_join(links_solo_excel,  by = c("source" = "link_relativo")) %>% 
  drop_na()


datos_limpios_excel <-
  datos_raw_excel %>%
  clean_names() %>% #nombre de columnas en minusculas y "_"
  drop_na(concesionaria, servicio) %>% 
  filter(concesionaria != "CONCESIONARIA") %>% 
  # dejamos source como link relativo web
  mutate(source = str_remove(source, "data/descarga_"),
         tipo_de_parametro = NA_character_) %>%
  # se unen la info de los archivo con los datos limpios
  left_join(links_solo_excel,  by = c("source" = "link_relativo")) 


# Unimos los dos tipos de datos (xls y xlsx) ------------------------------

datos_limpios <- bind_rows(datos_limpios_xls,datos_limpios_excel)

# Guardamos en un .csv ----------------------------------------------------
# son casi 500Mb, lo guardamos comprimido
write_csv(datos_limpios, "data/datos_limpios.csv.gz")


