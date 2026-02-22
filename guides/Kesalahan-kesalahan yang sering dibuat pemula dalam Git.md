# 10 Kesalahan Pemula yang Sering Terjadi dalam Penggunaan Git dan Cara Mengatasinya (Workaround)

Bagi pemula, Git bisa menjadi alat yang sangat membingungkan pada awalnya. Banyak masalah yang sering dihadapi karena belum terbiasa dengan alur kerjanya. Berikut adalah 10 kesalahan paling umum yang sering dibuat pemula saat menggunakan Git beserta cara untuk mengatasinya (_workaround_).

## 1. Terjebak di Editor Vim (Tidak Bisa Keluar saat Commit)

**Masalah:** Saat menjalankan `git commit` tanpa parameter `-m`, Git otomatis membuka editor teks (biasanya Vim) di terminal, dan banyak pemula yang bingung bagaimana cara keluar dari editor tersebut.
**Workaround:**

- Tekan tombol `Esc` di keyboard.
- Ketik `:wq` lalu tekan `Enter` (untuk menyimpan pesan dan keluar).
- Jika tidak ingin menyimpan atau membatalkan commit, tekan `Esc`, ketik `:q!` lalu tekan `Enter`.
- _Tips tambahan:_ Ubah editor default Git menjadi VS Code agar lebih mudah: `git config --global core.editor "code --wait"`.

## 2. Commit ke Branch yang Salah (Misal ke `main` atau `master`)

**Masalah:** Anda membuat banyak perubahan dan mem-commit-nya, lalu baru sadar bahwa Anda sedang berada di branch `main` (seharusnya membuat branch fitur baru).
**Workaround:**

- Jika **belum di-commit** tapi sudah diubah: Jalankan `git stash` (untuk menyimpan sementara perubahan), pindah ke branch baru `git checkout -b branch-baru`, lalu kembalikan perubahan dengan `git stash pop`.
- Jika **sudah di-commit** (tapi belum push):
  1. Pindah ke branch baru dengan membawa commit tersebut: `git branch branch-baru`
  2. Kembalikan branch utama ke satu commit sebelumnya: `git reset HEAD~1 --hard`
  3. Pindah ke branch baru: `git checkout branch-baru`.

## 3. Lupa `git pull` Sebelum `git push`

**Masalah:** Anda langsung melakukan `git push` setelah selesai bekerja, dan tiba-tiba Git menolak (_rejected_) karena ada perubahan baru di remote repository yang belum Anda tarik (_pull_).
**Workaround:**

- Tarik perubahan terbaru dari server menggunakan `git pull`.
- Sangat disarankan untuk menggunakan `git pull --rebase` agar struktur histori commit tetap rapi tanpa merge commit yang tidak penting.
- Selesaikan konflik (jika ada), lalu lakukan `git push` kembali.

## 4. Panik Menghadapi Merge Conflict

**Masalah:** Saat melakukan pull atau merge, Git memberikan peringatan _Merge Conflict_. Pemula sering panik dan takut kode mereka rusak.
**Workaround:**

- Tenang dan jangan panik. Git tidak merusak kode Anda, ia hanya bingung memilih versi mana yang benar karena baris kode yang sama diubah oleh dua orang berbeda.
- Buka file yang konflik (biasanya ditandai berwarna merah di editor Anda).
- Cari penanda `<<<<<<< HEAD`, `=======`, dan `>>>>>>>`.
- Hapus baris penanda tersebut, pilih kode yang ingin dipertahankan atau gabungkan secara manual.
- Setelah selesai, jalankan `git add <file>` lalu `git commit`.

## 5. Menambahkan File Sampah/Rahasia ke Repository (Lupa `.gitignore`)

**Masalah:** Menggunakan `git add .` dan tanpa sengaja memasukkan file yang tidak perlu (seperti `node_modules/`, log, atau `.env` berisi password).
**Workaround:**

- Jika **belum di-commit**: Batalkan staging dengan `git restore --staged <nama-file>`.
- Jika **sudah di-commit** tapi belum di-push: Keluarkan dari tracking Git dengan menjalankan `git rm --cached -r <nama-file_atau_folder>`. Kemudian pastikan Anda menambahkan nama file/folder tersebut ke dalam file `.gitignore` dan lakukan commit ulang.

## 6. Membuat "Monster Commit"

**Masalah:** Pemula sering kali menunda-nunda commit. Hasilnya, satu commit berisi perubahan ratusan file dengan banyak fitur yang berbeda sekaligus. Ini menyulitkan jika ada bug dan fitur harus di-_revert_.
**Workaround:**

- Pisahkan perubahan logis ke dalam beberapa commit.
- Gunakan perintah `git add -p` (patch). Perintah ini memungkinkan Anda meninjau setiap bongkahan kode (hunk) yang diubah dan memilih mana saja yang mau di-staging untuk commit ini dan mana yang ditunda ke commit berikutnya.

## 7. Menulis Pesan Commit yang Buruk

**Masalah:** Menggunakan pesan commit seperti "update", "fix bug", "bismillah fix", atau "." yang membuat orang lain (dan diri sendiri di masa depan) bingung tentang apa yang diubah.
**Workaround:**

- Jika sudah terlanjur untuk commit terakhir, perbaiki pesannya menggunakan `git commit --amend -m "Pesan baru yang lebih jelas"`.
- Biasakan menggunakan gaya penulisan _Conventional Commits_, contoh: `feat: menambahkan fitur login` atau `fix: memperbaiki error pada perhitungan diskon`.

## 8. Mengubah Histori Commit yang Sudah di-Push (`--amend` atau `reset`)

**Masalah:** Anda menggunakan `git commit --amend` untuk memperbaiki commit Anda, lalu melakukan `git push` dan ternyata ditolak karena histori lokal dan remote sudah berbeda.
**Workaround:**

- **Aturan Emas:** JANGAN PERNAH mengubah histori commit (`amend`, `reset`, `rebase`) jika commit tersebut sudah di-push dan digunakan oleh orang lain.
- Jika Anda satu-satunya yang bekerja di remote branch tersebut, Anda bisa memaksa dengan `git push --force`.
- Namun, jauh lebih aman jika Anda membuat commit baru dengan pesan "Fix typo in previous commit" daripada harus melakukan `--force` origin push.

## 9. Menghapus File Secara Tidak Sengaja dengan Git Clean atau Reset Hard

**Masalah:** Terlalu gegabah menggunakan perintah `git reset --hard` atau `git clean -fd` dan menyadari semua pekerjaan yang belum di-commit hilang total.
**Workaround:**

- Jika file belum pernah di-add atau di-commit, sayangnya file tersebut kemungkinan besar hilang selamanya. Git tidak melacak file tersebut.
- Jika file **pernah di-commit**, Anda bisa menyelamatkannya dengan `git reflog`. Cari hash commit terakhir tempat kode Anda masih ada, lalu kembalikan dengan `git checkout <hash>`.

## 10. `git init` di Dalam Repository Git Lain (Nested Git)

**Masalah:** Menjalankan `git init` di dalam folder proyek yang sebenarnya sudah merupakan bagian dari sebuah repository Git, menyebabkan Git bingung melacak jejak sub-folder tersebut.
**Workaround:**

- Tampilkan folder tersembunyi (hidden folders) di sistem operasi Anda.
- Masuk ke folder yang salah di-init, lalu **hapus folder `.git`** di dalam folder anak tersebut.
- _Catatan:_ Perhatikan baik-baik agar Anda menghapus folder `.git` milik folder anak yang salah, _bukan_ folder `.git` milik proyek utama.
