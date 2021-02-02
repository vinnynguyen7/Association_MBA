library(tidyverse)
install.packages("readxl")
library(readxl)
 
df_furniture <- read.csv("Furniture Sales Data.csv") %>%
  select(-1:-2) 

df_global <- read_excel("global_superstore_2016.xlsx") %>%
  rename_at(vars(everything()), ~str_replace_all(., "\\s+", ".")) %>%
  select(-1)

df_combined <- merge(df_furniture, df_global, by = "Order.ID", all = TRUE)

