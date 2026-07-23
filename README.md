<div align="center">

# 📦 srm — Interactive R Tutorials

**Tutorial Package for Statistical Research Methodology**

[![Install from GitHub](https://img.shields.io/badge/📦_R_Package-Install_from_GitHub-2ea44f?style=for-the-badge)](https://github.com/kskbhat/srm)
[![Course Notes](https://img.shields.io/badge/📖_Course_Notes-Open_Bookdown-blue?style=for-the-badge)](https://kskbhat.github.io/Teaching/srm)
[![R-CMD-check](https://github.com/kskbhat/srm/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/kskbhat/srm/actions/workflows/R-CMD-check.yaml)
[![codecov](https://codecov.io/gh/kskbhat/srm/branch/main/graph/badge.svg)](https://codecov.io/gh/kskbhat/srm)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg?style=for-the-badge)](https://www.gnu.org/licenses/gpl-3.0)

</div>

---

This R package contains interactive `learnr` tutorials for **Statistical Research Methodology (DDS 6106)**. Designed around an **Intuition-First 10-Step Pedagogical Model**, each algorithm is presented as a short, bite-sized interactive module featuring real-world storytelling, parameter playgrounds, visual diagnostics, predict-first checkpoints, and automated feedback via `gradethis`.

---

## 🖥️ Quick Start

### Step 1: Install the Package

```r
# Install remotes if you haven't already
if (!requireNamespace("remotes", quietly = TRUE)) {
  install.packages("remotes")
}

# Install the srm package directly from GitHub
remotes::install_github("kskbhat/srm")
```

---

### Step 2: Run a Tutorial

**Method A — R Console (Recommended)**

```r
library(srm)

# 🟢 Track 1: Essentials (Foundation & Sampling)
learnr::run_tutorial("sampling_designs", package = "srm")
learnr::run_tutorial("lcg_simulation", package = "srm")
learnr::run_tutorial("inverse_transform", package = "srm")
learnr::run_tutorial("raw_monte_carlo", package = "srm")
learnr::run_tutorial("bootstrap", package = "srm")

# 🟡 Track 2: Intermediate (Simulation & Variance Reduction)
learnr::run_tutorial("accept_reject", package = "srm")
learnr::run_tutorial("poisson_process", package = "srm")
learnr::run_tutorial("empirical_cdf", package = "srm")
learnr::run_tutorial("control_variates", package = "srm")
learnr::run_tutorial("antithetic_variates", package = "srm")
learnr::run_tutorial("importance_sampling", package = "srm")
learnr::run_tutorial("jackknife", package = "srm")

# 🔴 Track 3: Advanced (MCMC & Stochastic Optimization)
learnr::run_tutorial("metropolis_hastings", package = "srm")
learnr::run_tutorial("gibbs_sampling", package = "srm")
learnr::run_tutorial("bayesian_mcmc", package = "srm")
learnr::run_tutorial("ising_model", package = "srm")
learnr::run_tutorial("cftp_sampling", package = "srm")
learnr::run_tutorial("score_gradient", package = "srm")
learnr::run_tutorial("robbins_monro", package = "srm")
learnr::run_tutorial("multilevel_splitting", package = "srm")
learnr::run_tutorial("adaptive_mcmc", package = "srm")
```

**Method B — RStudio Tutorials Pane**

1. Open RStudio.
2. In the top-right pane, navigate to the **Tutorial** tab (next to Environment / History).
3. Scroll down to find the **srm** section.
4. Click the **Start Tutorial** button next to any module.

---

## 📘 Tutorial Coverage & Learning Tracks

| Tutorial Module | Track | Est. Time | Topics & Algorithm Covered |
|:---|:--:|:--:|:---|
| `sampling_designs` | 🟢 Essentials | ⏱️ 12 min | Sample Size Formulas, Neyman Stratified Allocation, CONSORT/STROBE Flowcharts |
| `lcg_simulation` | 🟢 Essentials | ⏱️ 10 min | Linear Congruential Generators, Hull-Dobell Theorem, 2D/3D Lattice Patterns |
| `inverse_transform` | 🟢 Essentials | ⏱️ 15 min | Inverse CDF Transformation $X = F^{-1}(U)$, Exponential, Pareto & Weibull Generators |
| `raw_monte_carlo` | 🟢 Essentials | ⏱️ 12 min | Raw Monte Carlo Integration, Standard Error Bounds $\mathcal{O}(N^{-1/2})$, Confidence Bands |
| `bootstrap` | 🟢 Essentials | ⏱️ 15 min | Non-Parametric Bootstrap Resampling, Percentile & BCa Confidence Intervals |
| `accept_reject` | 🟡 Intermediate | ⏱️ 15 min | Envelope Bounding $c \cdot g(x)$, Acceptance Efficiency $1/c$, Accepted/Rejected Scatterplots |
| `poisson_process` | 🟡 Intermediate | ⏱️ 12 min | Homogeneous/Non-Homogeneous Poisson Processes, Exponential Inter-Arrival Times |
| `empirical_cdf` | 🟡 Intermediate | ⏱️ 15 min | Empirical Distribution Function $F_n(x)$, Influence Functions, Glivenko-Cantelli Bounds |
| `control_variates` | 🟡 Intermediate | ⏱️ 15 min | Optimal Control Coefficient $c^*$, Variance Reduction Ratio $1 - \rho^2$ |
| `antithetic_variates` | 🟡 Intermediate | ⏱️ 12 min | Negative Covariance Pairing $\text{Cov}(U, 1-U) < 0$, Mirror Sampling |
| `importance_sampling` | 🟡 Intermediate | ⏱️ 18 min | Likelihood Ratios $w(x) = f(x)/g(x)$, Optimal Proposal $g^*(x)$, Rare-Event Tail Risks |
| `jackknife` | 🟡 Intermediate | ⏱️ 12 min | Leave-One-Out Bias Estimation & Jackknife Standard Error Calculation |
| `metropolis_hastings` | 🔴 Advanced | ⏱️ 20 min | Candidate Moves, Acceptance Ratio $\alpha(x,y)$, Random-Walk Tuning, Green/Red Trace Plots |
| `gibbs_sampling` | 🔴 Advanced | ⏱️ 20 min | Full Conditional Updates $\pi(x_i \mid x_{-i})$, Bivariate Normal Gibbs Sampler |
| `bayesian_mcmc` | 🔴 Advanced | ⏱️ 20 min | Prior/Likelihood Posterior Updating, Gelman-Rubin $\hat{R}$ Diagnostics |
| `ising_model` | 🔴 Advanced | ⏱️ 15 min | 2D Spin Grids, Energy Hamiltonian $H(\sigma)$, Inverse Temperature $\beta$ Phase Diagrams |
| `cftp_sampling` | 🔴 Advanced | ⏱️ 15 min | Coupling From The Past, Monotonic Chain Coalescence, Exact Un-biased Sampling |
| `score_gradient` | 🔴 Advanced | ⏱️ 18 min | Score Function / Likelihood Ratio Method, Policy Gradient Log-Derivative Trick |
| `robbins_monro` | 🔴 Advanced | ⏱️ 15 min | Stochastic Approximation Root-Finding, Step Size Decay Sequences $a_n = c/n$ |
| `multilevel_splitting` | 🔴 Advanced | ⏱️ 18 min | Intermediate Level Thresholds, Rare Event Probability Products $P(A) = \prod P(A_k \mid A_{k-1})$ |
| `adaptive_mcmc` | 🔴 Advanced | ⏱️ 20 min | Haario Adaptive Metropolis, Dynamic Covariance Matrix Adaptation $\Sigma_n$ |

---

## 📊 Package Datasets

- **`ehr_cohort`**: Observational electronic health records for sampling & Bayesian modeling.
- **`financial_losses`**: Heavy-tailed return data for Importance Sampling.
- **`genomic_counts`**: Gene expression count matrix for Gibbs sampling.
- **`sensor_streams`**: Industrial sensor time series data for Poisson process modeling.

---

## 📚 Official References

1. Robert CP, Casella G (2004). *Monte Carlo statistical methods*. 2nd ed. Springer.
2. Asmussen S, Glynn PW (2007). *Stochastic simulation: algorithms and analysis*. Springer.
3. Rubinstein RY, Kroese DP (2016). *Simulation and the Monte Carlo method*. 3rd ed. Wiley.
4. Efron B, Tibshirani RJ (1993). *An introduction to the bootstrap*. Chapman & Hall/CRC.
5. Gelman A, Carlin JB, Stern HS, Dunson DB, Vehtari A, Rubin DB (2013). *Bayesian data analysis*. 3rd ed. CRC Press.
6. Brooks S, Gelman A, Jones G, Meng XL (2011). *Handbook of Markov Chain Monte Carlo*. CRC Press.
7. Glasserman P (2004). *Monte Carlo methods in financial engineering*. Springer.
