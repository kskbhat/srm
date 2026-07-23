#' Metropolis-Hastings Sampler
#'
#' @param target_log_density Function computing log pi(x).
#' @param init Initial state x0.
#' @param n_iter Number of iterations.
#' @param proposal_sd Proposal standard deviation for Gaussian random walk.
#' @return List containing MCMC chain, acceptance rate, and accepted status per step.
#' @export
metropolis_hastings <- function(target_log_density, init = 0, n_iter = 5000, proposal_sd = 1) {
  chain <- numeric(n_iter)
  accepted <- logical(n_iter)
  current <- init
  
  for (i in 1:n_iter) {
    candidate <- stats::rnorm(1, mean = current, sd = proposal_sd)
    log_alpha <- target_log_density(candidate) - target_log_density(current)
    
    if (log(stats::runif(1)) < log_alpha) {
      current <- candidate
      accepted[i] <- TRUE
    }
    chain[i] <- current
  }
  
  return(list(
    chain = chain,
    acceptance_rate = mean(accepted),
    accepted = accepted
  ))
}

#' Bivariate Normal Gibbs Sampler
#'
#' @param n_iter Number of iterations.
#' @param rho Correlation coefficient (-1 < rho < 1).
#' @return Matrix of sampled (x, y) coordinates.
#' @export
gibbs_sampler <- function(n_iter = 5000, rho = 0.8) {
  mat <- matrix(0, nrow = n_iter, ncol = 2)
  colnames(mat) <- c("X", "Y")
  x <- 0
  y <- 0
  
  for (i in 1:n_iter) {
    x <- stats::rnorm(1, mean = rho * y, sd = sqrt(1 - rho^2))
    y <- stats::rnorm(1, mean = rho * x, sd = sqrt(1 - rho^2))
    mat[i, ] <- c(x, y)
  }
  
  return(mat)
}

#' 2D Ising Lattice Metropolis Model
#'
#' @param size Grid dimensions (size x size). Default 10.
#' @param beta Inverse temperature parameter (beta = 1 / T).
#' @param n_steps Number of spin update attempts.
#' @return Matrix representing final lattice spin states (-1 or +1).
#' @export
ising_simulation <- function(size = 10, beta = 0.44, n_steps = 10000) {
  grid <- matrix(sample(c(-1, 1), size * size, replace = TRUE), nrow = size, ncol = size)
  
  for (step in 1:n_steps) {
    i <- sample(1:size, 1)
    j <- sample(1:size, 1)
    
    # Periodic boundary conditions
    top <- grid[ifelse(i == 1, size, i - 1), j]
    bottom <- grid[ifelse(i == size, 1, i + 1), j]
    left <- grid[i, ifelse(j == 1, size, j - 1)]
    right <- grid[i, ifelse(j == size, 1, j + 1)]
    
    neighbors_sum <- top + bottom + left + right
    dE <- 2 * grid[i, j] * neighbors_sum
    
    if (dE <= 0 || stats::runif(1) < exp(-beta * dE)) {
      grid[i, j] <- -grid[i, j]
    }
  }
  
  return(grid)
}

#' Coupling From The Past (CFTP) Monotonic Sampler
#'
#' @param max_lookback Maximum backward horizon steps. Default 100.
#' @return Coalesced state value.
#' @export
cftp_perfect_sampler <- function(max_lookback = 100) {
  # Simple 1D monotonic state space {0, 1} exact sampler
  t_back <- 1
  coalesced <- FALSE
  final_state <- NA
  
  while (!coalesced && t_back <= max_lookback) {
    u_randoms <- stats::runif(t_back)
    
    state_low <- 0
    state_high <- 1
    
    for (step in 1:t_back) {
      u <- u_randoms[step]
      state_low <- ifelse(u < 0.5, max(0, state_low - 1), min(1, state_low + 1))
      state_high <- ifelse(u < 0.5, max(0, state_high - 1), min(1, state_high + 1))
    }
    
    if (state_low == state_high) {
      coalesced <- TRUE
      final_state <- state_low
    } else {
      t_back <- t_back * 2
    }
  }
  
  return(list(
    coalesced = coalesced,
    lookback_time = t_back,
    exact_sample = final_state
  ))
}
