test_that("integrate_regions() returns the expected values", {
  file <- list.files(
    path = system.file("extdata", package = "cwrshelpr"),
    full.names = TRUE,
    pattern = ".+\\.csv"
  )
  feem <- read_feem(file[1], truncate = TRUE)
  expect_equal(
    integrate_regions(feem)$integrated,
    c(46.641128, 200.347438, 2173.954726, 930.982613, 14542.800140, 21597.094717)
  )
})
