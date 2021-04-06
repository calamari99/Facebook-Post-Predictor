set.seed(99)
#unpaid_vfold <- vfold_cv(upsampled_cancer, v = 10, strata = Type)
unpaid_vfold <- vfold_cv(train_set_unpaid, v = 10, strata = Type)

unpaid_fit_v2 <- workflow() %>%
      add_recipe(unpaid_recipe) %>%
      add_model(knn_spec) %>%
      fit_resamples(resamples = unpaid_vfold) %>% collect_metrics()
unpaid_fit_v2
