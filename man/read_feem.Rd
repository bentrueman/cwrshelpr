% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/read_feem.R
\name{read_feem}
\alias{read_feem}
\title{Read FEEM data files generated by the Horiba Aqualog}
\usage{
read_feem(path, truncate = FALSE)
}
\arguments{
\item{path}{Path to stored FEEM data files}

\item{truncate}{Set negative intensities to zero?}
}
\value{
A tibble with columns \code{emission}, \code{em_regular}, \code{excitation}, and \code{intensity}.
\code{em_regular} is a regularly-spaced version of \code{emission} that is useful for plotting.
}
\description{
Read FEEM data files generated by the Horiba Aqualog
}
\examples{
file <- list.files(
   path = system.file("extdata", package = "cwrshelpr"),
   full.names = TRUE,
   pattern = ".+\\\\.csv"
)
read_feem(file[1])
}
