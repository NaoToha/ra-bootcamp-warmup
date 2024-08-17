# (c) Covariates Dataの整形

# 1.
library(readxl)

cv <- read_excel("./01_data/raw/covariates/covariates.xlsx")

# 2.
cv <- dplyr::rename(cv, unitid = university_id )

# 3.
cv <- cv %>%
  mutate(unitid = stringr::str_sub(cv$unitid, end = -5))
