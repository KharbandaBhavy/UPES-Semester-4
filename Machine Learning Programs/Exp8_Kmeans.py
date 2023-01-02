# Exp 8: Implementation of K-Means Algorithm.
# Code by Bhavy Kharbanda
# Sap Id: 500082531

from sklearn.cluster import KMeans
import pandas as pd
from sklearn.preprocessing import MinMaxScaler
from matplotlib import pyplot as plt

# TO get the dataset
df = pd.read_csv("Income.csv")
print("\nIncome Dataset Used:")
print(df)

# To plot the initial distribution of how the dataset looks.
plt.scatter(df['Age'], df['Income'])
plt.show()

# Declaring the value fo k for KMeans.
km = KMeans(n_clusters = 3)
print("\n")
print(km)

# TO fit and predict the model.
# Here y shows the different cluster labels for the dataset.
y_predict = km.fit_predict(df[['Age', 'Income']])
print("\n Predicted y labels:", y_predict)

# Adding the column of these clusters in the datset.
df['cluster'] = y_predict
print(df)

# Making different clusters for different data points and storing them in one dataframe. 
df1 = df[df.cluster == 0]
df2 = df[df.cluster == 1]
df3 = df[df.cluster == 2]

plt.scatter(df1.Age, df1['Income'], color = 'red')
plt.scatter(df2.Age, df2['Income'], color = 'green')
plt.scatter(df3.Age, df3['Income'], color = 'blue')

plt.xlabel('Age')
plt.ylabel('Income')
plt.show()

# In the plot we can see that there are still some data-points which are not properly clustered.
# So we use MinMax Scalar to rectify this.

scaler = MinMaxScaler()

scaler.fit(df[['Income']])
df['Income'] = scaler.transform(df[['Income']])

scaler.fit(df[['Age']])
df['Age'] = scaler.transform(df[['Age']])

# Applying Kmeans once again
km = KMeans(n_clusters = 3)
y_predict = km.fit_predict(df[['Age', 'Income']])
df['cluster'] = y_predict

# To show the centroids of the clusters
print("\n The Centroid coordinates for different clusters: ", km.cluster_centers_)

# Finally printing the rectified plot
df1 = df[df.cluster == 0]
df2 = df[df.cluster == 1]
df3 = df[df.cluster == 2]

plt.scatter(df1.Age, df1['Income'], color = 'red')
plt.scatter(df2.Age, df2['Income'], color = 'green')
plt.scatter(df3.Age, df3['Income'], color = 'blue')

plt.xlabel('Age')
plt.ylabel('Income')
plt.scatter(km.cluster_centers_[:,0], km.cluster_centers_[:,1], color = 'purple', marker = '*', label = 'centroid')
plt.legend()
plt.show()

# To plot the graph of sum of squared error and values of K.
sum_error = []
k_range = range(1,10)
for k in k_range:
    km = KMeans(n_clusters=k)
    km.fit(df[['Age','Income']])
    sum_error.append(km.inertia_)

plt.xlabel('K')
plt.ylabel('Sum of squared error')
plt.plot(k_range,sum_error)
plt.show()

