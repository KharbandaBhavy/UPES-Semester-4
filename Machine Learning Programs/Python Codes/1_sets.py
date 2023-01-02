# Code by Bhavy Kharbanda
# Sap Id:- 500082531
# Set Operations are: Union, Intersection, Difference and Symmetric Difference between two or more sets.

A = []
B = []
n = int(input("Enter number of elements in the Set: "))
print("Enter the first Set: ")  # To get the First Set from the user
for i in range(0, n):
    element = int(input())
    A.append(element)
print("Enter the Second Set: ")  # To get the Second Set from the user
for i in range(0, n):
    element = int(input())
    B.append(element)
A = set(A) # For converting lists to set
B = set(B)
print('\nSet A: ', A)
print('Set B: ', B)
print("\nSet Operations :\n")

# For Union of two sets.
print("Union of A and B is", A | B)

# For Intersection of two sets.
print("Intersection of A and B is", A & B)

# For Difference of two sets.
print("Difference of A and B is", A - B)

# For Symmetric Difference of two sets.
print("Symmetric Difference of A and B is", A ^ B)
