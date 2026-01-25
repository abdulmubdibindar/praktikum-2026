# Diagnostic script untuk mengecek data UNILA
library(tidyverse)

# Read backup file
data <- read.csv("datasets/_DataUtama_mhsUNILA.csv", sep = ";", stringsAsFactors = FALSE)

cat("=== DIAGNOSIS DATA UNILA ===\n\n")

cat("1. Struktur data:\n")
str(data)

cat("\n2. Nama kolom:\n")
print(colnames(data))

cat("\n3. Tingkat Semester - unique values:\n")
print(unique(data$`Tingkat Semester`))

cat("\n4. Uang Saku - unique values:\n")
print(unique(data$`Uang Saku`))

cat("\n5. jara (jarak) - summary:\n")
print(summary(as.numeric(data$jara)))

cat("\n6. Missing values per column:\n")
print(colSums(is.na(data)))

cat("\n7. Empty strings per column:\n")
empty_counts <- sapply(data, function(x) sum(x == "", na.rm = TRUE))
print(empty_counts[empty_counts > 0])
