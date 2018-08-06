#' Query Writer
#'
#' This function allows you to write complex SQL queries in a normal coding format while also easily incorporating data from vectors and data frames into your query.
#' @param ... A character string, or a series of character strings separated by commas.  You can also use functions that return character strings, such as the other sqlWriter functions.
#' @keywords sqlWriter
#' @export
#' @examples
#' sqlQueryWrite()

sqlQueryWrite <- function(...) {
  #paste together all elements
  query <- paste(..., sep=" ")

  #replace any -- comments with /* */
  query <- strsplit(query, split = "\\\n")
  query <- sapply(query, sub, pattern = "--", replacement = "/\\*")
  query <- sapply(query, function(x){if(length(grep("/\\*", x) > 0)) {x <- paste(x,"*/", sep = "")} else{x}}, USE.NAMES = FALSE)
  query <- paste(query, collapse = " ")

  #remove any remaining \t and \n characters
  query <- gsub("\t"," ", query)
  gsub("\n"," ", query)
}