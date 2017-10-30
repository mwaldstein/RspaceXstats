#' Company Information
#'
#' Provides general SpaceX company information
#'
#' @return A list of useful information about SpaceX
#' \describe{
#'   \item{name}{Company name}
#'   \item{founder}{Founder's name}
#'   \item{founded}{Year founded}
#'   \item{employees}{Number of employees}
#'   \item{vehicles}{Number of main types of launch vehicles}
#'   \item{launch_sites}{Number of launch sites}
#'   \item{ceo}{Name of the current CEO}
#'   \item{cto}{Name of the current CTO}
#'   \item{coo}{Name of the current COO}
#'   \item{cto_propulsion}{Name of the current CTO for Propulsion}
#'   \item{valuation}{Current company valuation (in USD)}
#'   \item{headquarters}{List of address components for the company headquarters}
#'   \item{summary}{Brief company description}
#' }
#'
#' @examples
#' company_info()
#'
#' @export
company_info <- function() {
    res <- request("/info")
    return(res)
}
