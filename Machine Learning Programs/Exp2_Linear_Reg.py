# Exp 2: Implementation of Linear Regression.
# Code by Bhavy Kharbanda
# Sap Id: 500082531

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from sklearn.linear_model import LinearRegression

dataset = pd.read_csv('iris.csv')
print("\nThe Iris Dataset:")
print(dataset)
x = dataset.iloc[:,1:2].values
y = dataset.iloc[:,2:3].values

#Linear regression direct from sk learn
reg = LinearRegression().fit(x,y)
print("\nLinear regression score is: ")
print(reg.score(x,y))
print("\nLinear regression Coefficient is: ")
print(reg.coef_)


# Using the actual formula to verify and plot
def estimate_coef(x, y):
    n = np.size(x)
    # mean of x and y
    m_x = np.mean(x)
    m_v = np.mean(y)
    # calcultaing the cross derivation about x
    SS_xv = np.sum(y*x) - n*m_v*m_x
    SS_xx = np.sum(x*x) - n*m_x*m_x

    # calculating the regression coeff
    b_1 = SS_xv/SS_xx
    b_0 = m_v - b_1*m_x

    return (b_0, b_1)


def plot_regression_line(x, y, b):
    plt.scatter(x, y, color='m', marker="o", s=30)       # plotting the actual points as scatter plot
    y_pred = b[0]+b[1]*x                                 # predicting the response vecotr
    plt.plot(x, y_pred, color="g")                       # plotting the regression line
    plt.xlabel("X")                                      # putting the labels
    plt.ylabel("Y")
    plt.show()


def main():
    dataset = pd.read_csv('iris.csv')
    x = np.array(dataset.iloc[:,1:2].values)
    y = np.array(dataset.iloc[:,2:3].values)        
    b = estimate_coef(x, y)
    print("\nEstimated coefficients:\n b_0={} \nb_1={}".format(b[0], b[1]))
    plot_regression_line(x, y, b)

main()
