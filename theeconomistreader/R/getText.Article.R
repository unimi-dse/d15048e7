#' Get the text of an articles chosen among The Economist homepage
#'
#' You can use an element of the vector link (link[i]) to chose the articole you want to scrape
#' @param link is an element of the vector link or an url of The Economist
#' @return A tibble of two variables the first one is the paragraph number and the second the text
#' @export
getText.Article <- function(link){
  url <- paste0('https://www.economist.com/', link)
  url <- URLencode(url)

  text <- read_html(url) %>%
    html_nodes('p.article__body-text') %>%
    html_text()

  text_tibble <<- tibble(paragraph = 1:length(text), text = text)

  return(text_tibble)
}
