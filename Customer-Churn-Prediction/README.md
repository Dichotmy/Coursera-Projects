
```markdown
# Customer Churn Prediction

## Project Overview

In this project, I built machine learning models to predict customer churn, which is a key focus for business retention strategies. Various classifiers were tested and tuned, including ensemble methods, and a final prediction submission was made for a data science competition.

### Dataset

- **Train Dataset:** Contains historical data on customer behavior, including features such as demographics and service usage.
- **Test Dataset:** Contains customer features without the churn label, used for generating predictions.

### Key Features

- **Feature Engineering:** Selected and transformed features to improve model performance.
- **Model Selection:** Applied various models (SGDClassifier, HistGradientBoosting, Logistic Regression, etc.).
- **Model Tuning:** Tuned hyperparameters using GridSearchCV and applied cross-validation.
- **Performance:** Achieved a 74.97% ROC-AUC score in a competitive challenge.

### Files

- `ChurnPrediction.ipynb`: Contains the full analysis, model building, and evaluation process.
- `data_descriptions.csv`: Explains the features used in the dataset.
- `prediction_submission.csv`: Final churn predictions for the test data.
- `test.csv`: Test data for model evaluation.
- `train.csv`: Training data used for model training.

### Conclusion

This project demonstrates the application of machine learning techniques in a real-world scenario, with a focus on improving customer retention through churn prediction.