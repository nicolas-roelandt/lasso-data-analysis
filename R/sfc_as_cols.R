#' sfc_as_cols
#' extract coordinates as new columns
#' @param x sf dataframe
#' @param names Geometry column output names (by default lon and lat)
#'
#' @export
#' @details
#' source: source: https://github.com/r-spatial/sf/issues/231#issuecomment-282359896

sfc_as_cols <- function(x, names = c("lon","lat")) {
  stopifnot(inherits(x,"sf") && inherits(sf::st_geometry(x),"sfc_POINT"))
  ret <- do.call(rbind,sf::st_geometry(x))
  ret <- tibble::as_tibble(ret) %>% dplyr::select(-V3)
  stopifnot(length(names) == ncol(ret))
  ret <- setNames(ret,names)
  dplyr::bind_cols(x,ret)
}
