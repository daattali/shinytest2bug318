lapply(list.files("apps", full.names = TRUE), function(folder) {
  shinytest2::test_app(folder)
})

test_that("addition works", {
  expect_equal(1+1, 2)
})
