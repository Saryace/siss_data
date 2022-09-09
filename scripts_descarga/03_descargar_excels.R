# Leer xlsx y crear dataframe crudo ---------------------------------------

#creo una funcion que 1) descarga los archivos, 2) los rotula como "descarga",
#3) los deja en una carpeta aparta (data)

walk2(links_solo_excel$links, links_solo_excel$link_relativo, function(link, link_relativo) {
  download.file(link,
                destfile = paste0("data/descarga_", link_relativo),
                #los baja en la carpeta "data"
                quiet = FALSE)
})

# Mapear a dataframe raw --------------------------------------------------

datos_raw_excel <-
  dir_ls("data", regexp = '.*\\.xlsx') %>% #regexp = termina en xlsx 
  map_dfr(read_xlsx, 
          range = cell_limits(c(13, 1), c(NA, NA)),
          .id = "source")

datos_raw_xls <-
  dir_ls("data", regexp = ".+xls$") %>% #regexp = termina en xls 
  map_dfr(read_xls, 
          range = cell_limits(c(5, 1), c(NA, NA)),
          col_types = "text",
          .id = "source")
