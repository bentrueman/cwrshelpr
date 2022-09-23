
test_that("read_lims() returns expected output", {
  file <- list.files(
    path = system.file("extdata", package = "cwrshelpr"),
    full.names = TRUE,
    pattern = ".+\\.xlsx"
  )
  out <- read_lims(file[3], work_order = "00A123456")
  expect_snapshot(out)
})
