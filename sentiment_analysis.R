## get some tweets
x <- search_tweets("#afd", n = 1000, include_rts = F, lang = "de")


## import corpora
pos <- read_delim("sentiment_corpus/SentiWS_v1.8c_Positive.txt", 
                  "\t", escape_double = FALSE, col_names = FALSE, 
                  col_types = cols(X3 = col_skip()), trim_ws = TRUE) %>% 
  mutate(
    X1 = str_remove(X1, "\\|.*")
  )

neg <- read_delim("sentiment_corpus/SentiWS_v1.8c_Negative.txt", 
                  "\t", escape_double = FALSE, col_names = FALSE, 
                  col_types = cols(X3 = col_skip()), trim_ws = TRUE) %>% 
  mutate(
    X1 = str_remove(X1, "\\|.*")
  )

## unnest tokens?
txt <- data_frame(
  nmbr  = seq_along(x$text),
  tweet = x$text
)
