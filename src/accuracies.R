knn_tune <- nearest_neighbor(weight_func = "rectangular", neighbors = tune()) %>%
  set_engine("kknn") %>%
  set_mode("classification")

knn_results <- workflow() %>%
  add_recipe(unpaid_recipe) %>%
  add_model(knn_tune) %>%
  tune_grid(resamples = unpaid_vfold, grid = 10) %>% 
  collect_metrics()

accuracies <- knn_results %>% 
       filter(.metric == "accuracy")

accuracies
