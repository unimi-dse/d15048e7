#' Get the text of an articles chosen among The Economist homepage
#'
#' You can use an element of the vector link to chose the articole you want to scrape
#' @param link is an element of the vector link or an url of The Economist
#' @return A tibble of two variables the first one is the paragraph number and the second the text
#' @export
get_text <- function(link){
  url <- paste0('https://www.economist.com/', link)
  url <- URLencode(url)

  text <- xml2::read_html(url) %>%
    rvest::html_nodes('p.article__body-text') %>%
    rvest::html_text()

  text_tibble <- tibble::tibble(paragraph = 1:length(text), text = text)

  return(text_tibble)
}

