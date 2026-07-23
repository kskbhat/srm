test_that("Datasets and dataset getter functions return valid structures", {
  df <- get_ehr_cohort()
  expect_equal(nrow(df), 500)
  expect_equal(ncol(df), 5)
  expect_equal(colnames(df), c("patient_id", "age", "bmi", "treatment", "outcome"))
  
  losses <- get_financial_losses()
  expect_equal(length(losses), 1000)
  expect_true(all(losses >= 0))
  
  counts <- get_genomic_counts()
  expect_equal(dim(counts), c(50, 20))
  
  streams <- get_sensor_streams()
  expect_equal(length(streams), 200)
  expect_true(all(diff(streams) >= 0))
  
  expect_equal(nrow(ehr_cohort), 500)
  expect_equal(length(financial_losses), 1000)
  expect_equal(dim(genomic_counts), c(50, 20))
  expect_equal(length(sensor_streams), 200)
})
