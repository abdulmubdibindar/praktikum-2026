---
name: R Bookdown Code Style Guide
description: Standardized coding patterns for R practical modules
---

# R Bookdown Code Style Guide

## 1. Chunk Labeling (CRITICAL FOR PDF COMPILATION)

### Pattern

**Format:** `{r mod##-descriptive-action}`

**Examples:**

- Module 01: `{r mod01-load-tidyverse}`
- Module 02: `{r mod02-import-data}`
- Module 05: `{r mod05-visualize-pvalue}`

### Why mod##- Prefix is Required

Without module prefix, chunk labels can duplicate across modules, causing LaTeX/PDF compilation errors:

```
Error: Duplicate chunk label 'load-libraries' in modules 01 and 02
```

### Naming Conventions for Chunk Labels

- **Use kebab-case:** `mod01-create-factor-gender`
- **Be descriptive:** `mod02-apply-factors` not `mod02-chunk5`
- **Action-oriented:** `mod03-plot-bar-chart` not `mod03-bar-chart`
- **Unique within module:** Each chunk needs distinct label

### Common Label Patterns

```r
{r mod##-load-libraries}        # Loading packages
{r mod##-import-data}           # Reading datasets
{r mod##-glimpse-data}          # Viewing data structure
{r mod##-clean-data}            # Data wrangling
{r mod##-create-factors}        # Factor creation
{r mod##-plot-xyz}              # Visualizations
{r mod##-test-hypothesis}       # Statistical tests
{r mod##-create-function}       # Custom functions
```

---

## 2. Pipe Operator

**Use:** Native R pipe `|>` (not magrittr `%>%`)

**Why:**

- Native to R 4.1+, no package dependency
- Faster performance
- Consistent with modern R practices

**Examples:**

```r
# ✅ Correct
data.ubl <- data.ubl |>
  rename(biaya.sepekan = biaya.seminggu) |>
  drop_na()

# ❌ Incorrect
data.ubl <- data.ubl %>%
  rename(biaya.sepekan = biaya.seminggu) %>%
  drop_na()
```

**Keyboard Shortcut:** `Ctrl` + `Shift` + `M`

---

## 3. Dataset Paths

**Always prefix:** `datasets/filename.ext`

**Why:**

- Portability (works when project moved)
- Consistency across modules
- Clear organization

**Examples:**

```r
# ✅ Correct
data <- read.xlsx("datasets/Data Praktikum 01.xlsx")
data_mhs <- read.csv2("datasets/data_mahasiswa.csv")

# ❌ Incorrect
data <- read.xlsx("Data Praktikum 01.xlsx")  # Breaks if not in root
data_mhs <- read.csv2("data_mahasiswa.csv")
```

**Verification Command:**

```r
# Check if file exists
file.exists("datasets/Data Praktikum 01.xlsx")
```

---

## 4. Factor Creation

### Preferred: Direct Vector Definition

**Why:** Clear, beginner-friendly, no typos

```r
# ✅ Preferred for teaching
jk <- c("Laki-Laki", "Perempuan")
data.ubl <- data.ubl |>
  mutate(Jenis.Kelamin = factor(Jenis.Kelamin, levels = jk))
```

### Advanced: Extract from Data

**When:** Large datasets, many unique values

```r
# Show as alternative (with explanation)
prodi_levels <- data.ubl |>
  distinct(Prodi) |>
  pull(Prodi)
```

**Pedagogical Approach:**

1. Teach direct vector method first (Module 02)
2. Show advanced extraction method later (Module 06) as optional
3. Explain trade-offs of each approach

---

## 5. Library Loading

### Location Rules

**1. Always at Module Start (Persiapan Section)**

````r
# ✅ Correct - at the beginning
```{r mod##-load-libraries}
library(tidyverse)
library(openxlsx)
````

````

**2. Mid-Module Loading Only If:**
- Pedagogically necessary (introducing new concept)
- Must include explanation why

```r
# ✅ Acceptable with explanation
Kini kita akan menggunakan paket `gtsummary` untuk membuat tabel statistik:

```{r mod##-load-gtsummary}
library(gtsummary)
````

````

**3. Never:**
```r
# ❌ Never load mid-module without explanation
# [Some code]
library(flextable)  # Why here? Students confused!
# [More code]
````

---

## 6. Pedagogical Structure (from pembuat-langkah.md)

Every module must follow this 5-step structure:

### 1. Ikhtisar Kasus (Case Overview)

- Set context
- Explain the problem
- State what students will learn

### 2. Cara Memperoleh Data & Menyimpan (Data Acquisition)

- Where data comes from
- How to access it
- How to store it

### 3. Paket Yang Digunakan (Packages Used)

- List required packages
- Brief explanation of each package's purpose

### 4. Langkah-Langkah (Steps)

- Detailed, followable procedures
- Clear code examples
- Explanations in Bahasa Indonesia

### 5. Kotak Latihan (`.rmdexercise`)

- Hands-on practice for students
- References capaian pembelajaran [STP-X.X]

**Example Structure:**

