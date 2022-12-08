library(readxl)
library(tidyverse)
library(dplyr)
library(lubridate)
library(ggplot2)
rm(list = ls())

setwd("~/Desktop/Fall 2022/DATA 331/Final /Project-Insect-Carnivore")
df <- read.csv("data/main.csv")

#Total for each state
df_state <- df %>%
  count(stateProvince)

ggplot(df_state, aes(x=stateProvince, y=n)) +
  geom_bar(stat = "identity", fill = "#327967")  + ylim(0,400)+
  geom_text(aes(label=n), vjust=-0.3, size=3.5)+
  xlab("States") + 
  ylab("Number of Ladybugs") + 
  ggtitle("Total number of Ladybugs for each State") +
  theme_minimal() 

#Total for each kind 
df_name <- df %>%
  count(scientificName)

ggp <- ggplot(df_name, aes(y=n, x=scientificName)) +
  geom_bar(stat = "identity", fill = "#327967")  + ylim(0,400)+ 
  geom_text(aes(label=n), vjust=0.3, hjust=-0.2, size=3.2)+
  xlab("Scientific Name") + 
  ylab("Number of Ladybugs") + 
  ggtitle("Total number of Ladybugs for each kind") +
  theme_minimal() 
ggp +  coord_flip() 

#Total by each kind and state 
df_name_and_state <- df %>%
  group_by(stateProvince) %>%
  count(scientificName)

ggp1 <- ggplot(df_name_and_state, aes(fill = stateProvince, y = n, x = scientificName)) +
  geom_bar(position = "stack", stat = "identity") + 
  ggtitle("Number of Ladybugs recorded by Name and State") + ylim(0, 180)+
  labs(x = "Scientific Name", y = "Number of Ladybugs") +
  theme_minimal() 
ggp1 + coord_flip() 


