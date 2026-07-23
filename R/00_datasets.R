#' Electronic Health Records Cohort Dataset Getter
#'
#' @return A data frame with 500 rows and 5 variables.
#' @export
get_ehr_cohort <- function() {
  data.frame(
    patient_id = 1:500,
    age = round(c(55 + 12 * sin(1:500))),
    bmi = round(26 + 4 * cos(1:500), 1),
    treatment = rep(c("A", "B"), 250),
    outcome = c(rep(c(0, 1, 0, 1, 0), 100))
  )
}

#' Financial Losses Tail-Risk Dataset Getter
#'
#' @return Numeric vector of loss measurements.
#' @export
get_financial_losses <- function() {
  abs(c(1:1000) / 50 + sin(1:1000) * 5)
}

#' Genomic Count Matrix Dataset Getter
#'
#' @return Matrix of gene expression counts (50 x 20).
#' @export
get_genomic_counts <- function() {
  matrix(as.integer(abs(15 + 5 * sin(1:1000))), nrow = 50, ncol = 20)
}

#' Industrial Sensor Time Series Streams Dataset Getter
#'
#' @return Numeric vector of cumulative arrival times.
#' @export
get_sensor_streams <- function() {
  cumsum(abs(2 + sin(1:200)))
}

#' Electronic Health Records Cohort Dataset
#' @export
ehr_cohort <- get_ehr_cohort()

#' Financial Losses Tail-Risk Dataset
#' @export
financial_losses <- get_financial_losses()

#' Genomic Count Matrix Dataset
#' @export
genomic_counts <- get_genomic_counts()

#' Industrial Sensor Time Series Streams Dataset
#' @export
sensor_streams <- get_sensor_streams()
