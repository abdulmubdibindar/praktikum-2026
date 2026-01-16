---
trigger: always_on
---

---

name: r-bookdown-standards
description: Standar penulisan RMarkdown untuk Bookdown agar kompatibel dengan output PDF/LaTeX.

---

# RMarkdown & Bookdown Standards

1. **Chunk Labeling:**

   - Always give unique labels to every code chunk.
   <!-- Penjelasan: LaTeX sering gagal mengompilasi jika ada chunk label duplikat, terutama saat membuat referensi silang grafik/tabel. -->

2. **Figure/Table Paths:**

   - Use `knitr::include_graphics()` for images.
   - Ensure all file paths are relative to the project root.
   <!-- Penjelasan: PDF output membutuhkan path gambar yang sangat spesifik agar LaTeX bisa menemukannya saat proses compiling. -->

3. **Dependency Management (renv):**

   - Before adding new libraries, check if `renv` is active.
   - Do not use absolute paths for libraries.
   <!-- Penjelasan: Menjaga lingkungan R tetap terisolasi agar buku bisa dikompilasi ulang di mesin lain tanpa error versi paket. -->

4. **Knitr Options:**
   - Set `echo = FALSE` by default for the book output unless instructed otherwise.
   - Set `fig.pos = 'H'` for PDF outputs.
   <!-- Penjelasan: 'fig.pos = H' memaksa posisi gambar di PDF agar tidak "melayang" ke halaman acak, masalah umum di LaTeX. -->
