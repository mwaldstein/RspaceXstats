#' Vehicle Information
#'
#' Provides information and stats on SpaceX company vehicles, both launch
#' vehicles and capsules
#'
#' @param id If not provided, gives a list of all vehicles. Otherwise,
#' just the specified vehicle.
#'
#' @return A list vehicle parameters
#'
#' @examples
#' vehicle_info("falcon9")
#'
#' @export
vehicle_info <- function(id = NULL) {
  path <- "/vehicles"
  if (!is.null(id)) {
    path <- paste0(path, "/", id)
  }
  res <- request(path)

  return(res)
}
