library(readxl)
library(tidyverse)
library(dplyr)
library(lubridate)
library(ggplot2)
rm(list = ls())

setwd("~/Desktop/Fall 2022/DATA 331/Final /Project-Insect-Carnivore")
df <- read.csv("data/cleaned_data.csv")

#Number of ladybugs found in each state 
data <- df %>%
  count(stateProvince, sort = TRUE)

#Perform T-test
t.test(data$n, mu=92)

