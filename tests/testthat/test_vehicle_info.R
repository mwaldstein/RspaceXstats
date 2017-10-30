context("Vehicle Info")

with_mock_API({
  test_that("All Vehicles", {
    res <- vehicle_info()

    expect_type(res, "list")
    expect_length(res, 33)
    expect_equal(nrow(res), 4)
  })
  test_that("Falcon 9", {
    res <- vehicle_info("falcon9")

    expect_type(res, "list")
    expect_length(res, 18)
    expect_null(nrow(res))
  })
  test_that("Dragon", {
    res <- vehicle_info("dragon")

    expect_type(res, "list")
    expect_length(res, 16)
    expect_null(nrow(res))
  })
  test_that("Bad Vehicle", {
    expect_error(vehicle_info("No_such_vehicle"))
  })
})
