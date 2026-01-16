---
description: Otomatisasi pengecekan TinyTeX dan kompilasi Bookdown ke PDF.
---

---

name: build-pdf
description: Otomatisasi pengecekan TinyTeX dan kompilasi Bookdown ke PDF.
trigger: /buildpdf

---

# Workflow: Build Book to PDF

Step 1: **Check & Install TinyTeX**

- Use 'R Interactive' Terminal
- Check if `tinytex` package is installed in R **using that terminal**.
- If not, install `tinytex` and run `tinytex::install_tinytex()`.
<!-- Penjelasan: PDF membutuhkan distribusi LaTeX. TinyTeX adalah versi ringan khusus pengguna R. Agen harus memastikan ini ada sebelum mencoba render agar tidak error di tengah jalan. -->

Step 2: **Clean Previous Builds**

- Execute `bookdown::clean_book(TRUE)` via terminal R command.
<!-- Penjelasan: Seringkali sisa file cache (.rds) lama menyebabkan konflik saat membuat PDF baru. Membersihkan cache menjamin "clean build". -->

Step 3: **Render Book**

- Execute command: `bookdown::render_book('index.Rmd', 'bookdown::pdf_book')`.
<!-- Penjelasan: Ini adalah fungsi inti. Kita secara spesifik memanggil format 'pdf_book' agar tidak menimpa output HTML GitHub Pages Anda secara tidak sengaja. -->

Step 4: **Verify Output**

- Check if the `.pdf` file exists in the `_book/` or output directory.
- Open the PDF file artifacts for user review.
     <!-- Penjelasan: Agen harus memverifikasi keberhasilan bukan hanya dari exit code 0, tapi dari keberadaan file fisik. -->
  Cara Menggunakan:
