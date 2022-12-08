library(readxl)
library(tidyverse)
library(dplyr)
library(lubridate)
rm(list = ls())

setwd("~/Desktop/Fall 2022/DATA 331/Final /Project-Insect-Carnivore")
df <- read.csv("data/Scan Ladybug Data.csv")

#Choosing Columns 
df_final <- df %>%
  dplyr::select("id", "scientificName", "stateProvince", "year")

#Clean Id
df_final %>% 
  dplyr::distinct(id)

#Clean Name
df_final$scientificName[df$scientificName == ""] <- "Unknown"
df_final$scientificName <- toupper(df$scientificName)

#Clean State   
df_final$stateProvince[df$stateProvince == "IL"] <- "Illinois"
df_final$stateProvince[df$stateProvince == "Il"] <- "Illinois"
df_final$stateProvince[df$stateProvince == "IA"] <- "Iowa"
df_final$stateProvince[df$stateProvince == "Ia"] <- "Iowa"

#Create new file
write.csv(df_final, "~/Desktop/Fall 2022/DATA 331/Final /Project-Insect-Carnivore/data/cleaned_data.csv", row.names = FALSE)

