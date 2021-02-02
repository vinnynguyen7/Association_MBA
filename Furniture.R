library(tidyverse)
install.packages("readxl")
library(readxl)
 
df_furniture <- read.csv("Furniture Sales Data.csv") %>%
  select(-1:-2) %>%
  mutate(Market = 'USCA')

colnames(df_furniture)

df_global <- read_excel("global_superstore_2016.xlsx") %>%
  rename_at(vars(everything()), ~str_replace_all(., "\\s+", ".")) %>%
  #rename(Sub-Category = Sub.Category) %>%
  select(-1, -20, -21, -22, -23, -24) 

names(df_global) <- gsub("-", ".", names(df_global))

colnames(df_global)

df_combined <- rbind(df_furniture, df_global)

