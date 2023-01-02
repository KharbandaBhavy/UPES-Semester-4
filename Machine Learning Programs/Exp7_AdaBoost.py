# Exp 7: Implementation of AdaBoost Algorithm.
# Code by Bhavy Kharbanda
# Sap Id: 500082531

# Importing libraries
import pandas as pd
from sklearn.ensemble import AdaBoostClassifier
from sklearn.model_selection import train_test_split
from sklearn import metrics

# Importing the Salary dataset.
df = pd.read_csv("Salary.csv")
print(df)
print(df.head())

# Selecting the features to be used in the training and testing.
X = df.iloc[:,0:6]
Y = df.iloc[:,6]

# Splitting the dataset into test and train dataset.
# Here 75% is the trainign dataset and 255 is the testing dataset.
X_train, X_test, y_train, y_test = train_test_split(X, Y, test_size = 0.2)

# n_estimators is the number of weak learners to train
# learning_rate is the default weight assigned to each model.
AdaModel = AdaBoostClassifier(n_estimators = 100, learning_rate = 1)

# Training the Model
model = AdaModel.fit(X_train, y_train)

# Predict the response for test dataset
y_pred = model.predict(X_test)

# To know the accuracy of the model.
print("\n Accuracy of the model is: ", metrics.accuracy_score(y_test, y_pred))


