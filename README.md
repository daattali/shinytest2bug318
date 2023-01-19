# shinytest2bug318

Showcasing bug https://github.com/rstudio/shinytest2/issues/318

I want to test multiple shiny apps inside the standard `tests/testthat` directory of a package. [According to the {shinytest2} documentation](https://rstudio.github.io/shinytest2/articles/use-package.html#how-should-i-test-multiple-applications) and according to what the {shinytest2} repository itself does, I should be able to create apps under `tests/testthat/apps/` and test them all using `tests/testthat/test-apps.R`:

```r
lapply(list.files("apps", full.names = TRUE), function(folder) {
  shinytest2::test_app(folder)
})
```

Running the tests does work when I do this, but running the CRAN checks (`devtools::check()`) fails with error:

```bash
[ FAIL 0 | WARN 1 | SKIP 0 | PASS 3 ]
Error in data.frame(file = test$file, context = context, test = test$test,  : 
  arguments imply differing number of rows: 1, 0
Calls: test_check ... as.data.frame.testthat_results -> lapply -> FUN -> data.frame
Execution halted
```

If you comment out the loop that calls `test_app()` on each app folder, then everything works fine. If I use a very simple directory structure instead of the recommended one, where each app directory simply contains an `app.R` and a `test-app.R`, then it also works fine.
