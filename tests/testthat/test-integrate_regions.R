test_that("integrate_regions() returns the expected values", {
  file <- list.files(
    path = system.file("extdata", package = "cwrshelpr"),
    full.names = TRUE,
    pattern = ".+\\.csv"
  )
  feem <- read_feem(file[1], truncate = TRUE)
  expect_equal(
    integrate_regions(feem)$integrated,
    c(46.09631, 261.26285, 2687.21236, 827.17278, 14921.11398, 24146.94553)
  )
})
