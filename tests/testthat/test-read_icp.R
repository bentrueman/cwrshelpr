
file <- list.files(
  path = system.file("extdata", package = "cwrshelpr"),
  full.names = TRUE
)

test_that("read_icp() yields a tibble with the expected number of rows", {
  expect_equal(nrow(read_icp(file[1])), 1440)
})

test_that("read_icp() yields expected output", {
  out1 <- read_icp(file[1])
  out2 <- read_icp(file[2])
  expect_snapshot(out1)
  expect_snapshot(out2)
})
