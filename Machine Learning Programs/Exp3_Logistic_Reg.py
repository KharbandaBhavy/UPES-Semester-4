# Exp 3: Implementation of Logistic Regression.
# Code by Bhavy Kharbanda
# Sap Id: 500082531

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

# Loading the Regression dataset.
dataset = pd.read_csv('iris.csv')
print("\nThe Iris Dataset:")
print(dataset)

# Taking X variable as the columns
X = dataset.iloc[:,2:-2].values
# Output column as Y
Y = dataset.iloc[:, -1].values

# Splitting the dataset into the Training set and Test set
from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, Y, test_size = 0.25, random_state = 0)

# Feature Scaling
from sklearn.preprocessing import StandardScaler
sc = StandardScaler()
X_train = sc.fit_transform(X_train)
X_test = sc.transform(X_test)

# Fitting Logistic Regression to the Training set
from sklearn.linear_model import LogisticRegression
reg = LogisticRegression(random_state = 0, solver='lbfgs', multi_class='auto')
reg.fit(X_train, y_train)

# Predicting the Test set results
y_pred = reg.predict(X_test)

print("\nLogistic regression score is: ")
print(reg.score(X_train, y_train))