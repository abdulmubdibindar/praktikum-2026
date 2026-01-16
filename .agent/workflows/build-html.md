---
description: Kompilasi Bookdown ke format HTML (GitBook) untuk web.
---

---

name: build-html
description: Kompilasi Bookdown ke format HTML (GitBook) untuk web.
trigger: /buildhtml

---

# Workflow: Build Book to HTML

Step 1: **Clean & Prepare**

- Use 'R Interactive' Terminal
- Execute `bookdown::clean_book(TRUE)` in that terminal to remove old cache files.
<!-- Penjelasan: HTML statis sangat bergantung pada tautan antar-bab. Membersihkan cache lama mencegah "broken link" atau konten hantu yang sudah dihapus tapi masih muncul di navigasi. -->

Step 2: **Render to GitBook**

- Execute command: `bookdown::render_book('index.Rmd', 'bookdown::gitbook')`.
<!-- Penjelasan: Kita menargetkan 'gitbook' secara eksplisit. Jika Anda menggunakan tema lain (seperti bs4_book), ganti bagian ini. Ini memisahkan proses ini dari build PDF agar tidak saling menimpa di folder output sementara. -->

Step 3: **Browser Verification**

- Check if `_docs/index.html` exists.
- Open the generated `index.html` file in the browser using the browser tool.
<!-- Penjelasan: Alih-alih hanya mengecek file ada/tidak, kita menyuruh agen membuka browser internal Antigravity. Ini memungkinkan Anda langsung melihat apakah CSS atau gambar tampil dengan benar tanpa meninggalkan IDE. -->
