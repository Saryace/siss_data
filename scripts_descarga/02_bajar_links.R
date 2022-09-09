
# Leer html de la web de la SISS ------------------------------------------

siss_html <- read_html("https://www.siss.gob.cl/586/w3-propertyvalue-6405.html")

# Extraer todos los links -------------------------------------------------

links_nodos <- #hiperlinks del sitio web (todos)
  siss_html %>% 
  html_nodes("a")

links <- #hiperlinks del sitio web (todos)
  siss_html %>%
  rvest::html_nodes("a") %>%
  rvest::html_attr("href") 

nombres_link <- html_text(links_nodos) #texto asociado a cada link

# Filtrar solo xlsx y xls -------------------------------------------------

links_solo_excel <- links %>% 
  as_tibble() %>% #ordeno los links
  #agrego la columna de texto asociado a cada link
  mutate(texto_link = nombres_link) %>% 
  #selecciono SOLO los xls y xlsx
  filter(stringr::str_ends(value, '.xls') |
           stringr::str_ends(value, '.xlsx')) %>% 
  #elimino los nombres de archivos que contengan ciertos strings
  filter(!str_detect(value, '_informe') & !str_detect(value, '_Resultado')
         & !str_detect(value, '_cap') & !str_detect(value, '_resultado')) %>% 
  #creo los links completos
  mutate(links =  paste0("https://www.siss.gob.cl/586/", value)) %>% 
  rename(link_relativo = value)

 
