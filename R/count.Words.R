#' Count the most used words of the articles and return a graph of the frequency of the word
#'
#' You can use the tibble given by the function getText.Article
#' @param text Any tibble with a cloumn named text, you can use the tibble given by the function getText.Article
#' @return The number of time each words is used in the text and a graph
#' @export
count.Words <- function(text){
  text_words <- text %>%
    unnest_tokens(word, text)

  text_words <- text_words %>%
    anti_join(stop_words)

  text_words %>%
    count(word, sort = TRUE) %>%
    filter(n > 2) %>%
    mutate(word = reorder(word, n)) %>%
    ggplot(aes(word, n)) +
    geom_col() +
    xlab(NULL) +
    coord_flip()
}
