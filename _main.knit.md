---
title: "Modul Praktik Statistika Untuk Perencanaan"
subtitle: "Penggunaan R dalam Pengolahan Data Kuantitatif"
site: bookdown::bookdown_site
output:
    bookdown::gitbook:
        css: style.css
        split_bib: false
    bookdown::pdf_book:
        latex_engine: xelatex
        citation_package: natbib
        keep_tex: true
        pandoc_args: ["--lua-filter=capaian.lua"]
        includes:
            in_header: preamble.tex
bibliography: referensi.bib
biblio-title: "Referensi"
link-citations: true
---



# Pengantar {.unnumbered}

Selamat datang di modul daring Praktikum Statistika untuk Perencanaan. Modul ini digunakan untuk mendampingi kalian mengikuti Praktikum dalam mata kuliah Statistika untuk Perencanaan, mata kuliah di Program Studi Perencanaan Wilayah dan Kota, Institut Teknologi Sumatera.

Modul praktikum ini akan mendampingi Anda mempelajari pengolahan statistik menggunakan bahasa pemrograman R. Untuk itu, modul ini terbagi menjadi **9 modul** yang disusun secara bertahap, dimulai dari pengenalan dasar hingga analisis multivariat:

| Modul |                   Topik                    |                                      Deskripsi Singkat                                       |
| :---: | :----------------------------------------: | :------------------------------------------------------------------------------------------: |
|   1   |        Pengolahan Data Terstruktur         | Dasar *data wrangling*: Impor, seleksi, standardisasi, penggabungan, dan ekspor data/dataset |
|   2   |           Statistika Deskriptif            |                 Perhitungan proporsi, mean, median, standar deviasi, dan IQV                 |
|   3   |              Visualisasi Data              |        Pembuatan grafik dengan `ggplot2`: bar chart, histogram, boxplot, scatter plot        |
|   4   | Distribusi Sampling & Interval Kepercayaan |                  Simulasi sampling, standard error, dan estimasi parameter                   |
|   5   |               Uji Hipotesis                |                 Uji hipotesis 1 dan 2 populasi untuk rata-rata dan proporsi                  |
|   6   |         Korelasi Nominal & Ordinal         |                            Koefisien V Cramer, Lambda, dan Gamma                             |
|   7   |              Korelasi Metrik               |                            Koefisien Spearman's ρ dan Pearson's r                            |
|   8   |               Regresi Linear               |                            Regresi linear sederhana dan berganda                             |
|   9   |         Analisis Komponen Prinsip          |                                   PCA dan Analisis Faktor                                    |

Setiap modul dilengkapi dengan **capaian pembelajaran**, **contoh kode**, dan **soal latihan** yang harus dikerjakan.

------------------------------------------------------------------------

# Pengenalan R dan RStudio {.unnumbered}

Selamat datang di dunia pengolahan data yang lebih canggih! Dalam praktikum ini, kalian akan berkenalan dengan teknik pengolahan dan analisis data dengan menggunakan bahasa pemrograman bernama R. R adalah bahasa pemrograman yang dibuat khusus untuk keperluan analisis statistik.

## Apa itu R?

R adalah lingkungan perangkat lunak (*software environment*) dan bahasa pemrograman yang digunakan untuk komputasi statistik dan grafik. R dikembangkan oleh Ross Ihaka dan Robert Gentleman di Universitas Auckland, Selandia Baru, pada awal tahun 1990-an sebagai evolusi dari bahasa S yang sebelumnya dikembangkan di Bell Laboratories [@history_overview_r]. R bersifat *open-source* (berlisensi GNU GPL), yang berarti dapat digunakan secara gratis dan dikembangkan secara kolaboratif oleh komunitas global [@r_wikipedia].

Keunggulan utama R dalam konteks perencanaan dan pemerintahan meliputi:

1.  **Ekosistem Paket yang Luas**: R memiliki puluhan ribu paket (*packages*) di CRAN untuk berbagai keperluan, mulai dari manipulasi data, pemodelan statistik, hingga analisis geospasial menggunakan `sf` dan `terra` [@spatial_r_sf; @spatial_data_science_terra].
2.  **Visualisasi Data**: Dengan paket seperti `ggplot2` dan `Shiny`, R memungkinkan pembuatan grafik berkualitas tinggi dan dashboard interaktif yang informatif [@shiny_gallery].
3.  **Dukungan Kebijakan Berbasis Data**: R mendukung implementasi kebijakan "Satu Data Indonesia" dengan kemampuan standardisasi, interoperabilitas, dan transparansi metode analisis yang dapat diaudit [@satu_data_local_govt]. R memfasilitasi proses ETL (*Extract-Transform-Load*) otomatis untuk membersihkan data dari berbagai instansi [@r_public_data].

Dalam bidang perencanaan wilayah dan kota, R digunakan untuk:

-   **Analisis Geospasial**: Mengelola data vektor dan raster untuk pemetaan dan pemodelan lingkungan [@spatial_data_science_terra].
-   **Perencanaan Transportasi**: Menggunakan paket seperti `stplanr` untuk analisis jaringan, rute, dan pemodelan transportasi berkelanjutan [@stplanr_cran; @sustainable_transport_stplanr].
-   **Simulasi Kebijakan**: Melakukan simulasi dampak kebijakan publik, seperti perubahan penggunaan lahan atau intervensi sosial, sebelum diterapkan secara nyata [@simulation_public_policies].

## Mengapa Menggunakan R?

R memiliki kelebihan yang signifikan dibandingkan dengan alat analisis berbasis antarmuka grafis (*Graphical User Interface* - GUI) seperti SPSS atau Microsoft Excel. Berikut adalah beberapa alasan utama mengapa R menjadi standar de facto dalam sains data modern:

1.  **Reproduksibilitas (*Reproducibility*)**:
    Berbeda dengan perangkat lunak berbasis *point-and-click* di mana langkah-langkah analisis seringkali sulit dilacak kembali, R bekerja berbasis skript (*script-based*). Setiap langkah analisis, mulai dari pembersihan data hingga pembuatan model, terekam secara eksplisit dalam kode. Hal ini memungkinkan analisis untuk diverifikasi, diaudit, dan dijalankan ulang oleh orang lain (atau diri kita sendiri di masa depan) dengan hasil yang identik, sebuah prinsip fundamental dalam penelitian ilmiah yang kredibel [@peng2011reproducible; @gandrud2013reproducible].

2.  **Fleksibilitas dan Kemampuan Kostumisasi**:
    R tidak membatasi pengguna pada menu yang sudah tersedia. Sebagai bahasa pemrograman, R memungkinkan kita untuk membangun alat analisis sendiri atau memodifikasi metode yang sudah ada sesuai dengan kebutuhan spesifik penelitian, memberikan fleksibilitas yang hampir tak terbatas dibandingkan perangkat lunak tertutup (*proprietary*) [@wickham2016r].

3.  **Gratis dan *Open Source***:
    Sebagai perangkat lunak *open source*, R dapat digunakan sepenuhnya secara gratis. Ini menghilangkan hambatan biaya lisensi yang mahal yang sering ditemui pada perangkat lunak komersial, membuatnya sangat aksesibel bagi mahasiswa, peneliti, dan pemerintah daerah dengan anggaran terbatas.

4.  **Komunitas yang Masif**:
    Dukungan komunitas R sangat luar biasa melalui platform seperti StackOverflow dan R-Bloggers. Jika Anda menemui masalah, kemungkinan besar orang lain sudah pernah menghadapinya dan solusinya sudah tersedia secara daring.

## Apa itu RStudio?

RStudio (yang kini bertransformasi menjadi **Posit**) adalah *Integrated Development Environment* (IDE) untuk R. Diluncurkan pertama kali pada tahun 2009, RStudio menyediakan antarmuka visual yang lebih ramah pengguna dibandingkan antarmuka baris perintah (*command line*) asli R [@about_posit]. Fitur-fitur seperti penyorotan sintaksis (*syntax highlighting*), *auto-completion*, dan manajemen *workspace* membuat pengguna baru lebih mudah mempelajari dan menggunakan R. Transformasi menjadi Posit mencerminkan komitmen terhadap ekosistem *data science* modern yang lebih luas, termasuk dukungan untuk Python [@goodbye_rstudio].

Gambar \@ref(fig:jendela-rstudio) memberikan penjelasan singkat tentang tampilan jendela RStudio yang terdiri atas 4 panel.

