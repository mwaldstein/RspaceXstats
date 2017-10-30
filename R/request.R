#' noRd
request <- function (path, base = "https://api.spacexdata.com/v1/") {
  path <- sub("^/", "", path)
  url <- paste0(base, path)
  res <- httr::GET(url)
  if (httr::http_type(res) != "application/json" |
      httr::http_error(res)) {
      stop("Unexpected content type")
  }
  json <- jsonlite::fromJSON(httr::content(res,
                                           as = "text",
                                           encoding = "UTF-8"),
                             simplifyDataFrame = TRUE)

  return(json)
}