```markdown
# Modul-X: [Topic]

[Capaian pembelajaran statement]

---

Dalam praktikum ini... [Ikhtisar kasus]

## Persiapan

### Data untuk Modul Ini

[Cara memperoleh data]

### Library yang Diperlukan

[Paket yang digunakan]

## [Main Topic 1]

[Langkah-langkah dengan kode dan penjelasan]

::: rmdexercise
**Aktivitas Mandiri 1: [Topic] [STP-X.X]**
[Latihan]
:::

## [Main Topic 2]

[Continue...]
```

---

## 7. Custom Blocks

### Available Blocks

```markdown
::: rmdnote
**Catatan Penting**
Informasi tambahan atau penjelasan konsep
:::

::: rmdwarning
**Peringatan!**
Hal yang harus dihindari atau diperhatikan
:::

::: rmdexercise
**Aktivitas Mandiri X: [Topic] [STP-X.X]**
Latihan untuk mahasiswa
:::

::: rmdkasus
**Studi Kasus**
Contoh aplikasi nyata
:::
```

### When to Use Each

**rmdnote:**

- Additional explanations
- Introducing new concepts (e.g., pipe operator, list data type)
- Tips and best practices

**rmdwarning:**

- Common mistakes (e.g., case sensitivity)
- Important caveats
- Potential errors

**rmdexercise:**

- Hands-on practice
- Always reference [STP-X.X]
- Include clear instructions

**rmdkasus:**

- Real-world application examples
- Extended scenarios

---

## 8. Code Comments

### Bahasa Indonesia Required

All comments in Indonesian for student modules

```r
# ✅ Correct
# Mengimpor dataset mahasiswa UBL
data.ubl <- read.xlsx("datasets/Data Praktikum 02.xlsx")

# ❌ Incorrect
# Import UBL student dataset
data.ubl <- read.xlsx("datasets/Data Praktikum 02.xlsx")
```

### Block Comments

For multi-line comments:

```r
# Prefer single-line comments repeated:
# Ini adalah penjelasan panjang yang
# memerlukan beberapa baris untuk
# menjelaskan konsep yang kompleks

# Alternative (for disabling code):
if(FALSE) {
  Kode ini tidak akan dijalankan
  Berguna untuk debugging
}
```

---

## 9. Output Control (Presentation Only)

**For book presentation only** - do NOT teach to students

### Limit Output Lines

When output is too long in book:

```r
{r mod##-summary-data, output.lines=1:15}
summary(data.ubl)  # Shows only first 15 lines
```

### Suppress Warnings

```r
{r mod##-action, warning=FALSE}
# Code that generates harmless warnings
```

### Hide Code (Show Output Only)

```r
{r mod##-show-result-only, echo=FALSE}
# Students see output, not code
```

**Note:** These are internal presentation tools, not pedagogical content

---

## 10. Naming Conventions

### Variables (R objects)

**Preferred:** `snake_case`

```r
data_mahasiswa <- read.xlsx(...)
jarak_tempuh <- data$jarak
biaya_sepekan <- calculate_cost()
```

### Dataset Columns (from Excel)

**Common:** `dot.notation` (often inherited from Excel)

```r
data.ubl$Jenis.Kelamin
data.ubl$biaya.dalam.sepekan
```

### Consistency Rule

Pick one style per context and stick with it:

- R objects → `snake_case`
- Column names → `dot.notation`
- Never mix styles for same type

---

## 11. Quality Checklist

Before finalizing any module, verify:

- [ ] All chunks have `{r mod##-label}` format
- [ ] No duplicate chunk labels
- [ ] All dataset paths have `datasets/` prefix
- [ ] Using `|>` not `%>%`
- [ ] Libraries loaded at module start
- [ ] Follows 5-step pedagogical structure
- [ ] All comments in Bahasa Indonesia
- [ ] At least one `.rmdexercise` block
- [ ] Referenced capaian pembelajaran [STP-X.X]
- [ ] Tested: runs without errors
- [ ] Tested: `/build-html` succeeds

---

## 12. Common Mistakes to Avoid

### ❌ Duplicate Chunk Labels

```r
# Module 01
{r load-libraries}  # ← Duplicates Module 02!

# Module 02
{r load-libraries}  # ← PDF compilation fails!
```

**Fix:** `{r mod01-load-libraries}` and `{r mod02-load-libraries}`

### ❌ Missing datasets/ Prefix

```r
data <- read.csv2("data_mahasiswa.csv")  # Breaks portability
```

**Fix:** `read.csv2("datasets/data_mahasiswa.csv")`

### ❌ Using %>% Instead of |>

```r
data %>% filter(x > 5)  # Old style
```

**Fix:** `data |> filter(x > 5)`

### ❌ Mid-Module Library Load Without Explanation

```r
# [Some code]
library(corrplot)  # Why here? Confusing!
```

**Fix:** Add explanation or move to top

### ❌ English Comments

```r
# Load the dataset  # Wrong language!
```

**Fix:** `# Memuat dataset`

---

## References

- **Main Rule File:** `.agent/rules/pembuat-langkah.md`
- **Bookdown Standards:** `.agent/rules/r-bookdown-standards.md`
- **Skill Document:** `SKILL_RpracModuleWriter.md`

---

**Last Updated:** 2026-02-12  
**Version:** 1.0
