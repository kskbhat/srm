test_that("Raw Monte Carlo integrates x^2 on (0,1) accurately", {
  res <- mc_integrate(function(x) x^2, n = 10000, a = 0, b = 1)
  expect_equal(res$estimate, 1/3, tolerance = 0.05)
})

test_that("Control variates achieves positive variance reduction", {
  res <- control_variates(g = function(x) exp(x), h = function(x) x, mu_h = 0.5, n = 5000)
  expect_true(res$var_reduction > 0)
})

test_that("Antithetic variates achieves positive variance reduction for monotonic functions", {
  res <- antithetic_mc(g = function(x) exp(x), n = 5000)
  expect_true(res$var_reduction > 0)
})

test_that("Bootstrap SE computation works as expected", {
  res <- bootstrap_ci(c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10), statistic = mean, R = 200)
  expect_equal(res$t0, 5.5)
  expect_true(res$se > 0)
})
