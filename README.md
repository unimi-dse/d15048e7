# theeconomist


#### _d15048e7_

Scrap article text from The Economist website (https://www.economist.com/). Count the words and plot the result


## Installation

```R
# first install the R package "devtools" if not installed
devtools::install_github('unimi-dse/d15048e7')
```

## Usage

```R
# load the package
require(theeconomist)
```

## Functions

Function             | Description                                                                 | Examples
---------------------|-----------------------------------------------------------------------------|------------------------
`get_text()`         | Scrap The Economist article body text.                                      | get_text("united-states/2020/02/11/donald-trump-loosens-americas-restrictions-on-landmines")
`get_links()`       | Get all the articles links from The Economist homepage .                     | get_links()
`count_words()`     | Build a tibble with the most frequent words and plot it.                     | analyze_text("united-states/2020/02/11/donald-trump-loosens-americas-restrictions-on-landmines")

Type ?Function for a complete description of the functions (for example, `?get_links()`)

## Arguments

Argument `link` is used in `get_text()` and `count_words()` . `link` is a character string, you can paste and copy one of the element of the list form `get_links()` 


## Packages Imported
dplyr, rvest, tibble, tidytext, ggplot2, xml2, magrittr



**Author**: Marco Del Treppo

**Date**: February 2020
