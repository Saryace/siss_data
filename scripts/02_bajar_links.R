
# Leer html de la web de la SISS ------------------------------------------

siss_html <- read_html("https://www.siss.gob.cl/586/w3-propertyvalue-6405.html")

# Extraer todos los links -------------------------------------------------

links <-
siss_html %>% 
  rvest::html_nodes("a") %>%
  rvest::html_attr("href") 

links_nodos <- 
siss_html %>% 
html_nodes("a")

nombres_link <- html_text(links_nodos)

# Filtrar solo xlsx y xls -------------------------------------------------

links_solo_xls <- links %>% 
  as.tibble() %>% 
  mutate(nombre_link = nombres_link) %>% 
  filter(stringr::str_ends(value, '.xls') | stringr::str_ends(value, '.xlsx')) %>% 
  filter(!str_detect(value, '_informe') & !str_detect(value, '_Resultado') & !str_detect(value, '_cap')) %>% 
  mutate(links =  paste0("https://www.siss.gob.cl/586/",value))

 
