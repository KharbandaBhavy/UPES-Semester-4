# Exp 9: Implement DB-Scan Clustering Algorithm
# Code by Bhavy Kharbanda
# Sap Id: 500082531

import numpy as np
from sklearn.datasets import make_blobs
import pandas as pd
from pandas import DataFrame
from matplotlib import pyplot as plt
from sklearn.cluster import DBSCAN

# For generating the dataset
X, _ = make_blobs(n_samples = 500, centers = 3, n_features =2, random_state = 20)

# For visualization of the dataset that we created
df = DataFrame(dict(x = X[:,0], y = X[:,1]))
print("\nThe dataset generated: ")
print(df)

df.plot(kind='scatter', x='x', y='y')
plt.xlabel('X1')
plt.ylabel('Y1')
plt.show()

# Importing the DBScan cluster and implementing it.
clustering = DBSCAN(eps=1, min_samples = 5).fit(X)
cluster = clustering.labels_
print("\nTotal number of the clusters in the dataset: ")
print(len(set(cluster)))
# Here this length shows that we have 4 clusters so the last cluster is nothing but noice.
print("\nBlue coloured data points shows the Noise in the clustering.")

# Visualizing these clusters in different colors.
df = DataFrame(dict(x = X[:,0], y = X[:,1], label = cluster))
colors = {-1: 'blue', 0:'red', 1:'green', 2:'yellow'}
fig, ax = plt.subplots(figsize=(6,5))
grouped = df.groupby('label')
for key, group in grouped:
    group.plot(ax = ax, kind = 'scatter', x='x', y='y', label = key, color = colors[key])

plt.xlabel('X1')
plt.ylabel('Y1')
plt.show()
    


