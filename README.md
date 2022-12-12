# Project-Insect-Carnivore

## It's Coming Home team members:
Viet Anh Nguyen, 

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



