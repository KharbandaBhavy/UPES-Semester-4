# 5. Design and implement Bayesian Network for real-world data sets. (Burglary Alarm Problem) 
# Code by Bhavy Kharbanda
# Sap Id:- 500082531

print("\nMy Name is : Bhavy Kharbanda. \nMy SAP ID is : 500082531\n")
print("I am going to implement Burglary-Earthquake Alarm Problem.\n")

from pomegranate import *
from pomegranate import BayesianNetwork, Node

# Created distribution for Burglary occurring
Burglary = DiscreteDistribution({'T': .001, 'F': .999})
 
# Created distribution for Earthquake occurring
Earthquake = DiscreteDistribution({'T': .002, 'F': .998})

Alarm = ConditionalProbabilityTable([
    ['T', 'T', 'T', .95],
    ['T', 'T', 'F', .05],
    ['T', 'F', 'T', .94],
    ['T', 'F', 'F', .06],
    ['F', 'T', 'T', .29],
    ['F', 'T', 'F', .71],
    ['F', 'F', 'T', .001],
    ['F', 'F', 'F', .999],
], [Burglary, Earthquake])

# Creating three nodes
d1 = Node(Burglary, name="Burglary")
d2 = Node(Earthquake, name="Earthquake")
d3 = Node(Alarm, name="Alarm")

# Building the Bayesian Network using pomegranate
network = BayesianNetwork("Representing the Burglary Alarm System Problem with Bayesian Networks")
network.add_states(d1, d2, d3)
network.add_edge(d1, d3)
network.add_edge(d2, d3)
network.bake()

# Taking user input to put the Bayesian network to use
Val_B = input("True or False for Burglary (T/F): ")
Val_E = input("True or False for Earthquake (T/F): ")

# Making the prediction
beliefs = network.predict_proba({'Burglary': Val_B, 'Earthquake': Val_E})

# Displaying details
beliefs = map(str, beliefs)
print("\n".join("{}, {}".format(state.name, belief) for state, belief in zip(network.states, beliefs)))


