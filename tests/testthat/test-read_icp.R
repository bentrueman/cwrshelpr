
test_that("read_icp() yields a tibble with the expected number of rows", {
  file <- list.files(
    path = system.file("extdata", package = "cwrshelpr"),
    full.names = TRUE
  )
  expect_equal(nrow(read_icp(file[1])), 1440)
})

test_that("read_icp() yields expected output", {
  file <- list.files(
    path = system.file("extdata", package = "cwrshelpr"),
    full.names = TRUE
  )
  out1 <- read_icp(file[1])
  out2 <- read_icp(file[2])
  expect_snapshot(out1)
  expect_snapshot(out2)
})
