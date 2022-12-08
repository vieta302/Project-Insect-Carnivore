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
df_final$scientificName[df_final$scientificName == ""] <- "Unknown"
df_final$scientificName <- toupper(df_final$scientificName)

#Clean State   
df_final$stateProvince[df$stateProvince == "IL"] <- "Illinois"
df_final$stateProvince[df$stateProvince == "Il"] <- "Illinois"
df_final$stateProvince[df$stateProvince == "IA"] <- "Iowa"
df_final$stateProvince[df$stateProvince == "Ia"] <- "Iowa"

#Create finalized data
write.csv(df_final, "~/Desktop/Fall 2022/DATA 331/Final /Project-Insect-Carnivore/data/main.csv", row.names = FALSE)

