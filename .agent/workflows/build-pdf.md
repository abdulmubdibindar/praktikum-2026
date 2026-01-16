---
description: Otomatisasi pengecekan TinyTeX dan kompilasi Bookdown ke PDF.
---

---

name: build-pdf
description: Build PDF menggunakan terminal radian.
trigger: /build-pdf

---

# Workflow: Build Book to PDF (Radian)

Step 1: **Clean via Radian**

- Execute command: `echo "bookdown::clean_book(TRUE)" | radian`
<!-- Penjelasan: Kita menggunakan 'echo ... | radian' untuk mengirim perintah ke radian dan langsung mengeksekusinya tanpa masuk ke mode interaktif yang bisa memacetkan Agen. -->

Step 2: **Render PDF via Radian**

- Execute command: `echo "tinytex::install_tinytex(); bookdown::render_book('index.Rmd', 'bookdown::pdf_book')" | radian`
<!-- Penjelasan: Memastikan tinytex siap, lalu merender PDF. Output akan tampil dengan pewarnaan syntax highlighting khas radian di terminal. -->

Step 3: **Open PDF Artifact**

- Check for the `.pdf` file in output directory and open it with the browser tool.
