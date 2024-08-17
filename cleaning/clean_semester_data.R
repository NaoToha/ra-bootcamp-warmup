## データ整理と変換

library(tidyverse)

# (a) Semester Dataの整形

# 1.
setwd("C:/Users/naoto/OneDrive/デスクトップ/ra-bootcamp-warmup")
sd1 <- read.csv("./01_data/raw/semester_dummy/semester_data_1.csv")
sd2 <- read.csv("./01_data/raw/semester_dummy/semester_data_2.csv")

# 2.
colnames(sd1) <- sd1[1,]
sd1 <- sd1[-1,]

# 3.
colnames(sd2) <- colnames(sd1)
sd <- rbind(sd1, sd2)

# 4.
sd <- sd[,-6]

# 5
sd <- sd %>%
  mutate(intro_s = ifelse(semester == "1" & 
                            lag(quarter, default = "0") == "1", 1, 0))
