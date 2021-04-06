ups_recipe <- recipe(Type ~ Lifetime_Post_Total_Reach + Lifetime_Post_Total_Impressions, data = train_set_unpaid) %>%
  step_upsample(Type, over_ratio = 1, skip = FALSE) %>%
  prep()

# upsampled_cancer <- bake(ups_recipe, train_set_unpaid)

# upsampled_cancer %>%
#   group_by(Type) %>%
#   summarize(n = n())
