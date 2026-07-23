#' Linear Congruential Generator (LCG)
#'
#' @param n Number of pseudo-random numbers to generate.
#' @param seed Initial seed value. Default 12345.
#' @param a Multiplier. Default 1103515245.
#' @param c Increment. Default 12345.
#' @param m Modulus. Default 2^31.
#' @return Numeric vector of pseudo-random numbers in (0, 1).
#' @export
lcg <- function(n, seed = 12345, a = 1103515245, c = 12345, m = 2^31) {
  x <- numeric(n)
  current <- seed
  for (i in 1:n) {
    current <- (a * current + c) %% m
    x[i] <- current / m
  }
  return(x)
}

#' Inverse-Transform Exponential Generator
#'
#' @param n Sample size.
#' @param rate Rate parameter lambda > 0. Default 1.
#' @return Sample from Exp(rate).
#' @export
inv_transform_exp <- function(n, rate = 1) {
  u <- stats::runif(n)
  return(-log(1 - u) / rate)
}

#' Accept-Reject Beta Sampler
#'
#' @param n Target number of accepted samples.
#' @param shape1 Alpha parameter > 0.
#' @param shape2 Beta parameter > 0.
#' @return List containing accepted samples, total attempts, and acceptance efficiency.
#' @export
accept_reject_beta <- function(n, shape1 = 2, shape2 = 5) {
  mode_val <- (shape1 - 1) / (shape1 + shape2 - 2)
  c_val <- stats::dbeta(mode_val, shape1, shape2)
  
  samples <- numeric(n)
  count <- 0
  attempts <- 0
  
  while (count < n) {
    attempts <- attempts + 1
    y <- stats::runif(1)
    u <- stats::runif(1)
    if (u <= stats::dbeta(y, shape1, shape2) / c_val) {
      count <- count + 1
      samples[count] <- y
    }
  }
  
  return(list(
    samples = samples,
    attempts = attempts,
    efficiency = n / attempts
  ))
}

#' Homogeneous Poisson Process Arrival Times
#'
#' @param T_max Maximum time horizon.
#' @param rate Constant arrival rate lambda > 0.
#' @return Vector of event arrival times.
#' @export
sim_poisson_process <- function(T_max = 10, rate = 2) {
  arrival_times <- c()
  current_time <- 0
  while (current_time < T_max) {
    dt <- inv_transform_exp(1, rate = rate)
    current_time <- current_time + dt
    if (current_time <= T_max) {
      arrival_times <- c(arrival_times, current_time)
    }
  }
  return(arrival_times)
}
