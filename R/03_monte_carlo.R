#' Raw Monte Carlo Integration
#'
#' @param g Function to integrate.
#' @param n Number of samples.
#' @param a Lower integration bound. Default 0.
#' @param b Upper integration bound. Default 1.
#' @return List containing estimate, standard error, and confidence interval.
#' @export
mc_integrate <- function(g, n = 10000, a = 0, b = 1) {
  u <- stats::runif(n, min = a, max = b)
  evals <- (b - a) * g(u)
  est <- mean(evals)
  se <- stats::sd(evals) / sqrt(n)
  return(list(
    estimate = est,
    se = se,
    ci = c(est - 1.96 * se, est + 1.96 * se)
  ))
}

#' Control Variates Variance Reduction
#'
#' @param g Function to integrate (target).
#' @param h Control variate function with known mean mu_h.
#' @param mu_h Known expectation E[h(X)].
#' @param n Sample size.
#' @return List containing control variate estimate and variance reduction ratio.
#' @export
control_variates <- function(g, h, mu_h, n = 10000) {
  u <- stats::runif(n)
  g_val <- g(u)
  h_val <- h(u)
  
  c_star <- - stats::cov(g_val, h_val) / stats::var(h_val)
  g_cv <- g_val + c_star * (h_val - mu_h)
  
  var_raw <- stats::var(g_val)
  var_cv <- stats::var(g_cv)
  
  return(list(
    estimate = mean(g_cv),
    se = stats::sd(g_cv) / sqrt(n),
    c_star = c_star,
    var_reduction = 1 - (var_cv / var_raw)
  ))
}

#' Antithetic Variates Integration
#'
#' @param g Function to integrate on (0,1).
#' @param n Sample size (even number of pairs).
#' @return List with antithetic estimate and variance reduction ratio.
#' @export
antithetic_mc <- function(g, n = 10000) {
  half_n <- n / 2
  u <- stats::runif(half_n)
  pair_evals <- (g(u) + g(1 - u)) / 2
  
  u_raw <- stats::runif(n)
  raw_evals <- g(u_raw)
  
  return(list(
    estimate = mean(pair_evals),
    se = stats::sd(pair_evals) / sqrt(half_n),
    var_reduction = 1 - (stats::var(pair_evals) / stats::var(raw_evals))
  ))
}

#' Importance Sampling Integrator
#'
#' @param h Target integrand function.
#' @param f Target density function.
#' @param g Proposal density function.
#' @param rg Random generator for proposal density g.
#' @param n Sample size.
#' @return List containing importance sampling estimate and weights.
#' @export
importance_sampling <- function(h, f, g, rg, n = 10000) {
  x <- rg(n)
  w <- f(x) / g(x)
  evals <- h(x) * w
  return(list(
    estimate = mean(evals),
    se = stats::sd(evals) / sqrt(n),
    weights = w
  ))
}

#' Non-Parametric Bootstrap Confidence Intervals
#'
#' @param data Numeric vector of data.
#' @param statistic Function taking data vector and returning scalar statistic.
#' @param R Number of bootstrap replicates. Default 1000.
#' @return List containing original statistic, bootstrap SE, and 95% percentile CI.
#' @export
bootstrap_ci <- function(data, statistic, R = 1000) {
  t0 <- statistic(data)
  n <- length(data)
  boot_stats <- numeric(R)
  for (i in 1:R) {
    boot_sample <- sample(data, size = n, replace = TRUE)
    boot_stats[i] <- statistic(boot_sample)
  }
  se <- stats::sd(boot_stats)
  ci <- stats::quantile(boot_stats, probs = c(0.025, 0.975))
  return(list(
    t0 = t0,
    se = se,
    ci = ci,
    boot_stats = boot_stats
  ))
}
