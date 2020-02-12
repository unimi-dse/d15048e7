#' @title The Economist get links
#' @description Scrape links of all the articles on The Economist homepage
#'
#'
#' @return A chr vector with all the links of the article
#' @examples  get_links()
#' @export
#' @importFrom magrittr %>%
get_links <- function(){
  url <- paste0('https://www.economist.com/')
  url <- URLencode(url)

  link <- xml2::read_html(url) %>%
    rvest::html_nodes('h3 a')%>%
    rvest::html_attr('href')

  return(link)
}
