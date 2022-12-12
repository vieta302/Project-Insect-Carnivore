# Project-Insect-Carnivore
<div align = "center">
<img src = "https://github.com/vieta302/Project-Insect-Carnivore/blob/main/Orange-Ladybug.jpeg" width = "450")>
</div>

## It's Coming Home Team Members:
Viet Anh Nguyen, Houssam Hallouch, Dawit Tadele

---
## Data Prep 
I. Choosing columns (id, scientificName, stateProvince, year)
```
f_final <- df %>%
  dplyr::select("id", "scientificName", "stateProvince", "year")
```

II. Tidy data
1. Clean ID (removing duplicates):
```
df_final %>%
  dplyr::distinct(id)
```
2. Clean Name (return "unknown" if left blanked, unify format)
```
df_final$scientificName[df_final$scientificName == ""] <- "Unknown"
df_final$scientificName <- toupper(df_final$scientificName)
```
3. Clean State (Unify the format of the states)
```
df_final$stateProvince[df$stateProvince == "IL"] <- "Illinois"
df_final$stateProvince[df$stateProvince == "Il"] <- "Illinois"
df_final$stateProvince[df$stateProvince == "IA"] <- "Iowa"
df_final$stateProvince[df$stateProvince == "Ia"] <- "Iowa"
```
7. Create finalized data file 
```
write.csv(df_final, "~/Desktop/Fall 2022/DATA 331/Final /Project-Insect-Carnivore/data/main.csv", row.names = FALSE)
```

---
## Visualizations
I. Total number of Ladybugs for each State:
- From the graph, it is clear that the number of Ladybugs are significantly higher in Illinois and Iowa than other states.

<div align = "center">
<img src = "https://github.com/vieta302/Project-Insect-Carnivore/blob/main/Graphs%20/Total%20for%20each%20state.png" width = "600")>
</div>

II. Total number of Ladybugs for each Kind:
- As shown in the graph, "Harmonia Axyridis" and "Coleomegilla Maculata" stands out for being the 2 species being recorded the most. 

<div align = "center">
<img src = "https://github.com/vieta302/Project-Insect-Carnivore/blob/main/Graphs%20/Total%20for%20each%20kind.png" width = "600")>
</div>

III. Total number of Ladybugs for each Decade:
*Prep: We first have to group the years by decades.
```
decades <- df 
decades$year <- substring(decades$year, 1,3)
decades$year <- paste(decades$year, "0s", sep = "")

decades_data <- decades %>%
  count(year)
```
- From the line chart, we can conclude that the majority of the records were from recent years. 

<div align = "center">
<img src = "https://github.com/vieta302/Project-Insect-Carnivore/blob/main/Graphs%20/Total%20for%20each%20decade.png" width = "600")>
</div>

IV. T-Test
- Null hypothesis: the average number of ladybugs in one state is 92.
- Alternative hypothesis: the average number of ladybugs found in one state is different than 92.
- Conclusion: There is not enough evidence to conclude that the average number of ladybugs recorded in one state is different than 92.
```
        One Sample t-test

data:  data$n
t = -0.012421, df = 6, p-value = 0.9905
alternative hypothesis: true mean is not equal to 92
95 percent confidence interval:
 -49.42637 231.99780
sample estimates:
mean of x 
 91.28571 
```