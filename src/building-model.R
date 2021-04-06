knn_spec <- nearest_neighbor(weight_func = "rectangular", neighbors = 3) %>%
  set_engine("kknn") %>%
  set_mode("classification")

unpaid_recipe <- recipe(Type ~ 
                        Lifetime_Post_Total_Reach + Lifetime_Post_Total_Impressions,
                        data = train_set_unpaid) %>%
  step_scale(all_predictors()) %>%
  step_center(all_predictors())

unpaid_fit <- workflow() %>%
      add_recipe(unpaid_recipe) %>%
      add_model(knn_spec) %>%
      # fit(data = upsampled_cancer)
      fit(data = train_set_unpaid)

      #fit_resamples(resamples = unpaid_vfold)

unpaid_val_predicted <- predict(unpaid_fit, val_set_unpaid) %>%
    bind_cols(val_set_unpaid)

unpaid_prediction_accuracy <- unpaid_val_predicted %>%
    metrics(truth = Type, estimate = .pred_class)
    
unpaid_prediction_accuracy
