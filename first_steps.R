afd <- search_tweets("#afd", n = 1000, include_rts = F)

users <- search_users("274C", n = 1000)

# klappt nicht:
x <- search_users("❌")

# klappt bedingt:
x <- search_tweets("❌", n = 1000, include_rts = F, lang = "de")

saveRDS(x, "data/test_crosses.rds")

x <- readRDS("data/test_crosses.rds")

y <- x %>% select_if(negate(is.list))

ggplot(y, aes(source)) +
  geom_bar() +
  coord_flip()


loc <- lat_lng(x)
