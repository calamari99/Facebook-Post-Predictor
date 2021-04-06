test_unpaid_plot <- train_set_unpaid %>% ggplot(aes(x = Lifetime_Post_Total_Reach, y = Lifetime_Post_Total_Impressions, color = Type)) +
  geom_point(alpha = 0.5) +
  labs(color = "Type of Post", x = "Lifetime Post Total Reach", y = "Lifetime Post Total Impressions")

test_unpaid_plot
