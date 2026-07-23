#' Calculate Sample Size for Proportion
#'
#' @param p Anticipated proportion (0 to 1). Default 0.5.
#' @param d Margin of error. Default 0.05.
#' @param conf_level Confidence level. Default 0.95.
#' @return Required sample size n.
#' @export
calc_sample_size <- function(p = 0.5, d = 0.05, conf_level = 0.95) {
  alpha <- 1 - conf_level
  z <- stats::qnorm(1 - alpha / 2)
  n <- (z^2 * p * (1 - p)) / (d^2)
  return(ceiling(n))
}

#' Stratified Neyman Allocation
#'
#' @param n Total sample size to allocate.
#' @param N_h Vector of stratum population sizes.
#' @param S_h Vector of stratum standard deviations.
#' @return Vector of allocated sample sizes n_h per stratum.
#' @export
stratified_allocation <- function(n, N_h, S_h) {
  denom <- sum(N_h * S_h)
  n_h <- round(n * (N_h * S_h) / denom)
  return(n_h)
}
