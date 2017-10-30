# Test helper for mock_api
library(httptest)

httptest::.mockPaths("../cache")

# Test if mocks have been created
has_mocks <- TRUE

mock_bypass <- Sys.getenv("MOCK_BYPASS")

if (mock_bypass == "capture") {
  message("Capturing mocks...")
  with_mock_API <- capture_requests
} else if (mock_bypass == "true" | !has_mocks) {
  message("Bypassing mocks...")
  with_mock_API <- force
}

# override buildMockUrl to shorten paths
# buildMockURL may not be locked in some circumstances, so try but fail quietly
try({unlockBinding("buildMockURL", environment(httptest::buildMockURL))}, silent = TRUE)
buildMockURL.orig <- httptest::buildMockURL
buildMockURL.new <- function(req, method = "GET") {
  path <- buildMockURL.orig(req, method = method)

  # everything is on the same domain, so clear it out
  path <- gsub("^api.spacexdata.com/", "", path)

  path
}
assign("buildMockURL", buildMockURL.new, envir = environment(httptest::buildMockURL))
