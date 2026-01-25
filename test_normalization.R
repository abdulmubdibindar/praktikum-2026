# Test script sederhana untuk cek apakah fix berhasil
library(tidyverse)

cat("Testing regex patterns...\n\n")

# Test data
test_tingkat <- c(
    "1 (Semester 1 -  semester 2)",
    "2 (Semester 3 - Semester 4)",
    "3 (Semester 5 - Semester 6)",
    "4 (Semester 7 - Semester 8)"
)

test_uang <- c(
    "< 1 jt",
    "1 jt - 2jt",
    "2,1 jt - 3 jt",
    "3,1 jt - 4 jt",
    "> 4 jt"
)

# Expected levels
tingkat_levels <- c(
    "1 (Semester 1 s.d. Semester 2)",
    "2 (Semester 3 s.d. Semester 4)",
    "3 (Semester 5 s.d. Semester 6)",
    "4 (Semester 7 s.d. Semester 8)"
)

uang_saku_levels <- c(
    "< 1 jt", "1 jt s.d. 2 jt", "2,1 jt s.d. 3 jt",
    "3,1 jt s.d. 4 jt", "> 4 jt"
)

# Test normalization for Tingkat Semester
cat("TINGKAT SEMESTER NORMALIZATION:\n")
cat("Original -> Normalized\n")
result_tingkat <- test_tingkat |>
    str_replace_all(" - ", " s.d. ") |>
    str_replace_all(" \u2013 ", " s.d. ") |>
    str_replace_all("\\s+", " ") |>
    str_replace_all("semester", "Semester")

for (i in 1:length(test_tingkat)) {
    cat(sprintf("'%s' -> '%s'\n", test_tingkat[i], result_tingkat[i]))
}

cat("\n\nUANG SAKU NORMALIZATION:\n")
cat("Original -> Normalized\n")
result_uang <- test_uang |>
    str_replace_all(" - ", " s.d. ") |>
    str_replace_all(" \u2013 ", " s.d. ") |>
    str_replace_all("(\\d)jt", "\\1 jt")

for (i in 1:length(test_uang)) {
    cat(sprintf("'%s' -> '%s'\n", test_uang[i], result_uang[i]))
}

# Test factor creation
cat("\n\nFACTOR CREATION TEST:\n")
df_test <- data.frame(
    Tingkat.Semester = test_tingkat,
    Uang.Saku = test_uang,
    stringsAsFactors = FALSE
)

df_test <- df_test |>
    mutate(
        Tingkat.Semester = str_replace_all(Tingkat.Semester, " - ", " s.d. "),
        Tingkat.Semester = str_replace_all(Tingkat.Semester, " \u2013 ", " s.d. "),
        Tingkat.Semester = str_replace_all(Tingkat.Semester, "\\s+", " "),
        Tingkat.Semester = str_replace_all(Tingkat.Semester, "semester", "Semester"),
        
        Uang.Saku = str_replace_all(Uang.Saku, " - ", " s.d. "),
        Uang.Saku = str_replace_all(Uang.Saku, " \u2013 ", " s.d. "),
        Uang.Saku = str_replace_all(Uang.Saku, "(\\d)jt", "\\1 jt"),
        
        Tingkat.Semester = factor(Tingkat.Semester, levels = tingkat_levels, ordered = TRUE),
        Uang.Saku = factor(Uang.Saku, levels = uang_saku_levels, ordered = TRUE)
    )

cat("\nTingkat.Semester NA count:", sum(is.na(df_test$Tingkat.Semester)), "/ Should be 0\n")
cat("Uang.Saku NA count:", sum(is.na(df_test$Uang.Saku)), "/ Should be 0\n")

if (sum(is.na(df_test$Tingkat.Semester)) == 0 && sum(is.na(df_test$Uang.Saku)) == 0) {
    cat("\n✓ SUCCESS: All values converted to factors successfully!\n")
} else {
    cat("\n✗ FAILED: Some values could not be converted\n")
    cat("Tingkat.Semester values:\n")
    print(df_test$Tingkat.Semester)
    cat("\nUang.Saku values:\n")
    print(df_test$Uang.Saku)
}
