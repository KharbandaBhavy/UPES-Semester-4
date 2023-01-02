# Code by Bhavy Kharbanda
# Sap Id:- 500082531
# Propositional Logics includes Conjunction, Disjunction, Negation, Implication and Biconditional Operations.
import numpy as np

print('Truth Table for Conjunction :')
a = [0, 0, 1, 1]
b = [0, 1, 0, 1]
print('a:', a)
print('b:', b)
result = np.logical_and(a, b)
result = result*1
print('a and b: ', result)

print('')
print('Truth Table for Disjunction :')
print('a:', a)
print('b:', b)
result = np.logical_or(a, b)
result = result*1
print('a or b: ', result)


print('')
print('Truth Table for Negation :')
print('a:', a)
result = np.logical_not(a)
result = result*1
print('Not a:', result)

print('')
print('Truth Table for Implication :')
print('a:', a)
print('b:', b)
result = np.logical_not(a)
result2 = np.logical_or(result, b)
result2 = result2*1
print('a => b :', result2)

print('')
print('Truth Table for Biconditional :')
print('a:', a)
print('b:', b)
result = np.logical_xor(a, b)
result2 = np.logical_not(result)
result2 = result2*1
print('a <=> b: ', result2)


