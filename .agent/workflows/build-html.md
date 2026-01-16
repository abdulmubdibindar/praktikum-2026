---
description: Kompilasi Bookdown ke format HTML (GitBook) untuk web.
---

---

name: build-html
description: Build HTML menggunakan terminal radian.
trigger: /build-html

---

# Workflow: Build Book to HTML (Radian)

Step 1: **Clean via Radian**

- Execute command: `echo "bookdown::clean_book(TRUE)" | radian`

Step 2: **Render GitBook via Radian**

- Execute command: `echo "bookdown::render_book('index.Rmd', 'bookdown::gitbook')" | radian`
<!-- Penjelasan: Menggunakan radian akan memberikan log yang lebih berwarna dan mudah dibaca di terminal Antigravity dibandingkan Rscript standar. -->

Step 3: **Preview**

- Open the generated `index.Rmd` (html output) in the browser to verify.
