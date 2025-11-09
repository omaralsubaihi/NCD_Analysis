# .Rprofile (project root)

# 1️⃣ Set CRAN mirror
options(repos = c(CRAN = "https://cloud.r-project.org"))

# 2️⃣ Activate renv
source("renv/activate.R")

# 3️⃣ Restore all packages (automatically installs anything missing)
renv::restore(confirm = FALSE)

# 4️⃣ Load ProjectTemplate
library(ProjectTemplate)
migrate.project()
load.project()
