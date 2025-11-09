# ------------------------------------------------------------
# Project-level .Rprofile (cross-platform, fully automatic)
# ------------------------------------------------------------

# 1️⃣ Set default CRAN mirror (for installs without prompts)
options(repos = c(CRAN = "https://cloud.r-project.org"))

# 2️⃣ Activate renv if present
if (file.exists("renv/activate.R")) {
  source("renv/activate.R")
  
  # 3️⃣ Automatically restore the environment if needed
  if (!all(renv::status()$state == "consistent")) {
    message("* Restoring project library via renv...")
    renv::restore(confirm = FALSE)
  }
  
  # 4️⃣ Automatically load ProjectTemplate if available
  if (requireNamespace("ProjectTemplate", quietly = TRUE)) {
    message("* Loading ProjectTemplate project...")
    ProjectTemplate::load.project()
  }
}
