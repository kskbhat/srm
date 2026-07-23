# srm: Interactive R Tutorials for Statistical Research Methodology

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

**`srm`** is an interactive, open-source R package for learning **Statistical Research Methodology (DDS 6106)**. Designed around an **Intuition-First 10-Step Pedagogical Model**, this package provides bite-sized, interactive `learnr` tutorials, real-world datasets, animated diagnostics, predict-and-run checkpoints, and formal mathematical proofs.

---

## 🚀 Installation

You can install the development version of `srm` directly from GitHub in R/RStudio:

```r
if (!requireNamespace("remotes", quietly = TRUE)) {
  install.packages("remotes")
}
remotes::install_github("kskbhat/srm")
```

---

## 🗺️ Guided Learning Tracks & Available Tutorials

Tutorials are organized into three clear learning tracks depending on your background:

### 🟢 Track 1: Essentials (Foundation & Sampling)
```r
library(srm)

# 1. Sampling Designs & Power Calculations (⏱️ 12 min)
learnr::run_tutorial("sampling_designs", package = "srm")

# 2. Linear Congruential Generators (⏱️ 10 min)
learnr::run_tutorial("lcg_simulation", package = "srm")

# 3. Inverse-Transform Method (⏱️ 15 min)
learnr::run_tutorial("inverse_transform", package = "srm")

# 4. Raw Monte Carlo Integration (⏱️ 12 min)
learnr::run_tutorial("raw_monte_carlo", package = "srm")

# 5. Non-Parametric Bootstrap (⏱️ 15 min)
learnr::run_tutorial("bootstrap", package = "srm")
```

### 🟡 Track 2: Intermediate (Simulation & Variance Reduction)
```r
# 6. Accept-Reject Sampling (⏱️ 15 min)
learnr::run_tutorial("accept_reject", package = "srm")

# 7. Poisson Processes & Arrival Times (⏱️ 12 min)
learnr::run_tutorial("poisson_process", package = "srm")

# 8. Empirical CDF & Influence Functions (⏱️ 15 min)
learnr::run_tutorial("empirical_cdf", package = "srm")

# 9. Control Variates Variance Reduction (⏱️ 15 min)
learnr::run_tutorial("control_variates", package = "srm")

# 10. Antithetic Variates (⏱️ 12 min)
learnr::run_tutorial("antithetic_variates", package = "srm")

# 11. Importance Sampling for Rare Events (⏱️ 18 min)
learnr::run_tutorial("importance_sampling", package = "srm")

# 12. Jackknife Bias Estimation (⏱️ 12 min)
learnr::run_tutorial("jackknife", package = "srm")
```

### 🔴 Track 3: Advanced (MCMC & Stochastic Optimization)
```r
# 13. Metropolis-Hastings Algorithm (⏱️ 20 min)
learnr::run_tutorial("metropolis_hastings", package = "srm")

# 14. Gibbs Sampling (⏱️ 20 min)
learnr::run_tutorial("gibbs_sampling", package = "srm")

# 15. Bayesian MCMC Modeling (⏱️ 20 min)
learnr::run_tutorial("bayesian_mcmc", package = "srm")

# 16. 2D Ising Lattice Model (⏱️ 15 min)
learnr::run_tutorial("ising_model", package = "srm")

# 17. Coupling From The Past (CFTP) (⏱️ 15 min)
learnr::run_tutorial("cftp_sampling", package = "srm")

# 18. Score Function Gradient Estimator (⏱️ 18 min)
learnr::run_tutorial("score_gradient", package = "srm")

# 19. Robbins-Monro Stochastic Approximation (⏱️ 15 min)
learnr::run_tutorial("robbins_monro", package = "srm")

# 20. Multi-Level Splitting (⏱️ 18 min)
learnr::run_tutorial("multilevel_splitting", package = "srm")

# 21. Adaptive Metropolis (⏱️ 20 min)
learnr::run_tutorial("adaptive_mcmc", package = "srm")
```

---

## 📊 Teaching Datasets

The package includes four real-world teaching datasets:
- **`ehr_cohort`**: Observational electronic health records for sampling & Bayesian modeling.
- **`financial_losses`**: Heavy-tailed return data for Importance Sampling.
- **`genomic_counts`**: Gene expression count data for Gibbs sampling.
- **`sensor_streams`**: Industrial sensor time series data for Poisson process modeling.

---

## 📜 Author & License

Developed by **Dr. Shrikrishna Bhat K**  
Assistant Professor, Prasanna School of Public Health,  
Manipal Academy of Higher Education (MAHE), Manipal, India.

Licensed under the **GPL-3 License**.
