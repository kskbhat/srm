test_that("Metropolis-Hastings samples standard normal target density", {
  res <- metropolis_hastings(target_log_density = function(x) dnorm(x, log = TRUE), init = 0, n_iter = 3000)
  expect_equal(mean(res$chain[1000:3000]), 0, tolerance = 0.3)
  expect_true(res$acceptance_rate > 0.1 && res$acceptance_rate < 0.9)
})

test_that("Gibbs sampler generates bivariate normal correlation accurately", {
  mat <- gibbs_sampler(n_iter = 3000, rho = 0.7)
  sampled_cor <- cor(mat[1000:3000, "X"], mat[1000:3000, "Y"])
  expect_equal(sampled_cor, 0.7, tolerance = 0.1)
})

test_that("2D Ising model grid returns valid spin dimensions", {
  grid <- ising_simulation(size = 8, beta = 0.44, n_steps = 1000)
  expect_equal(dim(grid), c(8, 8))
  expect_true(all(grid %in% c(-1, 1)))
})
