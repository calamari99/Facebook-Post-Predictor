test_set %>% group_by(Type) %>%
  summarize(n = n())
