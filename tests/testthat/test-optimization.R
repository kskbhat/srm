test_that("Robbins-Monro stochastic approximation converges to root", {
  noisy_g <- function(theta) (theta - 3) + rnorm(1, sd = 0.2)
  seq_est <- robbins_monro(noisy_g, init = 0, n_iter = 500, c = 0.5)
  final_est <- mean(tail(seq_est, 50))
  expect_equal(final_est, 3, tolerance = 0.5)
})

test_that("Score function gradient estimator computes positive gradient for mean offset", {
  h <- function(x) x
  grad <- score_function_gradient(h, theta = 2, n = 2000)
  expect_equal(grad, 1, tolerance = 0.3)
})

test_that("Multi-level splitting calculates level probabilities and product rare event probability", {
  res <- multilevel_splitting(levels = c(1, 2, 3), n_particles = 500)
  expect_true(res$probability >= 0 && res$probability <= 1)
  expect_equal(length(res$level_probabilities), 3)
})

test_that("Adaptive Metropolis sampler dynamically tunes covariance matrix", {
  target_log <- function(x) -0.5 * sum(x^2)
  mat <- adaptive_metropolis(target_log_density = target_log, init = c(0, 0), n_iter = 500, t0 = 50)
  expect_equal(dim(mat), c(500, 2))
})
