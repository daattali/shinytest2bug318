library(shinytest2)

test_that("test1", {
  app <- AppDriver$new(name = "test1", expect_values_screenshot_args = FALSE)
  app$click("go")
  expect_equal(as.numeric(app$get_value(input = "go")), 1)
})
