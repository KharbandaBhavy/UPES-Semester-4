# Exp 1: Implementation of KNN Algorithm.
# Code by Bhavy Kharbanda
# Sap Id: 500082531

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

# Loading the iris dataset.
dataset = pd.read_csv('iris.csv')
print("\nThe Iris Dataset:")
print(dataset)
 
# Columns required for the classification that is 2nd to 5th column.
X = dataset.iloc[:,2:-2].values

# Output column is the last column
Y = dataset.iloc[:,-1].values

# Splitting the dataset where testing size is 25 percent fo the total datset.
from sklearn.model_selection import train_test_split
x_train, x_test, y_train, y_test = train_test_split(X,Y,test_size=0.25,random_state=0)

# To preprocess the model.
from sklearn.preprocessing import StandardScaler
sc = StandardScaler()
x_train = sc.fit_transform(x_train)
x_test = sc.fit_transform(x_test)

# TO create the KNN Model.
from sklearn.neighbors import KNeighborsClassifier
classifier = KNeighborsClassifier(n_neighbors = 3, metric = "minkowski", p=2 )
# TO train the model.
classifier.fit(x_train,y_train)

from sklearn.metrics import accuracy_score
y_pred = classifier.predict(x_test)

# To tell the accuracy of the model.
print("\nThe accuracy score of the model is: ")
accuracy = accuracy_score(y_test,y_pred)

print("Accuracy: ",accuracy_score(y_test,y_pred))
print("Accuracy Percentage: ", accuracy*100,"%")





