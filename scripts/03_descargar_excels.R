# Leer xlsx y crear dataframe crudo ---------------------------------------

walk2(links_solo_xls$links, links_solo_xls$value, function(link, id) {
  download.file(link,
                destfile = paste0("data/descarga_", id), #los baja en la carpeta "data"
                quiet = FALSE)
})

# Mapear a dataframe raw --------------------------------------------------

datos_raw_excel <-
  dir_ls("data", regexp = '.*\\.xlsx') %>% #solo xlsx no xls
  map_dfr(read_excel, 
          range = cell_limits(c(13, 1), c(NA, NA)),
          .id = "source")

datos_raw_xls <-
  dir_ls("data", regexp = ".+xls$") %>% 
  map_dfr(read_excel, 
          range = cell_limits(c(5, 1), c(NA, NA)),
          col_types = "text",
          .id = "source")
