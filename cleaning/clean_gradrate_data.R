# (b) Gradrate Dataの整形

# 1.
# ディレクトリ内のすべてのCSVファイルを取得
gd_file_paths <- list.files(path = "./01_data/raw/outcome", full.names = T)
gd <- gd_file_paths %>% 
  purrr::map_dfr(~ read_excel(.x))
print(gd)

# 2.
gd <- gd %>%
  mutate(women_gradrate_4yr = women_gradrate_4yr*0.01)

# 3.
gd <- dplyr::mutate(gd, totcohortsize = as.double(totcohortsize))
class(gd$totcohortsize)

gd <- dplyr::mutate(gd, tot_gradrate_4yr = tot4yrgrads / totcohortsize 
)
# 4.
gd <- gd %>%
  mutate(tot_gradrate_4yr =round(tot_gradrate_4yr, 3))

# 5.
gd <- gd %>%
  dplyr::filter(year > 1990 & year < 2011) 
