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
