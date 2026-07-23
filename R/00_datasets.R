#' Electronic Health Records Cohort Dataset
#'
#' @format A data frame with 500 rows and 5 variables:
#' \describe{
#'   \item{patient_id}{Unique patient identifier}
#'   \item{age}{Patient age in years}
#'   \item{bmi}{Body Mass Index}
#'   \item{treatment}{Treatment group (A or B)}
#'   \item{outcome}{Binary health outcome (0 or 1)}
#' }
#' @export
ehr_cohort <- data.frame(
  patient_id = 1:500,
  age = round(c(55 + 12 * sin(1:500))),
  bmi = round(26 + 4 * cos(1:500), 1),
  treatment = rep(c("A", "B"), 250),
  outcome = c(rep(c(0, 1, 0, 1, 0), 100))
)

#' Financial Losses Tail-Risk Dataset
#'
#' Heavy-tailed financial return loss measurements for Importance Sampling.
#' @export
financial_losses <- abs(c(1:1000) / 50 + sin(1:1000) * 5)

#' Genomic Count Matrix Dataset
#'
#' Gene expression count matrix (50 genes x 20 samples) for Gibbs sampling.
#' @export
genomic_counts <- matrix(as.integer(abs(15 + 5 * sin(1:1000))), nrow = 50, ncol = 20)

#' Industrial Sensor Time Series Streams Dataset
#'
#' Cumulative event arrival times for Poisson process modeling.
#' @export
sensor_streams <- cumsum(abs(2 + sin(1:200)))
