#' Get Links of all the articles on The Economist homepage
#'
#'
#' @param () no param
#' @return A chr vector with all the links of the article
#' @export
getLink.Articles <- function(){
  url <- paste0('https://www.economist.com/')
  url <- URLencode(url)

  link <<- read_html(url) %>%
    html_nodes('h3 a')%>%
    html_attr('href')

  return(link)
}