<div class="figure" style="text-align: center">
<img src="images/jendela_rstudio.png" alt="Bagian-bagian jendela RStudio" width="926" />
<p class="caption">(\#fig:jendela-rstudio)Bagian-bagian jendela RStudio</p>
</div>

1.  Panel *Environment* yang menampilkan daftar data atau variabel yang telah kita impor atau buat.
2.  Panel *Files, Plots, dan Help*, tempat kita melihat daftar *file* yang tersedia, grafik yang dihasilkan, dan menemukan dokumen bantuan untuk berbagai bagian dari R.
3.  Panel *Console*, digunakan untuk menjalankan kode.
4.  Panel *Script*, digunakan untuk menulis kode. Di sinilah kita akan menghabiskan sebagian besar waktu kerja kita.

## Instalasi R dan RStudio

Sebelum memulai praktikum, kalian perlu menginstal R dan RStudio terlebih dahulu. R harus diinstal **sebelum** RStudio, karena RStudio memerlukan instalasi R yang berfungsi untuk dapat berjalan.

**Langkah 1: Instalasi R**

1. Kunjungi situs resmi CRAN di **[cran.r-project.org](https://cran.r-project.org)**
2. Pilih sistem operasi Anda (Windows/macOS/Linux)
3. Untuk **Windows**: Klik "base" lalu unduh installer terbaru
4. Untuk **macOS**: Pilih versi sesuai prosesor (Apple Silicon M1/M2/M3/M4/M5 atau Intel)
5. Jalankan file installer dan ikuti petunjuk hingga selesai

**Langkah 2: Instalasi RStudio**

1. Kunjungi situs resmi Posit di **[posit.co/downloads](https://posit.co/downloads)**
2. Unduh **RStudio Desktop** versi gratis sesuai sistem operasi Anda
3. Jalankan installer dan ikuti petunjuk hingga selesai

**Verifikasi**: Buka RStudio setelah instalasi selesai. RStudio akan otomatis mendeteksi instalasi R yang sudah ada.

## Cara Menjalankan R

Cara (paling) utama untuk menjalankan perintah bahasa pemrograman R adalah dengan mengetikkannya langsung di **Console** (jendela nomor 3 pada Gambar \@ref(fig:jendela-rstudio)).

Misalnya, jika Anda mengetikkan `1 + 1` di Console lalu menekan **Enter**, R akan langsung memberikan jawabannya.

::: rmdexercise
**Aktivitas Mandiri: Halo Dunia**

Cobalah ketik perintah berikut di Console, lalu tekan Enter:

`print("Halo dunia!")`

Selamat! Anda baru saja menjalankan kode R pertama Anda.
:::

Namun, mengetik satu per satu di Console akan melelahkan jika perintahnya banyak. Oleh karena itu, kita biasanya menulis kode dalam sebuah file *source code* (ekstensi `.R`).

### Membuat File Kode Sumber R (`.R`)

File kode sumber R (berekstensi `.R`) adalah dokumen teks yang berisi rangkaian perintah R yang dapat disimpan, diedit, dan dijalankan berulang kali. Ini adalah cara profesional dalam bekerja dengan R, karena kode kita menjadi **terdokumentasi**, **dapat direproduksi**, dan **mudah dibagikan**.

**Langkah-langkah membuat file `.R` baru:**

1. Di RStudio, pilih menu **File → New File → R Script** (atau tekan **Ctrl + Shift + N** di Windows/Linux, **Cmd + Shift + N** di Mac)
2. Sebuah tab baru akan muncul di panel *Script* (jendela kiri atas)
3. Ketikkan kode R Anda di dalam tab tersebut
4. Simpan file dengan memilih **File → Save** (atau **Ctrl + S** / **Cmd + S**)
5. Beri nama file dengan ekstensi `.R`, misalnya `kode_R_pertama_saya.R`

**Menjalankan kode dari file `.R`:**

Untuk menjalankan kode dari file `.R` ke Console tanpa mengetik ulang:

1. Sorot (blok) baris kode yang ingin dijalankan di panel *Script*
2. Tekan kombinasi tombol **Ctrl + Enter** (Windows/Linux) atau **Cmd + Enter** (Mac)
3. Kode yang disorot akan otomatis dikirim ke *Console* dan dijalankan

Ini adalah cara kerja standar yang efisien dalam menggunakan R. Dengan cara ini, kita bisa:

- **Menyimpan pekerjaan** untuk digunakan di lain waktu
- **Menjalankan ulang** analisis dengan mudah
- **Berbagi kode** dengan rekan kerja atau asisten praktikum
- **Mendokumentasikan** setiap langkah analisis kita

::: rmdexercise
**Aktivitas Mandiri: Membuat Kode Sumber R**

1. Buatlah file R Script baru melalui menu **File → New File → R Script**
2. Ketikkan kode berikut di dalam file tersebut:

``` r
# File kode R pertama saya
# Dibuat pada: [isi dengan tanggal hari ini]

print("Halo dunia!")
print("Hari ini saya mulai belajar R!")

# Operasi matematika sederhana
1 + 1
2 * 3
```

3. Simpan file dengan nama `kode_R_pertama_saya.R` di dalam folder **Praktikum STP 2026**
4. Sorot baris-baris kode `print`, lalu tekan **Ctrl + Enter** (Windows/Linux) atau **Cmd + Enter** (Mac). Setelah itu, sorot baris-baris operasi matematika, lalu tekan **Ctrl + Enter** (Windows/Linux) atau **Cmd + Enter** (Mac) lagi.
5. Perhatikan jendela *Console* - Anda akan melihat hasil eksekusi kode Anda
6. Selamat! Anda baru saja membuat file kode sumber R pertama Anda yang dapat disimpan dan dijalankan kapan saja. Jangan lupa tekan **Ctrl + S** / **Cmd + S** untuk menyimpan file Anda setiap kali Anda selesai mengeditnya.

:::

------------------------------------------------------------------------

# Pengenalan Teknis R {.unnumbered}

Sebelum memulai praktikum dengan set data sesungguhnya, ada baiknya kita memahami beberapa konsep teknis dasar dalam bahasa pemrograman R. Bagian ini merangkum keterampilan-keterampilan dasar yang akan kalian temui tersebar di modul-modul praktikum.

## Pengaturan Direktori

Salah satu keterampilan penting dalam bekerja dengan R adalah mengorganisasi *file* dan data dengan baik. Sepanjang semester ini, kalian akan bekerja dengan berbagai dataset, kode R, dan hasil analisis. Pengaturan direktori yang terstruktur akan memudahkan kalian dalam mengelola semua file tersebut dan memastikan kode dapat berjalan dengan lancar.

### Struktur Direktori yang Ideal

Sebelum memulai praktikum, kalian perlu menyiapkan direktori kerja (*working directory*) yang terorganisir dengan baik. Berikut adalah struktur direktori yang **wajib** kalian gunakan sepanjang semester:

```text
Praktikum STP 2026/
├── Praktikum STP 2026.Rproj
├── datasets/
│   ├── data.csv
│   └── ...
├── output/
│   ├── output_1.xlsx
│   └── ...
├── modul_1.R
└── modul_2.R
```

**Komponen-komponen penting:**

-   **`Praktikum STP 2026.Rproj`**: File RStudio Project yang mengatur *working directory* secara otomatis dan menyimpan *environment* kerja kalian.
-   **`datasets/`**: Folder khusus untuk menyimpan **semua dataset mentah** (file Excel, CSV, atau format lainnya yang kalian terima dari asisten praktikum).
-   **`output/`**: Folder khusus untuk menyimpan **hasil-hasil analisis** seperti file Excel yang sudah diolah, file CSV hasil export, atau grafik yang dihasilkan.
-   **`modul_1.R`, `modul_2.R`, ...**: File-file kode R (script) yang akan kalian buat untuk setiap modul praktikum.

Dengan struktur seperti ini, kode R kalian akan lebih **ringkas** dan **portabel**. Sebagai contoh, untuk membaca data, kalian cukup menulis:

``` r
data <- read.xlsx("datasets/data_penduduk.xlsx")
```

Tanpa perlu menulis *path* lengkap seperti `C:\Users\NamaAnda\Documents\praktikum\data_penduduk.xlsx` yang panjang, rumit, dan berbeda-beda di setiap komputer.

### Membuat dan Mengatur Direktori Praktikum

Ikuti langkah-langkah berikut untuk menyiapkan direktori praktikum kalian:

#### Langkah 1: Membuat Folder Utama

Buatlah sebuah folder di komputer kalian dengan nama **`Praktikum STP 2026`** (sesuai tahun ajaran yang sedang berjalan). Penamaan yang seragam ini **sangat penting** agar asisten praktikum dapat dengan mudah membantu kalian jika terjadi masalah atau kesalahan.

Folder ini akan menjadi **direktori kerja** (*working directory*) kalian selama satu semester penuh.

#### Langkah 2: Membuat Subfolder `datasets` dan `output`

Di dalam folder `Praktikum STP 2026`, buatlah **dua subfolder**:

1.  Subfolder **`datasets`** - untuk menyimpan semua data mentah
2.  Subfolder **`output`** - untuk menyimpan hasil analisis

**Cara membuat folder:**

-   **Di Windows**: Klik kanan di dalam folder `Praktikum STP 2026` → pilih *New* → *Folder* → beri nama `datasets`, lalu ulangi untuk membuat folder `output`
-   **Di Mac/Linux**: Klik kanan di dalam folder `Praktikum STP 2026` → pilih *New Folder* → beri nama `datasets`, lalu ulangi untuk membuat folder `output`

Setiap kali kalian mendapatkan dataset baru untuk praktikum (misalnya file Excel atau CSV dari asisten), **simpanlah di dalam folder `datasets`**. Setiap kali kalian menghasilkan output analisis, **simpanlah di dalam folder `output`**.

#### Langkah 3: Mengubahnya Menjadi RStudio Project

Setelah struktur folder dasar sudah siap, langkah selanjutnya adalah mengubahnya menjadi **RStudio Project**. RStudio Project adalah fitur yang sangat berguna untuk mengelola sesi kerja R kalian.

**Keuntungan RStudio Project:**

1.  **Otomatis mengatur *working directory***: Ketika kalian membuka sebuah Project, RStudio otomatis mengatur *working directory* ke folder tersebut, sehingga kalian tidak perlu menggunakan perintah `setwd()` lagi.

::: rmdnote
Perintah `setwd()` digunakan untuk mengatur *working directory* secara manual. Misalnya, jika kita ingin mengatur *working directory* ke folder `Praktikum STP 2026` yang terletak dalam folder `Documents` pada direktori `C:/Users/NamaAnda/`, kita bisa menggunakan perintah 

```r
setwd("C:/Users/NamaAnda/Documents/Praktikum STP 2026")
```

Namun, jika kita sudah membuat direktori Anda sebagai Project, dalam praktikum ini, kita tidak perlu menggunakan perintah ini lagi.
:::

2.  **Mempertahankan status kerja**: RStudio menyimpan *environment* (variabel, data yang sudah dimuat) sehingga kalian bisa melanjutkan pekerjaan dari tempat terakhir kalian berhenti.
3.  **Memudahkan manajemen path**: Kalian cukup menulis *relative path* (misalnya `datasets/data.xlsx`) tanpa perlu mengetik *path* lengkap yang panjang dan berisiko error.
4.  **Portabilitas**: Project folder bisa dipindahkan ke komputer lain atau dibagikan ke rekan tanpa perlu mengubah kode, karena semua path bersifat relatif.

**Cara membuat RStudio Project:**

1.  Buka RStudio
2.  Pilih menu **File → New Project...**
3.  Pilih **Existing Directory** (karena folder sudah dibuat)
4.  Klik **Browse...** dan cari folder **`Praktikum STP 2026`** yang sudah kalian buat
5.  Klik **Create Project**

Setelah itu, RStudio akan membuat file **`Praktikum STP 2026.Rproj`** di dalam folder kalian. File `.Rproj` ini adalah "pintu masuk" ke Project kalian.

**Setiap kali ingin bekerja**: Cukup *double-click* file **`Praktikum STP 2026.Rproj`** tersebut, dan RStudio akan terbuka dengan *working directory* yang sudah otomatis diatur ke folder praktikum kalian. Kalian siap untuk mulai bekerja!

::: rmdwarning
**Catatan Penting:** Selalu buka RStudio melalui file `.Rproj`, bukan dengan membuka RStudio terlebih dahulu lalu membuka *script*. Ini memastikan *working directory* selalu benar dan kode kalian berjalan sebagaimana mestinya.
:::

### Mengunduh Dataset Praktikum dari GitHub

Setelah struktur direktori dan Project sudah siap, langkah selanjutnya adalah **mengunduh dataset-dataset praktikum** yang akan digunakan sepanjang semester. Semua dataset praktikum disimpan di repository GitHub dan dapat diunduh secara gratis.

::: rmdnote
**Mengapa Dataset Disimpan di GitHub? {.header}**

Dataset praktikum disimpan di GitHub agar:
- Semua mahasiswa mendapatkan dataset yang **sama** dan **terbaru**
- Dataset dapat **diakses kapan saja** tanpa perlu menunggu distribusi dari asisten
- Jika ada pembaruan dataset, kalian bisa **mengunduh ulang** dengan mudah
- Dataset **tidak hilang** meskipun laptop rusak atau file terhapus
:::

#### Langkah-Langkah Mengunduh Dataset

Ikuti langkah-langkah berikut dengan seksama untuk mengunduh folder `datasets/` dari GitHub:

**1. Buka halaman GitHub repository praktikum**

Klik link berikut atau copy-paste ke browser kalian:

**[https://github.com/abdulmubdibindar/praktikum-r-stp](https://github.com/abdulmubdibindar/praktikum-r-stp)**

Kalian akan melihat halaman repository yang berisi semua file praktikum.

**2. Download seluruh repository sebagai file ZIP**

- Di halaman GitHub, cari dan klik tombol hijau **"Code"** di bagian kanan atas
- Pada menu yang muncul, pilih **"Download ZIP"**
- Simpan file ZIP di lokasi yang mudah kalian temukan (misalnya folder **Downloads** atau **Desktop**)
- Tunggu hingga proses download selesai

**3. Ekstrak file ZIP yang sudah didownload**

- Buka folder tempat kalian menyimpan file ZIP (misalnya **Downloads**)
- Klik kanan pada file **`praktikum-r-stp-main.zip`**
- Pilih **"Extract All..."** atau **"Extract Here"** (di Windows)
- Atau untuk Mac/Linux: double-click file ZIP, akan otomatis ter-ekstrak
- Setelah ekstrak selesai, akan muncul folder bernama **`praktikum-r-stp-main`**

**4. Copy folder `datasets` ke dalam Project RStudio kalian**

Ini adalah langkah paling penting! Ikuti dengan teliti:

- Buka folder **`praktikum-r-stp-main`** yang baru diekstrak
- Di dalam folder tersebut, cari folder bernama **`datasets`**
- **Klik kanan** pada folder `datasets`, lalu pilih **"Copy"** (atau tekan `Ctrl + C`)
- Buka folder **`Praktikum STP 2026`** (folder Project RStudio kalian)
- **Klik kanan** di dalam folder tersebut, lalu pilih **"Paste"** (atau tekan `Ctrl + V`)
- Folder `datasets` beserta seluruh isinya sekarang sudah tersalin ke Project kalian

**5. Verifikasi dataset sudah tersimpan dengan benar**

Untuk memastikan dataset sudah tersimpan di lokasi yang benar, buka RStudio (klik file `.Rproj` kalian), lalu jalankan kode berikut di **Console**:


``` r
# Mengecek apakah folder datasets ada di working directory
dir.exists("datasets")
```

Jika hasilnya `TRUE`, berarti folder `datasets` sudah berada di lokasi yang benar! ✓

Selanjutnya, cek isi folder `datasets` dengan kode:


``` r
# Melihat daftar file di dalam folder datasets
list.files("datasets")
```

Kalian akan melihat daftar file-file dataset seperti `Data Praktikum 01.xlsx`, `Data Praktikum 02.xlsx`, `DataUtama_mhsUBL.csv`, dan lain-lain.

::: rmdimportant
**Struktur Folder yang Benar {.header}**

Pastikan struktur folder Project kalian sekarang terlihat seperti ini:

```text
Praktikum STP 2026/           ← Folder Project kalian
├── Praktikum STP 2026.Rproj  ← File Project RStudio
├── datasets/                 ← Folder datasets (HARUS ada di sini!)
│   ├── Data Praktikum 01.xlsx
│   ├── Data Praktikum 02.xlsx
│   ├── Data Praktikum 03.xlsx
│   ├── DataUtama_mhsUBL.csv
│   ├── DataUtama_mhsUINRIL.csv
│   ├── DataUtama_mhsUNILA.csv
│   ├── DataUtama_mhsITERA.csv
│   ├── data_mahasiswa.csv
│   └── ... (file-file dataset lainnya)
├── output/                   ← Folder untuk hasil analisis
└── ... (file .R kalian)
```

**PENTING**: Jika folder `datasets` berada di lokasi lain (misalnya di **Desktop** atau **Downloads**), kode praktikum **tidak akan bisa** membaca dataset. Pastikan folder `datasets` berada **langsung di dalam** folder `Praktikum STP 2026`.
:::

#### Alternatif: Download Dataset Satu per Satu (Tidak Disarankan)

Jika kalian hanya ingin mengunduh satu atau beberapa file dataset tertentu, bisa menggunakan cara berikut:

1. Buka [folder datasets di GitHub](https://github.com/abdulmubdibindar/praktikum-r-stp/tree/main/datasets)
2. Klik nama file dataset yang ingin diunduh (misalnya `Data Praktikum 01.xlsx`)
3. Klik tombol **"Download"** di pojok kanan atas halaman
4. Simpan file tersebut ke dalam folder **`datasets/`** di Project RStudio kalian

> **Catatan**: Cara ini lebih lambat jika kalian perlu banyak file. **Sangat disarankan** menggunakan cara download ZIP untuk mendapatkan **semua dataset sekaligus** agar tidak perlu download berulang-ulang.

#### Troubleshooting: Jika Kode Tidak Bisa Membaca Dataset

Jika kalian mengalami error seperti:

```
Error in file(file, "rt") : cannot open the connection
```

Kemungkinan penyebabnya:

- ❌ Folder `datasets` tidak berada di lokasi yang benar
- ❌ Nama folder salah ketik (misalnya `dataset` tanpa huruf 's' atau `Datasets` dengan huruf kapital)
- ❌ File Project `.Rproj` tidak dibuka (sehingga *working directory* salah)

**Solusi:**

1. Tutup RStudio
2. Buka **kembali** RStudio dengan cara double-click file **`Praktikum STP 2026.Rproj`**
3. Jalankan kembali kode `dir.exists("datasets")` - harus menghasilkan `TRUE`
4. Jika masih `FALSE`, cek kembali apakah folder `datasets` sudah benar-benar berada di dalam folder Project


## Sintaks Dasar Bahasa r

Dalam subbab ini, kita akan membahas sintaks dasar bahasa R yang akan sering digunakan dalam praktikum ini.

### Komentar

Pada dasarnya, semua yang kita tulis di *script* akan dijalankan oleh R. Akan tetapi, kita bisa memberi tahu R untuk tidak menjalankan kode yang kita tulis dengan mengubah formatnya menjadi **komentar** (*comment*). Kita bisa menuliskan komentar dengan menggunakan tanda pagar (`#`) sebelum kode yang ingin kita komentari.

``` r
# Kode ini akan menghitung 1 + 1
1 + 1 
```

::: rmdimportant
Komentar sangat berperan penting dalam kode kalian. Malahan, ini adalah kekuatan terbesar dari penggunaan R dalam Kita akan sering menggunakan komentar dalam kode kalian. Jadi, jangan ragu untuk menggunakan komentar untuk menjelaskan kode kalian.
:::

### *Assignment* (Pemberian Nilai)

Untuk menyimpan nilai ke dalam variabel/objek, kita menggunakan tanda panah kiri (`<-`). Gunakanlah selalu `<-` sebagai penanda bahwa kita sedang memasukkan nilai ke dalam objek, karena ini adalah standar baku dalam pemrograman R.

``` r
x <- 10
nama <- "Budi"
```

### *Case Sensitivity*

R membedakan huruf besar dan huruf kecil (*case sensitive*). Variabel `Data` dianggap berbeda dengan `data`.

## Paket (*Packages*)

R memiliki ribuan paket tambahan yang menyediakan fungsi-fungsi khusus.

-   **`install.packages("nama_paket")`**: Digunakan untuk mengunduh dan menginstal paket dari internet ke komputer kita. Ini cukup dilakukan satu kali saja.
-   **`library(nama_paket)`**: Digunakan untuk memuat paket yang sudah terinstal ke dalam sesi kerja kita agar isinya bisa digunakan. Ini harus dilakukan setiap kali kita membuka RStudio baru.

Paket utama yang akan sering kita gunakan adalah:

-   **`tidyverse`**: Kumpulan paket untuk pengolahan data modern.
-   **`openxlsx`**: Untuk membaca dan menulis file Excel.

::: rmdexercise
**Aktivitas Mandiri: Instalasi Paket**

Cobalah untuk menginstal paket `tidyverse` dan `openxlsx` di komputer Anda dengan mengetikkan perintah berikut di *Console*:

`install.packages(c("tidyverse", "openxlsx"))`

Tunggu hingga proses instalasi selesai. Ingat, tahap ini hanya perlu dilakukan satu kali saja.
:::

## Fungsi (*Functions*)

Fungsi adalah serangkaian instruksi yang dibungkus menjadi satu perintah untuk melakukan tugas tertentu. R memiliki banyak fungsi bawaan, dan kita juga bisa membuat fungsi sendiri.

### Menggunakan Fungsi

Untuk menggunakan fungsi, kita memanggil namanya diikuti dengan tanda kurung `()`. Di dalam tanda kurung, kita bisa memasukkan **argumen** (input).

``` r
# Contoh fungsi bawaan: mean (rata-rata)
nilai <- c(10, 20, 30)
rata_rata <- mean(nilai) # Hasil: 20
```

### Membuat Fungsi Sendiri

Kita dapat membuat fungsi kustom menggunakan perintah `function()`. Struktur dasarnya adalah:

``` r
nama_fungsi <- function(input) {
  # Proses yang dilakukan
  hasil <- input * 2
  return(hasil)
}
```

Ini akan sangat berguna ketika kita ingin melakukan perhitungan yang sama berulang kali, seperti pada perhitungan IQV di Modul 2.

## Struktur Data Dasar

### Vektor

Vektor adalah struktur data paling dasar di R yang menampung deretan nilai dengan tipe yang sama. Kita membuatnya dengan fungsi `c()` (*combine*).

``` r
angka <- c(1, 2, 3, 4, 5)
huruf <- c("a", "b", "c")
```

### Tipe Data

Saat mengolah data, kalian akan sering menemukan singkatan tipe data berikut:

-   **`dbl` (Double)**: Angka numerik (bisa desimal).
-   **`chr` (Character)**: Teks atau *string*. Ditandai dengan tanda kutip.
-   **`fct` (Factor)**: Data kategorik (bisa nominal atau ordinal). Factor menyimpan nilai sebagai angka di belakang layar namun menampilkan label teks, yang berguna untuk analisis statistik dan plot.

### Data Frame dan Tibble

Data dalam R biasanya disimpan dalam bentuk tabel yang disebut *Data Frame*. Di era modern (tidyverse), kita sering menggunakan versi yang lebih canggih disebut **Tibble**. Strukturnya mirip spreadsheet: baris mewakili observasi, kolom mewakili variabel.

## Operator Pipa (`|>`)

Dalam `tidyverse`, kita sering menggunakan operator pipa (`|>`) untuk merangkai beberapa perintah sekaligus. Bayangkan ini sebagai penyambung proses:

``` r
# Tanpa pipa
hasil <- fungsi_2(fungsi_1(data))

# Dengan pipa (lebih mudah dibaca)
data |> 
  fungsi_1() |> 
  fungsi_2()
```

Artinya: "Ambil `data`, lalu `fungsi_1`, kemudian hasilnya dimasukkan ke `fungsi_2`."

## Manajemen Data (Input/Output)

### Membaca Data

Kita sering menggunakan `read.xlsx()` dari paket `openxlsx` untuk membaca file Excel.

``` r
data <- read.xlsx("folder/nama_file.xlsx", sheet = "nama_sheet")
```

### Menyimpan Data

Setelah diolah, data bisa disimpan kembali ke Excel atau CSV.

``` r
write.xlsx(data, "folder/nama_file_baru.xlsx")
write.csv2(data, "folder/nama_file_baru.csv") # Format CSV Excel Indonesia (pemisah titik koma)
```

<!--chapter:end:index.Rmd-->

# Modul-1: Pengolahan Data Terstruktur

Setelah mempelajari modul ini Anda diharapkan dapat:

1.  menganalisis variabel dan objek dalam sebuah format data terstruktur [STP-1.3]{.capaian}
2.  mengelola data terstruktur dengan tepat menggunakan perangkat komputer [STP-1.4]{.capaian}

---

Kita akan mempelajari cara pengolahan data terstruktur atau *dataset*/set data dari hasil kuesioner kepada mahasiswa-mahasiswa Universitas Islam Negeri Raden Intan Lampung (UINRIL) dan Universitas Bandar Lampung (UBL) tentang pola perjalanan mereka.

Dalam R, pengolahan data terstruktur dipermudah dengan adanya paket `tidyverse`. Paket ini menyertakan paket-paket lain yang mempunyai kegunaan unik dalam pengolahan data terstruktur.


``` r
library(tidyverse)
```

Seperti yang kalian lihat, paket `tidyverse` menyertakan paket-paket berikut yang mempunyai kegunaan masing-masing:

-   `dplyr`: menyediakan serangkaian fungsi inti untuk memanipulasi dan mentransformasi data secara efisien.
-   `forcats`: memudahkan pekerjaan dengan data kategorikal atau yang dalam R disebut juga 'factors'.
-   `ggplot2`: untuk membuat grafik yang ciamik.
-   `lubridate`: mempermudah pekerjaan terkait format tanggal
-   `purrr`: meningkatkan kemampuan pemrograman fungsi dan vektor
-   `readr`: untuk membaca data tabular seperti `.csv`
-   `stringr`: menyederhanakan operasi teks/*string*
-   `tibble`: versi modern dari *data.frame* yang lebih rapi dan mudah digunakan.
-   `tidyr`: untuk merapikan data dengan mengubah format atau struktur tata letaknya.

Selain paket `tidyverse`, kita juga akan menggunakan paket `openxlsx` untuk mengoperasikan *file* Excel.


``` r
library(openxlsx)
```

## Mengimpor set data *(dataset)* dari Excel

Untuk membuat set data di lingkungan kerja R kita, gunakan fungsi `read.xlsx()` seperti berikut. Fungsi `read.xlsx()` mempunyai atribut utama berupa *file path* lokasi file yang ditempatkan di dalam tanda kurung.

::: rmdwarning

⚠️ **Penting**

Pastikan file Excel yang akan diimpor sudah tertutup, karena mengimpor file yang sedang terbuka akan menghasilkan *error*.
:::



``` r
# Memuat dataset dari file Excel "Data Gabungan.xlsx" yang terletak di folder yang sama dengan file R Markdown ini.
data <- read.xlsx("datasets/Data Praktikum 01.xlsx")

# Menampilkan 6 baris pertama dataset
head(data)
```

```
##   Kampus_PT Nomor.urut Jenis.Kelamin Umur                   Fakultas                                 Prodi            Tingkat.Semester  Uang.Saku
## 1    UINRIL          1     Laki-laki   22                    Syariah                        Hukum Keluarga 4 (Semester 7 - Semester 8) 1Jt - 2 Jt
## 2    UINRIL          2     Laki-laki   25                    Syariah                        Hukum Keluarga 4 (Semester 7 - Semester 8)     < 1 Jt
## 3    UINRIL          3     Perempuan   24      Tarbiyah dan Keguruan                Pendidikan Agama Islam 4 (Semester 7 - Semester 8)     < 1 Jt
## 4    UINRIL          4     Laki-laki   19 Dakwah dan Ilmu Komunikasi        Komunikasi dan Penyiaran Islam 1 (Semester 1 - Semester 2)     < 1 Jt
## 5    UINRIL          5     Laki-laki   23      Tarbiyah dan Keguruan            Manajemen Pendidikan Islam 4 (Semester 7 - Semester 8)     < 1 Jt
## 6    UINRIL          6     Laki-laki   21                       Adab Ilmu Perpustakaan dan Informasi Islam 4 (Semester 7 - Semester 8)     < 1 Jt
##   kepemilikan.mobil kepemilikan.motor kepemilikan.sepedan      kendaraan.utama    kelurahan          jenis.tempat.tinggal
## 1                 0                 1                   0 Sepeda Motor Pribadi       Wiyono         Rumah Bersama Saudara
## 2                 1                 4                   0 Sepeda Motor Pribadi     Sukarame                   Kos Sendiri
## 3                 0                 0                   0        Berjalan Kaki     Sukarame                   Kos Sendiri
## 4                 0                 1                   0 Sepeda Motor Pribadi Harapan Jaya                   Kos Sendiri
## 5                 0                 1                   0 Sepeda Motor Pribadi  Korpri Raya Rumah Mengontrak Bersama-sama
## 6                 0                 1                   0 Sepeda Motor Pribadi    Rajabasa   Rumah Pribadi/Rumah Keluarga
##                 nama.jalan.tempat.tinggal alasan.pemilihan.lokasi.tempat.tinggal jarak.(km) biaya.dalam.ribu2 Jumlah.Perjalanan.Senin
## 1                            Pasar Wiyono                              Lain-lain      19.27               100                       3
## 2                     jln endro suratmin                     Dekat dengan kampus       0.58                80                       3
## 3                         Jl. Pulau ambon                    Dekat dengan kampus       0.56                 0                       3
## 4           Jl.pulau pisang, gg way pesai                    Dekat dengan kampus       1.05                50                       0
## 5                              Jl. Durian                    Dekat dengan kampus       1.69                50                       4
## 6 Jln Nunyai Gg. Hi. Ismail Blok B NO 22E                    Dekat dengan kampus       7.91                50                       0
##   Jumlah.Perjalanan.Selasa Jumlah.Perjalanan.Rabu Jumlah.Perjalanan.Kamis Jumlah.Perjalanan.Jumat Jumlah.Perjalanan.Sabtu Jumlah.Perjalanan.Ahad
## 1                        3                      0                       0                       0                       0                      0
## 2                        3                      0                       3                       0                       0                      0
## 3                        0                      3                       0                       0                       0                      0
## 4                        2                      0                       2                       2                       0                      2
## 5                        4                      0                       0                       3                       2                      0
## 6                        2                      2                       0                       2                       2                      2
```

Fungsi tersebut akan mengimpor seluruh isi dari file Excel `Data Gabungan.xlsx` pada *sheet* pertama saja.

Apabila kita ingin mengimpor set data dari *sheet* lainnya, kita harus menyertakan detil nama sheet yang kita ingin impor pada atribut `sheet`.

*Dataset* yang kita impor akan menjadi objek dengan jenis *tibble*.


``` r
# Menyimpan file sebagai variabel tersendiri sehingga lebih fleksibel
file_dibaca <- "datasets/Data Praktikum 01.xlsx" # nama variabel bukan 'file' saja karena sudah ada fungsi R tersendiri dengan nama tersebut

# Mengimpor data dari file_dibaca dan menyimpannya sebagai variabel
data_ubl <- read.xlsx(file_dibaca, sheet = "DataUtama_mhsUBL")

# Melihat data tersebut
head(data_ubl)
```

```
##   Timestamp Kampus_PT Nomor.urut Jenis.Kelamin Umur                         Fakultas           Prodi            Tingkat.Semester     Uang.Saku
## 1  45413.83       UBL          1     Perempuan   21 Fakultas Ilmu Sosial dan Politik Ilmu Komunikasi 4 (Semester 7 - Semester 8)        < 1 jt
## 2  45413.83       UBL          2     Laki-Laki   20                   Fakultas Hukum      Ilmu Hukum 3 (Semester 5 - Semester 6)   1 jt – 2 jt
## 3  45413.85       UBL          3     Laki-Laki   21      Fakultas Ekonomi dan Bisnis       Manajemen 4 (Semester 7 - Semester 8)   1 jt – 2 jt
## 4  45413.85       UBL          4     Laki-Laki   22      Fakultas Ekonomi dan Bisnis       Akuntansi 4 (Semester 7 - Semester 8)   1 jt – 2 jt
## 5  45413.88       UBL          5     Laki-Laki   21      Fakultas Ekonomi dan Bisnis       Manajemen 4 (Semester 7 - Semester 8) 2,1 jt – 3 jt
## 6  45413.92       UBL          6     Perempuan   21      Fakultas Ekonomi dan Bisnis       Akuntansi 4 (Semester 7 - Semester 8)   1 jt – 2 jt
##   kepemilikan.mobil kepemilikan.motor kepemilikan.sepeda                                      kendaraan.utama               kelurahan
## 1                 1                 2                  1                                 Sepeda Motor Pribadi       Kalibalau Kencana
## 2                 2                 1                  1                                        Mobil Pribadi            Gunung sulah
## 3                 1                 2                  2                                 Sepeda Motor Pribadi              langkapura
## 4                 1                 4                  1 Kendaraan Bermotor (menumpang dengan keluarga/teman) Bilabong JAYA JAYA JAYA
## 5                 4                 4                  1                                        Mobil Pribadi                sukarame
## 6                 1                 2                  1                                  Transportasi Online               Way halim
##           jenis.tempat.tinggal                       nama.jalan.tempat.tinggal jarak.(km)         alasan.pemilihan.lokasi.tempat.tinggal
## 1 Rumah pribadi/rumah keluarga                                    eLBe Loundry   4.223797                 Bersama keluarga/saudara/teman
## 2 Rumah pribadi/rumah keluarga                         Jl.Urip Sumoharjo no 88   2.703331 Mudahnya akses berpergian dari tempat tinggal 
## 3 Rumah pribadi/rumah keluarga                  JL DARUSSALAM GG LANGGAR LK II   3.237072                 Bersama keluarga/saudara/teman
## 4 Rumah pribadi/rumah keluarga Jl Darussalam bilabong bila bolong di jait dong   3.002336    Lingkungan nyaman karna aman dari kejahatan
## 5 Rumah pribadi/rumah keluarga          jl.cendrawasih sukarame bandar lampung   5.961925                    Dekat dengan fasilitas umum
## 6 Rumah pribadi/rumah keluarga                            Jl P tabuan nomor 26   2.925331                 Bersama keluarga/saudara/teman
##                 biaya.dalam.seminggu Jumlah.perjalanan.Senin Jumlah.Perjalanan.Selasa Jumlah.Perjalanan.Rabu Jumlah.Perjalanan.Kamis
## 1                            25 ribu                       2                        3                      2                       3
## 2                                200                       3                        3                      3                       3
## 3 50rb menggunakan kendaraan pribadi                       1                        1                      1                       1
## 4                      Sminggu 20 rb                       2                        2                      2                       2
## 5                     20 JUTA RUPIAH                       1                        1                      1                       1
## 6                              40 rb                       3                        3                      1                       1
##   Jumlah.Perjalanan.Jumat Jumlah.Perjalanan.Sabtu Jumlah.Perjalanan.Ahad
## 1                       2                       2                      2
## 2                       3                       3                      3
## 3                       1                       1                      1
## 4                       2                       2                      2
## 5                       1                       1                      1
## 6                       1                       1                      1
```

Kita juga dapat melihat *dataset* kita secara lengkap dengan perintah `View()`


``` r
# Melihat set data UINRIL
View(data)

# Melihat set data UBL
View(data_ubl)
```

## Analisis data terstruktur pada set data

Kita sudah mempelajari bahwa data terstruktur terdiri atas **objek**, **variabel**, dan **nilai**. Satu objek diwakili oleh satu baris, variabel oleh kolom, dan nilai berada di dalam sel-sel yang merupakan perpotongan kolom dan baris.

> ⚠️ **Penting**
>
> Di modul ini kita menggunakan istilah "variabel" untuk menyebut dua hal yang berbeda. Makna pertama mengacu pada penyimpan nilai di R, sementara yang kedua adalah elemen data terstruktur yang menjadi kolom-kolom.
>
> Dalam modul ini kita akan menggunakan istilah yang sama untuk kedua makna, jadi pahami konteks kalimatnya terlebih dahulu ketika menemukan kata ini.

Untuk mengetahui ringkasan struktur data, kita dapat menggunakan fungsi `glimpse()` yang membutuhkan set data yang kita simpan sebagai argumen.


``` r
# ringkasan struktur data UIN RIL
glimpse(data)
```

```
## Rows: 400
## Columns: 25
## $ Kampus_PT                              <chr> "UINRIL", "UINRIL", "UINRIL", "UINRIL", "UINRIL", "UINRIL", "UINRIL", "UINRIL", "UINRIL", "UINRIL…
## $ Nomor.urut                             <dbl> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27…
## $ Jenis.Kelamin                          <chr> "Laki-laki", "Laki-laki", "Perempuan", "Laki-laki", "Laki-laki", "Laki-laki", "Laki-laki", "Laki-…
## $ Umur                                   <dbl> 22, 25, 24, 19, 23, 21, 22, 21, 21, 21, 19, 19, 19, 19, 19, 20, 19, 21, 20, 20, 20, 20, 20, 19, 2…
## $ Fakultas                               <chr> "Syariah", "Syariah", "Tarbiyah dan Keguruan", "Dakwah dan Ilmu Komunikasi", "Tarbiyah dan Keguru…
## $ Prodi                                  <chr> "Hukum Keluarga", "Hukum Keluarga", "Pendidikan Agama Islam", "Komunikasi dan Penyiaran Islam", "…
## $ Tingkat.Semester                       <chr> "4 (Semester 7 - Semester 8)", "4 (Semester 7 - Semester 8)", "4 (Semester 7 - Semester 8)", "1 (…
## $ Uang.Saku                              <chr> "1Jt - 2 Jt", "< 1 Jt", "< 1 Jt", "< 1 Jt", "< 1 Jt", "< 1 Jt", "< 1 Jt", "< 1 Jt", "1Jt - 2 Jt",…
## $ kepemilikan.mobil                      <dbl> 0, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1…
## $ kepemilikan.motor                      <dbl> 1, 4, 0, 1, 1, 1, 1, 4, 4, 1, 0, 1, 3, 1, 0, 0, 1, 2, 2, 1, 0, 0, 1, 0, 1, 3, 2, 2, 0, 1, 1, 1, 2…
## $ kepemilikan.sepedan                    <dbl> 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 3, 0, 0, 0, 0, 4…
## $ kendaraan.utama                        <chr> "Sepeda Motor Pribadi", "Sepeda Motor Pribadi", "Berjalan Kaki", "Sepeda Motor Pribadi", "Sepeda …
## $ kelurahan                              <chr> "Wiyono", "Sukarame", "Sukarame", "Harapan Jaya", "Korpri Raya", "Rajabasa ", "Campang Raya", "Ca…
## $ jenis.tempat.tinggal                   <chr> "Rumah Bersama Saudara", "Kos Sendiri", "Kos Sendiri", "Kos Sendiri", "Rumah Mengontrak Bersama-s…
## $ nama.jalan.tempat.tinggal              <chr> "Pasar Wiyono", "jln endro suratmin ", "Jl. Pulau ambon", "Jl.pulau pisang, gg way pesai", "Jl. D…
## $ alasan.pemilihan.lokasi.tempat.tinggal <chr> "Lain-lain", "Dekat dengan kampus", "Dekat dengan kampus", "Dekat dengan kampus", "Dekat dengan k…
## $ `jarak.(km)`                           <dbl> 19.27, 0.58, 0.56, 1.05, 1.69, 7.91, 2.58, 2.32, 0.77, 6.56, 0.63, 0.53, 0.91, 2.52, 1.31, 0.83, …
## $ biaya.dalam.ribu2                      <dbl> 100, 80, 0, 50, 50, 50, 35, 50, 40, 50, 0, 50, 50, 40, 0, 0, 30, 50, 60, 15, 0, 0, 40, 15, 37, 25…
## $ Jumlah.Perjalanan.Senin                <dbl> 3, 3, 3, 0, 4, 0, 3, 4, 2, 3, 4, 2, 3, 2, 3, 2, 2, 2, 3, 2, 0, 2, 0, 3, 3, 2, 3, 1, 2, 2, 3, 2, 2…
## $ Jumlah.Perjalanan.Selasa               <dbl> 3, 3, 0, 2, 4, 2, 0, 4, 0, 2, 4, 2, 2, 2, 3, 2, 2, 2, 3, 0, 0, 0, 2, 0, 0, 2, 3, 1, 0, 2, 3, 2, 3…
## $ Jumlah.Perjalanan.Rabu                 <dbl> 0, 0, 3, 0, 0, 2, 3, 4, 3, 2, 4, 2, 2, 2, 2, 2, 2, 0, 3, 2, 2, 2, 2, 3, 3, 0, 2, 2, 0, 4, 3, 2, 2…
## $ Jumlah.Perjalanan.Kamis                <dbl> 0, 3, 0, 2, 0, 0, 0, 4, 0, 2, 2, 2, 2, 2, 0, 3, 2, 2, 2, 2, 2, 2, 2, 3, 2, 2, 3, 2, 2, 4, 3, 2, 2…
## $ Jumlah.Perjalanan.Jumat                <dbl> 0, 0, 0, 2, 3, 2, 2, 4, 0, 0, 2, 2, 2, 2, 2, 0, 2, 2, 0, 2, 2, 2, 2, 2, 2, 2, 3, 3, 0, 0, 4, 2, 2…
## $ Jumlah.Perjalanan.Sabtu                <dbl> 0, 0, 0, 0, 2, 2, 2, 2, 2, 0, 2, 2, 0, 0, 0, 0, 0, 2, 0, 2, 0, 0, 0, 0, 0, 2, 2, 2, 0, 0, 2, 2, 0…
## $ Jumlah.Perjalanan.Ahad                 <dbl> 0, 0, 0, 2, 0, 2, 2, 2, 2, 0, 2, 2, 0, 2, 2, 0, 0, 1, 2, 0, 0, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 2…
```

Hasil dari fungsi `glimpse()` tersebut menunjukkan jumlah baris, jumlah kolom, dan kolom-kolom yang ada dalam set data kita beserta rinciannya. Set data kita memiliki 400 baris yang ditunjukkan oleh **`Rows`** dan 25 kolom yang ditunjukkan oleh **`Columns`** . Ini artinya, set data kita memiliki 400 objek dan 25 variabel.

Rincian nama-nama variabel ditunjukkan pada baris keluaran yang diawali oleh simbol **`\$`**. Singkatan-singkatan di dalam kurung sudut `<>` bermakna jenis nilai dari variabel tersebut. [Laman ini](https://cran.r-project.org/web/packages/tibble/vignettes/types.html) memberikan penjelasan makna setiap singkatan tersebut.

Terlihat dalam data kita bahwa hanya ada dua tipe nilai variabel: `dbl` dan `chr` yang berarti *double* (bilangan desimal) dan *character* (huruf/*string*).

::: {.rmdexercise}
**Aktivitas Mandiri 1: Menganalisis Struktur Data [STP-1.3]**

Jalankan `glimpse(data)` untuk dataset UIN RIL dan jawab:

1. Berapa jumlah objek (baris) dalam dataset ini?
2. Berapa jumlah variabel (kolom)?
3. Sebutkan 3 variabel dengan tipe `dbl` dan 3 variabel dengan tipe `chr`
4. Mengapa variabel `Jenis.Kelamin` bertipe `chr` bukan `dbl`? Jelaskan!
:::

## Mengolah set data

Dalam bagian ini kita akan mengolah set data kita yang bertujuan untuk memenuhi kebutuhan pengolahan data kita. Sebelum melakukan pengolahan, maka kita perlu menjawab pertanyaan terlebih dahulu "apa yang kita butuhkan untuk pengolahan data kita?"

Dalam praktikum ini kita sudah mengetahui bahwa terdapat dua jenis set data hasil kuesioner, yakni set data mahasiswa Universitas Islam Negeri Raden Intan Lampung (UINRIL) dan juga Universitas Bandar Lampung (UBL). Kedua jenis set data tersebut disimpan dalam variabel yang berbeda. Kita butuh untuk *menggabungkan kedua set data* tersebut menjadi satu set data yang mencakup kedua kampus agar nanti kita bisa melakukan analisis dengan lebih leluasa.

Pengolahan set data seperti ini punya istilah yang keren: ***data wrangling*** (bisa dibaca "data rengling")

### Merancang Algoritma (Urutan kerja)

Karena R adalah program yang mayoritasnya *character user interface* (CUI) alih-alih *graphical user interface*, maka pekerjaan kita tidak bisa seleluasa GUI yang dapat kita bolak-balik urutannya. Kita sebaiknya memiliki "rencana kerja" yang jelas, yang dalam bahasa pemrograman disebut **algoritma**.

Algoritma yang akan kita lakukan dalam praktikum ini adalah sebagai berikut:

1.  Mengidentifikasi nama-nama kolom di set data UIN RIL
2.  Mengidentifikasi nama-nama kolom di set data UBL
3.  Menentukan kolom-kolom yang akan diambil di set data baru
4.  Menyeleksi kolom-kolom yang akan dipakai di set data UIN RIL dan UBL,
5.  Mengubah nama kolom-kolom di kedua set data menjadi nama-nama yang sudah ditentukan di langkah-3.
6.  Menyatukan kedua set data.

> 💡 **Tip**
>
> Sebisa mungkin rancang setiap langkah pada urutan kerja kita dengan rinci agar kita dapat menerjemahkan langkah-langkah tersebut dengan lebih mudah ke baris kode.

### Mengidentifikasi Nama-nama Kolom

Untuk mengidentifikasi nama-nama kolom kita dapat menggunakan fungsi `colnames()` yang mengambil argumen nama set data.


``` r
# data UIN RIL
colnames(data)
```

```
##  [1] "Kampus_PT"                              "Nomor.urut"                             "Jenis.Kelamin"                         
##  [4] "Umur"                                   "Fakultas"                               "Prodi"                                 
##  [7] "Tingkat.Semester"                       "Uang.Saku"                              "kepemilikan.mobil"                     
## [10] "kepemilikan.motor"                      "kepemilikan.sepedan"                    "kendaraan.utama"                       
## [13] "kelurahan"                              "jenis.tempat.tinggal"                   "nama.jalan.tempat.tinggal"             
## [16] "alasan.pemilihan.lokasi.tempat.tinggal" "jarak.(km)"                             "biaya.dalam.ribu2"                     
## [19] "Jumlah.Perjalanan.Senin"                "Jumlah.Perjalanan.Selasa"               "Jumlah.Perjalanan.Rabu"                
## [22] "Jumlah.Perjalanan.Kamis"                "Jumlah.Perjalanan.Jumat"                "Jumlah.Perjalanan.Sabtu"               
## [25] "Jumlah.Perjalanan.Ahad"
```


``` r
# data UIN RIL
colnames(data_ubl)
```

```
##  [1] "Timestamp"                              "Kampus_PT"                              "Nomor.urut"                            
##  [4] "Jenis.Kelamin"                          "Umur"                                   "Fakultas"                              
##  [7] "Prodi"                                  "Tingkat.Semester"                       "Uang.Saku"                             
## [10] "kepemilikan.mobil"                      "kepemilikan.motor"                      "kepemilikan.sepeda"                    
## [13] "kendaraan.utama"                        "kelurahan"                              "jenis.tempat.tinggal"                  
## [16] "nama.jalan.tempat.tinggal"              "jarak.(km)"                             "alasan.pemilihan.lokasi.tempat.tinggal"
## [19] "biaya.dalam.seminggu"                   "Jumlah.perjalanan.Senin"                "Jumlah.Perjalanan.Selasa"              
## [22] "Jumlah.Perjalanan.Rabu"                 "Jumlah.Perjalanan.Kamis"                "Jumlah.Perjalanan.Jumat"               
## [25] "Jumlah.Perjalanan.Sabtu"                "Jumlah.Perjalanan.Ahad"
```

Kita dapat mengetahui jumlah kolom setiap set data secara langsung dengan fungsi `length()`.


``` r
length(colnames(data)) # jumlah kolom set data UIN RIL
```

```
## [1] 25
```

``` r
length(colnames(data_ubl)) # jumlah kolom set data UBL
```

```
## [1] 26
```

> ⚠️ Penting!
>
> Fungsi `length()` pada dasarnya adalah fungsi penghitung jumlah elemen dalam suatu vektor atau jenis data lain yang berupa daftar.


``` r
# Mendefinisikan suatu vektor
suatu_vektor <- c(1, 2, 3, 4, 5)

# Mengukur panjangnya
length(suatu_vektor)
```

```
## [1] 5
```

Dari kedua fungsi tersebut, kita dapat mengetahui bahwa terdapat perbedaan jumlah kolom dan juga perbedaan penamaan:

-   `kepemilikan.sepedan` di data UIN vs `kepemilikan.sepeda` di data UBL.

-   `biaya.dalam.ribu2` di data UIN vs `biaya.dalam.seminggu` di data UBL.

Perbedaan-perbedaan inilah yang membuat kita tidak bisa langsung menggabungkan data. Kita harus menyeragamkannya terlebih dahulu,

### Menentukan Kolom-kolom yang Akan Diambil di Set Data Baru

Setelah mengidentifikasi nama-nama variabel dan jumlahnya, kita putuskan untuk mengambil variabel-variabel berikut: (1) `Nomor.urut`, (2) `Jenis.Kelamin`, (3) `Umur`, (4) `Fakultas`, (5) `Prodi`, (6) `Tingkat.Semester`, (7) `Uang.Saku`, (8) `kepemilikan.mobil`, (9) `kepemilikan.motor`, (10) `kepemilikan.sepeda`, (11) `kendaraan.utama`, (12) `jenis.tempat.tinggal`, (13) `jarak`, (14) `biaya.dalam.seminggu`, (15) `Jumlah.perjalanan.Senin`, (16) `Jumlah.perjalanan.Selasa`, (17) `Jumlah.perjalanan.Rabu`, (18) `Jumlah.perjalanan.Kamis`, (19) `Jumlah.perjalanan.Jumat`, (20) `Jumlah.perjalanan.Sabtu`, (21) `Jumlah.perjalanan.Ahad`.

Kita akan menyimpan nama-nama kolom yang sudah kita tentukan tersebut menjadi sebuah vektor.


``` r
# Membuat vektor berisi nama-nama kolom final yang kita inginkan
kolom_final <- c(
  "Nomor.urut", "Jenis.Kelamin", "Umur", "Fakultas", "Prodi", 
  "Tingkat.Semester", "Uang.Saku",
  "kepemilikan.mobil", 
  "kepemilikan.motor", "kepemilikan.sepeda", "kendaraan.utama", 
  "jenis.tempat.tinggal", "jarak", "biaya.dalam.sepekan", 
  "Jumlah.perjalanan.Senin", "Jumlah.perjalanan.Selasa", 
  "Jumlah.perjalanan.Rabu", "Jumlah.perjalanan.Kamis", 
  "Jumlah.perjalanan.Jumat", "Jumlah.perjalanan.Sabtu", 
  "Jumlah.perjalanan.Ahad"
)
```

### Menyeleksi Kolom-kolom Yang Akan Dipakai

Kita akan menggunakan fungsi `select()` dari `dplyr` (bagian dari `tidyverse`) untuk memilih hanya kolom-kolom yang relevan dari masing-masing set data. Perhatikan baik-baik, kita harus menggunakan **nama kolom asli** saat menyeleksi.


``` r
# 4. Menyeleksi kolom dari data UIN RIL
data_uin_selected <- select(data,
  Nomor.urut, Jenis.Kelamin, Umur, Fakultas, Prodi, Tingkat.Semester,
  Uang.Saku, 
  kepemilikan.mobil, kepemilikan.motor, 
  kepemilikan.sepedan, # Ingat, nama aslinya pakai 'n'
  kendaraan.utama, jenis.tempat.tinggal, 
  `jarak.(km)`, # Gunakan backtick (`) karena ada karakter spesial, yakni tanda kurung.
  `biaya.dalam.ribu2`,
  Jumlah.Perjalanan.Senin, Jumlah.Perjalanan.Selasa, Jumlah.Perjalanan.Rabu,
  Jumlah.Perjalanan.Kamis, Jumlah.Perjalanan.Jumat, Jumlah.Perjalanan.Sabtu,
  Jumlah.Perjalanan.Ahad
)
```


``` r
# 5. Menyeleksi kolom dari data UBL
data_ubl_selected <- select(data_ubl,
  Nomor.urut, Jenis.Kelamin, Umur, Fakultas, Prodi, Tingkat.Semester,
  Uang.Saku,
  kepemilikan.mobil, kepemilikan.motor, 
  kepemilikan.sepeda, # Di sini namanya sudah benar
  kendaraan.utama, jenis.tempat.tinggal,
  `jarak.(km)`,
  biaya.dalam.seminggu,
  Jumlah.perjalanan.Senin, Jumlah.Perjalanan.Selasa, Jumlah.Perjalanan.Rabu,
  Jumlah.Perjalanan.Kamis, Jumlah.Perjalanan.Jumat, Jumlah.Perjalanan.Sabtu,
  Jumlah.Perjalanan.Ahad
)
```

Sekarang kita punya dua *data frame* baru (`data_uin_selected` dan `data_ubl_selected`) yang isinya hanya kolom-kolom yang kita butuhkan.

### Mengubah Nama Kolom Menjadi Nama Standar

Ini adalah langkah kuncinya. Kita cukup menimpa nama-nama kolom di kedua *data frame* yang sudah kita seleksi tadi dengan nama-nama kolom dari vektor `kolom_final` yang kita buat di 3.3.3.


``` r
# Mengganti nama kolom di kedua data frame
colnames(data_uin_selected) <- kolom_final
colnames(data_ubl_selected) <- kolom_final
```

Untuk membuktikan bahwa namanya sudah berubah, kita bisa cek lagi.


``` r
# Cek nama kolom setelah diubah
colnames(data_uin_selected)
```

```
##  [1] "Nomor.urut"               "Jenis.Kelamin"            "Umur"                     "Fakultas"                 "Prodi"                   
##  [6] "Tingkat.Semester"         "Uang.Saku"                "kepemilikan.mobil"        "kepemilikan.motor"        "kepemilikan.sepeda"      
## [11] "kendaraan.utama"          "jenis.tempat.tinggal"     "jarak"                    "biaya.dalam.sepekan"      "Jumlah.perjalanan.Senin" 
## [16] "Jumlah.perjalanan.Selasa" "Jumlah.perjalanan.Rabu"   "Jumlah.perjalanan.Kamis"  "Jumlah.perjalanan.Jumat"  "Jumlah.perjalanan.Sabtu" 
## [21] "Jumlah.perjalanan.Ahad"
```

``` r
print("============================================================")
```

```
## [1] "============================================================"
```

``` r
colnames(data_ubl_selected)
```

```
##  [1] "Nomor.urut"               "Jenis.Kelamin"            "Umur"                     "Fakultas"                 "Prodi"                   
##  [6] "Tingkat.Semester"         "Uang.Saku"                "kepemilikan.mobil"        "kepemilikan.motor"        "kepemilikan.sepeda"      
## [11] "kendaraan.utama"          "jenis.tempat.tinggal"     "jarak"                    "biaya.dalam.sepekan"      "Jumlah.perjalanan.Senin" 
## [16] "Jumlah.perjalanan.Selasa" "Jumlah.perjalanan.Rabu"   "Jumlah.perjalanan.Kamis"  "Jumlah.perjalanan.Jumat"  "Jumlah.perjalanan.Sabtu" 
## [21] "Jumlah.perjalanan.Ahad"
```

Hasil dari kedua perintah di atas seharusnya adalah daftar nama yang identik.

::: {.rmdexercise}
**Aktivitas Mandiri 2: Seleksi dan Rename Kolom [STP-1.4]**

Gunakan dataset `data_ubl` yang sudah diimpor:

1. Pilih hanya kolom: `Nomor.urut`, `Jenis.Kelamin`, `Umur`, `Fakultas`, `Prodi`
2. Rename kolom `Jenis.Kelamin` menjadi `JK` (gunakan fungsi `rename()`)
3. Simpan hasilnya ke variabel `data_ubl_subset`
4. Gunakan `glimpse(data_ubl_subset)` untuk memverifikasi hanya ada 5 kolom dan nama `JK` sudah benar
:::

### Menyatukan Kedua Set Data

Ini adalah langkah terakhir kita. Karena kedua set data kini memiliki struktur kolom yang sama persis, kita bisa menyatukannya menjadi satu *data frame* besar dengan fungsi `bind_rows()`.


``` r
# Menggabungkan kedua data frame menjadi satu
data_gabungan <- bind_rows(data_uin_selected, data_ubl_selected)
```

Hasil dari penggabungan tersebut menyebabkan *error* pada kolom `biaya.dalam.sepekan` . Ini disebabkan oleh biaya.dalam.sepekan dalam set data UINRIL (`data`) berbeda jenisnya dengan set data UBL (`data_ubl`). Begitu pula `Jumlah.perjalanan.Senin`


``` r
# Mengecek tipe data dalam set data UINRIL
glimpse(data_uin_selected)
```

```
## Rows: 400
## Columns: 21
## $ Nomor.urut               <dbl> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, …
## $ Jenis.Kelamin            <chr> "Laki-laki", "Laki-laki", "Perempuan", "Laki-laki", "Laki-laki", "Laki-laki", "Laki-laki", "Laki-laki", "Peremp…
## $ Umur                     <dbl> 22, 25, 24, 19, 23, 21, 22, 21, 21, 21, 19, 19, 19, 19, 19, 20, 19, 21, 20, 20, 20, 20, 20, 19, 20, 22, 22, 22,…
## $ Fakultas                 <chr> "Syariah", "Syariah", "Tarbiyah dan Keguruan", "Dakwah dan Ilmu Komunikasi", "Tarbiyah dan Keguruan", "Adab", "…
## $ Prodi                    <chr> "Hukum Keluarga", "Hukum Keluarga", "Pendidikan Agama Islam", "Komunikasi dan Penyiaran Islam", "Manajemen Pend…
## $ Tingkat.Semester         <chr> "4 (Semester 7 - Semester 8)", "4 (Semester 7 - Semester 8)", "4 (Semester 7 - Semester 8)", "1 (Semester 1 - S…
## $ Uang.Saku                <chr> "1Jt - 2 Jt", "< 1 Jt", "< 1 Jt", "< 1 Jt", "< 1 Jt", "< 1 Jt", "< 1 Jt", "< 1 Jt", "1Jt - 2 Jt", "< 1 Jt", "1J…
## $ kepemilikan.mobil        <dbl> 0, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, …
## $ kepemilikan.motor        <dbl> 1, 4, 0, 1, 1, 1, 1, 4, 4, 1, 0, 1, 3, 1, 0, 0, 1, 2, 2, 1, 0, 0, 1, 0, 1, 3, 2, 2, 0, 1, 1, 1, 2, 1, 1, 0, 0, …
## $ kepemilikan.sepeda       <dbl> 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 3, 0, 0, 0, 0, 4, 0, 0, 0, 0, …
## $ kendaraan.utama          <chr> "Sepeda Motor Pribadi", "Sepeda Motor Pribadi", "Berjalan Kaki", "Sepeda Motor Pribadi", "Sepeda Motor Pribadi"…
## $ jenis.tempat.tinggal     <chr> "Rumah Bersama Saudara", "Kos Sendiri", "Kos Sendiri", "Kos Sendiri", "Rumah Mengontrak Bersama-sama", "Rumah P…
## $ jarak                    <dbl> 19.27, 0.58, 0.56, 1.05, 1.69, 7.91, 2.58, 2.32, 0.77, 6.56, 0.63, 0.53, 0.91, 2.52, 1.31, 0.83, 0.95, 7.67, 4.…
## $ biaya.dalam.sepekan      <dbl> 100, 80, 0, 50, 50, 50, 35, 50, 40, 50, 0, 50, 50, 40, 0, 0, 30, 50, 60, 15, 0, 0, 40, 15, 37, 25, 60, 60, 0, 1…
## $ Jumlah.perjalanan.Senin  <dbl> 3, 3, 3, 0, 4, 0, 3, 4, 2, 3, 4, 2, 3, 2, 3, 2, 2, 2, 3, 2, 0, 2, 0, 3, 3, 2, 3, 1, 2, 2, 3, 2, 2, 1, 4, 0, 5, …
## $ Jumlah.perjalanan.Selasa <dbl> 3, 3, 0, 2, 4, 2, 0, 4, 0, 2, 4, 2, 2, 2, 3, 2, 2, 2, 3, 0, 0, 0, 2, 0, 0, 2, 3, 1, 0, 2, 3, 2, 3, 2, 2, 2, 5, …
## $ Jumlah.perjalanan.Rabu   <dbl> 0, 0, 3, 0, 0, 2, 3, 4, 3, 2, 4, 2, 2, 2, 2, 2, 2, 0, 3, 2, 2, 2, 2, 3, 3, 0, 2, 2, 0, 4, 3, 2, 2, 2, 4, 0, 5, …
## $ Jumlah.perjalanan.Kamis  <dbl> 0, 3, 0, 2, 0, 0, 0, 4, 0, 2, 2, 2, 2, 2, 0, 3, 2, 2, 2, 2, 2, 2, 2, 3, 2, 2, 3, 2, 2, 4, 3, 2, 2, 2, 4, 0, 5, …
## $ Jumlah.perjalanan.Jumat  <dbl> 0, 0, 0, 2, 3, 2, 2, 4, 0, 0, 2, 2, 2, 2, 2, 0, 2, 2, 0, 2, 2, 2, 2, 2, 2, 2, 3, 3, 0, 0, 4, 2, 2, 1, 1, 0, 5, …
## $ Jumlah.perjalanan.Sabtu  <dbl> 0, 0, 0, 0, 2, 2, 2, 2, 2, 0, 2, 2, 0, 0, 0, 0, 0, 2, 0, 2, 0, 0, 0, 0, 0, 2, 2, 2, 0, 0, 2, 2, 0, 0, 0, 0, 5, …
## $ Jumlah.perjalanan.Ahad   <dbl> 0, 0, 0, 2, 0, 2, 2, 2, 2, 0, 2, 2, 0, 2, 2, 0, 0, 1, 2, 0, 0, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 5, …
```

``` r
print("=================================================================================")
```

```
## [1] "================================================================================="
```

``` r
# Mengecek tipe data dalam set data UBL
glimpse(data_ubl_selected)
```

```
## Rows: 379
## Columns: 21
## $ Nomor.urut               <dbl> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, …
## $ Jenis.Kelamin            <chr> "Perempuan", "Laki-Laki", "Laki-Laki", "Laki-Laki", "Laki-Laki", "Perempuan", "Perempuan", "Perempuan", "Laki-L…
## $ Umur                     <dbl> 21, 20, 21, 22, 21, 21, 22, 22, 22, 22, 21, 22, 22, 22, 19, 22, 23, 22, 23, 22, 20, 19, 21, 22, 18, 20, 22, 21,…
## $ Fakultas                 <chr> "Fakultas Ilmu Sosial dan Politik", "Fakultas Hukum", "Fakultas Ekonomi dan Bisnis", "Fakultas Ekonomi dan Bisn…
## $ Prodi                    <chr> "Ilmu Komunikasi", "Ilmu Hukum", "Manajemen", "Akuntansi", "Manajemen", "Akuntansi", "Administrasi Publik", "Ad…
## $ Tingkat.Semester         <chr> "4 (Semester 7 - Semester 8)", "3 (Semester 5 - Semester 6)", "4 (Semester 7 - Semester 8)", "4 (Semester 7 - S…
## $ Uang.Saku                <chr> "< 1 jt", "1 jt – 2 jt", "1 jt – 2 jt", "1 jt – 2 jt", "2,1 jt – 3 jt", "1 jt – 2 jt", "1 jt – 2 jt", "< 1 jt",…
## $ kepemilikan.mobil        <dbl> 1, 2, 1, 1, 4, 1, 1, 1, 1, 1, NA, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 2, 0, 0, 0, 0, 0, 2, 1, 1, 2, 1, 2, 1, 3, 2, 2,…
## $ kepemilikan.motor        <dbl> 2, 1, 2, 4, 4, 2, 1, 1, 1, 1, 1, 2, 0, 1, 1, 1, 0, 1, 0, 2, 2, 1, 1, 0, 1, 0, 1, 3, 1, 3, 2, 2, 2, 2, 2, 2, 3, …
## $ kepemilikan.sepeda       <dbl> 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, NA, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 1, 0, 0, 1, 0, 0, 3, 1, 0, 0, 0, 0, 0, 0, 1, 1,…
## $ kendaraan.utama          <chr> "Sepeda Motor Pribadi", "Mobil Pribadi", "Sepeda Motor Pribadi", "Kendaraan Bermotor (menumpang dengan keluarga…
## $ jenis.tempat.tinggal     <chr> "Rumah pribadi/rumah keluarga", "Rumah pribadi/rumah keluarga", "Rumah pribadi/rumah keluarga", "Rumah pribadi/…
## $ jarak                    <dbl> 4.2237967, 2.7033310, 3.2370722, 3.0023362, 5.9619250, 2.9253306, 2.0588294, 12.0078709, 4.7355783, 6.7413074, …
## $ biaya.dalam.sepekan      <chr> "25 ribu", "200", "50rb menggunakan kendaraan pribadi", "Sminggu 20 rb", "20 JUTA RUPIAH", "40 rb", "70 rb", "3…
## $ Jumlah.perjalanan.Senin  <chr> "2", "3", "1", "2", "1", "3", "2", "4", "4", "3", "Tidak Valid", "2", "Tidak Valid", "4", "2", "2", "2", "1", "…
## $ Jumlah.perjalanan.Selasa <dbl> 3, 3, 1, 2, 1, 3, 2, 4, 4, 3, 3, 1, 1, 4, 1, 3, 3, 1, 1, 3, 1, 1, 1, 3, 4, 1, 5, 1, 1, 3, 3, 3, 3, 4, 3, 4, 1, …
## $ Jumlah.perjalanan.Rabu   <dbl> 2, 3, 1, 2, 1, 1, 2, 4, 4, 3, 1, 2, 1, 4, 3, 2, 4, 1, 1, 3, 1, 1, 1, 3, 3, 1, 5, 1, 1, 3, 2, 3, 1, 3, 2, 3, 1, …
## $ Jumlah.perjalanan.Kamis  <dbl> 3, 3, 1, 2, 1, 1, 2, 4, 4, 3, 1, 1, 1, 4, 3, 2, 2, 1, 1, 3, 1, 1, 1, 3, 3, 1, 5, 1, 2, 3, 1, 2, 4, 2, 3, 1, 1, …
## $ Jumlah.perjalanan.Jumat  <dbl> 2, 3, 1, 2, 1, 1, 2, 4, 3, 3, 1, 2, 1, 4, 3, 2, 3, 1, 1, 3, 1, 1, 1, 3, 3, 1, 5, 1, 1, 3, 1, 1, 1, 3, 2, 5, 1, …
## $ Jumlah.perjalanan.Sabtu  <dbl> 2, 3, 1, 2, 1, 1, 2, 3, 4, 2, 1, 1, 1, 1, 1, 2, 1, 1, 1, 3, 1, 1, 1, 3, 3, 1, 3, 1, 1, 3, 1, 4, 3, 3, 2, 3, 2, …
## $ Jumlah.perjalanan.Ahad   <dbl> 2, 3, 1, 2, 1, 1, 2, 3, 4, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 3, 1, 1, 1, 3, 3, 1, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, …
```

Ini adalah kasus yang tepat untuk menggambarkan bahwa dalam data terstruktur, jenis nilai harus sama persis. Untuk kesederhanaan praktikum, kita akan melewati dulu variabel `biaya.dalam.sepekan` dan `Jumlah.perjalanan.Senin` tersebut.

### Memperbaiki Set Data yang Akan Digabungkan

Kita akan menghapus `biaya.dalam.sepekan` dari kedua set data kita. Untuk menghapus suatu kolom, kita dapat menggunakan fungsi `select()` juga, akan tetapi kita tambahkan tanda negatif (`-`) di depan nama variabelnya.


``` r
# 'Menimpa' data_uin_selected dengan data_uin_selected yang variabel biaya.dalam.sepekan sudah dihapus
data_uin_selected <- select(data_uin_selected, 
                            -`biaya.dalam.sepekan`, -`Jumlah.perjalanan.Senin`)

# Melihat hasilnya
glimpse(data_uin_selected)
```

```
## Rows: 400
## Columns: 19
## $ Nomor.urut               <dbl> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, …
## $ Jenis.Kelamin            <chr> "Laki-laki", "Laki-laki", "Perempuan", "Laki-laki", "Laki-laki", "Laki-laki", "Laki-laki", "Laki-laki", "Peremp…
## $ Umur                     <dbl> 22, 25, 24, 19, 23, 21, 22, 21, 21, 21, 19, 19, 19, 19, 19, 20, 19, 21, 20, 20, 20, 20, 20, 19, 20, 22, 22, 22,…
## $ Fakultas                 <chr> "Syariah", "Syariah", "Tarbiyah dan Keguruan", "Dakwah dan Ilmu Komunikasi", "Tarbiyah dan Keguruan", "Adab", "…
## $ Prodi                    <chr> "Hukum Keluarga", "Hukum Keluarga", "Pendidikan Agama Islam", "Komunikasi dan Penyiaran Islam", "Manajemen Pend…
## $ Tingkat.Semester         <chr> "4 (Semester 7 - Semester 8)", "4 (Semester 7 - Semester 8)", "4 (Semester 7 - Semester 8)", "1 (Semester 1 - S…
## $ Uang.Saku                <chr> "1Jt - 2 Jt", "< 1 Jt", "< 1 Jt", "< 1 Jt", "< 1 Jt", "< 1 Jt", "< 1 Jt", "< 1 Jt", "1Jt - 2 Jt", "< 1 Jt", "1J…
## $ kepemilikan.mobil        <dbl> 0, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, …
## $ kepemilikan.motor        <dbl> 1, 4, 0, 1, 1, 1, 1, 4, 4, 1, 0, 1, 3, 1, 0, 0, 1, 2, 2, 1, 0, 0, 1, 0, 1, 3, 2, 2, 0, 1, 1, 1, 2, 1, 1, 0, 0, …
## $ kepemilikan.sepeda       <dbl> 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 3, 0, 0, 0, 0, 4, 0, 0, 0, 0, …
## $ kendaraan.utama          <chr> "Sepeda Motor Pribadi", "Sepeda Motor Pribadi", "Berjalan Kaki", "Sepeda Motor Pribadi", "Sepeda Motor Pribadi"…
## $ jenis.tempat.tinggal     <chr> "Rumah Bersama Saudara", "Kos Sendiri", "Kos Sendiri", "Kos Sendiri", "Rumah Mengontrak Bersama-sama", "Rumah P…
## $ jarak                    <dbl> 19.27, 0.58, 0.56, 1.05, 1.69, 7.91, 2.58, 2.32, 0.77, 6.56, 0.63, 0.53, 0.91, 2.52, 1.31, 0.83, 0.95, 7.67, 4.…
## $ Jumlah.perjalanan.Selasa <dbl> 3, 3, 0, 2, 4, 2, 0, 4, 0, 2, 4, 2, 2, 2, 3, 2, 2, 2, 3, 0, 0, 0, 2, 0, 0, 2, 3, 1, 0, 2, 3, 2, 3, 2, 2, 2, 5, …
## $ Jumlah.perjalanan.Rabu   <dbl> 0, 0, 3, 0, 0, 2, 3, 4, 3, 2, 4, 2, 2, 2, 2, 2, 2, 0, 3, 2, 2, 2, 2, 3, 3, 0, 2, 2, 0, 4, 3, 2, 2, 2, 4, 0, 5, …
## $ Jumlah.perjalanan.Kamis  <dbl> 0, 3, 0, 2, 0, 0, 0, 4, 0, 2, 2, 2, 2, 2, 0, 3, 2, 2, 2, 2, 2, 2, 2, 3, 2, 2, 3, 2, 2, 4, 3, 2, 2, 2, 4, 0, 5, …
## $ Jumlah.perjalanan.Jumat  <dbl> 0, 0, 0, 2, 3, 2, 2, 4, 0, 0, 2, 2, 2, 2, 2, 0, 2, 2, 0, 2, 2, 2, 2, 2, 2, 2, 3, 3, 0, 0, 4, 2, 2, 1, 1, 0, 5, …
## $ Jumlah.perjalanan.Sabtu  <dbl> 0, 0, 0, 0, 2, 2, 2, 2, 2, 0, 2, 2, 0, 0, 0, 0, 0, 2, 0, 2, 0, 0, 0, 0, 0, 2, 2, 2, 0, 0, 2, 2, 0, 0, 0, 0, 5, …
## $ Jumlah.perjalanan.Ahad   <dbl> 0, 0, 0, 2, 0, 2, 2, 2, 2, 0, 2, 2, 0, 2, 2, 0, 0, 1, 2, 0, 0, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 5, …
```

``` r
colnames(data_uin_selected)
```

```
##  [1] "Nomor.urut"               "Jenis.Kelamin"            "Umur"                     "Fakultas"                 "Prodi"                   
##  [6] "Tingkat.Semester"         "Uang.Saku"                "kepemilikan.mobil"        "kepemilikan.motor"        "kepemilikan.sepeda"      
## [11] "kendaraan.utama"          "jenis.tempat.tinggal"     "jarak"                    "Jumlah.perjalanan.Selasa" "Jumlah.perjalanan.Rabu"  
## [16] "Jumlah.perjalanan.Kamis"  "Jumlah.perjalanan.Jumat"  "Jumlah.perjalanan.Sabtu"  "Jumlah.perjalanan.Ahad"
```


``` r
# 'Menimpa' data_ubl_selected dengan data_ubl_selected yang variabel biaya.dalam.sepekan sudah dihapus
data_ubl_selected <- select(data_ubl_selected, 
                            -`biaya.dalam.sepekan`, -`Jumlah.perjalanan.Senin`)

# Melihat hasilnya
glimpse(data_ubl_selected)
```

```
## Rows: 379
## Columns: 19
## $ Nomor.urut               <dbl> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, …
## $ Jenis.Kelamin            <chr> "Perempuan", "Laki-Laki", "Laki-Laki", "Laki-Laki", "Laki-Laki", "Perempuan", "Perempuan", "Perempuan", "Laki-L…
## $ Umur                     <dbl> 21, 20, 21, 22, 21, 21, 22, 22, 22, 22, 21, 22, 22, 22, 19, 22, 23, 22, 23, 22, 20, 19, 21, 22, 18, 20, 22, 21,…
## $ Fakultas                 <chr> "Fakultas Ilmu Sosial dan Politik", "Fakultas Hukum", "Fakultas Ekonomi dan Bisnis", "Fakultas Ekonomi dan Bisn…
## $ Prodi                    <chr> "Ilmu Komunikasi", "Ilmu Hukum", "Manajemen", "Akuntansi", "Manajemen", "Akuntansi", "Administrasi Publik", "Ad…
## $ Tingkat.Semester         <chr> "4 (Semester 7 - Semester 8)", "3 (Semester 5 - Semester 6)", "4 (Semester 7 - Semester 8)", "4 (Semester 7 - S…
## $ Uang.Saku                <chr> "< 1 jt", "1 jt – 2 jt", "1 jt – 2 jt", "1 jt – 2 jt", "2,1 jt – 3 jt", "1 jt – 2 jt", "1 jt – 2 jt", "< 1 jt",…
## $ kepemilikan.mobil        <dbl> 1, 2, 1, 1, 4, 1, 1, 1, 1, 1, NA, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 2, 0, 0, 0, 0, 0, 2, 1, 1, 2, 1, 2, 1, 3, 2, 2,…
## $ kepemilikan.motor        <dbl> 2, 1, 2, 4, 4, 2, 1, 1, 1, 1, 1, 2, 0, 1, 1, 1, 0, 1, 0, 2, 2, 1, 1, 0, 1, 0, 1, 3, 1, 3, 2, 2, 2, 2, 2, 2, 3, …
## $ kepemilikan.sepeda       <dbl> 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, NA, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 1, 0, 0, 1, 0, 0, 3, 1, 0, 0, 0, 0, 0, 0, 1, 1,…
## $ kendaraan.utama          <chr> "Sepeda Motor Pribadi", "Mobil Pribadi", "Sepeda Motor Pribadi", "Kendaraan Bermotor (menumpang dengan keluarga…
## $ jenis.tempat.tinggal     <chr> "Rumah pribadi/rumah keluarga", "Rumah pribadi/rumah keluarga", "Rumah pribadi/rumah keluarga", "Rumah pribadi/…
## $ jarak                    <dbl> 4.2237967, 2.7033310, 3.2370722, 3.0023362, 5.9619250, 2.9253306, 2.0588294, 12.0078709, 4.7355783, 6.7413074, …
## $ Jumlah.perjalanan.Selasa <dbl> 3, 3, 1, 2, 1, 3, 2, 4, 4, 3, 3, 1, 1, 4, 1, 3, 3, 1, 1, 3, 1, 1, 1, 3, 4, 1, 5, 1, 1, 3, 3, 3, 3, 4, 3, 4, 1, …
## $ Jumlah.perjalanan.Rabu   <dbl> 2, 3, 1, 2, 1, 1, 2, 4, 4, 3, 1, 2, 1, 4, 3, 2, 4, 1, 1, 3, 1, 1, 1, 3, 3, 1, 5, 1, 1, 3, 2, 3, 1, 3, 2, 3, 1, …
## $ Jumlah.perjalanan.Kamis  <dbl> 3, 3, 1, 2, 1, 1, 2, 4, 4, 3, 1, 1, 1, 4, 3, 2, 2, 1, 1, 3, 1, 1, 1, 3, 3, 1, 5, 1, 2, 3, 1, 2, 4, 2, 3, 1, 1, …
## $ Jumlah.perjalanan.Jumat  <dbl> 2, 3, 1, 2, 1, 1, 2, 4, 3, 3, 1, 2, 1, 4, 3, 2, 3, 1, 1, 3, 1, 1, 1, 3, 3, 1, 5, 1, 1, 3, 1, 1, 1, 3, 2, 5, 1, …
## $ Jumlah.perjalanan.Sabtu  <dbl> 2, 3, 1, 2, 1, 1, 2, 3, 4, 2, 1, 1, 1, 1, 1, 2, 1, 1, 1, 3, 1, 1, 1, 3, 3, 1, 3, 1, 1, 3, 1, 4, 3, 3, 2, 3, 2, …
## $ Jumlah.perjalanan.Ahad   <dbl> 2, 3, 1, 2, 1, 1, 2, 3, 4, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 3, 1, 1, 1, 3, 3, 1, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, …
```

### Menyatukan Kedua Set Data Setelah Diperbaiki

Kita akan coba menggabungkan kedua set data tadi.


``` r
# Menggabungkan kedua data frame menjadi satu
data_gabungan <- bind_rows(data_uin_selected, data_ubl_selected)
```

Selesai! 🥳 Mari kita lihat hasil akhir dari kerja keras kita dengan `glimpse()`. Hasil akan menunjukkan bahwa kita mempunyai 779 objek yang merupakan gabungan responden mahasiswa UIN RIL dan UBL.


``` r
# Tampilkan struktur data gabungan yang sudah rapi
glimpse(data_gabungan)
```

```
## Rows: 779
## Columns: 19
## $ Nomor.urut               <dbl> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, …
## $ Jenis.Kelamin            <chr> "Laki-laki", "Laki-laki", "Perempuan", "Laki-laki", "Laki-laki", "Laki-laki", "Laki-laki", "Laki-laki", "Peremp…
## $ Umur                     <dbl> 22, 25, 24, 19, 23, 21, 22, 21, 21, 21, 19, 19, 19, 19, 19, 20, 19, 21, 20, 20, 20, 20, 20, 19, 20, 22, 22, 22,…
## $ Fakultas                 <chr> "Syariah", "Syariah", "Tarbiyah dan Keguruan", "Dakwah dan Ilmu Komunikasi", "Tarbiyah dan Keguruan", "Adab", "…
## $ Prodi                    <chr> "Hukum Keluarga", "Hukum Keluarga", "Pendidikan Agama Islam", "Komunikasi dan Penyiaran Islam", "Manajemen Pend…
## $ Tingkat.Semester         <chr> "4 (Semester 7 - Semester 8)", "4 (Semester 7 - Semester 8)", "4 (Semester 7 - Semester 8)", "1 (Semester 1 - S…
## $ Uang.Saku                <chr> "1Jt - 2 Jt", "< 1 Jt", "< 1 Jt", "< 1 Jt", "< 1 Jt", "< 1 Jt", "< 1 Jt", "< 1 Jt", "1Jt - 2 Jt", "< 1 Jt", "1J…
## $ kepemilikan.mobil        <dbl> 0, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, …
## $ kepemilikan.motor        <dbl> 1, 4, 0, 1, 1, 1, 1, 4, 4, 1, 0, 1, 3, 1, 0, 0, 1, 2, 2, 1, 0, 0, 1, 0, 1, 3, 2, 2, 0, 1, 1, 1, 2, 1, 1, 0, 0, …
## $ kepemilikan.sepeda       <dbl> 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 3, 0, 0, 0, 0, 4, 0, 0, 0, 0, …
## $ kendaraan.utama          <chr> "Sepeda Motor Pribadi", "Sepeda Motor Pribadi", "Berjalan Kaki", "Sepeda Motor Pribadi", "Sepeda Motor Pribadi"…
## $ jenis.tempat.tinggal     <chr> "Rumah Bersama Saudara", "Kos Sendiri", "Kos Sendiri", "Kos Sendiri", "Rumah Mengontrak Bersama-sama", "Rumah P…
## $ jarak                    <dbl> 19.27, 0.58, 0.56, 1.05, 1.69, 7.91, 2.58, 2.32, 0.77, 6.56, 0.63, 0.53, 0.91, 2.52, 1.31, 0.83, 0.95, 7.67, 4.…
## $ Jumlah.perjalanan.Selasa <dbl> 3, 3, 0, 2, 4, 2, 0, 4, 0, 2, 4, 2, 2, 2, 3, 2, 2, 2, 3, 0, 0, 0, 2, 0, 0, 2, 3, 1, 0, 2, 3, 2, 3, 2, 2, 2, 5, …
## $ Jumlah.perjalanan.Rabu   <dbl> 0, 0, 3, 0, 0, 2, 3, 4, 3, 2, 4, 2, 2, 2, 2, 2, 2, 0, 3, 2, 2, 2, 2, 3, 3, 0, 2, 2, 0, 4, 3, 2, 2, 2, 4, 0, 5, …
## $ Jumlah.perjalanan.Kamis  <dbl> 0, 3, 0, 2, 0, 0, 0, 4, 0, 2, 2, 2, 2, 2, 0, 3, 2, 2, 2, 2, 2, 2, 2, 3, 2, 2, 3, 2, 2, 4, 3, 2, 2, 2, 4, 0, 5, …
## $ Jumlah.perjalanan.Jumat  <dbl> 0, 0, 0, 2, 3, 2, 2, 4, 0, 0, 2, 2, 2, 2, 2, 0, 2, 2, 0, 2, 2, 2, 2, 2, 2, 2, 3, 3, 0, 0, 4, 2, 2, 1, 1, 0, 5, …
## $ Jumlah.perjalanan.Sabtu  <dbl> 0, 0, 0, 0, 2, 2, 2, 2, 2, 0, 2, 2, 0, 0, 0, 0, 0, 2, 0, 2, 0, 0, 0, 0, 0, 2, 2, 2, 0, 0, 2, 2, 0, 0, 0, 0, 5, …
## $ Jumlah.perjalanan.Ahad   <dbl> 0, 0, 0, 2, 0, 2, 2, 2, 2, 0, 2, 2, 0, 2, 2, 0, 0, 1, 2, 0, 0, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 5, …
```

### Mengekspor Set Data Hasil Pengolahan ke Fail *(File)* Terpisah

Dalam dunia data sains dikenal jenis fail `.csv` yang merupakan singkatan dari *"comma-separated values."* Fail ini menyimpan nilai-nilai sehingga dapat dibaca sebagai tabel seperti contoh berikut:

```         
Nama; umur
Ifna; 20
Salbina; 21
```

Hasilnya adalah:

| Nama    | umur |
| ------- | ---- |
| Ifna    | 20   |
| Salbina | 21   |

Kita dapat mengekspor set data hasil pengolahan menjadi fail dengan format data terstruktur seperti `.csv` atau Excel (`.xls`, `.xlsx`) dengan fungsi `write.csv2()` atau `write.xlsx()`.

Format perintah fungsi-fungsi ini adalah:

``` r
write.csv2(variabel_dataset, "nama_file_ekspor.csv")

write.xlsx(variabel_dataset, "nama_file_ekspor.xlsx")
```

Seluruh fail yang diekspor lokasi direktorinya **sama seperti lokasi file .Rproj** kita.

#### Mengekspor set data ke fail `.csv`

Terdapat dua jenis fungsi untuk mengekspor set data ke fail `.csv`: `write.csv()` dan `write.csv2()`. Perbedaan antara keduanya adalah **pemisah nilainya**.

Fungsi `write.csv()` digunakan untuk set data yang menggunakan **tanda titik** sebagai pemisah desimal, sehingga pemisahnya adalah **tanda koma (,)**. Ini adalah format yang biasa dipakai di Amerika Utara.

Sementara itu, `write.csv2()` menggunakan pemisah **titik-koma (;)** *(semicolon)*. Ini digunakan untuk set data yang pemisah desimalnya adalah **tanda koma**.


``` r
# Mengekspor data_gabungan dalam format csv
write.csv2(data_gabungan, "Data UINRIL & UBL.csv")
```

#### Mengekspor set data ke fail `.xlsx`

Sama seperti write.csv2(), fungsi write.xlsx() juga mengikuti format yang sama.


``` r
write.xlsx(data_gabungan, "Data UINRIL & UBL.xlsx")
```

::: {.rmdexercise}
**Aktivitas Mandiri 3: Menggabungkan Data ITERA dan UNILA [STP-1.3, STP-1.4]**

Dari file `Data Praktikum 01.xlsx`, terdapat dua sheet tambahan:
- `DataUtama_mhsITERA`
- `DataUtama_mhsUNILA`

**Langkah-langkah:**

1. **Impor data dari kedua sheet** menggunakan `read.xlsx()`
   - Simpan sheet ITERA ke variabel `data_itera`
   - Simpan sheet UNILA ke variabel `data_unila`

2. **Identifikasi kolom yang bisa digabungkan**
   - Gunakan `colnames()` untuk melihat nama kolom di kedua dataset
   - Gunakan `glimpse()` untuk melihat tipe data setiap kolom
   - Tentukan kolom mana yang tipenya sama dan bisa digabungkan

3. **Seleksi kolom yang sesuai** menggunakan `select()`
   - Pilih hanya kolom yang ada di kedua dataset dan tipenya sama
   - Ingat menggunakan backtick (`) untuk kolom dengan karakter khusus

4. **Seragamkan nama kolom**
   - Buat vektor `kolom_final` berisi nama standar untuk semua kolom
   - Gunakan `colnames(data_itera_selected) <- kolom_final`
   - Lakukan hal sama untuk `data_unila_selected`

5. **Gabungkan dengan `bind_rows()`**
   - Jika ada error tipe data, periksa dengan `glimpse()` dan perbaiki
   - Simpan hasil gabungan ke variabel `data_gabungan_iteraunila`

6. **Simpan ke file**
   - Ekspor hasil gabungan dengan `write.xlsx()`
   - Nama file: `Prak1_[NIM1]_[NIM2].xlsx`

**Analisis [STP-1.3]:**

7. Berapa jumlah **variabel** (kolom) dalam data gabungan?
8. Berapa jumlah **objek** (baris) dalam data gabungan?
9. Tampilkan bukti dengan `glimpse(data_gabungan_iteraunila)` dan sertakan screenshot

**Refleksi:**
- Apa tantangan terbesar yang Anda hadapi dalam menggabungkan data?
- Mengapa penting untuk mengecek tipe data sebelum menggabungkan dataset?
:::

------------------------------------------------------------------------




<!--chapter:end:01-data-terstruktur.Rmd-->

# Modul-2: Analisis Statistika Deskriptif

Setelah mempelajari modul ini, Anda diharapkan dapat mengoperasikan perhitungan persentase/proporsi, rasio, laju, ukuran pemusatan, dan ukuran penyebaran untuk suatu data kuantitatif dengan menggunakan perangkat lunak [STP-2.4]{.capaian}

---

Dalam praktikum ini kita akan melanjutkan analisis data terstruktur kita dengan analisis statistika deskriptif untuk variabel-variabel **kategoris** dan **numerik**. Kedua jenis variabel ini berkaitan juga dengan tingkat pengukurannya yang terdiri atas **nominal**, **ordinal**, dan **interval/rasio (metrik).**

Analisis statistik deskriptif yang akan kita lakukan mencakup **persentase/proporsi**, **rata-rata *(mean)***, **median**, dan **standar deviasi**. Ada beberapa ukuran statistik yang tidak kita pelajari di kelas tetapi dikenalkan pada praktikum ini, seperti **persentil** dan **kuartil**. Perhitungan IQV akan dilakukan dengan sekaligus mengenalkan mekanisme `function` di R.

## Persiapan

Seperti biasa, kita perlu memuat *library* andalan kita dalam mengolah data, `tidyverse`, dan juga untuk membaca file Excel, `openxlsx`.


``` r
# Memuat library yang diperlukan
library(tidyverse)
library(openxlsx)
```

## Mengimpor Dataset

Kita menggunakan data mahasiswa UBL yang sudah lengkap karena sudah diolah kembali.


``` r
# Mengeset variabel tersendiri untuk nama file nama sheet
file.dibaca <- "datasets/Data Praktikum 02.xlsx"
sheet.ubl <- "DataUtama_mhsUBL"

# Mengimpor file menjadi dataset memanfaatkan variabel nama file dan nama sheet yang kita buat tadi
data.ubl <- read.xlsx(file.dibaca, sheet = sheet.ubl)
```

Sebelumnya kita sudah mengenal `glimpse()` yang berasal dari *library* `dplyr`, sekarang kita akan mengenal perintah untuk menampilkan ringkasan dataset bawaan R (disebut juga *'base R'*) bernama `summary()`.


``` r
# Melihat ringkasan dataset (cara lain)
summary(data.ubl)
```

```
##    Timestamp      Kampus_PT           Nomor.urut    Jenis.Kelamin           Umur         Fakultas            Prodi           Tingkat.Semester  
##  Min.   :45414   Length:379         Min.   :  1.0   Length:379         Min.   :18.00   Length:379         Length:379         Length:379        
##  1st Qu.:45416   Class :character   1st Qu.: 95.5   Class :character   1st Qu.:20.00   Class :character   Class :character   Class :character  
##  Median :45423   Mode  :character   Median :190.0   Mode  :character   Median :21.00   Mode  :character   Mode  :character   Mode  :character  
##  Mean   :45420                      Mean   :190.0                      Mean   :20.78                                                           
##  3rd Qu.:45423                      3rd Qu.:284.5                      3rd Qu.:22.00                                                           
##  Max.   :45424                      Max.   :379.0                      Max.   :23.00                                                           
##                                                                                                                                                
##   Uang.Saku         kepemilikan.mobil kepemilikan.motor kepemilikan.sepeda kendaraan.utama     kelurahan         jenis.tempat.tinggal
##  Length:379         Min.   :0.0000    Min.   :0.000     Min.   :0.0000     Length:379         Length:379         Length:379          
##  Class :character   1st Qu.:0.0000    1st Qu.:1.000     1st Qu.:0.0000     Class :character   Class :character   Class :character    
##  Mode  :character   Median :1.0000    Median :1.000     Median :0.0000     Mode  :character   Mode  :character   Mode  :character    
##                     Mean   :0.9654    Mean   :1.517     Mean   :0.2857                                                               
##                     3rd Qu.:2.0000    3rd Qu.:2.000     3rd Qu.:0.0000                                                               
##                     Max.   :4.0000    Max.   :5.000     Max.   :3.0000                                                               
##                     NA's   :3                           NA's   :1                                                                    
##  nama.jalan.tempat.tinggal   jarak.(km)       alasan.pemilihan.lokasi.tempat.tinggal biaya.dalam.seminggu Jumlah.perjalanan.Senin
##  Length:379                Min.   : 0.06352   Length:379                             Min.   :  0.00       Min.   :1.000          
##  Class :character          1st Qu.: 1.31127   Class :character                       1st Qu.: 50.00       1st Qu.:2.000          
##  Mode  :character          Median : 2.69037   Mode  :character                       Median : 70.00       Median :2.000          
##                            Mean   : 3.37914                                          Mean   : 93.57       Mean   :2.679          
##                            3rd Qu.: 4.69466                                          3rd Qu.:110.00       3rd Qu.:4.000          
##                            Max.   :43.54519                                          Max.   :600.00       Max.   :8.000          
##                                                                                      NA's   :2            NA's   :43             
##  Jumlah.Perjalanan.Selasa Jumlah.Perjalanan.Rabu Jumlah.Perjalanan.Kamis Jumlah.Perjalanan.Jumat Jumlah.Perjalanan.Sabtu Jumlah.Perjalanan.Ahad
##  Min.   :1.000            Min.   :1.000          Min.   :1.000           Min.   :1.000           Min.   :1.000           Min.   :1.00          
##  1st Qu.:1.000            1st Qu.:1.000          1st Qu.:1.000           1st Qu.:1.000           1st Qu.:1.000           1st Qu.:1.00          
##  Median :2.000            Median :2.000          Median :2.000           Median :2.000           Median :2.000           Median :1.00          
##  Mean   :2.264            Mean   :2.092          Mean   :2.092           Mean   :2.032           Mean   :1.749           Mean   :1.52          
##  3rd Qu.:3.000            3rd Qu.:3.000          3rd Qu.:3.000           3rd Qu.:3.000           3rd Qu.:2.000           3rd Qu.:2.00          
##  Max.   :6.000            Max.   :6.000          Max.   :7.000           Max.   :9.000           Max.   :5.000           Max.   :4.00          
## 
```

## Merapikan Dataset *(Data Wrangling)*

Sering dikatakan bahwa 50% pekerjaan ilmuwan data adalah **merapikan dataset**. Ini diistilahkan dengan *wrangling*. *Data wrangling* mencakup penggantian nama variabel, pengecekan nilai yang hilang *(missing values)*, mengubah/memanipulasi variabel, dan masih banyak lagi.

#### Mengganti Nama Variabel

Pada praktikum sebelumnya kita mengubah nama kolom/variabel dalam *dataset* secara **keseluruhan**, yakni dengan menimpakan vektor nama-nama baru variabel kita dengan fungsi `colnames()` .

Kita pastinya tidak akan selalu mengubah semua kolom secara sekaligus, karena itu kita harus belajar bagaimana cara mengganti nama beberapa kolom saja, yakni dengan perintah `rename()`.

Perintah `rename()` memiliki sintaks seperti berikut

```r
rename(dataset_kita, nama_kolom_baru = nama_kolom_lama) 
```


``` r
# Membaca ulang dataset supaya menjadi kondisi semula
data.ubl <- read.xlsx(file.dibaca, sheet = sheet.ubl)
colnames(data.ubl)
```

```
##  [1] "Timestamp"                              "Kampus_PT"                              "Nomor.urut"                            
##  [4] "Jenis.Kelamin"                          "Umur"                                   "Fakultas"                              
##  [7] "Prodi"                                  "Tingkat.Semester"                       "Uang.Saku"                             
## [10] "kepemilikan.mobil"                      "kepemilikan.motor"                      "kepemilikan.sepeda"                    
## [13] "kendaraan.utama"                        "kelurahan"                              "jenis.tempat.tinggal"                  
## [16] "nama.jalan.tempat.tinggal"              "jarak.(km)"                             "alasan.pemilihan.lokasi.tempat.tinggal"
## [19] "biaya.dalam.seminggu"                   "Jumlah.perjalanan.Senin"                "Jumlah.Perjalanan.Selasa"              
## [22] "Jumlah.Perjalanan.Rabu"                 "Jumlah.Perjalanan.Kamis"                "Jumlah.Perjalanan.Jumat"               
## [25] "Jumlah.Perjalanan.Sabtu"                "Jumlah.Perjalanan.Ahad"
```

``` r
# Mengganti nama variabel-variabel
data.ubl <- rename(data.ubl, biaya.dalam.sepekan = biaya.dalam.seminggu)
data.ubl <- rename(data.ubl, Jumlah.Perjalanan.Senin = Jumlah.perjalanan.Senin)
data.ubl <- rename(data.ubl, jarak = `jarak.(km)`)  # tanda backtick (`) digunakan di antara "jarak.(km)" 
                                                    # karena ada tanda kurung yang dianggap oleh R mempunyai fungsi khusus
```

::: {.rmdnote}
**Pengenalan Teknik Pengolahan dalam R: *Pipe Operator* (`|>`)**

Dalam pengolahan data dengan `tidyverse` penting untuk kita kuasai penggunaan operator yang satu ini. Perhatikan dua cara berikut untuk mengganti nama variabel-variabel kita.


``` r
# CARA-1: CARA KONVENSIONAL

# Membaca ulang dataset supaya menjadi kondisi semula
data.ubl <- read.xlsx(file.dibaca, sheet = sheet.ubl)
colnames(data.ubl)
```

```
##  [1] "Timestamp"                              "Kampus_PT"                              "Nomor.urut"                            
##  [4] "Jenis.Kelamin"                          "Umur"                                   "Fakultas"                              
##  [7] "Prodi"                                  "Tingkat.Semester"                       "Uang.Saku"                             
## [10] "kepemilikan.mobil"                      "kepemilikan.motor"                      "kepemilikan.sepeda"                    
## [13] "kendaraan.utama"                        "kelurahan"                              "jenis.tempat.tinggal"                  
## [16] "nama.jalan.tempat.tinggal"              "jarak.(km)"                             "alasan.pemilihan.lokasi.tempat.tinggal"
## [19] "biaya.dalam.seminggu"                   "Jumlah.perjalanan.Senin"                "Jumlah.Perjalanan.Selasa"              
## [22] "Jumlah.Perjalanan.Rabu"                 "Jumlah.Perjalanan.Kamis"                "Jumlah.Perjalanan.Jumat"               
## [25] "Jumlah.Perjalanan.Sabtu"                "Jumlah.Perjalanan.Ahad"
```

``` r
# Mengganti nama variabel-variabel
data.ubl <- rename(data.ubl, biaya.dalam.sepekan = biaya.dalam.seminggu)
data.ubl <- rename(data.ubl, Jumlah.Perjalanan.Senin = Jumlah.perjalanan.Senin)
data.ubl <- rename(data.ubl, jarak = `jarak.(km)`)
```


``` r
# CARA-2: MENGGUNAKAN PIPE OPERATOR

# Membaca ulang dataset supaya menjadi kondisi semula
data.ubl <- read.xlsx(file.dibaca, sheet = sheet.ubl)

# Mengganti nama variabel-variabel
data.ubl <- data.ubl |> 
  rename(biaya.dalam.sepekan = biaya.dalam.seminggu) |>
  # setiap baris yang masih ada proses selanjutnya harus diisi dengan pipe operator
  rename(Jumlah.Perjalanan.Senin = Jumlah.perjalanan.Senin) |> 
  rename(jarak = `jarak.(km)`)
```

Dalam cara 1, kita harus menulis `data.ubl` berkali-kali untuk setiap perintah. Ini mungkin tidak akan terasa jika jumlah kolom yang kita miliki sedikit. Tetapi, akan lain ceritanya jika jumlahnya banyak. Selain itu, data kita tidak bisa secara intuitif seperti biasanya kita membaca suatu teks dari kiri ke kanan.

Operator pipa (`|>`) memungkinkan hal tersebut. Selain kita tidak perlu menuliskan dataset kita berkali-kali, kita dengan lebih mudah memahami baris-baris kode kita tersebut sebagai proses dari atas ke bawah, dari kiri ke kanan, seperti pipa.

Berikut adalah penjelasan cara-2:

-   `data.ubl |>`: perintah "Ambil dataset `data.ubl`."

-   Kirimkan dataset itu ke fungsi berikutnya (`rename`).

-   Hasil dari fungsi `rename` pertama dikirimkan lagi ke fungsi `rename` kedua, dan seterusnya.

> ⚠️ **Penting**
>
> Pipe operator dapat dimasukkan dengan kombinasi tombol `Ctrl` + `Shift` + `M` di *keyboard*.

:::

::: {.rmdexercise}
**Aktivitas Mandiri 1: Menguasai Pipe Operator [STP-2.4]**

Dengan satu blok kode menggunakan pipe operator `|>`:
1. Baca dataset UBL dari file dan sheet yang sudah ditentukan
2. Ubah nama variabel `biaya.dalam.seminggu` menjadi `biaya.dalam.sepekan`
3. Ubah nama variabel `Jumlah.perjalanan.Senin` menjadi `Jumlah.Perjalanan.Senin`
4. Buang baris yang mengandung missing values dengan fungsi `drop_na()`
5. Simpan hasilnya ke variabel `data_ubl_bersih`
6. Verifikasi dengan `glimpse(data_ubl_bersih)` - pastikan tidak ada NA
:::

#### Mengecek *Missing Values*

Pengecekan *missing values* dilakukan dengan perintah `is.na()` yang menghasilkan tabel berisi nilai *boolean* `FALSE` dan `TRUE` yang berarti 'tidak kosong' dan 'kosong' secara berturut-turut.

`colSums()` menjumlahkan nilai-nilai `TRUE` pada setiap kolom, menandakan berapa jumlah objek yang kosong nilainya.


``` r
checkMV_ubl <- is.na(data.ubl)

head(checkMV_ubl)
```

```
##   Timestamp Kampus_PT Nomor.urut Jenis.Kelamin  Umur Fakultas Prodi Tingkat.Semester Uang.Saku kepemilikan.mobil kepemilikan.motor
## 1     FALSE     FALSE      FALSE         FALSE FALSE    FALSE FALSE            FALSE     FALSE             FALSE             FALSE
## 2     FALSE     FALSE      FALSE         FALSE FALSE    FALSE FALSE            FALSE     FALSE             FALSE             FALSE
## 3     FALSE     FALSE      FALSE         FALSE FALSE    FALSE FALSE            FALSE     FALSE             FALSE             FALSE
## 4     FALSE     FALSE      FALSE         FALSE FALSE    FALSE FALSE            FALSE     FALSE             FALSE             FALSE
## 5     FALSE     FALSE      FALSE         FALSE FALSE    FALSE FALSE            FALSE     FALSE             FALSE             FALSE
## 6     FALSE     FALSE      FALSE         FALSE FALSE    FALSE FALSE            FALSE     FALSE             FALSE             FALSE
##   kepemilikan.sepeda kendaraan.utama kelurahan jenis.tempat.tinggal nama.jalan.tempat.tinggal jarak alasan.pemilihan.lokasi.tempat.tinggal
## 1              FALSE           FALSE     FALSE                FALSE                     FALSE FALSE                                  FALSE
## 2              FALSE           FALSE     FALSE                FALSE                     FALSE FALSE                                  FALSE
## 3              FALSE           FALSE     FALSE                FALSE                     FALSE FALSE                                  FALSE
## 4              FALSE           FALSE     FALSE                FALSE                     FALSE FALSE                                  FALSE
## 5              FALSE           FALSE     FALSE                FALSE                     FALSE FALSE                                  FALSE
## 6              FALSE           FALSE     FALSE                FALSE                     FALSE FALSE                                  FALSE
##   biaya.dalam.sepekan Jumlah.Perjalanan.Senin Jumlah.Perjalanan.Selasa Jumlah.Perjalanan.Rabu Jumlah.Perjalanan.Kamis Jumlah.Perjalanan.Jumat
## 1               FALSE                   FALSE                    FALSE                  FALSE                   FALSE                   FALSE
## 2               FALSE                   FALSE                    FALSE                  FALSE                   FALSE                   FALSE
## 3               FALSE                   FALSE                    FALSE                  FALSE                   FALSE                   FALSE
## 4               FALSE                   FALSE                    FALSE                  FALSE                   FALSE                   FALSE
## 5                TRUE                   FALSE                    FALSE                  FALSE                   FALSE                   FALSE
## 6               FALSE                   FALSE                    FALSE                  FALSE                   FALSE                   FALSE
##   Jumlah.Perjalanan.Sabtu Jumlah.Perjalanan.Ahad
## 1                   FALSE                  FALSE
## 2                   FALSE                  FALSE
## 3                   FALSE                  FALSE
## 4                   FALSE                  FALSE
## 5                   FALSE                  FALSE
## 6                   FALSE                  FALSE
```

``` r
colSums(checkMV_ubl)
```

```
##                              Timestamp                              Kampus_PT                             Nomor.urut 
##                                      0                                      0                                      0 
##                          Jenis.Kelamin                                   Umur                               Fakultas 
##                                      0                                      0                                      0 
##                                  Prodi                       Tingkat.Semester                              Uang.Saku 
##                                      0                                      0                                      0 
##                      kepemilikan.mobil                      kepemilikan.motor                     kepemilikan.sepeda 
##                                      3                                      0                                      1 
##                        kendaraan.utama                              kelurahan                   jenis.tempat.tinggal 
##                                      0                                      0                                      0 
##              nama.jalan.tempat.tinggal                                  jarak alasan.pemilihan.lokasi.tempat.tinggal 
##                                      4                                      0                                      0 
##                    biaya.dalam.sepekan                Jumlah.Perjalanan.Senin               Jumlah.Perjalanan.Selasa 
##                                      2                                     43                                      0 
##                 Jumlah.Perjalanan.Rabu                Jumlah.Perjalanan.Kamis                Jumlah.Perjalanan.Jumat 
##                                      0                                      0                                      0 
##                Jumlah.Perjalanan.Sabtu                 Jumlah.Perjalanan.Ahad 
##                                      0                                      0
```

#### Menghapus *Missing Values*

Penghapusan *missing values* juga dapat digunakan dengan *pipe operator.* Adapun perintah yang dapat kita gunakan adalah `drop_na()` dari paket `tidyr`.


``` r
# Menghapus observasi yang memiliki Missing Values
data.ubl <- data.ubl |>
  drop_na()

# Mengecek kembali Missing Values
checkMV_ubl <- is.na(data.ubl)
colSums(checkMV_ubl)
```

```
##                              Timestamp                              Kampus_PT                             Nomor.urut 
##                                      0                                      0                                      0 
##                          Jenis.Kelamin                                   Umur                               Fakultas 
##                                      0                                      0                                      0 
##                                  Prodi                       Tingkat.Semester                              Uang.Saku 
##                                      0                                      0                                      0 
##                      kepemilikan.mobil                      kepemilikan.motor                     kepemilikan.sepeda 
##                                      0                                      0                                      0 
##                        kendaraan.utama                              kelurahan                   jenis.tempat.tinggal 
##                                      0                                      0                                      0 
##              nama.jalan.tempat.tinggal                                  jarak alasan.pemilihan.lokasi.tempat.tinggal 
##                                      0                                      0                                      0 
##                    biaya.dalam.sepekan                Jumlah.Perjalanan.Senin               Jumlah.Perjalanan.Selasa 
##                                      0                                      0                                      0 
##                 Jumlah.Perjalanan.Rabu                Jumlah.Perjalanan.Kamis                Jumlah.Perjalanan.Jumat 
##                                      0                                      0                                      0 
##                Jumlah.Perjalanan.Sabtu                 Jumlah.Perjalanan.Ahad 
##                                      0                                      0
```

#### Menyesuaikan Variabel Nominal dan Ordinal dengan `factor()`

Apabila kita mengimpor dataset dengan variabel nonangka, bentuknya akan terbaca sebagai *character* (`chr`). Perintah `factor()` dari paket `forcats` berfungsi untuk mendefinisikan nilai-nilai yang ada dalam variabel kategoris tersebut sehingga kita mendefinisikan urutannya dan menetapkannya sebagai variabel ordinal.


``` r
# Mengidentifikasi variabel-variabel yang bisa diubah menjadi factor
glimpse(data.ubl)
```

```
## Rows: 330
## Columns: 26
## $ Timestamp                              <dbl> 45413.83, 45413.83, 45413.85, 45413.85, 45413.92, 45413.93, 45413.93, 45413.93, 45413.94, 45414.0…
## $ Kampus_PT                              <chr> "UBL", "UBL", "UBL", "UBL", "UBL", "UBL", "UBL", "UBL", "UBL", "UBL", "UBL", "UBL", "UBL", "UBL",…
## $ Nomor.urut                             <dbl> 1, 2, 3, 4, 6, 7, 8, 9, 10, 12, 14, 15, 16, 17, 18, 19, 20, 21, 24, 25, 27, 30, 31, 32, 33, 34, 3…
## $ Jenis.Kelamin                          <chr> "Perempuan", "Laki-Laki", "Laki-Laki", "Laki-Laki", "Perempuan", "Perempuan", "Perempuan", "Laki-…
## $ Umur                                   <dbl> 21, 20, 21, 22, 21, 22, 22, 22, 22, 22, 22, 19, 22, 23, 22, 23, 22, 20, 22, 18, 22, 20, 22, 21, 2…
## $ Fakultas                               <chr> "Fakultas Ilmu Sosial dan Politik", "Fakultas Hukum", "Fakultas Ekonomi dan Bisnis", "Fakultas Ek…
## $ Prodi                                  <chr> "Ilmu Komunikasi", "Ilmu Hukum", "Manajemen", "Akuntansi", "Akuntansi", "Administrasi Publik", "A…
## $ Tingkat.Semester                       <chr> "4 (Semester 7 - Semester 8)", "3 (Semester 5 - Semester 6)", "4 (Semester 7 - Semester 8)", "4 (…
## $ Uang.Saku                              <chr> "< 1 jt", "1 jt – 2 jt", "1 jt – 2 jt", "1 jt – 2 jt", "1 jt – 2 jt", "1 jt – 2 jt", "< 1 jt", "1…
## $ kepemilikan.mobil                      <dbl> 1, 2, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 2, 1, 2, 1, 3, 2, 2, 1, 0, 2, 0…
## $ kepemilikan.motor                      <dbl> 2, 1, 2, 4, 2, 1, 1, 1, 1, 2, 1, 1, 1, 0, 1, 0, 2, 2, 0, 1, 1, 3, 2, 2, 2, 2, 2, 2, 3, 2, 1, 1, 1…
## $ kepemilikan.sepeda                     <dbl> 1, 1, 2, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 2, 0, 0, 0…
## $ kendaraan.utama                        <chr> "Sepeda Motor Pribadi", "Mobil Pribadi", "Sepeda Motor Pribadi", "Kendaraan Bermotor (menumpang d…
## $ kelurahan                              <chr> "Kalibalau Kencana", "Gunung sulah", "langkapura", "Bilabong JAYA JAYA JAYA", "Way halim", "Segal…
## $ jenis.tempat.tinggal                   <chr> "Rumah pribadi/rumah keluarga", "Rumah pribadi/rumah keluarga", "Rumah pribadi/rumah keluarga", "…
## $ nama.jalan.tempat.tinggal              <chr> "eLBe Loundry", "Jl.Urip Sumoharjo no 88", "JL DARUSSALAM GG LANGGAR LK II", "Jl Darussalam bilab…
## $ jarak                                  <dbl> 4.2237967, 2.7033310, 3.2370722, 3.0023362, 2.9253306, 2.0588294, 12.0078709, 4.7355783, 6.741307…
## $ alasan.pemilihan.lokasi.tempat.tinggal <chr> "Bersama keluarga/saudara/teman", "Mudahnya akses berpergian dari tempat tinggal ", "Bersama kelu…
## $ biaya.dalam.sepekan                    <dbl> 25, 200, 50, 20, 40, 70, 35, 50, 350, 50, 30, 35, 50, 200, 40, 100, 600, 50, 5, 50, 30, 500, 50, …
## $ Jumlah.Perjalanan.Senin                <dbl> 2, 3, 1, 2, 3, 2, 4, 4, 3, 2, 4, 2, 2, 2, 1, 1, 4, 4, 4, 2, 5, 4, 2, 3, 3, 3, 4, 2, 4, 1, 5, 3, 3…
## $ Jumlah.Perjalanan.Selasa               <dbl> 3, 3, 1, 2, 3, 2, 4, 4, 3, 1, 4, 1, 3, 3, 1, 1, 3, 1, 3, 4, 5, 3, 3, 3, 3, 4, 3, 4, 1, 1, 3, 1, 3…
## $ Jumlah.Perjalanan.Rabu                 <dbl> 2, 3, 1, 2, 1, 2, 4, 4, 3, 2, 4, 3, 2, 4, 1, 1, 3, 1, 3, 3, 5, 3, 2, 3, 1, 3, 2, 3, 1, 1, 4, 3, 4…
## $ Jumlah.Perjalanan.Kamis                <dbl> 3, 3, 1, 2, 1, 2, 4, 4, 3, 1, 4, 3, 2, 2, 1, 1, 3, 1, 3, 3, 5, 3, 1, 2, 4, 2, 3, 1, 1, 1, 4, 1, 4…
## $ Jumlah.Perjalanan.Jumat                <dbl> 2, 3, 1, 2, 1, 2, 4, 3, 3, 2, 4, 3, 2, 3, 1, 1, 3, 1, 3, 3, 5, 3, 1, 1, 1, 3, 2, 5, 1, 1, 3, 4, 4…
## $ Jumlah.Perjalanan.Sabtu                <dbl> 2, 3, 1, 2, 1, 2, 3, 4, 2, 1, 1, 1, 2, 1, 1, 1, 3, 1, 3, 3, 3, 3, 1, 4, 3, 3, 2, 3, 2, 1, 3, 3, 2…
## $ Jumlah.Perjalanan.Ahad                 <dbl> 2, 3, 1, 2, 1, 2, 3, 4, 1, 1, 1, 1, 1, 2, 1, 1, 3, 1, 3, 3, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 3, 2…
```

Contoh pertama kita adalah variabel yang paling mudah: `Jenis.Kelamin`.


``` r
# Mengubah variabel Jenis.Kelamin dari chr menjadi factor (fct)
jk <- c("Laki-laki", "Perempuan") # Membuat vektor rincian nilai nominal

# Mengubah jenis variabel "Jenis.Kelamin" dari chr ke fct dengan 'mutate()'
data.ubl <- data.ubl |> 
  mutate(Jenis.Kelamin = factor(Jenis.Kelamin,jk))

# Mengecek hasil
glimpse(data.ubl)
```

```
## Rows: 330
## Columns: 26
## $ Timestamp                              <dbl> 45413.83, 45413.83, 45413.85, 45413.85, 45413.92, 45413.93, 45413.93, 45413.93, 45413.94, 45414.0…
## $ Kampus_PT                              <chr> "UBL", "UBL", "UBL", "UBL", "UBL", "UBL", "UBL", "UBL", "UBL", "UBL", "UBL", "UBL", "UBL", "UBL",…
## $ Nomor.urut                             <dbl> 1, 2, 3, 4, 6, 7, 8, 9, 10, 12, 14, 15, 16, 17, 18, 19, 20, 21, 24, 25, 27, 30, 31, 32, 33, 34, 3…
## $ Jenis.Kelamin                          <fct> Perempuan, NA, NA, NA, Perempuan, Perempuan, Perempuan, NA, Perempuan, NA, Perempuan, NA, Perempu…
## $ Umur                                   <dbl> 21, 20, 21, 22, 21, 22, 22, 22, 22, 22, 22, 19, 22, 23, 22, 23, 22, 20, 22, 18, 22, 20, 22, 21, 2…
## $ Fakultas                               <chr> "Fakultas Ilmu Sosial dan Politik", "Fakultas Hukum", "Fakultas Ekonomi dan Bisnis", "Fakultas Ek…
## $ Prodi                                  <chr> "Ilmu Komunikasi", "Ilmu Hukum", "Manajemen", "Akuntansi", "Akuntansi", "Administrasi Publik", "A…
## $ Tingkat.Semester                       <chr> "4 (Semester 7 - Semester 8)", "3 (Semester 5 - Semester 6)", "4 (Semester 7 - Semester 8)", "4 (…
## $ Uang.Saku                              <chr> "< 1 jt", "1 jt – 2 jt", "1 jt – 2 jt", "1 jt – 2 jt", "1 jt – 2 jt", "1 jt – 2 jt", "< 1 jt", "1…
## $ kepemilikan.mobil                      <dbl> 1, 2, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 2, 1, 2, 1, 3, 2, 2, 1, 0, 2, 0…
## $ kepemilikan.motor                      <dbl> 2, 1, 2, 4, 2, 1, 1, 1, 1, 2, 1, 1, 1, 0, 1, 0, 2, 2, 0, 1, 1, 3, 2, 2, 2, 2, 2, 2, 3, 2, 1, 1, 1…
## $ kepemilikan.sepeda                     <dbl> 1, 1, 2, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 2, 0, 0, 0…
## $ kendaraan.utama                        <chr> "Sepeda Motor Pribadi", "Mobil Pribadi", "Sepeda Motor Pribadi", "Kendaraan Bermotor (menumpang d…
## $ kelurahan                              <chr> "Kalibalau Kencana", "Gunung sulah", "langkapura", "Bilabong JAYA JAYA JAYA", "Way halim", "Segal…
## $ jenis.tempat.tinggal                   <chr> "Rumah pribadi/rumah keluarga", "Rumah pribadi/rumah keluarga", "Rumah pribadi/rumah keluarga", "…
## $ nama.jalan.tempat.tinggal              <chr> "eLBe Loundry", "Jl.Urip Sumoharjo no 88", "JL DARUSSALAM GG LANGGAR LK II", "Jl Darussalam bilab…
## $ jarak                                  <dbl> 4.2237967, 2.7033310, 3.2370722, 3.0023362, 2.9253306, 2.0588294, 12.0078709, 4.7355783, 6.741307…
## $ alasan.pemilihan.lokasi.tempat.tinggal <chr> "Bersama keluarga/saudara/teman", "Mudahnya akses berpergian dari tempat tinggal ", "Bersama kelu…
## $ biaya.dalam.sepekan                    <dbl> 25, 200, 50, 20, 40, 70, 35, 50, 350, 50, 30, 35, 50, 200, 40, 100, 600, 50, 5, 50, 30, 500, 50, …
## $ Jumlah.Perjalanan.Senin                <dbl> 2, 3, 1, 2, 3, 2, 4, 4, 3, 2, 4, 2, 2, 2, 1, 1, 4, 4, 4, 2, 5, 4, 2, 3, 3, 3, 4, 2, 4, 1, 5, 3, 3…
## $ Jumlah.Perjalanan.Selasa               <dbl> 3, 3, 1, 2, 3, 2, 4, 4, 3, 1, 4, 1, 3, 3, 1, 1, 3, 1, 3, 4, 5, 3, 3, 3, 3, 4, 3, 4, 1, 1, 3, 1, 3…
## $ Jumlah.Perjalanan.Rabu                 <dbl> 2, 3, 1, 2, 1, 2, 4, 4, 3, 2, 4, 3, 2, 4, 1, 1, 3, 1, 3, 3, 5, 3, 2, 3, 1, 3, 2, 3, 1, 1, 4, 3, 4…
## $ Jumlah.Perjalanan.Kamis                <dbl> 3, 3, 1, 2, 1, 2, 4, 4, 3, 1, 4, 3, 2, 2, 1, 1, 3, 1, 3, 3, 5, 3, 1, 2, 4, 2, 3, 1, 1, 1, 4, 1, 4…
## $ Jumlah.Perjalanan.Jumat                <dbl> 2, 3, 1, 2, 1, 2, 4, 3, 3, 2, 4, 3, 2, 3, 1, 1, 3, 1, 3, 3, 5, 3, 1, 1, 1, 3, 2, 5, 1, 1, 3, 4, 4…
## $ Jumlah.Perjalanan.Sabtu                <dbl> 2, 3, 1, 2, 1, 2, 3, 4, 2, 1, 1, 1, 2, 1, 1, 1, 3, 1, 3, 3, 3, 3, 1, 4, 3, 3, 2, 3, 2, 1, 3, 3, 2…
## $ Jumlah.Perjalanan.Ahad                 <dbl> 2, 3, 1, 2, 1, 2, 3, 4, 1, 1, 1, 1, 1, 2, 1, 1, 3, 1, 3, 3, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 3, 2…
```

Ternyata, hasil pendefinisian `factor` ke dalam data kita mengandung `NA` yang berarti data kosong atau *missing value*. Hal tersebut terjadi karena kita mendefinisikan vektor `jk` berisi `c("Laki-laki", "Perempuan")`.

Sementara itu, jika kita cermat, sebelumnya nilai jenis kelamin ditulis dengan `"Laki-Laki"` . Maka, kita harus memperbaiki vektor kita yang berisi nilai-nilai yang sesuai dengan dataset terlebih dahulu.


``` r
# Mengulangi pembacaan file sekaligus merapikan nama variabel-variabelnya serta menghilangkan Missing Values menggunakan Pipe operator
data.ubl <- read.xlsx(file.dibaca, sheet = sheet.ubl) |> 
  rename(biaya.dalam.sepekan = biaya.dalam.seminggu) |>
  rename(Jumlah.Perjalanan.Senin = Jumlah.perjalanan.Senin) |> 
  rename(jarak = `jarak.(km)`) |> 
  drop_na()

# Memperbaiki vektor nilai nominal sesuai dengan yang ada di data dengan mengganti penulisan "Laki-laki" menjadi "Laki-Laki"
jk <- c("Laki-Laki", "Perempuan")

# Mengubah lagi jenis variabel "Jenis.Kelamin" dari chr ke fct dengan 'mutate()
data.ubl <- data.ubl |> 
  mutate(Jenis.Kelamin = factor(Jenis.Kelamin,jk))

# Mengecek hasil
glimpse(data.ubl)
```

```
## Rows: 330
## Columns: 26
## $ Timestamp                              <dbl> 45413.83, 45413.83, 45413.85, 45413.85, 45413.92, 45413.93, 45413.93, 45413.93, 45413.94, 45414.0…
## $ Kampus_PT                              <chr> "UBL", "UBL", "UBL", "UBL", "UBL", "UBL", "UBL", "UBL", "UBL", "UBL", "UBL", "UBL", "UBL", "UBL",…
## $ Nomor.urut                             <dbl> 1, 2, 3, 4, 6, 7, 8, 9, 10, 12, 14, 15, 16, 17, 18, 19, 20, 21, 24, 25, 27, 30, 31, 32, 33, 34, 3…
## $ Jenis.Kelamin                          <fct> Perempuan, Laki-Laki, Laki-Laki, Laki-Laki, Perempuan, Perempuan, Perempuan, Laki-Laki, Perempuan…
## $ Umur                                   <dbl> 21, 20, 21, 22, 21, 22, 22, 22, 22, 22, 22, 19, 22, 23, 22, 23, 22, 20, 22, 18, 22, 20, 22, 21, 2…
## $ Fakultas                               <chr> "Fakultas Ilmu Sosial dan Politik", "Fakultas Hukum", "Fakultas Ekonomi dan Bisnis", "Fakultas Ek…
## $ Prodi                                  <chr> "Ilmu Komunikasi", "Ilmu Hukum", "Manajemen", "Akuntansi", "Akuntansi", "Administrasi Publik", "A…
## $ Tingkat.Semester                       <chr> "4 (Semester 7 - Semester 8)", "3 (Semester 5 - Semester 6)", "4 (Semester 7 - Semester 8)", "4 (…
## $ Uang.Saku                              <chr> "< 1 jt", "1 jt – 2 jt", "1 jt – 2 jt", "1 jt – 2 jt", "1 jt – 2 jt", "1 jt – 2 jt", "< 1 jt", "1…
## $ kepemilikan.mobil                      <dbl> 1, 2, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 2, 1, 2, 1, 3, 2, 2, 1, 0, 2, 0…
## $ kepemilikan.motor                      <dbl> 2, 1, 2, 4, 2, 1, 1, 1, 1, 2, 1, 1, 1, 0, 1, 0, 2, 2, 0, 1, 1, 3, 2, 2, 2, 2, 2, 2, 3, 2, 1, 1, 1…
## $ kepemilikan.sepeda                     <dbl> 1, 1, 2, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 2, 0, 0, 0…
## $ kendaraan.utama                        <chr> "Sepeda Motor Pribadi", "Mobil Pribadi", "Sepeda Motor Pribadi", "Kendaraan Bermotor (menumpang d…
## $ kelurahan                              <chr> "Kalibalau Kencana", "Gunung sulah", "langkapura", "Bilabong JAYA JAYA JAYA", "Way halim", "Segal…
## $ jenis.tempat.tinggal                   <chr> "Rumah pribadi/rumah keluarga", "Rumah pribadi/rumah keluarga", "Rumah pribadi/rumah keluarga", "…
## $ nama.jalan.tempat.tinggal              <chr> "eLBe Loundry", "Jl.Urip Sumoharjo no 88", "JL DARUSSALAM GG LANGGAR LK II", "Jl Darussalam bilab…
## $ jarak                                  <dbl> 4.2237967, 2.7033310, 3.2370722, 3.0023362, 2.9253306, 2.0588294, 12.0078709, 4.7355783, 6.741307…
## $ alasan.pemilihan.lokasi.tempat.tinggal <chr> "Bersama keluarga/saudara/teman", "Mudahnya akses berpergian dari tempat tinggal ", "Bersama kelu…
## $ biaya.dalam.sepekan                    <dbl> 25, 200, 50, 20, 40, 70, 35, 50, 350, 50, 30, 35, 50, 200, 40, 100, 600, 50, 5, 50, 30, 500, 50, …
## $ Jumlah.Perjalanan.Senin                <dbl> 2, 3, 1, 2, 3, 2, 4, 4, 3, 2, 4, 2, 2, 2, 1, 1, 4, 4, 4, 2, 5, 4, 2, 3, 3, 3, 4, 2, 4, 1, 5, 3, 3…
## $ Jumlah.Perjalanan.Selasa               <dbl> 3, 3, 1, 2, 3, 2, 4, 4, 3, 1, 4, 1, 3, 3, 1, 1, 3, 1, 3, 4, 5, 3, 3, 3, 3, 4, 3, 4, 1, 1, 3, 1, 3…
## $ Jumlah.Perjalanan.Rabu                 <dbl> 2, 3, 1, 2, 1, 2, 4, 4, 3, 2, 4, 3, 2, 4, 1, 1, 3, 1, 3, 3, 5, 3, 2, 3, 1, 3, 2, 3, 1, 1, 4, 3, 4…
## $ Jumlah.Perjalanan.Kamis                <dbl> 3, 3, 1, 2, 1, 2, 4, 4, 3, 1, 4, 3, 2, 2, 1, 1, 3, 1, 3, 3, 5, 3, 1, 2, 4, 2, 3, 1, 1, 1, 4, 1, 4…
## $ Jumlah.Perjalanan.Jumat                <dbl> 2, 3, 1, 2, 1, 2, 4, 3, 3, 2, 4, 3, 2, 3, 1, 1, 3, 1, 3, 3, 5, 3, 1, 1, 1, 3, 2, 5, 1, 1, 3, 4, 4…
## $ Jumlah.Perjalanan.Sabtu                <dbl> 2, 3, 1, 2, 1, 2, 3, 4, 2, 1, 1, 1, 2, 1, 1, 1, 3, 1, 3, 3, 3, 3, 1, 4, 3, 3, 2, 3, 2, 1, 3, 3, 2…
## $ Jumlah.Perjalanan.Ahad                 <dbl> 2, 3, 1, 2, 1, 2, 3, 4, 1, 1, 1, 1, 1, 2, 1, 1, 3, 1, 3, 3, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 3, 2…
```

Kita sudah berhasil menjadikan variabel `Jenis.Kelamin` sebagai factor. Selanjutnya, kita akan mengubah variabel-variabel kategoris lain menjadi factor juga. Variabel-variabel tersebut di antaranya adalah `Prodi`, `Tingkat.Semester`, `Uang.Saku`, dan `jenis.tempat.tinggal`.

Sekarang kita akan mengecek nilai variabel-variabel kategoris tersebut dengan dua cara berikut:


``` r
# Mengecek rincian nilai-nilai variabel lain secara bersamaan 
table(data.ubl$Fakultas) # cara 1
```

```
## 
##           Fakultas Ekonomi dan Bisnis                        Fakultas Hukum                Fakultas Ilmu Komputer 
##                                   104                                    98                                    29 
##      Fakultas Ilmu Sosial dan Politik Fakultas Keguruan dan Ilmu Pendidikan                       Fakultas Teknik 
##                                    52                                     6                                    41
```

``` r
data.ubl |>  # cara 2
  count(Prodi)
```

```
##                        Prodi  n
## 1        Administrasi Bisnis 15
## 2        Administrasi Publik 21
## 3                  Akuntansi 23
## 4                 Arsitektur  8
## 5                 Ilmu Hukum 98
## 6            Ilmu Komunikasi 20
## 7                Informatika 18
## 8                  Manajemen 77
## 9  Pendidikan Bahasa Inggris  6
## 10          Sistem Informasi 13
## 11              Teknik Mesin  7
## 12              Teknik Sipil 24
```

``` r
data.ubl |> 
  count(Tingkat.Semester)
```

```
##              Tingkat.Semester   n
## 1 1 (Semester 1 – Semester 2)  34
## 2 2 (Semester 3 – Semester 4)  50
## 3 3 (Semester 5 - Semester 6)  63
## 4 4 (Semester 7 - Semester 8) 183
```

``` r
data.ubl |> 
  count(Uang.Saku)
```

```
##       Uang.Saku   n
## 1   1 jt – 2 jt 167
## 2 2,1 jt – 3 jt 116
## 3 3,1 jt – 4 jt  18
## 4        < 1 jt  28
## 5        > 4 jt   1
```

``` r
table(data.ubl$jenis.tempat.tinggal)
```

```
## 
##              Kos bersama-sama                   Kos Sendiri         Rumah bersama saudara Rumah mengontrak bersama-sama 
##                            14                            52                            23                             5 
##      Rumah mengontrak pribadi  Rumah pribadi/rumah keluarga 
##                             3                           233
```

Kemudian kita buat vektor-vektor yang menyimpan nilai-nilai yang mungkinnya.

Perhatikan bahwa untuk **variabel ordinal** kita harus menuliskan vektor nilainya dengan urutan yang sesuai dengan tingkatannya.


``` r
# Membuat vektor nilai-nilai kategoris (untuk factor) berdasarkan nilai-nilai dari tampilan rincian
fakultas <- c("Fakultas Ekonomi dan Bisnis", "Fakultas Hukum",
              "Fakultas Ilmu Komputer", "Fakultas Ilmu Sosial dan Politik",
              "Fakultas Keguruan dan Ilmu Pendidikan", "Fakultas Teknik")
# nilai-nilai dalam vektor dapat di-Enter setelah tanda koma agar script lebih rapi dan enak dibaca

prodi <- c("Administrasi Bisnis", "Administrasi Publik",
           "Akuntansi","Arsitektur","Ilmu Hukum","Ilmu Komunikasi",
           "Informatika","Manajemen",
           "Pendidikan Bahasa Inggris", "Sistem Informasi")

# Variabel ordinal harus ditulis sesuai dengan urutan yang benar
tingkat <- c("1 (Semester 1 – Semester 2)",
             "2 (Semester 3 – Semester 4)",
             "3 (Semester 5 - Semester 6)",
             "4 (Semester 7 - Semester 8)")

uang_saku <- c("< 1 jt", "1 jt – 2 jt", "2,1 jt – 3 jt",
               "3,1 jt – 4 jt", "> 4 jt")
```

Sekarang kita sudah bisa mengubah nilai-nilai di variabel kategoris tersebut dari *character* menjadi *factor*. Variabel ordinal menggunakan atribut `ordered` yang bernilai `TRUE`, artinya urutan dipentingkan dalam `levels`.


``` r
# Mengubah variabel-variabel tersebut menjadi factor
data.ubl <- data.ubl |> 
  mutate(Jenis.Kelamin = factor(Jenis.Kelamin, levels = jk),
         Fakultas = factor(Fakultas, levels = fakultas),
         Prodi = factor(Prodi, levels = prodi),
         # jangan lupa atribut 'ordered = TRUE' untuk var. ordinal
         Tingkat.Semester = factor(Tingkat.Semester, 
                                   levels = tingkat,
                                   ordered = TRUE), 
         Uang.Saku = factor(Uang.Saku, levels = uang_saku, ordered = TRUE))

# Mengecek hasil
glimpse(data.ubl)
```

```
## Rows: 330
## Columns: 26
## $ Timestamp                              <dbl> 45413.83, 45413.83, 45413.85, 45413.85, 45413.92, 45413.93, 45413.93, 45413.93, 45413.94, 45414.0…
## $ Kampus_PT                              <chr> "UBL", "UBL", "UBL", "UBL", "UBL", "UBL", "UBL", "UBL", "UBL", "UBL", "UBL", "UBL", "UBL", "UBL",…
## $ Nomor.urut                             <dbl> 1, 2, 3, 4, 6, 7, 8, 9, 10, 12, 14, 15, 16, 17, 18, 19, 20, 21, 24, 25, 27, 30, 31, 32, 33, 34, 3…
## $ Jenis.Kelamin                          <fct> Perempuan, Laki-Laki, Laki-Laki, Laki-Laki, Perempuan, Perempuan, Perempuan, Laki-Laki, Perempuan…
## $ Umur                                   <dbl> 21, 20, 21, 22, 21, 22, 22, 22, 22, 22, 22, 19, 22, 23, 22, 23, 22, 20, 22, 18, 22, 20, 22, 21, 2…
## $ Fakultas                               <fct> Fakultas Ilmu Sosial dan Politik, Fakultas Hukum, Fakultas Ekonomi dan Bisnis, Fakultas Ekonomi d…
## $ Prodi                                  <fct> Ilmu Komunikasi, Ilmu Hukum, Manajemen, Akuntansi, Akuntansi, Administrasi Publik, Administrasi P…
## $ Tingkat.Semester                       <ord> 4 (Semester 7 - Semester 8), 3 (Semester 5 - Semester 6), 4 (Semester 7 - Semester 8), 4 (Semeste…
## $ Uang.Saku                              <ord> "< 1 jt", "1 jt – 2 jt", "1 jt – 2 jt", "1 jt – 2 jt", "1 jt – 2 jt", "1 jt – 2 jt", "< 1 jt", "1…
## $ kepemilikan.mobil                      <dbl> 1, 2, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 2, 1, 2, 1, 3, 2, 2, 1, 0, 2, 0…
## $ kepemilikan.motor                      <dbl> 2, 1, 2, 4, 2, 1, 1, 1, 1, 2, 1, 1, 1, 0, 1, 0, 2, 2, 0, 1, 1, 3, 2, 2, 2, 2, 2, 2, 3, 2, 1, 1, 1…
## $ kepemilikan.sepeda                     <dbl> 1, 1, 2, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 2, 0, 0, 0…
## $ kendaraan.utama                        <chr> "Sepeda Motor Pribadi", "Mobil Pribadi", "Sepeda Motor Pribadi", "Kendaraan Bermotor (menumpang d…
## $ kelurahan                              <chr> "Kalibalau Kencana", "Gunung sulah", "langkapura", "Bilabong JAYA JAYA JAYA", "Way halim", "Segal…
## $ jenis.tempat.tinggal                   <chr> "Rumah pribadi/rumah keluarga", "Rumah pribadi/rumah keluarga", "Rumah pribadi/rumah keluarga", "…
## $ nama.jalan.tempat.tinggal              <chr> "eLBe Loundry", "Jl.Urip Sumoharjo no 88", "JL DARUSSALAM GG LANGGAR LK II", "Jl Darussalam bilab…
## $ jarak                                  <dbl> 4.2237967, 2.7033310, 3.2370722, 3.0023362, 2.9253306, 2.0588294, 12.0078709, 4.7355783, 6.741307…
## $ alasan.pemilihan.lokasi.tempat.tinggal <chr> "Bersama keluarga/saudara/teman", "Mudahnya akses berpergian dari tempat tinggal ", "Bersama kelu…
## $ biaya.dalam.sepekan                    <dbl> 25, 200, 50, 20, 40, 70, 35, 50, 350, 50, 30, 35, 50, 200, 40, 100, 600, 50, 5, 50, 30, 500, 50, …
## $ Jumlah.Perjalanan.Senin                <dbl> 2, 3, 1, 2, 3, 2, 4, 4, 3, 2, 4, 2, 2, 2, 1, 1, 4, 4, 4, 2, 5, 4, 2, 3, 3, 3, 4, 2, 4, 1, 5, 3, 3…
## $ Jumlah.Perjalanan.Selasa               <dbl> 3, 3, 1, 2, 3, 2, 4, 4, 3, 1, 4, 1, 3, 3, 1, 1, 3, 1, 3, 4, 5, 3, 3, 3, 3, 4, 3, 4, 1, 1, 3, 1, 3…
## $ Jumlah.Perjalanan.Rabu                 <dbl> 2, 3, 1, 2, 1, 2, 4, 4, 3, 2, 4, 3, 2, 4, 1, 1, 3, 1, 3, 3, 5, 3, 2, 3, 1, 3, 2, 3, 1, 1, 4, 3, 4…
## $ Jumlah.Perjalanan.Kamis                <dbl> 3, 3, 1, 2, 1, 2, 4, 4, 3, 1, 4, 3, 2, 2, 1, 1, 3, 1, 3, 3, 5, 3, 1, 2, 4, 2, 3, 1, 1, 1, 4, 1, 4…
## $ Jumlah.Perjalanan.Jumat                <dbl> 2, 3, 1, 2, 1, 2, 4, 3, 3, 2, 4, 3, 2, 3, 1, 1, 3, 1, 3, 3, 5, 3, 1, 1, 1, 3, 2, 5, 1, 1, 3, 4, 4…
## $ Jumlah.Perjalanan.Sabtu                <dbl> 2, 3, 1, 2, 1, 2, 3, 4, 2, 1, 1, 1, 2, 1, 1, 1, 3, 1, 3, 3, 3, 3, 1, 4, 3, 3, 2, 3, 2, 1, 3, 3, 2…
## $ Jumlah.Perjalanan.Ahad                 <dbl> 2, 3, 1, 2, 1, 2, 3, 4, 1, 1, 1, 1, 1, 2, 1, 1, 3, 1, 3, 3, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 3, 2…
```

Sekarang, tipe data untuk variabel-variabel kategoris kita tadi sudah menampilkan `<fct>` yang berarti "factor". Variabel ordinal diidentifikasi dengan tipe `<ord>`.

Kita dapat mengecek urutan factor kita dengan perintah `levels()` berikut.


``` r
# Mengecek hasil dengan mengidentifikasi level factor untuk data kategoris-ordinal
levels(data.ubl$Tingkat.Semester)
```

```
## [1] "1 (Semester 1 – Semester 2)" "2 (Semester 3 – Semester 4)" "3 (Semester 5 - Semester 6)" "4 (Semester 7 - Semester 8)"
```

``` r
levels(data.ubl$Uang.Saku)
```

```
## [1] "< 1 jt"        "1 jt – 2 jt"   "2,1 jt – 3 jt" "3,1 jt – 4 jt" "> 4 jt"
```

::: {.rmdexercise}
**Aktivitas Mandiri 2: Membuat Factor untuk Variabel Kategoris [STP-2.4]**

Untuk dataset UBL yang sudah dibersihkan:
1. Buat vektor `tempat_tinggal` dengan nilai-nilai jenis tempat tinggal yang ada di data
   (Gunakan `table(data.ubl$jenis.tempat.tinggal)` untuk melihat nilai-nilainya)
2. Gunakan `mutate()` untuk mengubah `jenis.tempat.tinggal` menjadi factor
3. Verifikasi dengan `glimpse()` - tipe harus `<fct>`
4. Cek level dengan `levels(data.ubl$jenis.tempat.tinggal)`
:::

## Analisis Statistika Deskriptif

Kita akan menggunakan paket `gtsummary` dan `flextable` untuk melakukan analisis statistik deskriptif dengan ringkas. Paket ini memiliki perintah `tbl_summary()` yang dapat mengeluarkan analisis statistika deskriptif secara intuitif berdasarkan jenis data yang kita masukkan.

Untuk meng-install kedua paket tersebut, hapus tanda pagar di depan baris pertama dalam *chunk* di bawah dan muat paket `gtsummary` saja.


``` r
# install.packages(c("gtsummary", "flextable"))
library(gtsummary)
```

### Variabel Kategoris

Kita masih akan menggunakan *pipe operator* dalam mengoperasikan analisis ini. Perintah yang kita gunakan adalah `tbl_summary()` yang kita teruskan ke `as_flex_table()` sebagai keluarannya.

Untuk menampilkan persentase/proporsi, kita cukup memasukkan variabel-variabel kategoris ke dalam tabel dengan atribut `include`. Atribut tersebut menerima masukan berupa vektor nama-nama variabel kategoris dalam dataset kita. Fungsi `tbl_summary` ini akan menampilkan secara otomatis tabel distribusi frekuensinya disertai dengan nilai persentasenya di samping nilai frekuensi tersebut.


``` r
data.ubl |> 
  tbl_summary(include = c(Jenis.Kelamin,
                          Fakultas,
                          Tingkat.Semester,
                          Uang.Saku,
                          jenis.tempat.tinggal)) |> 
  as_flex_table()
```

```{=html}
<div class="tabwid"><style>.cl-8d63ed26{}.cl-8d5c57f0{font-family:'Arial';font-size:11pt;font-weight:bold;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-8d5c5804{font-family:'Arial';font-size:6.6pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;position: relative;bottom:3.3pt;}.cl-8d5c5805{font-family:'Arial';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-8d5f5108{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:2pt;padding-top:2pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-8d5f5112{margin:0;text-align:center;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:2pt;padding-top:2pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-8d5f511c{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-8d5f511d{margin:0;text-align:center;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-8d5f511e{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:15pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-8d5f5126{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-8d5f6eea{width:3.18in;background-color:transparent;vertical-align: middle;border-bottom: 1pt solid rgba(0, 0, 0, 1.00);border-top: 1pt solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-8d5f6ef4{width:0.99in;background-color:transparent;vertical-align: middle;border-bottom: 1pt solid rgba(0, 0, 0, 1.00);border-top: 1pt solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-8d5f6efe{width:3.18in;background-color:transparent;vertical-align: top;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-8d5f6eff{width:0.99in;background-color:transparent;vertical-align: top;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-8d5f6f00{width:3.18in;background-color:transparent;vertical-align: top;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-8d5f6f01{width:0.99in;background-color:transparent;vertical-align: top;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-8d5f6f08{width:3.18in;background-color:transparent;vertical-align: top;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-8d5f6f09{width:0.99in;background-color:transparent;vertical-align: top;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-8d5f6f0a{width:3.18in;background-color:transparent;vertical-align: top;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-8d5f6f0b{width:0.99in;background-color:transparent;vertical-align: top;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-8d5f6f12{width:3.18in;background-color:transparent;vertical-align: top;border-bottom: 1pt solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-8d5f6f13{width:0.99in;background-color:transparent;vertical-align: top;border-bottom: 1pt solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-8d5f6f14{width:3.18in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(255, 255, 255, 0.00);border-top: 0 solid rgba(255, 255, 255, 0.00);border-left: 0 solid rgba(255, 255, 255, 0.00);border-right: 0 solid rgba(255, 255, 255, 0.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-8d5f6f1c{width:0.99in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(255, 255, 255, 0.00);border-top: 0 solid rgba(255, 255, 255, 0.00);border-left: 0 solid rgba(255, 255, 255, 0.00);border-right: 0 solid rgba(255, 255, 255, 0.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}</style><table data-quarto-disable-processing='true' class='cl-8d63ed26'><thead><tr style="overflow-wrap:break-word;"><th class="cl-8d5f6eea"><p class="cl-8d5f5108"><span class="cl-8d5c57f0">Characteristic</span></p></th><th class="cl-8d5f6ef4"><p class="cl-8d5f5112"><span class="cl-8d5c57f0">N = 330</span><span class="cl-8d5c5804">1</span></p></th></tr></thead><tbody><tr style="overflow-wrap:break-word;"><td class="cl-8d5f6efe"><p class="cl-8d5f511c"><span class="cl-8d5c5805">Jenis.Kelamin</span></p></td><td class="cl-8d5f6eff"><p class="cl-8d5f511d"><span class="cl-8d5c5805"></span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-8d5f6f00"><p class="cl-8d5f511e"><span class="cl-8d5c5805">Laki-Laki</span></p></td><td class="cl-8d5f6f01"><p class="cl-8d5f511d"><span class="cl-8d5c5805">165 (50%)</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-8d5f6f00"><p class="cl-8d5f511e"><span class="cl-8d5c5805">Perempuan</span></p></td><td class="cl-8d5f6f01"><p class="cl-8d5f511d"><span class="cl-8d5c5805">165 (50%)</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-8d5f6f08"><p class="cl-8d5f511c"><span class="cl-8d5c5805">Fakultas</span></p></td><td class="cl-8d5f6f09"><p class="cl-8d5f511d"><span class="cl-8d5c5805"></span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-8d5f6f00"><p class="cl-8d5f511e"><span class="cl-8d5c5805">Fakultas Ekonomi dan Bisnis</span></p></td><td class="cl-8d5f6f01"><p class="cl-8d5f511d"><span class="cl-8d5c5805">104 (32%)</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-8d5f6f00"><p class="cl-8d5f511e"><span class="cl-8d5c5805">Fakultas Hukum</span></p></td><td class="cl-8d5f6f01"><p class="cl-8d5f511d"><span class="cl-8d5c5805">98 (30%)</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-8d5f6f00"><p class="cl-8d5f511e"><span class="cl-8d5c5805">Fakultas Ilmu Komputer</span></p></td><td class="cl-8d5f6f01"><p class="cl-8d5f511d"><span class="cl-8d5c5805">29 (8.8%)</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-8d5f6f00"><p class="cl-8d5f511e"><span class="cl-8d5c5805">Fakultas Ilmu Sosial dan Politik</span></p></td><td class="cl-8d5f6f01"><p class="cl-8d5f511d"><span class="cl-8d5c5805">52 (16%)</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-8d5f6f00"><p class="cl-8d5f511e"><span class="cl-8d5c5805">Fakultas Keguruan dan Ilmu Pendidikan</span></p></td><td class="cl-8d5f6f01"><p class="cl-8d5f511d"><span class="cl-8d5c5805">6 (1.8%)</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-8d5f6f00"><p class="cl-8d5f511e"><span class="cl-8d5c5805">Fakultas Teknik</span></p></td><td class="cl-8d5f6f01"><p class="cl-8d5f511d"><span class="cl-8d5c5805">41 (12%)</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-8d5f6f00"><p class="cl-8d5f511c"><span class="cl-8d5c5805">Tingkat.Semester</span></p></td><td class="cl-8d5f6f01"><p class="cl-8d5f511d"><span class="cl-8d5c5805"></span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-8d5f6f00"><p class="cl-8d5f511e"><span class="cl-8d5c5805">1 (Semester 1 – Semester 2)</span></p></td><td class="cl-8d5f6f01"><p class="cl-8d5f511d"><span class="cl-8d5c5805">34 (10%)</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-8d5f6f00"><p class="cl-8d5f511e"><span class="cl-8d5c5805">2 (Semester 3 – Semester 4)</span></p></td><td class="cl-8d5f6f01"><p class="cl-8d5f511d"><span class="cl-8d5c5805">50 (15%)</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-8d5f6f00"><p class="cl-8d5f511e"><span class="cl-8d5c5805">3 (Semester 5 - Semester 6)</span></p></td><td class="cl-8d5f6f01"><p class="cl-8d5f511d"><span class="cl-8d5c5805">63 (19%)</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-8d5f6f00"><p class="cl-8d5f511e"><span class="cl-8d5c5805">4 (Semester 7 - Semester 8)</span></p></td><td class="cl-8d5f6f01"><p class="cl-8d5f511d"><span class="cl-8d5c5805">183 (55%)</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-8d5f6f00"><p class="cl-8d5f511c"><span class="cl-8d5c5805">Uang.Saku</span></p></td><td class="cl-8d5f6f01"><p class="cl-8d5f511d"><span class="cl-8d5c5805"></span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-8d5f6f00"><p class="cl-8d5f511e"><span class="cl-8d5c5805">&lt; 1 jt</span></p></td><td class="cl-8d5f6f01"><p class="cl-8d5f511d"><span class="cl-8d5c5805">28 (8.5%)</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-8d5f6f00"><p class="cl-8d5f511e"><span class="cl-8d5c5805">1 jt – 2 jt</span></p></td><td class="cl-8d5f6f01"><p class="cl-8d5f511d"><span class="cl-8d5c5805">167 (51%)</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-8d5f6f00"><p class="cl-8d5f511e"><span class="cl-8d5c5805">2,1 jt – 3 jt</span></p></td><td class="cl-8d5f6f01"><p class="cl-8d5f511d"><span class="cl-8d5c5805">116 (35%)</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-8d5f6f00"><p class="cl-8d5f511e"><span class="cl-8d5c5805">3,1 jt – 4 jt</span></p></td><td class="cl-8d5f6f01"><p class="cl-8d5f511d"><span class="cl-8d5c5805">18 (5.5%)</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-8d5f6f00"><p class="cl-8d5f511e"><span class="cl-8d5c5805">&gt; 4 jt</span></p></td><td class="cl-8d5f6f01"><p class="cl-8d5f511d"><span class="cl-8d5c5805">1 (0.3%)</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-8d5f6f0a"><p class="cl-8d5f511c"><span class="cl-8d5c5805">jenis.tempat.tinggal</span></p></td><td class="cl-8d5f6f0b"><p class="cl-8d5f511d"><span class="cl-8d5c5805"></span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-8d5f6f00"><p class="cl-8d5f511e"><span class="cl-8d5c5805">Kos bersama-sama</span></p></td><td class="cl-8d5f6f01"><p class="cl-8d5f511d"><span class="cl-8d5c5805">14 (4.2%)</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-8d5f6f00"><p class="cl-8d5f511e"><span class="cl-8d5c5805">Kos Sendiri</span></p></td><td class="cl-8d5f6f01"><p class="cl-8d5f511d"><span class="cl-8d5c5805">52 (16%)</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-8d5f6f00"><p class="cl-8d5f511e"><span class="cl-8d5c5805">Rumah bersama saudara</span></p></td><td class="cl-8d5f6f01"><p class="cl-8d5f511d"><span class="cl-8d5c5805">23 (7.0%)</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-8d5f6f00"><p class="cl-8d5f511e"><span class="cl-8d5c5805">Rumah mengontrak bersama-sama</span></p></td><td class="cl-8d5f6f01"><p class="cl-8d5f511d"><span class="cl-8d5c5805">5 (1.5%)</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-8d5f6f00"><p class="cl-8d5f511e"><span class="cl-8d5c5805">Rumah mengontrak pribadi</span></p></td><td class="cl-8d5f6f01"><p class="cl-8d5f511d"><span class="cl-8d5c5805">3 (0.9%)</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-8d5f6f12"><p class="cl-8d5f511e"><span class="cl-8d5c5805">Rumah pribadi/rumah keluarga</span></p></td><td class="cl-8d5f6f13"><p class="cl-8d5f511d"><span class="cl-8d5c5805">233 (71%)</span></p></td></tr></tbody><tfoot><tr style="overflow-wrap:break-word;"><td  colspan="2"class="cl-8d5f6f14"><p class="cl-8d5f5126"><span class="cl-8d5c5804">1</span><span class="cl-8d5c5805">n (%)</span></p></td></tr></tfoot></table></div>
```

Untuk menghitung IQV, kita bisa memanfaatkan perintah `function` yang mengambil masukan nilai-nilai yang ada di tanda kurungnya dan memprosesnya di dalam kurung kurawal `{}`. Perintah function selalu diakhiri dengan `return()` di dalamnya untuk menunjukkan hasil yang akan menjadi keluaran fungsi tersebut.


``` r
iqv <- function(x) {
  
  # 1. Membersihkan data dari nilai yang hilang (NA)
  x_clean <- x[!is.na(x)]
  
  # 2. Membuat tabel frekuensi dari data yang bersih
  counts <- table(x_clean)
  
  # 3. Menghitung jumlah kategori (K)
  K <- length(counts)
  
  # 4. Kasus khusus: Jika hanya ada 1 kategori atau tidak ada data,
  #    maka tidak ada variasi, sehingga IQV = 0.
  if (K <= 1) {
    return(0)
  }
  
  # 5. Menghitung jumlah total observasi (n)
  n <- sum(counts)
  
  # 6. Menghitung jumlah kuadrat dari proporsi setiap kategori (Σpᵢ²)
  sum_p_sq <- sum((counts / n)^2)
  
  # 7. Menerapkan formula IQV
  #    IQV = [K / (K - 1)] * [1 - Σpᵢ²]
  iqv_value <- (K / (K - 1)) * (1 - sum_p_sq)
  
  # 8. Mengembalikan hasil perhitungan IQV
  return(iqv_value)
}
```

Untuk menghasilkan nilai IQV suatu variabel, kita perlu memasukkan vektor yang berisi nilai-nilai dalam variabel dataset kita. Ini dapat dilakukan dengan sintaks `dataset$nama_variabel`. Tanda \$ berfungsi memberi tahu R untuk memilih variabel yang ada dalam dataset yang digunakan.


``` r
# Menampilkan vektor jenis.tempat.tinggal (opsional. Hapus komentar pada baris 
# berikut jika ingin mencobanya)
# data.ubl$jenis.tempat.tinggal

# Menghitung IQV variabel jenis.tempat.tinggal
iqv(data.ubl$jenis.tempat.tinggal)
```

```
## [1] 0.5636143
```

### Variabel Numerik

Perintah `tbl_summary` akan menentukan jenis statistik deskriptif yang ditampilkan secara intuitif berdasarkan dataset yang dibacanya. Perhatikan hasil dari `tbl_summary` berikut untuk variabel `kepemilikan.mobil` dan `jarak`.


``` r
data.ubl |> 
  tbl_summary(include = c(kepemilikan.mobil,
                          jarak)) |> 
  as_flex_table()
```

```{=html}
<div class="tabwid"><style>.cl-8dd8ad14{}.cl-8dd1cec2{font-family:'Arial';font-size:11pt;font-weight:bold;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-8dd1cecc{font-family:'Arial';font-size:6.6pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;position: relative;bottom:3.3pt;}.cl-8dd1cecd{font-family:'Arial';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-8dd49f94{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:2pt;padding-top:2pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-8dd49f9e{margin:0;text-align:center;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:2pt;padding-top:2pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-8dd49fa8{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-8dd49fb2{margin:0;text-align:center;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-8dd49fb3{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:15pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-8dd49fbc{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-8dd4ba10{width:1.499in;background-color:transparent;vertical-align: middle;border-bottom: 1pt solid rgba(0, 0, 0, 1.00);border-top: 1pt solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-8dd4ba1a{width:1.406in;background-color:transparent;vertical-align: middle;border-bottom: 1pt solid rgba(0, 0, 0, 1.00);border-top: 1pt solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-8dd4ba1b{width:1.499in;background-color:transparent;vertical-align: top;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-8dd4ba24{width:1.406in;background-color:transparent;vertical-align: top;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-8dd4ba25{width:1.499in;background-color:transparent;vertical-align: top;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-8dd4ba26{width:1.406in;background-color:transparent;vertical-align: top;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-8dd4ba2e{width:1.499in;background-color:transparent;vertical-align: top;border-bottom: 1pt solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-8dd4ba2f{width:1.406in;background-color:transparent;vertical-align: top;border-bottom: 1pt solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-8dd4ba38{width:1.499in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(255, 255, 255, 0.00);border-top: 0 solid rgba(255, 255, 255, 0.00);border-left: 0 solid rgba(255, 255, 255, 0.00);border-right: 0 solid rgba(255, 255, 255, 0.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-8dd4ba39{width:1.406in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(255, 255, 255, 0.00);border-top: 0 solid rgba(255, 255, 255, 0.00);border-left: 0 solid rgba(255, 255, 255, 0.00);border-right: 0 solid rgba(255, 255, 255, 0.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}</style><table data-quarto-disable-processing='true' class='cl-8dd8ad14'><thead><tr style="overflow-wrap:break-word;"><th class="cl-8dd4ba10"><p class="cl-8dd49f94"><span class="cl-8dd1cec2">Characteristic</span></p></th><th class="cl-8dd4ba1a"><p class="cl-8dd49f9e"><span class="cl-8dd1cec2">N = 330</span><span class="cl-8dd1cecc">1</span></p></th></tr></thead><tbody><tr style="overflow-wrap:break-word;"><td class="cl-8dd4ba1b"><p class="cl-8dd49fa8"><span class="cl-8dd1cecd">kepemilikan.mobil</span></p></td><td class="cl-8dd4ba24"><p class="cl-8dd49fb2"><span class="cl-8dd1cecd"></span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-8dd4ba25"><p class="cl-8dd49fb3"><span class="cl-8dd1cecd">0</span></p></td><td class="cl-8dd4ba26"><p class="cl-8dd49fb2"><span class="cl-8dd1cecd">107 (32%)</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-8dd4ba25"><p class="cl-8dd49fb3"><span class="cl-8dd1cecd">1</span></p></td><td class="cl-8dd4ba26"><p class="cl-8dd49fb2"><span class="cl-8dd1cecd">126 (38%)</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-8dd4ba25"><p class="cl-8dd49fb3"><span class="cl-8dd1cecd">2</span></p></td><td class="cl-8dd4ba26"><p class="cl-8dd49fb2"><span class="cl-8dd1cecd">80 (24%)</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-8dd4ba25"><p class="cl-8dd49fb3"><span class="cl-8dd1cecd">3</span></p></td><td class="cl-8dd4ba26"><p class="cl-8dd49fb2"><span class="cl-8dd1cecd">15 (4.5%)</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-8dd4ba25"><p class="cl-8dd49fb3"><span class="cl-8dd1cecd">4</span></p></td><td class="cl-8dd4ba26"><p class="cl-8dd49fb2"><span class="cl-8dd1cecd">2 (0.6%)</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-8dd4ba2e"><p class="cl-8dd49fa8"><span class="cl-8dd1cecd">jarak</span></p></td><td class="cl-8dd4ba2f"><p class="cl-8dd49fb2"><span class="cl-8dd1cecd">2.71 (1.31, 4.74)</span></p></td></tr></tbody><tfoot><tr style="overflow-wrap:break-word;"><td  colspan="2"class="cl-8dd4ba38"><p class="cl-8dd49fbc"><span class="cl-8dd1cecc">1</span><span class="cl-8dd1cecd">n (%); Median (Q1, Q3)</span></p></td></tr></tfoot></table></div>
```

Seperti yang kalian lihat, `tbl_summary` langsung menampilkan persentase tiap nilai yang ada di kepemilikan.mobil seolah-olah `kepemilikan.mobil` adalah variabel diskret. Hal ini terjadi karena nilai variabel `kepemilikan.mobil` adalah nilai numerik diskret, sehingga masing-masing nilai dikenali sebagai kategori.

Hal ini berbeda lagi dengan variabel `jarak` yang menampilkan statistik deskriptif untuk variabel numerik, yakni median, kuartil bawah dan kuartil atas (Q1 & Q3).

Untuk meminta `tbl_summary` menampilkan analisis statistik deskriptif untuk variabel numerik seperti mean, median, kuartil, dan standar deviasi (simpangan baku), kita dapat menyatakannya dalam atribut-atribut berikut.


``` r
data.ubl |> 
  tbl_summary(include = c(kepemilikan.mobil,
                          kepemilikan.motor,
                          jarak),
              type = list(kepemilikan.mobil ~ "continuous", # untuk mengarahkan tbl_summary membaca tipe data sesuai yang kita butuhkan
                          kepemilikan.motor ~ "continuous"),
              digits = list(kepemilikan.mobil ~ 0, # untuk menentukan jumlah desimal nilai yang ditampilkan
                            kepemilikan.motor ~ 0),
              statistic = list(kepemilikan.mobil ~ "{median} ({p25}, {p75})", # untuk menentukan jenis statistik deskriptif yang ditampilkan
                               kepemilikan.motor ~ "{median}",
                               jarak ~ "{mean} ({sd})")) |> 
  as_flex_table()
```

```{=html}
<div class="tabwid"><style>.cl-8e454514{}.cl-8e3ca92c{font-family:'Arial';font-size:11pt;font-weight:bold;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-8e3ca940{font-family:'Arial';font-size:6.6pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;position: relative;bottom:3.3pt;}.cl-8e3ca94a{font-family:'Arial';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-8e40278c{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:2pt;padding-top:2pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-8e402796{margin:0;text-align:center;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:2pt;padding-top:2pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-8e402797{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-8e4027a0{margin:0;text-align:center;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-8e4027a1{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-8e40430c{width:1.525in;background-color:transparent;vertical-align: middle;border-bottom: 1pt solid rgba(0, 0, 0, 1.00);border-top: 1pt solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-8e404316{width:1.024in;background-color:transparent;vertical-align: middle;border-bottom: 1pt solid rgba(0, 0, 0, 1.00);border-top: 1pt solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-8e404320{width:1.525in;background-color:transparent;vertical-align: top;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-8e404321{width:1.024in;background-color:transparent;vertical-align: top;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-8e40432a{width:1.525in;background-color:transparent;vertical-align: top;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-8e404334{width:1.024in;background-color:transparent;vertical-align: top;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-8e404335{width:1.525in;background-color:transparent;vertical-align: top;border-bottom: 1pt solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-8e40433e{width:1.024in;background-color:transparent;vertical-align: top;border-bottom: 1pt solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-8e40433f{width:1.525in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(255, 255, 255, 0.00);border-top: 0 solid rgba(255, 255, 255, 0.00);border-left: 0 solid rgba(255, 255, 255, 0.00);border-right: 0 solid rgba(255, 255, 255, 0.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-8e404348{width:1.024in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(255, 255, 255, 0.00);border-top: 0 solid rgba(255, 255, 255, 0.00);border-left: 0 solid rgba(255, 255, 255, 0.00);border-right: 0 solid rgba(255, 255, 255, 0.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}</style><table data-quarto-disable-processing='true' class='cl-8e454514'><thead><tr style="overflow-wrap:break-word;"><th class="cl-8e40430c"><p class="cl-8e40278c"><span class="cl-8e3ca92c">Characteristic</span></p></th><th class="cl-8e404316"><p class="cl-8e402796"><span class="cl-8e3ca92c">N = 330</span><span class="cl-8e3ca940">1</span></p></th></tr></thead><tbody><tr style="overflow-wrap:break-word;"><td class="cl-8e404320"><p class="cl-8e402797"><span class="cl-8e3ca94a">kepemilikan.mobil</span></p></td><td class="cl-8e404321"><p class="cl-8e4027a0"><span class="cl-8e3ca94a">1 (0, 2)</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-8e40432a"><p class="cl-8e402797"><span class="cl-8e3ca94a">kepemilikan.motor</span></p></td><td class="cl-8e404334"><p class="cl-8e4027a0"><span class="cl-8e3ca94a">1</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-8e404335"><p class="cl-8e402797"><span class="cl-8e3ca94a">jarak</span></p></td><td class="cl-8e40433e"><p class="cl-8e4027a0"><span class="cl-8e3ca94a">3.35 (3.54)</span></p></td></tr></tbody><tfoot><tr style="overflow-wrap:break-word;"><td  colspan="2"class="cl-8e40433f"><p class="cl-8e4027a1"><span class="cl-8e3ca940">1</span><span class="cl-8e3ca94a">Median (Q1, Q3); Median; Mean (SD)</span></p></td></tr></tfoot></table></div>
```

``` r
# Ketika meng-enter script, jangan salah memperhatikan urutan dan kelengkapan tanda koma pada fungsi
```

Untuk mengatur jenis statistik deskriptif yang ditampilkan, ubah bagian kanan tanda `~` pada atribut `statistic` sehingga apa yang ditulis di antara tanda petik menjadi template untuk ditampilkan di tabel. Adapun teknik statistik yang kita pakai harus kita tuliskan dalam kurung kurawalnya. Teknik-teknik statistik yang bisa kita gunakan di antaranya:

-   `{mean}` : rata-rata

-   `{median}` : median

-   `{min}`, `{max}`: nilai minimum, maksimum

-   `{p##}` : persentil ##. Persentil adalah nilai yang membagi data menjadi seratus bagian. Karena kuartil membagi data menjadi empat bagian, maka untuk menampilkan kuartil bawah (Q1), yang berarti nilai yang membagi data menjadi 1/4 terbawah (25%), kita menuliskan `{p25}`. Begitu juga dengan Q3 yang membagi data menjadi 3/4 terbawah (75%), kita menuliskan `{p75}`

-   `{sd}` : *standard deviation*/simpangan baku

-   `{n}` : frekuensi kategori

-   `{N}` : jumlah seluruhnya

-   `{p}` : persentase

::: {.rmdnote}
**Pengenalan Tipe Data Baru R: List (`list)`**

*List* pada dasarnya adalah tipe data nontunggal seperti vektor, hanya saja perbedaannya terletak pada tipe nilai yang dikandung. Vektor mewajibkan setiap elemen bernilai sama: string saja, angka saja, atau *boolean* saja misalnya.

Di sisi lain, *list* bisa memuat lebih dari satu jenis nilai. Ini sangat berguna ketika kita harus mendefinisikan sesuatu yang membutuhkan lebih dari satu nilai, seperti cara menampilkan statistik deskriptif untuk tiap-tiap variabel kita di fungsi `tbl_summary` di atas:

``` r
type = list(kepemilikan.motor ~ "continuous", kepemilikan.mobil ~ "continuous")

digits = list(kepemilikan.motor ~ 0, kepemilikan.mobil ~ 0)
```

-   *list* dalam pengaturan atribut `type` berarti "anggap tipe variabel `kepemilikan.motor` sebagai *continuous**,*** begitu juga untuk variabel `kepemilikan.mobil`

-   *list* dalam pengaturan atribut `digits` berarti "atur agar nilai desimal untuk `kepemilikan.motor` adalah 0, begitu juga untuk variabel `kepemilikan.mobil`
:::

::: {.rmdexercise}
**Aktivitas Mandiri 3: Analisis Statistik Deskriptif Komprehensif [STP-2.4]**

**Persiapan:**
Impor dataset UIN RIL dari sheet `DataUtama_mhsUINRIL` dan bersihkan seperti yang sudah dipraktikkan:
- Rename variabel yang perlu disesuaikan
- Gunakan `drop_na()` untuk menghapus missing values
- Buat factor untuk variabel kategoris (minimal: `Jenis.Kelamin`, `Tingkat.Semester`, `Uang.Saku`)

**Analisis yang Diminta:**

a. **Persentase/Proporsi:**
   - Hitung persentase mahasiswa berdasarkan `Uang.Saku`
   - Gunakan `tbl_summary(include = Uang.Saku)` dan `as_flex_table()`

b. **Ukuran Pemusatan (Median dan Kuartil):**
   - Untuk variabel `Jumlah.Perjalanan.Senin` (atau hari lain jika variabel ini tidak ada)
   - Tampilkan Median, Q1 (p25), dan Q3 (p75)
   - Gunakan `statistic = "{median} ({p25}, {p75})"`

c. **Ukuran Pemusatan dan Penyebaran (Mean dan SD):**
   - Untuk variabel biaya perjalanan per pekan
   - Tampilkan Mean dan Standar Deviasi
   - Gunakan `statistic = "{mean} ({sd})"`

d. **Ukuran Variasi Nominal (IQV):**
   - Hitung IQV untuk variabel `alasan.pemilihan.lokasi.tempat.tinggal`
   - Gunakan fungsi `iqv()` yang sudah dipelajari
   - Interpretasi: seberapa bervariasi alasan mahasiswa memilih tempat tinggal?

**Dokumentasi:**
- Kumpulkan semua hasil dalam file R Markdown Anda
- Sertakan interpretasi singkat untuk setiap hasil analisis
:::

------------------------------------------------------------------------


<!--chapter:end:02-statistik-deskriptif.Rmd-->

# Modul-3: Visualisasi Data Kuantitatif


Setelah mempelajari modul ini, Anda diharapkan dapat:

1. memilih visualiasi yang tepat sesuai dengan variabel yang akan disajikan dan informasi yang ingin disampaikan [STP-3.1]{.capaian}
2. menginterpretasikan suatu visualiasi data kuantitatif secara mendalam [STP-3.2]{.capaian}
3. menjelaskan pentingnya menentukan tingkat pengukuran untuk sebuah variabel dari kaitannya dengan analisis statistik deskriptif dan diagram yang dipilih untuk menyajikan informasi [STP-3.4]{.capaian}
4. menghasilkan grafik yang tepat sesuai variabel yang akan disajikan [STP-3.3]{.capaian}


---

## Visualisasi Data dengan `ggplot2`

`ggplot2` adalah sebuah paket R yang dibuat oleh Hadley Wickham untuk membuat grafik dan visualisasi data. Paket ini didasarkan pada "Grammar of Graphics", sebuah kerangka kerja yang memecah visualisasi menjadi komponen-komponen terpisah seperti data, sistem koordinat, dan elemen-elemen visual (geometries). Dengan pendekatan ini, Anda dapat membangun grafik lapis demi lapis *(layer by layer)*.

![Konsep `ggplot2`](images/basics_ggplot2.png)

### Mengimpor *Library* & Mengatur Dataset

Pertama, kita perlu memuat paket `tidyverse` yang sudah mencakup `ggplot2` untuk visualisasi dan `dplyr` serta `readr` untuk manipulasi data.

Tak lupa, kita juga akan menyertakan `openxlsx` dan `gtsummary` untuk mengolah data secara tabular jika sekiranya diperlukan dalam menunjang alur kerja kita.


``` r
library(tidyverse)
library(openxlsx)
library(gtsummary)
```

Selanjutnya, kita akan mengimpor *dataset* kita, yakni hasil kuesioner kepada mahasiswa UBL., seperti halnya praktikum-praktikum sebelumnya.


``` r
# Mengeset variabel tersendiri untuk nama file nama sheet}
file.dibaca <- "datasets/Data Praktikum 03.xlsx"
sheet.ubl <- "DataUtama_mhsUBL"

# Mengimpor file menjadi dataset memanfaatkan variabel nama file dan nama sheet yang kita buat tadi
data.ubl <- read.xlsx(file.dibaca, sheet = sheet.ubl)

# Pengenalan fungsi baru: 'mengintip' sejumlah baris pertama dari dataset kita
head(data.ubl)
```

```
##   Timestamp Kampus_PT Nomor.urut Jenis.Kelamin Umur                         Fakultas           Prodi            Tingkat.Semester     Uang.Saku
## 1  45413.83       UBL          1     Perempuan   21 Fakultas Ilmu Sosial dan Politik Ilmu Komunikasi 4 (Semester 7 - Semester 8)        < 1 jt
## 2  45413.83       UBL          2     Laki-Laki   20                   Fakultas Hukum      Ilmu Hukum 3 (Semester 5 - Semester 6)   1 jt – 2 jt
## 3  45413.85       UBL          3     Laki-Laki   21      Fakultas Ekonomi dan Bisnis       Manajemen 4 (Semester 7 - Semester 8)   1 jt – 2 jt
## 4  45413.85       UBL          4     Laki-Laki   22      Fakultas Ekonomi dan Bisnis       Akuntansi 4 (Semester 7 - Semester 8)   1 jt – 2 jt
## 5  45413.88       UBL          5     Laki-Laki   21      Fakultas Ekonomi dan Bisnis       Manajemen 4 (Semester 7 - Semester 8) 2,1 jt – 3 jt
## 6  45413.92       UBL          6     Perempuan   21      Fakultas Ekonomi dan Bisnis       Akuntansi 4 (Semester 7 - Semester 8)   1 jt – 2 jt
##   kepemilikan.mobil kepemilikan.motor kepemilikan.sepeda                                      kendaraan.utama               kelurahan
## 1                 1                 2                  1                                 Sepeda Motor Pribadi       Kalibalau Kencana
## 2                 2                 1                  1                                        Mobil Pribadi            Gunung sulah
## 3                 1                 2                  2                                 Sepeda Motor Pribadi              langkapura
## 4                 1                 4                  1 Kendaraan Bermotor (menumpang dengan keluarga/teman) Bilabong JAYA JAYA JAYA
## 5                 4                 4                  1                                        Mobil Pribadi                sukarame
## 6                 1                 2                  1                                  Transportasi Online               Way halim
##           jenis.tempat.tinggal                       nama.jalan.tempat.tinggal jarak.(km)         alasan.pemilihan.lokasi.tempat.tinggal
## 1 Rumah pribadi/rumah keluarga                                    eLBe Loundry   4.223797                 Bersama keluarga/saudara/teman
## 2 Rumah pribadi/rumah keluarga                         Jl.Urip Sumoharjo no 88   2.703331 Mudahnya akses berpergian dari tempat tinggal 
## 3 Rumah pribadi/rumah keluarga                  JL DARUSSALAM GG LANGGAR LK II   3.237072                 Bersama keluarga/saudara/teman
## 4 Rumah pribadi/rumah keluarga Jl Darussalam bilabong bila bolong di jait dong   3.002336    Lingkungan nyaman karna aman dari kejahatan
## 5 Rumah pribadi/rumah keluarga          jl.cendrawasih sukarame bandar lampung   5.961925                    Dekat dengan fasilitas umum
## 6 Rumah pribadi/rumah keluarga                            Jl P tabuan nomor 26   2.925331                 Bersama keluarga/saudara/teman
##   biaya.dalam.seminggu Jumlah.perjalanan.Senin Jumlah.Perjalanan.Selasa Jumlah.Perjalanan.Rabu Jumlah.Perjalanan.Kamis Jumlah.Perjalanan.Jumat
## 1                   25                       2                        3                      2                       3                       2
## 2                  200                       3                        3                      3                       3                       3
## 3                   50                       1                        1                      1                       1                       1
## 4                   20                       2                        2                      2                       2                       2
## 5                   NA                       1                        1                      1                       1                       1
## 6                   40                       3                        3                      1                       1                       1
##   Jumlah.Perjalanan.Sabtu Jumlah.Perjalanan.Ahad
## 1                       2                      2
## 2                       3                      3
## 3                       1                      1
## 4                       2                      2
## 5                       1                      1
## 6                       1                      1
```

Kemudian kita perlu menetapkan `factor` untuk variabel-variabel kategoris kita agar data kita lebih 'bersih.'


``` r
# Menetapkan vektor untuk factor variabel kategoris
jk <- c("Laki-Laki", "Perempuan")

fakultas <- c("Fakultas Ekonomi dan Bisnis", "Fakultas Hukum",
              "Fakultas Ilmu Komputer", "Fakultas Ilmu Sosial dan Politik",
              "Fakultas Keguruan dan Ilmu Pendidikan", "Fakultas Teknik")

prodi <- c("Administrasi Bisnis", "Administrasi Publik","Akuntansi","Arsitektur",
           "Ilmu Hukum","Ilmu Komunikasi", "Informatika","Manajemen",
           "Pendidikan Bahasa Inggris", "Sistem Informasi")

tingkat <- c("1 (Semester 1 – Semester 2)",
             "2 (Semester 3 – Semester 4)",
             "3 (Semester 5 - Semester 6)",
             "4 (Semester 7 - Semester 8)")

uang_saku <- c("< 1 jt", "1 jt – 2 jt", "2,1 jt – 3 jt", "3,1 jt – 4 jt", "> 4 jt")


# Merapikan dataset
data.ubl <- data.ubl |> 
  # mengubah nama variabel
  rename(biaya.dalam.sepekan = biaya.dalam.seminggu) |>
  rename(Jumlah.Perjalanan.Senin = Jumlah.perjalanan.Senin) |> 
  rename(jarak = `jarak.(km)`) |> 
  # menghapus data dengan missing values
  drop_na() |> 
  # menambahkan factor ke variabel kategoris
  mutate(Jenis.Kelamin = factor(Jenis.Kelamin, levels = jk),
         Fakultas = factor(Fakultas, levels = fakultas),
         Prodi = factor(Prodi, levels = prodi),
         Tingkat.Semester = factor(Tingkat.Semester, 
                                   levels = tingkat,
                                   ordered = TRUE), 
         Uang.Saku = factor(Uang.Saku, levels = uang_saku, ordered = TRUE))
```

Kita akan mengubah kategori `factor` pada variabel `Tingkat.Semester` dan `Uang.Saku` agar lebih mudah dibaca saat divisualisasikan. Kita akan menggunakan fungsi dari `dplyr` (bagian dari `tidyverse`) untuk membersihkan dan mengubah data.


``` r
# Membersihkan dan mengubah nama level pada variabel Tingkat.Semester dan Uang.Saku
data.ubl.cleaned <- data.ubl %>%
  mutate(
    Tingkat.Semester = fct_recode(Tingkat.Semester,
      "Semester 1 & 2" = "1 (Semester 1 – Semester 2)",
      "Semester 3 & 4" = "2 (Semester 3 – Semester 4)",
      "Semester 5 & 6" = "3 (Semester 5 - Semester 6)",
      "Semester 7 & 8" = "4 (Semester 7 - Semester 8)",
      "Di Atas Semester 8" = "5 (Di atas semester 8)"
    ),
    Uang.Saku = fct_relevel(Uang.Saku, 
      "< 1 jt", "1 jt – 2 jt", "> 2 jt"
    )
  )
```

```
## Warning: There were 2 warnings in `mutate()`.
## The first warning was:
## ℹ In argument: `Tingkat.Semester = fct_recode(...)`.
## Caused by warning:
## ! Unknown levels in `f`: 5 (Di atas semester 8)
## ℹ Run `dplyr::last_dplyr_warnings()` to see the 1 remaining warning.
```

``` r
# Menampilkan hasil pembersihan data
glimpse(data.ubl.cleaned)
```

```
## Rows: 330
## Columns: 26
## $ Timestamp                              <dbl> 45413.83, 45413.83, 45413.85, 45413.85, 45413.92, 45413.93, 45413.93, 45413.93, 45413.94, 45414.0…
## $ Kampus_PT                              <chr> "UBL", "UBL", "UBL", "UBL", "UBL", "UBL", "UBL", "UBL", "UBL", "UBL", "UBL", "UBL", "UBL", "UBL",…
## $ Nomor.urut                             <dbl> 1, 2, 3, 4, 6, 7, 8, 9, 10, 12, 14, 15, 16, 17, 18, 19, 20, 21, 24, 25, 27, 30, 31, 32, 33, 34, 3…
## $ Jenis.Kelamin                          <fct> Perempuan, Laki-Laki, Laki-Laki, Laki-Laki, Perempuan, Perempuan, Perempuan, Laki-Laki, Perempuan…
## $ Umur                                   <dbl> 21, 20, 21, 22, 21, 22, 22, 22, 22, 22, 22, 19, 22, 23, 22, 23, 22, 20, 22, 18, 22, 20, 22, 21, 2…
## $ Fakultas                               <fct> Fakultas Ilmu Sosial dan Politik, Fakultas Hukum, Fakultas Ekonomi dan Bisnis, Fakultas Ekonomi d…
## $ Prodi                                  <fct> Ilmu Komunikasi, Ilmu Hukum, Manajemen, Akuntansi, Akuntansi, Administrasi Publik, Administrasi P…
## $ Tingkat.Semester                       <ord> Semester 7 & 8, Semester 5 & 6, Semester 7 & 8, Semester 7 & 8, Semester 7 & 8, Semester 7 & 8, S…
## $ Uang.Saku                              <ord> "< 1 jt", "1 jt – 2 jt", "1 jt – 2 jt", "1 jt – 2 jt", "1 jt – 2 jt", "1 jt – 2 jt", "< 1 jt", "1…
## $ kepemilikan.mobil                      <dbl> 1, 2, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 2, 1, 2, 1, 3, 2, 2, 1, 0, 2, 0…
## $ kepemilikan.motor                      <dbl> 2, 1, 2, 4, 2, 1, 1, 1, 1, 2, 1, 1, 1, 0, 1, 0, 2, 2, 0, 1, 1, 3, 2, 2, 2, 2, 2, 2, 3, 2, 1, 1, 1…
## $ kepemilikan.sepeda                     <dbl> 1, 1, 2, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 2, 0, 0, 0…
## $ kendaraan.utama                        <chr> "Sepeda Motor Pribadi", "Mobil Pribadi", "Sepeda Motor Pribadi", "Kendaraan Bermotor (menumpang d…
## $ kelurahan                              <chr> "Kalibalau Kencana", "Gunung sulah", "langkapura", "Bilabong JAYA JAYA JAYA", "Way halim", "Segal…
## $ jenis.tempat.tinggal                   <chr> "Rumah pribadi/rumah keluarga", "Rumah pribadi/rumah keluarga", "Rumah pribadi/rumah keluarga", "…
## $ nama.jalan.tempat.tinggal              <chr> "eLBe Loundry", "Jl.Urip Sumoharjo no 88", "JL DARUSSALAM GG LANGGAR LK II", "Jl Darussalam bilab…
## $ jarak                                  <dbl> 4.2237967, 2.7033310, 3.2370722, 3.0023362, 2.9253306, 2.0588294, 12.0078709, 4.7355783, 6.741307…
## $ alasan.pemilihan.lokasi.tempat.tinggal <chr> "Bersama keluarga/saudara/teman", "Mudahnya akses berpergian dari tempat tinggal ", "Bersama kelu…
## $ biaya.dalam.sepekan                    <dbl> 25, 200, 50, 20, 40, 70, 35, 50, 350, 50, 30, 35, 50, 200, 40, 100, 600, 50, 5, 50, 30, 500, 50, …
## $ Jumlah.Perjalanan.Senin                <dbl> 2, 3, 1, 2, 3, 2, 4, 4, 3, 2, 4, 2, 2, 2, 1, 1, 4, 4, 4, 2, 5, 4, 2, 3, 3, 3, 4, 2, 4, 1, 5, 3, 3…
## $ Jumlah.Perjalanan.Selasa               <dbl> 3, 3, 1, 2, 3, 2, 4, 4, 3, 1, 4, 1, 3, 3, 1, 1, 3, 1, 3, 4, 5, 3, 3, 3, 3, 4, 3, 4, 1, 1, 3, 1, 3…
## $ Jumlah.Perjalanan.Rabu                 <dbl> 2, 3, 1, 2, 1, 2, 4, 4, 3, 2, 4, 3, 2, 4, 1, 1, 3, 1, 3, 3, 5, 3, 2, 3, 1, 3, 2, 3, 1, 1, 4, 3, 4…
## $ Jumlah.Perjalanan.Kamis                <dbl> 3, 3, 1, 2, 1, 2, 4, 4, 3, 1, 4, 3, 2, 2, 1, 1, 3, 1, 3, 3, 5, 3, 1, 2, 4, 2, 3, 1, 1, 1, 4, 1, 4…
## $ Jumlah.Perjalanan.Jumat                <dbl> 2, 3, 1, 2, 1, 2, 4, 3, 3, 2, 4, 3, 2, 3, 1, 1, 3, 1, 3, 3, 5, 3, 1, 1, 1, 3, 2, 5, 1, 1, 3, 4, 4…
## $ Jumlah.Perjalanan.Sabtu                <dbl> 2, 3, 1, 2, 1, 2, 3, 4, 2, 1, 1, 1, 2, 1, 1, 1, 3, 1, 3, 3, 3, 3, 1, 4, 3, 3, 2, 3, 2, 1, 3, 3, 2…
## $ Jumlah.Perjalanan.Ahad                 <dbl> 2, 3, 1, 2, 1, 2, 3, 4, 1, 1, 1, 1, 1, 2, 1, 1, 3, 1, 3, 3, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 3, 2…
```

Sekarang kita siap memvisualkan data kita.

### Tata Tulis Grafik *(Grammar of Graphics)*

Setiap grafik `ggplot2` terdiri dari beberapa komponen kunci:

-   **DATA**: Dataset yang ingin Anda visualisasikan.
-   **MAPPING**: `aes()` (aesthetics), yang menghubungkan variabel dari data Anda ke properti visual dari grafik (misalnya, sumbu x, sumbu y, warna, ukuran).
-   **GEOM_FUNCTION**: Objek geometris yang merepresentasikan data (misalnya, `geom_point()` untuk scatter plot, `geom_bar()` untuk diagram batang).
-   **STAT**: Transformasi statistik. Setiap `geom` memiliki statistik default (misalnya, `geom_bar` secara default menggunakan `stat_count`), tetapi Anda bisa menentukannya secara manual.
-   **POSITION**: Penyesuaian posisi untuk `geom` yang tumpang tindih (misalnya, `position_dodge()` atau `position_stack()`).
-   **COORDINATE_FUNCTION**: Sistem koordinat yang digunakan (`coord_cartesian`, `coord_flip`, dll.).
-   **FACET_FUNCTION**: Membagi plot menjadi beberapa sub-plot berdasarkan variabel kategori (`facet_wrap` atau `facet_grid`).

``` r
ggplot(<DATA>) + 
  <GEOM_FUNCTION>(mapping = aes(<MAPPING>),
             stat = <STAT>,
             position = <POSITION>) +
  <COORDINATE_FUNCTION> +
  <FACET_FUNCTION> +
  <SCALE_FUNCTION> +  # opsional
  <THEME_FUNCTION>    # opsional
```

!["Grammar of Graphics"](images/grammar_of_graphics.png)

### Praktik Visualisasi Data

#### Diagram Batang *(Column/Bar Chart)*

Diagram batang sangat baik untuk menampilkan distribusi atau perbandingan data **kategoris**.

##### Diagram Batang Tunggal

Mari kita lihat distribusi mahasiswa berdasarkan tingkat semester. `geom_bar()` secara otomatis menghitung jumlah observasi untuk setiap kategori di sumbu x.


``` r
diagram_batang <- ggplot(data.ubl.cleaned) +
  geom_bar(mapping = aes(x = Tingkat.Semester), fill = "skyblue",
           color = "black") +
  labs(
    title = "Distribusi Mahasiswa Berdasarkan Tingkat Semester",
    x = "Tingkat Semester",
    y = "Jumlah Mahasiswa"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) # Rotasi label x agar tidak tumpang tindih

diagram_batang
```

<img src="_main_files/figure-html/bar-chart-single-1.png" width="672" />

**Interpretasi:** Grafik di atas menunjukkan bahwa mayoritas responden mahasiswa berasal dari tingkat semester 5 & 6, diikuti oleh semester 7 & 8.

**Penjelasan Sintaks (Grammar of Graphics):**

-   **DATA**: `ggplot(data.ubl.cleaned)` mendefinisikan dataset yang digunakan.
-   **GEOM**: `geom_bar(...)` menentukan bentuk geometris yang digunakan, yaitu batang.
-   **MAPPING**: `mapping = aes(x = Tingkat.Semester)` memetakan variabel `Tingkat.Semester` dari data ke sumbu x pada grafik.
-   **STAT**: `geom_bar()` secara default menggunakan `stat = "count"`, yang berarti ia secara otomatis melakukan transformasi statistik dengan menghitung jumlah baris untuk setiap kategori `Tingkat.Semester` dan menampilkannya sebagai ketinggian batang di sumbu y.
-   `fill = "skyblue", color = "black"`: Ini adalah pengaturan properti visual, bukan pemetaan. Kita mengatur semua batang agar memiliki warna isian "skyblue" dan garis tepi "black".
-   `labs(...)`, `theme_minimal()`, `theme(...)`: Ini adalah lapisan tambahan untuk kustomisasi label dan tema, bukan bagian inti dari "grammar".

##### Diagram Batang Bertumpuk *(Stacked)*

Kita bisa menambahkan variabel lain, misalnya `Uang.Saku`, ke dalam `aes()` dengan properti `fill` untuk membuat diagram batang bertumpuk. Ini menunjukkan proporsi uang saku di setiap tingkat semester.


``` r
diagram_batangTumpuk <- ggplot(data.ubl.cleaned) +
  geom_bar(mapping = aes(x = Tingkat.Semester, fill = Uang.Saku)) +
  labs(
    title = "Distribusi Uang Saku per Tingkat Semester",
    x = "Tingkat Semester",
    y = "Jumlah Mahasiswa",
    fill = "Uang Saku per Bulan"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

diagram_batangTumpuk
```

<img src="_main_files/figure-html/bar-chart-stacked-1.png" width="672" />

**Interpretasi:** Dari grafik ini, kita bisa melihat komposisi uang saku di setiap angkatan. Misalnya, pada tingkat "Semester 5 & 6", sebagian besar mahasiswa memiliki uang saku antara 1 juta hingga 2 juta. Hal ini kita ketahui dari perbandingan relatif tinggi porsi warna-warna dalam masing-masing batang.

**Penjelasan Sintaks (Grammar of Graphics):**

-   **MAPPING**: `mapping = aes(x = Tingkat.Semester, fill = Uang.Saku)` kini memiliki pemetaan tambahan. Selain sumbu x, kita juga memetakan variabel `Uang.Saku` ke properti visual `fill` (warna isian). `ggplot` akan membuat segmen berwarna berbeda di dalam setiap batang sesuai kategori uang saku.
-   **POSITION**: Secara default, `geom_bar()` menggunakan `position = "stack"` ketika `fill` dipetakan ke sebuah variabel. Inilah yang menyebabkan segmen-segmen tersebut ditumpuk di atas satu sama lain.
-   `labs(fill = "Uang Saku per Bulan")`: Argumen `fill` di dalam `labs()` berfungsi untuk mengubah judul dari legenda yang secara otomatis dibuat dari pemetaan `fill`.

Untuk membandingkan jumlah absolut antar kategori uang saku, diagram batang berkelompok lebih efektif. Kita gunakan `position = "dodge"`.


``` r
diagram_batangSebar <- ggplot(data.ubl.cleaned) +
  geom_bar(mapping = aes(x = Tingkat.Semester, fill = Uang.Saku),
           position = "dodge") +
  labs(
    title = "Perbandingan Uang Saku per Tingkat Semester",
    x = "Tingkat Semester",
    y = "Jumlah Mahasiswa",
    fill = "Uang Saku per Bulan"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

diagram_batangSebar
```

<img src="_main_files/figure-html/bar-chart-grouped-1.png" width="672" />

**Interpretasi:** Grafik ini mempermudah perbandingan langsung. Terlihat jelas bahwa kategori uang saku "1 jt – 2 jt" mendominasi di hampir semua tingkat semester.

-   **POSITION**: Komponen `position` diubah secara eksplisit menjadi `position = "dodge"`. Ini menginstruksikan `ggplot` untuk menempatkan batang-batang yang memiliki kategori x yang sama (misalnya, "Semester 5 & 6") bersebelahan, bukan menumpuknya. Ini memungkinkan perbandingan langsung antar kategori `Uang.Saku`.

Terkadang kita lebih tertarik pada perbandingan proporsi antar grup daripada jumlah absolutnya. Dengan mengubah `position` menjadi `"fill"`, kita dapat membuat setiap batang memiliki tinggi yang sama (100%) dan menunjukkan persentase relatif dari setiap subgrup.


``` r
diagram_btTumpuk100 <- ggplot(data.ubl.cleaned) +
  geom_bar(mapping = aes(x = Tingkat.Semester, fill = Uang.Saku),
           position = "fill") +
  scale_y_continuous(labels = scales::percent) + # untuk mengubah satuan sumbu Y menjadi '%'
  labs(
    title = "Proporsi Uang Saku per Tingkat Semester",
    x = "Tingkat Semester",
    y = "Persentase",
    fill = "Uang Saku per Bulan"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

diagram_btTumpuk100
```

<img src="_main_files/figure-html/bar-chart-fill-1.png" width="672" />

**Interpretasi:** Grafik ini menunjukkan bahwa secara proporsional, mahasiswa dengan kategori uang saku tertinggi ("\>4jt") yang paling dominan terdapat pada tingkat 3 ("Semester 5 & 6"). Sementara itu, mahasiswa kategori uang saku terrendah paling banyak porsinya pada tingkat 2 ("Semester 3 & 4"). Ini adalah wawasan yang mungkin tidak terlihat jelas pada grafik jumlah absolut.

**Penjelasan Sintaks (Grammar of Graphics):**

-   **POSITION**: Komponen `position` diubah menjadi `position = "fill"`. Pengaturan ini secara otomatis melakukan transformasi **STAT** yang berbeda: ia menghitung proporsi dari setiap subgrup (`Uang.Saku`) dalam setiap grup (`Tingkat.Semester`). Hasilnya adalah setiap batang dinormalisasi menjadi setinggi 1 (atau 100%).

-   **SCALE**: `scale_y_continuous(labels = scales::percent)` adalah lapisan tambahan yang mengontrol **SKALA** pada sumbu y. Fungsi `scales::percent` digunakan untuk memformat label sumbu dari angka desimal (misal: 0.5) menjadi format persentase (misal: 50%) agar lebih mudah dibaca.

::: {.rmdexercise}
**Aktivitas Mandiri 1: Membuat dan Menginterpretasikan Diagram Batang [STP-3.2, STP-3.3]**

Buatlah diagram batang untuk variabel `Fakultas`:

1. **Diagram batang sederhana** - gunakan `geom_bar()`
2. **Diagram batang bertumpuk** dengan `Uang.Saku` sebagai fill
3. **Diagram batang berkelompok** dengan `position = "dodge"` dan interpretasikan hasilnya:
   - Fakultas mana yang paling banyak mahasiswa dengan uang saku >2jt?
   - Bagaimana pola distribusi uang saku antar fakultas?
   - Apakah ada fakultas yang dominan memiliki mahasiswa dengan uang saku tertentu?
:::

### Diagram Lollipop

Diagram lolipop adalah alternatif dari diagram batang yang dapat mengurangi tinta visual dan memberikan penekanan lebih pada nilai data. Grafik ini menggunakan segmen garis dan titik untuk merepresentasikan nilai. Ini sangat efektif untuk menampilkan data kategoris yang banyak kategorinya.


``` r
# Pertama, kita perlu membuat tabel baru yang menampilkan jumlah mahasiswa per program studi
prodi_count <- data.ubl.cleaned |> 
  count(Prodi, name = "jumlah") |> 
  arrange(jumlah) |> 
  mutate(Prodi = fct_inorder(Prodi)) # mengubah jadi faktor terurut
```


``` r
# Kedua, kita baru bisa membuat diagram lollipop-nya
diagram_lollipop <- ggplot(prodi_count) +
  # diagram lollipop terdiri atas 2 geometri: geom_segment yang bertindak sebagai
  # batang dan geom_point yang bertindak sebagai permennya
  geom_segment(
    mapping = aes(x = Prodi,
                  y = 0, yend = jumlah),
    color = "grey",
    size = 1.5) +
  geom_point(
    mapping = aes(x = Prodi, y = jumlah),
    color = "#0072B2", size = 4
  ) + 
  coord_flip() + # Membalik sumbu agar mudah dibaca
  labs(
    title = "Jumlah Responden Mahasiswa UBL Per Program Studi",
    x = "Program Studi",
    y = "Jumlah Responden"
  ) +
  theme(
    panel.grid.major.y = element_blank(),
    panel.border = element_blank(),
    axis.ticks.y = element_blank()
  )
```

```
## Warning: Using `size` aesthetic for lines was deprecated in ggplot2 3.4.0.
## ℹ Please use `linewidth` instead.
## This warning is displayed once every 8 hours.
## Call `lifecycle::last_lifecycle_warnings()` to see where this warning was generated.
```

``` r
diagram_lollipop
```

<img src="_main_files/figure-html/lollipop-chart-1.png" width="672" />

**Interpretasi:** Grafik ini menunjukkan bahwa kebanyakan responden berasal dari program studi Ilmu Hukum dan Manajemen, dengan perbandingan yang cukup timpang dengan prodi-prodi lain. Selain itu, ternyata cukup dominan mahasiswa yang tidak memberikan data prodi mereka (NA) di antara prodi-prodi selain dua yang tertinggi tadi.

**Penjelasan Sintaks (Grammar of Graphics):**

-   **DATA & STAT**: Sama seperti contoh sebelumnya, kita melakukan pra-pemrosesan data menggunakan `dplyr`. Kita mengelompokkan data berdasarkan `Prodi`, menghitung (`count`) jumlahnya, mengurutkan (`arrange`), dan yang terpenting, mengubah `Prodi` menjadi variabel faktor yang terurut (`fct_inorder`) agar plot ditampilkan sesuai urutan yang kita inginkan.
-   **GEOM & MAPPING (Layering)**: Di sinilah keunikan diagram lolipop. Kita menggunakan **dua lapisan `geom`**:
    -   `geom_segment()`: Digunakan untuk membuat "batang" atau segmen garis. **Mapping**-nya membutuhkan empat estetika: `x` dan `xend` (yang sama untuk garis vertikal) serta `y` (titik awal, yaitu 0) dan `yend` (titik akhir, yaitu `jumlah`).
    -   `geom_point()`: Digunakan untuk membuat "permen" atau titik di ujung segmen. **Mapping**-nya lebih sederhana, hanya membutuhkan `x` dan `y`.
-   **KOORDINAT**: `coord_flip()` digunakan untuk membalik sumbu, membuat diagram lolipop horizontal yang seringkali lebih mudah dibaca label kategorinya.
-   **THEME**: Lapisan tema digunakan untuk membersihkan tampilan, seperti menghilangkan beberapa garis grid dan batas panel untuk menonjolkan data itu sendiri.

### Diagram Pai/Donat *(Pie/Donut Chart)*

Diagram pai (dan variasinya, diagram donat) digunakan untuk menunjukkan proporsi dari sebuah keseluruhan. Meskipun populer, diagram pai seringkali sulit untuk dibaca secara akurat, terutama ketika ada banyak irisan atau ukurannya mirip. Diagram donat sedikit lebih baik karena mengurangi penekanan pada sudut dan lebih fokus pada panjang busur.

Di `ggplot2`, diagram pai dibuat dengan memulai dari diagram batang bertumpuk, lalu mengubah sistem **KOORDINAT**-nya menjadi koordinat polar. Akan tetapi, dalam `ggplot2` kita tidak bisa membuat diagram pai langsung dari datasetnya, tetapi kita harus membentuk **tabel distribusi frekuensinya** terlebih dahulu.


``` r
fakultas_count <- data.ubl.cleaned |> 
  count(Fakultas, name = "jumlah") |> # Membuat kolom jumlah responden per fakultas
  mutate(
    persen = jumlah / sum(jumlah) # Membuat kolom persentase dari 'jumlah
  )

fakultas_count
```

```
##                                Fakultas jumlah     persen
## 1           Fakultas Ekonomi dan Bisnis    104 0.31515152
## 2                        Fakultas Hukum     98 0.29696970
## 3                Fakultas Ilmu Komputer     29 0.08787879
## 4      Fakultas Ilmu Sosial dan Politik     52 0.15757576
## 5 Fakultas Keguruan dan Ilmu Pendidikan      6 0.01818182
## 6                       Fakultas Teknik     41 0.12424242
```

Baru kemudian kita bisa menghasilkan perintah `ggplot` untuk


``` r
diagram_pai <- ggplot(fakultas_count, aes(x = 2, y = persen, fill = Fakultas)) +
  geom_bar(stat = "identity", color = "white") +
  coord_polar(theta = "y", start = 0) +
  labs(
    title = "Sebaran Fakultas Responden Mahasiswa UBL",
    fill = "Fakultas"
  ) +
  # Membersihkan tema
  theme_void() +
  theme(legend.position = "right")

diagram_pai
```

<img src="_main_files/figure-html/membuat-diagram-pai-1.png" width="672" />

**Interpretasi:** Diagram donat ini menunjukkan proporsi dari setiap fakultas. Terlihat jelas bahwa irisan "Fakultas Ekonomi dan Bisnis" dan "Fakultas Hukum" mendominasi porsi responden.

**Penjelasan Sintaks (Grammar of Graphics):**

-   **DATA & STAT**: Kita menggunakan data `alasan_counts` yang sudah diagregasi, lalu menambahkan kolom baru untuk persentase (`persen`) dan posisi vertikal untuk label (`posisi_y_label`).
-   **GEOM & MAPPING**: Kita mulai dengan `geom_bar(stat = "identity")` yang membuat diagram batang di mana tinggi batang (`y`) adalah nilai persentase itu sendiri. `x=2` adalah trik untuk membuat satu batang tunggal yang akan kita "lilit".
-   **KOORDINAT**: `coord_polar(theta = "y")` adalah komponen kunci. Ini mengambil diagram batang dan mengubah sistem koordinatnya dari Kartesius (x,y) menjadi Polar. Sumbu y "dibengkokkan" menjadi sebuah lingkaran.
-   `theme_void()`: Menghilangkan semua elemen tema seperti sumbu, label sumbu, dan latar belakang, yang tidak relevan untuk diagram pai/donat.
-   kita bisa menambahkan lubang di tengah pai dengan menambahkan `xlim(0.5, 2.5)` yang merupakan batas dalam dan batas luar dari radius si diagram seperti berikut.


``` r
diagram_donat <- diagram_pai + xlim(0.5, 2.5)

diagram_donat
```

<img src="_main_files/figure-html/membuat-diagram-donat-1.png" width="672" />

> ⚠️**Penting**
>
> Komunitas perupa data pada dasarnya menganjurkan kita untuk 'menghindari' diagram lingkaran. Hal ini bisa kalian baca di [laman ini](https://www.data-to-viz.com/caveat/pie.html). Alternatifnya, mereka lebih menyarankan kita untuk menggunakan diagram batang atau diagram lollipop saja

### Diagram *Treemap*

Treemap adalah alternatif lain untuk diagram pai, terutama efektif ketika Anda memiliki banyak kategori. Treemap menampilkan data hierarkis atau bagian-ke-keseluruhan sebagai satu set persegi panjang bersarang. Ukuran setiap persegi panjang sebanding dengan nilainya.

Untuk membuat treemap, kita perlu paket tambahan yaitu `treemapify`.


``` r
# Pastikan paket sudah terinstall: install.packages("treemapify")
# install.packages("treemapify")
library(treemapify)
```

Kita akan membuat *treemap* dari alasan mahasiswa memilih tempat tinggal mereka


``` r
# Pertama, kita siapkan data dengan menghitung jumlah dan mengurutkannya
alasan_counts <- data.ubl.cleaned |> 
  # Mengganti nama yang terlalu panjang agar muat di plot
  mutate(alasan_singkat = fct_recode(`alasan.pemilihan.lokasi.tempat.tinggal`,
    "Bersama Keluarga" = "Bersama keluarga/saudara/teman",
    "Dekat Kampus/lokasi lain" = "Dekat dengan kampus",
    "Dekat Kampus/lokasi lain" = "Dekat dengan fasilitas umum",
    "Dekat Kampus/lokasi lain" = "Mudahnya akses berpergian dari tempat tinggal ",
    "Fasilitas Lengkap" = "Fasilitas tempat tinggal lengkap",
    "Murah" = "Biaya tempat tinggal murah",
    "Aman" = "Lingkungan nyaman karna aman dari kejahatan"
  )) |>
  count(alasan_singkat, name = "jumlah")

alasan_counts
```

```
##             alasan_singkat jumlah
## 1         Bersama Keluarga    247
## 2                    Murah     16
## 3 Dekat Kampus/lokasi lain     35
## 4        Fasilitas Lengkap      1
## 5               Lain-lain       2
## 6                     Aman     29
```


``` r
ggplot(alasan_counts, aes(area = jumlah, fill = alasan_singkat, label = alasan_singkat)) +
  geom_treemap() +
  geom_treemap_text(
    colour = "white", 
    place = "centre",
    size = 13
  ) +
  labs(
    title = "Proporsi Alasan Mahasiswa Memilih Tempat Tinggal (Treemap)",
    fill = "Alasan utama"
  ) +
  theme(legend.position = "bottom") # Untuk menampilkan area yang tidak ada labelnya
```

<img src="_main_files/figure-html/treemap-1.png" width="672" />

**Penjelasan Sintaks (Grammar of Graphics):**

-   **DATA**: Kita menggunakan data `alasan_counts` yang sudah diagregasi.
-   **GEOM & MAPPING**: Paket `treemapify` menyediakan `geom` baru yang terintegrasi dengan `ggplot2`.
    1.  `geom_treemap()`: Ini adalah `geom` utama. Alih-alih `x` dan `y`, **MAPPING** utamanya adalah `aes(area = jumlah)`. `ggplot` akan secara otomatis menghitung tata letak persegi panjang berdasarkan nilai `jumlah`. Kita juga memetakan `alasan_singkat` ke `fill` untuk warna dan `label` untuk teks.
    2.  `geom_treemap_text()`: Ini adalah `geom` tambahan khusus untuk menempatkan teks di dalam setiap area treemap.
-   **THEME**: Kita bisa menyembunyikan legenda karena setiap area sudah diberi label secara langsung, sehingga legenda menjadi berlebihan. Caranya adalah mengatur nilai `bottom =` menjadi `"none"`. Akan tetapi, untuk kasus kita, kita punya area yang terlalu kecil untuk diberi label, sehingga kita tetap tampilkan legenda.

### Histogram

Histogram digunakan untuk melihat distribusi dari variabel numerik/kontinu, seperti `Umur`.


``` r
histogram <- ggplot(data.ubl.cleaned) +
  geom_histogram(mapping = aes(x = Umur), binwidth = 1, fill = "darkseagreen", color = "white") +
  labs(
    title = "Distribusi Umur Mahasiswa",
    x = "Umur (Tahun)",
    y = "Frekuensi"
  ) +
  theme_minimal()

histogram
```

<img src="_main_files/figure-html/histogram-1.png" width="672" />

**Penjelasan Sintaks (Grammar of Graphics):**

-   **DATA**: `ggplot(data.ubl.cleaned)` mendefinisikan dataset.
-   **GEOM**: `geom_histogram(...)` menentukan bentuk geometris berupa histogram.
-   **MAPPING**: `mapping = aes(x = Umur)` memetakan variabel numerik `Umur` ke sumbu x.
-   **STAT**: `geom_histogram` memiliki `stat = "bin"` sebagai defaultnya. Transformasi statistik ini akan membagi data `Umur` ke dalam beberapa rentang (bins) yang lebarnya diatur oleh `binwidth = 1`, lalu menghitung frekuensi data di setiap rentang tersebut untuk ditampilkan di sumbu y.

### *Boxplot*

Box plot berguna untuk membandingkan distribusi variabel numerik di antara beberapa grup/kategori. Mari kita bandingkan distribusi jarak tempat tinggal (`jarak`) untuk setiap jenis kendaraan utama.


``` r
boxplot <- ggplot(data.ubl.cleaned) +
  geom_boxplot(mapping = aes(x = kendaraan.utama, y = jarak, fill = kendaraan.utama)) +
  coord_flip() + # Membalik sumbu agar label mudah dibaca
  labs(
    title = "Distribusi Jarak Tempat Tinggal Berdasarkan Kendaraan Utama",
    x = "Kendaraan Utama",
    y = "Jarak dari Kampus (km)"
  ) +
  theme_minimal() +
  theme(legend.position = "none") # Menghilangkan legenda karena sudah ada di sumbu

boxplot
```

<img src="_main_files/figure-html/box-plot-1.png" width="672" />

**Interpretasi:** Box plot ini menunjukkan bahwa mahasiswa yang menggunakan mobil pribadi cenderung memiliki rentang jarak tempat tinggal yang lebih bervariasi dan median yang sedikit lebih tinggi dibandingkan pengguna sepeda motor. Pengguna ojek online memiliki median jarak yang paling rendah di antara kategori lainnya.

**Penjelasan Sintaks (Grammar of Graphics):**

-   **DATA**: `ggplot(data.ubl.cleaned)` mendefinisikan dataset.

-   **GEOM**: `geom_boxplot(...)` menentukan bentuk geometris berupa diagram kotak.

-   **MAPPING**: `mapping = aes(x = kendaraan.utama, y = \`jarak.(km)\`, fill = kendaraan.utama)`memetakan tiga hal: variabel kategori`kendaraan.utama`ke sumbu x, variabel numerik`jarak.(km)`ke sumbu y, dan`kendaraan.utama`ke warna isian`fill\`.

-   **STAT**: `geom_boxplot` secara default menggunakan `stat_boxplot`, yang menghitung ringkasan lima angka (minimum, Q1, median, Q3, maksimum) untuk setiap grup di sumbu x.

-   **KOORDINAT**: `coord_flip()` secara eksplisit mengubah sistem koordinat dengan membalik sumbu x dan y. Ini adalah komponen terpisah yang diterapkan setelah komponen lainnya.

-   `theme(legend.position = "none")`: Kustomisasi lapisan tema untuk menyembunyikan legenda.

### Grafik Pencar *(Scatter Plot)*

Scatter plot ideal untuk melihat hubungan antara dua variabel numerik. Mari kita lihat hubungan antara `Umur` dan `jarak` tempat tinggal.


``` r
scatter_plot <- ggplot(data.ubl.cleaned) +
  geom_point(mapping = aes(x = Umur, y = jarak), alpha = 0.6, color = "darkblue") + # alpha untuk transparansi
  labs(
    title = "Hubungan Antara Umur dan Jarak Tempat Tinggal",
    x = "Umur (Tahun)",
    y = "Jarak dari Kampus (km)"
  ) +
  theme_minimal()
  
scatter_plot
```

<img src="_main_files/figure-html/scatter-plot-1.png" width="672" />

**Interpretasi:** Grafik ini tidak menunjukkan adanya pola atau hubungan yang jelas antara umur mahasiswa dan jarak tempat tinggal mereka dari kampus. Titik-titik tersebar secara acak.

**Penjelasan Sintaks (Grammar of Graphics):**

-   **DATA**: `ggplot(data.ubl.cleaned)` mendefinisikan dataset.
-   **GEOM**: `geom_point(...)` menentukan bentuk geometris berupa titik.
-   **MAPPING**: `mapping = aes(x = Umur, y = \`jarak.(km)\`)`memetakan dua variabel,`Umur`ke sumbu x dan`jarak.(km)\` ke sumbu y. Setiap baris data akan menjadi satu titik pada plot.
-   `alpha = 0.6` dan `color = "darkblue"` adalah pengaturan properti visual untuk semua titik.

Penting untuk menjaga konteks dalam interpretasi. Scatter plot kita menunjukkan bahwa mahasiswa yang lebih tua cenderung tinggal lebih jauh dari kampus. Namun, untuk benar-benar memahami kekuatan hubungan ini, kita perlu menggunakan statistik korelasi (akan dipelajari di modul selanjutnya).

::: {.rmdexercise}
**Aktivitas Mandiri 2: Histogram dan Boxplot untuk Variabel Numerik [STP-3.2, STP-3.3]**

Gunakan variabel `jarak` (jarak tempat tinggal dari kampus):

1. **Buat histogram** dengan `binwidth = 2` dan interpretasikan:
   - Apakah distribusi jarak simetris atau menceng (skewed)?
   - Pada rentang jarak berapa frekuensi mahasiswa paling tinggi?
   - Apakah ada pola tertentu dalam distribusi jarak?

2. **Buat boxplot** yang membandingkan `jarak` berdasarkan `Tingkat.Semester` dan interpretasikan:
   - Tingkat semester mana yang rata-rata (median) tinggal paling jauh dari kampus?
   - Apakah ada outlier? Jika ada, pada tingkat semester mana?
   - Bagaimana variabilitas jarak pada setiap tingkat semester?
:::

::: {.rmdexercise}
**Aktivitas Mandiri 3: Visualisasi Komprehensif untuk `biaya.dalam.sepekan` [STP-3.1, STP-3.2, STP-3.3, STP-3.4]**

**A. Menghasilkan Grafik [STP-3.3]:**

1. Buat **histogram** untuk `biaya.dalam.sepekan`
   - Coba beberapa nilai `binwidth` (misal: 20, 50, atau 100) dan pilih yang paling informatif
   - Tambahkan judul dan label sumbu yang jelas

2. Buat **boxplot** untuk `biaya.dalam.sepekan` berdasarkan `kendaraan.utama`
   - Gunakan `geom_boxplot()` dengan `fill` berdasarkan kendaraan
   - Tambahkan label yang jelas

3. Buat **scatter plot** untuk `Umur` vs `biaya.dalam.sepekan`
   - Tambahkan `geom_point()` dengan `alpha = 0.5` untuk transparansi
   - Pertimbangkan menambahkan `geom_smooth(method = "lm")` untuk melihat trend

**B. Pemilihan Visualisasi dan Tingkat Pengukuran [STP-3.1, STP-3.4]:**

4. **Mengapa histogram cocok untuk `biaya.dalam.sepekan`?**
   - Jelaskan kaitannya dengan tingkat pengukuran variabel (metrik/rasio)
   - Informasi apa yang bisa diperoleh dari histogram? (distribusi, spread, outlier)

5. **Apakah scatter plot cocok untuk `Jenis.Kelamin` vs `Umur`? Mengapa tidak?**
   - Jelaskan kaitannya dengan tingkat pengukuran variabel
   - Diagram apa yang lebih sesuai untuk membandingkan umur berdasarkan jenis kelamin?

**C. Interpretasi Mendalam [STP-3.2]:**

6. **Dari histogram no.1:**
   - Berapa rentang biaya yang paling sering muncul (modus)?
   - Apakah distribusinya simetris, menceng kanan, atau menceng kiri?
   - Apakah ada outlier (nilai ekstrem)?

7. **Dari boxplot no.2:**
   - Kendaraan apa yang memiliki median biaya tertinggi?
   - Kendaraan apa yang paling bervariasi biayanya (IQR terbesar)?
   - Apakah ada outlier? Pada jenis kendaraan apa?

8. **Dari scatter plot no.3:**
   - Apakah ada pola hubungan antara umur dan biaya transportasi?
   - Jika ada trend line, apakah slopenya positif atau negatif?
   - Apa interpretasi kontekstualnya?

**D. Dokumentasi [STP-3.3]:**

9. Kumpulkan file modul ini dengan:
   - Seluruh kode diagram yang sudah Anda buat di modul ini
   - Seluruh interpretasi dan analisis untuk setiap diagram
   - Screenshot atau output grafik yang sudah dihasilkan
:::

------------------------------------------------------------------------


<!--chapter:end:03-visualisasi-data.Rmd-->

# Modul-4: Distribusi Sampling dan Interval Kepercayaan

Setelah mempelajari modul ini, Anda diharapkan dapat:

1. menghasilkan distribusi statistik sampel dan menghitung standard error-nya [STP-4.3]{.capaian}
2. menghasilkan interval kepercayaan dengan menggunaan perangkat lunak komputer [STP-5.2]{.capaian}


---

## Pendahuluan

Dalam statistika inferensial, kita seringkali ingin mengetahui karakteristik dari sebuah populasi (misalnya, rata-rata uang saku seluruh mahasiswa di Indonesia). Namun, mengumpulkan data dari seluruh populasi seringkali tidak memungkinkan. Sebagai solusinya, kita mengambil sampel acak dari populasi tersebut dan menggunakan statistik dari sampel (seperti rata-rata sampel) untuk menduga parameter populasi.

Modul ini akan membahas dua konsep fundamental dalam statistika inferensial: **Distribusi Sampling** dan **Interval Kepercayaan** untuk rata-rata dan proporsi. Kita akan menggunakan studi kasus data jarak tempuh mahasiswa dari empat universitas di Bandar Lampung dan sekitarnya untuk memahami bagaimana konsep ini diterapkan dalam praktik.

## Perangkat Lunak dan Pustaka (Libraries)

Pastikan Anda telah menginstal pustaka `tidyverse` yang akan sangat membantu dalam proses manipulasi dan visualisasi data.


``` r
library(tidyverse)
library(readr)
```

## Memuat dan Mempersiapkan Data

Langkah pertama adalah memuat data survei mahasiswa dari empat universitas. Kita akan menggabungkan dan membersihkan data tersebut untuk analisis. Variabel yang akan menjadi fokus kita adalah **jarak tempuh (km)** dan **jenis tempat tinggal**.































































































































































































































