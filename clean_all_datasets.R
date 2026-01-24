# Script Master untuk menjalankan pembersihan semua dataset sekaligus
# dan menghasilkan laporan ringkasan

library(tidyverse)

cat("\n")
cat("==============================================================\n")
cat("   SCRIPT MASTER PEMBERSIHAN DATASET MAHASISWA               \n")
cat("   ITERA, UNILA, UBL, dan UINRIL                           \n")
cat("==============================================================\n\n")

# Simpan output ke file laporan
sink("cleaning_summary.txt")

cat("LAPORAN PEMBERSIHAN DATASET\n")
cat("Waktu:", format(Sys.time(), "%Y-%m-%d %H:%M:%S"), "\n")
cat("==============================================================\n\n")

# 1. Jalankan script ITERA
cat("\n### DATASET ITERA ###\n\n")
source("clean_data_itera.R")

# 2. Jalankan script UNILA
cat("\n\n### DATASET UNILA ###\n\n")
source("clean_data_unila.R")

# 3. Jalankan script UBL
cat("\n\n### DATASET UBL ###\n\n")
source("clean_data_ubl.R")

# 4. Jalankan script UINRIL
cat("\n\n### DATASET UINRIL ###\n\n")
source("clean_data_uinril.R")

# 5. Buat ringkasan perbandingan
cat("\n\n==============================================================\n")
cat("RINGKASAN HASIL PEMBERSIHAN\n")
cat("==============================================================\n\n")

# Load semua dataset yang sudah dibersihkan
data_itera_clean <- read.csv("datasets/DataUtama_mhsITERA.csv")
data_unila_clean <- read.csv("datasets/DataUtama_mhsUNILA.csv")
data_ubl_clean <- read.csv("datasets/DataUtama_mhsUBL.csv")
data_uinril_clean <- read.csv("datasets/DataUtama_mhsUINRIL.csv")

cat("1. DIMENSI DATASET\n")
cat(
    "   - ITERA :", nrow(data_itera_clean), "baris x",
    ncol(data_itera_clean), "kolom\n"
)
cat(
    "   - UNILA :", nrow(data_unila_clean), "baris x",
    ncol(data_unila_clean), "kolom\n"
)
cat(
    "   - UBL   :", nrow(data_ubl_clean), "baris x",
    ncol(data_ubl_clean), "kolom\n"
)
cat(
    "   - UINRIL:", nrow(data_uinril_clean), "baris x",
    ncol(data_uinril_clean), "kolom\n"
)

cat("\n2. VERIFIKASI MISSING VALUES\n")
cat("   - ITERA : Total NA =", sum(is.na(data_itera_clean)), "\n")
cat("   - UNILA : Total NA =", sum(is.na(data_unila_clean)), "\n")
cat("   - UBL   : Total NA =", sum(is.na(data_ubl_clean)), "\n")
cat("   - UINRIL: Total NA =", sum(is.na(data_uinril_clean)), "\n")

cat("\n3. STRUKTUR KOLOM\n")
cat(
    "   - ITERA:", paste(colnames(data_itera_clean), collapse = ", "),
    "\n\n"
)
cat(
    "   - UNILA:", paste(colnames(data_unila_clean), collapse = ", "),
    "\n\n"
)
cat(
    "   - UBL  :", paste(colnames(data_ubl_clean), collapse = ", "),
    "\n\n"
)

cat("\n4. VARIABEL KATEGORIS (FACTOR)\n")
cat("   ITERA:\n")
str_itera <- sapply(data_itera_clean, class)
factor_cols_itera <- names(str_itera[str_itera == "factor"])
cat("   ", paste(factor_cols_itera, collapse = ", "), "\n\n")

cat("   UNILA:\n")
str_unila <- sapply(data_unila_clean, class)
factor_cols_unila <- names(str_unila[str_unila == "factor"])
cat("   ", paste(factor_cols_unila, collapse = ", "), "\n\n")

cat("   UBL:\n")
str_ubl <- sapply(data_ubl_clean, class)
factor_cols_ubl <- names(str_ubl[str_ubl == "factor"])
cat("   ", paste(factor_cols_ubl, collapse = ", "), "\n\n")

cat("   UINRIL:\n")
str_uinril <- sapply(data_uinril_clean, class)
factor_cols_uinril <- names(str_uinril[str_uinril == "factor"])
cat("   ", paste(factor_cols_uinril, collapse = ", "), "\n\n")

cat("\n==============================================================\n")
cat("PEMBERSIHAN SELESAI\n")
cat("File output:\n")
cat("  - datasets/DataUtama_mhsITERA.csv\n")
cat("  - datasets/DataUtama_mhsUNILA.csv\n")
cat("  - datasets/DataUtama_mhsUBL.csv\n")
cat("  - datasets/DataUtama_mhsUINRIL.csv\n")
cat("==============================================================\n\n")

# Tutup sink
sink()

# Tampilkan juga di console
cat("\n\n")
cat("==============================================================\n")
cat("   PEMBERSIHAN SEMUA DATASET SELESAI!                        \n")
cat("==============================================================\n\n")
cat("File output tersimpan di:\n")
cat("  1. datasets/DataUtama_mhsITERA.csv\n")
cat("  2. datasets/DataUtama_mhsUNILA.csv\n")
cat("  3. datasets/DataUtama_mhsUBL.csv\n")
cat("  4. datasets/DataUtama_mhsUINRIL.csv\n\n")
cat("Laporan lengkap tersimpan di: cleaning_summary.txt\n\n")
