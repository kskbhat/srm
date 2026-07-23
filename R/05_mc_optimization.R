#' Score Function Gradient Estimator (Likelihood Ratio Method)
#'
#' @param h Loss or payoff function.
#' @param theta Parameter theta.
#' @param n Sample size.
#' @return Estimated gradient with respect to theta.
#' @export
score_function_gradient <- function(h, theta = 1, n = 5000) {
  # Gaussian model N(theta, 1)
  x <- stats::rnorm(n, mean = theta, sd = 1)
  score <- (x - theta) # d/d_theta ln f(x; theta)
  grad_est <- mean(h(x) * score)
  return(grad_est)
}

#' Robbins-Monro Stochastic Approximation Root Finder
#'
#' @param noisy_g Function computing noisy observation g(theta) + noise.
#' @param init Initial guess theta0.
#' @param n_iter Iterations.
#' @param c Scale constant for step size a_n = c / n.
#' @return Sequence of theta estimates over iterations.
#' @export
robbins_monro <- function(noisy_g, init = 0, n_iter = 1000, c = 1) {
  theta_seq <- numeric(n_iter)
  current <- init
  
  for (n in 1:n_iter) {
    step_size <- c / n
    g_obs <- noisy_g(current)
    current <- current - step_size * g_obs
    theta_seq[n] <- current
  }
  
  return(theta_seq)
}

#' Multi-Level Splitting Rare Event Estimator
#'
#' @param levels Threshold levels L1 < L2 < ... < Lm.
#' @param n_particles Number of simulation particles per level.
#' @return Estimated rare event probability.
#' @export
multilevel_splitting <- function(levels = c(2, 4, 6), n_particles = 1000) {
  prob_factors <- numeric(length(levels))
  
  current_states <- stats::rnorm(n_particles, mean = 0, sd = 1)
  
  for (k in 1:length(levels)) {
    threshold <- levels[k]
    survivors <- current_states[current_states >= threshold]
    prob_factors[k] <- length(survivors) / length(current_states)
    
    if (length(survivors) == 0) break
    
    # Resample survivors for next level
    current_states <- sample(survivors, size = n_particles, replace = TRUE) + stats::rnorm(n_particles, sd = 0.5)
  }
  
  rare_event_prob <- prod(prob_factors)
  return(list(
    probability = rare_event_prob,
    level_probabilities = prob_factors
  ))
}

#' Adaptive Metropolis Sampler (Haario et al.)
#'
#' @param target_log_density Target log-density function.
#' @param init Initial state vector.
#' @param n_iter Total iterations.
#' @param t0 Adaptation start iteration. Default 100.
#' @return Matrix of sampled iterations.
#' @export
adaptive_metropolis <- function(target_log_density, init = c(0, 0), n_iter = 3000, t0 = 100) {
  d <- length(init)
  mat <- matrix(0, nrow = n_iter, ncol = d)
  mat[1, ] <- init
  
  sd_factor <- (2.4^2) / d
  cov_matrix <- diag(0.1, d)
  
  for (t in 2:n_iter) {
    current <- mat[t - 1, ]
    
    if (t > t0) {
      cov_matrix <- sd_factor * (stats::cov(mat[1:(t - 1), , drop = FALSE]) + diag(1e-5, d))
    }
    
    candidate <- current + MASS::mvrnorm(1, mu = rep(0, d), Sigma = cov_matrix)
    
    log_alpha <- target_log_density(candidate) - target_log_density(current)
    if (log(stats::runif(1)) < log_alpha) {
      current <- candidate
    }
    mat[t, ] <- current
  }
  
  return(mat)
}
