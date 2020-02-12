#' @title The Economist count words
#' @description Count the words of the selected article, use a stopword database imported from tidytext. Reorders the words and displays a graph.
#' @details You can use an element of the vector link to chose the articole you want to scrape
#' @param link is an element of the vector link or an url of The Economist
#' @return A graph with the most used words, only the words that are used more than 3 times
#' @examples  count_words("united-states/2020/02/11/donald-trump-loosens-americas-restrictions-on-landmines")
#' @export
#' @importFrom magrittr %>%
count_words <- function(link){
  url <- paste0('https://www.economist.com/', link)
  url <- URLencode(url)

  text <- xml2::read_html(url) %>%
    rvest::html_nodes('p.article__body-text') %>%
    rvest::html_text()

  text_tibble <- tibble::tibble(paragraph = 1:length(text), text = text)

  text_words <- text_tibble %>%
    tidytext::unnest_tokens(word, text) %>%
    dplyr::anti_join(stop_words) %>%
    count(word, sort = TRUE) %>%
    filter(n > 2) %>%
    mutate(word = reorder(word, n))


  text_words %>%
    ggplot2::ggplot(ggplot2::aes(word, n)) +
    ggplot2::geom_col() +
    ggplot2::xlab(NULL) +
    ggplot2::coord_flip()
}
