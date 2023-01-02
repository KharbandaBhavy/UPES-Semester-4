# Exp 10: Implementation of Tf-Idf algorithm.
# Code by Bhavy Kharbanda
# Sap Id: 500082531

import pandas as pd
import sklearn as sk
import math 

first_sentence = "Data Science is a brilliant job in the 21st century"
second_sentence = "Machine learning is the key for Data science"
# split so each word have their own string
first_sentence = first_sentence.split(" ")
second_sentence = second_sentence.split(" ")
#join them to remove common duplicate words
total= set(first_sentence).union(set(second_sentence))
print("\n Total words in both the sentences: ",total)

# Now lets add a way to count the words using a dictionary key-value pairing for both sentences :
wordDictA = dict.fromkeys(total, 0) 
wordDictB = dict.fromkeys(total, 0)
for word in first_sentence:
    wordDictA[word]+=1
    
for word in second_sentence:
    wordDictB[word]+=1
    

# Now we put them in a dataframe and then view the result:
print("\n Indexing of different words: ")
print(pd.DataFrame([wordDictA, wordDictB]))

# Writing the TF Function :
def computeTF(wordDict, doc):
    tfDict = {}
    corpusCount = len(doc)
    for word, count in wordDict.items():
        tfDict[word] = count/float(corpusCount)
    return(tfDict)
# running our sentences through the tf function:
tfFirst = computeTF(wordDictA, first_sentence)
tfSecond = computeTF(wordDictB, second_sentence)
# Converting to dataframe for visualization
tf = pd.DataFrame([tfFirst, tfSecond])
print("\n Tf of the sentences: ")
print(tf)

# For getting the stopwords:
import nltk
from nltk.corpus import stopwords
stop_words = set(stopwords.words('english'))
filtered_sentence = [w for w in wordDictA if not w in stop_words]
print("\n After removing the stopwords: ", filtered_sentence)

# And now that we finished the TF section, we move onto the IDF part:
def computeIDF(docList):
    idfDict = {}
    N = len(docList)
    
    idfDict = dict.fromkeys(docList[0].keys(), 0)
    for word, val in idfDict.items():
        idfDict[word] = math.log10(N / (float(val) + 1))
        
    return(idfDict)
# inputing our sentences in the log file
idfs = computeIDF([wordDictA, wordDictB])

# Now we implement the idf formula , let’s finish with calculating the TFIDF
def computeTFIDF(tfBow, idfs):
    tfidf = {}
    for word, val in tfBow.items():
        tfidf[word] = val*idfs[word]
    return(tfidf)
# running our two sentences through the IDF:
idfFirst = computeTFIDF(tfFirst, idfs)
idfSecond = computeTFIDF(tfSecond, idfs)
# putting it in a dataframe
idf= pd.DataFrame([idfFirst, idfSecond])
print("\n IDF of the sentences: ")
print(idf)


# Same procedure using the sklearn library:
# First step is to import the library
from sklearn.feature_extraction.text import TfidfVectorizer

firstV= "Data Science is a brilliant job in the 21st century"
secondV= "machine learning is the key for data science"
# Calling the TfidfVectorizer
vectorize= TfidfVectorizer()
# Fitting the model and passing the sentences:
response= vectorize.fit_transform([firstV, secondV])

print("\n Using Sklearn: ")
print(response)
