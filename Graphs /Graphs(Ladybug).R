library(readxl)
library(tidyverse)
library(dplyr)
library(lubridate)
library(ggplot2)
rm(list = ls())

setwd("~/Desktop/Fall 2022/DATA 331/Final /Project-Insect-Carnivore")
df <- read.csv("data/main.csv")

#Total for each state
state <- df %>%
  count(stateProvince)

ggplot(state, aes(x=stateProvince, y=n)) +
  geom_bar(stat = "identity", fill = "#327967")  + ylim(0,400)+
  geom_text(aes(label=n), vjust=-0.3, size=3.5)+
  xlab("States") + 
  ylab("Number of Ladybugs") + 
  ggtitle("Total number of Ladybugs for each State") +
  theme_minimal() 

#Total for each kind 
name <- df %>%
  count(scientificName)

ggp <- ggplot(name, aes(y=n, x=scientificName)) +
  geom_bar(stat = "identity", fill = "blue")  + ylim(0,200)+ 
  geom_text(aes(label=n), vjust=0.4, hjust=-0.3, size=3.2)+
  xlab("Scientific Name") + 
  ylab("Number of Ladybugs") + 
  ggtitle("Total number of Ladybugs for each kind") +
  theme_minimal() 
ggp +  coord_flip() 

#Group by decades
decades <- df 
decades$year <- substring(decades$year, 1,3)
decades$year <- paste(decades$year, "0s", sep = "")

decades_data <- decades %>%
  count(year)

#Total for each decade
ggplot(decades_data, aes(x=year, y = n, group = 1)) +
  geom_line(color = "orange") + ylim(0,500)+
  ggtitle("Number of Ladybugs recorded by Decades")+
  labs(x = "Decades", y = "Number of Ladybugs")+ geom_point(color = "black")+
  theme_minimal()




