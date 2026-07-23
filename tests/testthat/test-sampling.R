test_that("Sample size calculation for proportion computes exact ceiling n", {
  n1 <- calc_sample_size(p = 0.5, d = 0.05, conf_level = 0.95)
  expect_equal(n1, 385)
  
  n2 <- calc_sample_size(p = 0.2, d = 0.03, conf_level = 0.99)
  expect_true(n2 > n1)
})

test_that("Stratified Neyman allocation distributes samples proportionally to N_h * S_h", {
  n_total <- 100
  N_h <- c(1000, 2000, 3000)
  S_h <- c(2, 4, 6)
  
  alloc <- stratified_allocation(n = n_total, N_h = N_h, S_h = S_h)
  expect_equal(sum(alloc), n_total)
  expect_true(alloc[3] > alloc[2] && alloc[2] > alloc[1])
})
