# Dockerizing Your R Lab Session: A Step-by-Step Guide

This guide will help you create a consistent R environment using Docker, ensuring that all students have the exact same setup for your lab sessions, eliminating "it works on my machine" issues.

### Phase 1: Understanding the Concept

Think of Docker as shipping a "virtual computer" to your students. Instead of them installing R, RStudio, and packages one by one (and facing OS-specific errors), you give them a box that already has everything installed exactly how you want it.

*   **The Image:** This is the "blueprint" or the frozen state of the computer (R version X, Packages Y and Z installed).
*   **The Container:** This is the running instance. When a student runs the image, they get a container.
*   **The Volume:** This is the bridge between their real computer and the container. It allows them to edit files on their laptop using the RStudio running inside Docker.

### Phase 2: Drafting the Dockerfile

You need a text file named `Dockerfile` (no extension). This file tells Docker how to build your lab environment.

Based on your files (`01-praktikum-1-pengenalan.Rmd`), your students need **tidyverse**, **openxlsx**, and **bookdown**.

Here is the recommended `Dockerfile` content:

```dockerfile
# 1. Base Image: We start with a pre-made image from the "Rocker" project.
# 'rocker/tidyverse' already includes R, RStudio Server, and the entire tidyverse suite.
# We use a specific version tag (e.g., 4.3.1) to ensure it never changes in the future.
FROM rocker/tidyverse:4.3.1

# 2. Install System Dependencies (Linux libraries)
# Some R packages require specific Linux tools to be installed first.
# 'openxlsx' usually works fine, but if you add spatial packages later, you'd add libraries here.
# libglpk-dev is a common dependency for some R packages, included here as an example.
RUN apt-get update && apt-get install -y \
    libglpk-dev \
    && rm -rf /var/lib/apt/lists/*

# 3. Install R Packages
# We use 'install2.r', a helper script included in Rocker images, to install packages.
# It fails if installation fails (--error) so you know immediately if something is wrong.
# bookdown and rmarkdown are added here for completeness, as you are working with Rmd files.
RUN install2.r --error \
    openxlsx \
    bookdown \
    rmarkdown \
    && rm -rf /tmp/downloaded_packages
```

**How to create this file:**
Save the content above into a file named `Dockerfile` in the root of your project directory (`C:\Users\LENOVO\OneDrive - Institut Teknologi Sumatera\PL25-12001 Statistika Untuk Perencanaan\Praktikum 2026\`).

### Phase 3: Building the Image

Once you have that `Dockerfile` in your project folder, you need to "build" the Docker image. This process downloads the base layers and installs your specified R packages.

1.  **Open your terminal** (PowerShell or Command Prompt).
2.  **Navigate to your project directory**:
    ```powershell
    cd "C:\Users\LENOVO\OneDrive - Institut Teknologi Sumatera\PL25-12001 Statistika Untuk Perencanaan\Praktikum 2026\"
    ```
3.  **Run the build command**:
    ```powershell
    docker build -t r-lab-2026 .
    ```
    *   `-t r-lab-2026`: Tags (names) your image "r-lab-2026". You can choose any name you like.
    *   `.`: Tells Docker to look for the `Dockerfile` in the *current directory*.

This command will take some time the first time you run it, as it needs to download the base image and install R packages.

### Phase 4: Running the Lab Session (The Student Experience)

This is the command your students would use to start their RStudio environment. It's best to simplify this using Docker Compose.

#### Option A: Running with `docker run` (More verbose for students)

```powershell
docker run --rm -p 8787:8787 -e PASSWORD=mypassword -v ${PWD}:/home/rstudio/project r-lab-2026
```

**Breakdown of the command:**
*   `--rm`: Automatically removes the container when it stops. This keeps their system clean.
*   `-p 8787:8787`: Maps port 8787 on your student's machine to port 8787 inside the container. This is where RStudio Server runs. Students will access RStudio by opening their web browser and navigating to `http://localhost:8787`.
*   `-e PASSWORD=mypassword`: Sets the login password for the default `rstudio` user inside the container. You can set this to anything you want (e.g., `gemini`).
*   `-v ${PWD}:/home/rstudio/project`: **Crucial Step.** This creates a "volume mount". It maps the current folder on their Windows laptop (represented by `${PWD}` which expands to the current directory) to the `/home/rstudio/project` folder inside the Docker container.
    *   *Result:* Any files (like `.Rmd` files, data files, or plots) that they create or save within RStudio in the `/home/rstudio/project` directory inside the container will instantly appear in their local project folder on their Windows machine. Similarly, any files you place in the project folder will be accessible within RStudio.

#### Option B: Running with `docker compose` (Recommended for simplicity)

This option is much simpler for students. You provide them with an additional file, `docker-compose.yml`.

**`docker-compose.yml` content:**

```yaml
version: '3.8' # Use a recent Docker Compose version
services:
  rstudio:
    image: r-lab-2026 # The name of the image you built
    container_name: r_lab_session # A memorable name for the running container
    ports:
      - "8787:8787" # Maps port 8787 on the host to 8787 in the container
    environment:
      - PASSWORD=gemini  # Set a simple, consistent password for everyone
    volumes:
      - .:/home/rstudio/project # Mounts the current directory to the project folder in RStudio
```

**How to create this file:**
Save the content above into a file named `docker-compose.yml` in the root of your project directory, alongside your `Dockerfile`.

**Student instructions for Docker Compose:**
1.  Make sure they have **Docker Desktop** installed and running.
2.  Open their terminal, navigate to the lab project folder.
3.  Run: `docker compose up` (or `docker-compose up` on older Docker versions).
4.  Open a web browser and go to `http://localhost:8787`.
5.  Login with username `rstudio` and the password you set (e.g., `gemini`).
6.  To stop the lab session, they can press `Ctrl+C` in their terminal.

### Phase 5: Tips for a Smooth Semester

1.  **Pre-build and Push to Docker Hub (Recommended for distribution):**
    Building the image can take significant time (10-20 minutes, depending on internet speed and computer specs). Instead of having every student build it, you can:
    *   Build the image once on your machine: `docker build -t yourdockerhubusername/r-lab-2026:1.0 .` (Replace `yourdockerhubusername` with your actual Docker Hub ID and `1.0` with a version number).
    *   Log in to Docker Hub: `docker login`
    *   Push your image to Docker Hub: `docker push yourdockerhubusername/r-lab-2026:1.0`
    *   Students then only need to run: `docker run --rm -p 8787:8787 -e PASSWORD=gemini -v ${PWD}:/home/rstudio/project yourdockerhubusername/r-lab-2026:1.0` (or update the `image` field in `docker-compose.yml` to `yourdockerhubusername/r-lab-2026:1.0` and tell them to run `docker compose up`). This will download the pre-built image, which is much faster.

2.  **Lock R/Package Versions:**
    In your `Dockerfile`, always use specific version tags for your base image (e.g., `FROM rocker/tidyverse:4.3.1`). Avoid `latest` to ensure reproducibility across semesters and prevent unexpected changes when new versions are released.

3.  **Lab Content Organization:**
    Place all your lab materials (RMarkdown files, data files, images) in the same directory as your `Dockerfile` and `docker-compose.yml`. Thanks to the volume mount, these will be immediately available to students in their RStudio environment.

4.  **Student Prerequisites:**
    Students will need to install Docker Desktop (available for Windows, macOS, and Linux) on their machines before the lab session. Provide clear instructions for this.

This structured approach will greatly enhance the consistency and ease of your R lab sessions.
