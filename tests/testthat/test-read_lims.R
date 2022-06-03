
file <- list.files(
  path = system.file("extdata", package = "cwrshelpr"),
  full.names = TRUE,
  pattern = ".+\\.xlsx"
)

test_that("read_lims() returns expected output", {
  out <- read_lims(file[3], work_order = "00A123456")
  expect_snapshot(out)
})
