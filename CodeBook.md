# Imported Vvariables

- `features` : data imported from `features.txt`
- `activity_labels` : list with the activities from `activity_labels.txt`

- `X_test` : Test set imported from 'test/X_test.txt'
- `y_test` : Test labels imported from 'test/y_test.txt'
- `X_train` : Training set imported from 'train/X_train.txt'
- `y_train` : Training labels imported from 'train/y_train.txt'

# Transformated variables

- `translated_y_test` and `translated_y_train` : `y_test` and `y_train` translated to activities names using `activity_labels`

- `features_list` : array with the names of X datasets columns obtained from features using `separate` function

- `test` : column binding of `X_test` and `y_test` using `cbind` function
- `train` : column binding of `X_train` and `y_train` using `cbind` function

- `full_set` : row binding of test and `train` using `rbind` function. Columns named using `features_list` and `names` function. **Answers questions 1, 3 and 4**

- `selected_set` : selection of columns from full_set measuring on the mean and standard deviation using `select` function. **Answers question 2**

- `summarized_mean_set` : tidy data set with the average of each variable for each activity and each subject from `selected_set` using `group_by` and `summarise_all`. **Answers question 5**