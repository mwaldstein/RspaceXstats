context("Company Info")

with_mock_API({
  test_that("Success", {
    res <- company_info()

    expect_type(res, "list")
    expect_length(res, 14)
    expect_equal(res$name, "SpaceX")
    expect_equal(res$founded, 2002)
    expect_equal(res$founder, "Elon Musk")
    expect_equal(res$headquarters$state, "California")
  })
})
