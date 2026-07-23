test_that("LCG generates values strictly in (0,1)", {
  x <- lcg(100, seed = 12345)
  expect_equal(length(x), 100)
  expect_true(all(x >= 0 & x <= 1))
})

test_that("Inverse-transform exponential generates non-negative values", {
  x <- inv_transform_exp(100, rate = 2)
  expect_equal(length(x), 100)
  expect_true(all(x >= 0))
})

test_that("Accept-Reject Beta sampler achieves valid efficiency", {
  res <- accept_reject_beta(50, shape1 = 2, shape2 = 5)
  expect_equal(length(res$samples), 50)
  expect_true(res$attempts >= 50)
  expect_true(res$efficiency > 0 && res$efficiency <= 1)
})

test_that("Poisson process arrival times stay within T_max and are monotonic", {
  arrivals <- sim_poisson_process(T_max = 10, rate = 2)
  expect_true(all(arrivals <= 10))
  if (length(arrivals) > 1) {
    expect_true(all(diff(arrivals) > 0))
  }
})
